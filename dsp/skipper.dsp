// SKIPPER: stochastic CD-skip looper and stutter (gen~: gendsp/skipper.gendsp)
//
// Two pairs of 288000-sample buffers (6 s at 48 kHz, whatever the sample
// rate) in ping-pong: a capture records the input into the buffer that is
// not playing, from its start; when it ends, that buffer plays, looped over
// the captured length, at `speed` (negative: reversed) with linear
// interpolation and a raised-cosine fade of 1.5 ms (at most a quarter of the
// loop) at both ends. In auto mode (`triggermode` = 1) a metro of random
// period (automode_speedmin..max ms) starts captures of random length
// (automode_grainmin..max ms); `automode_on` = 0 stops the metro and any
// capture (the loop goes on). In manual mode the input is captured while
// `trigger` is 1, and the loop starts when it falls. Each new loop draws a
// pan (equal power, width `pan_percentage`), a volume drop (up to 80 % of
// `volume_percentage`) and, with probability `hickup_percentage`, a dropout
// (the gain slides to 0). Then a sample-and-hold decimation (`downsample`,
// hold of 1..25 samples), a soft limiter and the dry/wet `mix`.
//
// in1, in2: audio L, R
// out1, out2: processed L, R    out3: loop length (ms)    out4: speed
//
// Parameters: automode_speedmin (2..10000 ms, default 250), automode_speedmax
// (2..10000 ms, 1000), automode_grainmin (2..6000 ms, 40), automode_grainmax
// (2..6000 ms, 800), automode_on (0/1, 1), triggermode (0/1, 1), trigger
// (0/1, 0), speed (-4..4, 1), downsample (0..100, 0), volume_percentage
// (0..100, 20), hickup_percentage (0..100, 20), pan_percentage (0..100, 80),
// kill_capture (0/1, 0), mix (0..100 %, 80).
//
// As in gen:
// - the buffers are 288000 samples whatever the sample rate (6 s at 48 kHz
//   only): a manual capture stops recording there, and an auto grain is
//   capped to 288000 samples;
// - the first auto capture starts after 24000 samples (h_metro_interval's
//   initial value), whatever the sample rate; while capturing, the metro
//   does not count;
// - `kill_capture` only silences the loop until the next capture: it does
//   not clear the buffers, nor stop the metro (the header says "purge");
// - the loop length is fractional (milliseconds times the sample rate) and
//   the capture runs to its ceiling;
// - the hickup gate slides only while a loop plays;
// - the decimation counter runs whether `downsample` is on or not, and the
//   held value is the wet signal of the frame the counter fires;
// - the right output is panned with sin, the left with cos, of the same
//   angle: at pan 0 both are at unity (x1.41421356 * 0.7071).
//
// Noise sites (export order): 0 the interval, 1 the grain length (at a metro
// tick), 2 the pan, 3 the volume, 4 the hickup (at a new loop).

declare name "skipper";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
si = library("signals.lib");
g = library("genops.lib");

automode_speedmin = hslider("automode_speedmin [unit:ms]", 250, 2, 10000, 0.01);
automode_speedmax = hslider("automode_speedmax [unit:ms]", 1000, 2, 10000, 0.01);
automode_grainmin = hslider("automode_grainmin [unit:ms]", 40, 2, 6000, 0.01);
automode_grainmax = hslider("automode_grainmax [unit:ms]", 800, 2, 6000, 0.01);
automode_on = hslider("automode_on", 1, 0, 1, 1);
triggermode = hslider("triggermode", 1, 0, 1, 1);
trigger = hslider("trigger", 0, 0, 1, 1);
speed = hslider("speed", 1, -4, 4, 0.001);
downsample = hslider("downsample", 0, 0, 100, 0.01);
volume_percentage = hslider("volume_percentage [unit:%]", 20, 0, 100, 0.01);
hickup_percentage = hslider("hickup_percentage [unit:%]", 20, 0, 100, 0.01);
pan_percentage = hslider("pan_percentage [unit:%]", 80, 0, 100, 0.01);
kill_capture = hslider("kill_capture", 0, 0, 1, 1);
mix_p = hslider("mix [unit:%]", 80, 0, 100, 0.01);

PI = 3.1415926535897931;
BUF = 288000;

// ---------------------------------------------------------------- control
// 17 Histories, fed back: play_buf, has_data, play_ph, loop_len, loop_ms,
// metro_timer, metro_interval, auto_capturing, auto_cap_timer, target,
// prev_manual_trig, man_rec_count, pan_cur, vol_scale, is_hickup,
// hickup_gate, down_count. Outputs after them: the write slot (buffer *
// BUF + index, 2 * BUF: no write), the playing flag, the two read slots,
// the interpolation fraction, fade, volume, gate, pan angle, the loop length
// in ms and the decimation tick.
NS = 17;
ctrl(n0, n1, n2, n3, n4) = (body ~ si.bus(NS)) : si.block(NS), si.bus(11)
with {
    body(play_bufd, has_datad, play_phd, loop_lend, loop_msd, metro_timerd, metro_intervald,
         auto_capd, cap_timerd, targetd, prev_mand, man_countd, pan_curd, vol_scaled,
         is_hickupd, gated, down_countd) =
        play_buf, has_data, play_ph, loop_len, loop_ms, metro_timer, metro_interval,
        auto_cap, cap_timer, target, prev_man, man_count, pan_cur, vol_scale,
        is_hickup, gate, down_count,
        widx, active, ri0, ri1, fr, fade_gain, vol_scale, gate, theta, loop_ms, dtick
    with {
        // 3. kill
        kill_on = kill_capture > 0.5;
        kill_hit = kill_on & ((kill_on)' == 0);
        has_data0 = select2(kill_hit, has_datad, 0);
        play_ph0 = select2(kill_hit, play_phd, 0.0);
        auto_cap0 = select2(kill_hit, auto_capd, 0);
        man_count0 = select2(kill_hit, man_countd, 0);
        loop_len_p = g.init(4800, loop_lend);
        loop_ms_p = g.init(100.0, loop_msd);
        metro_interval_p = g.init(24000, metro_intervald);
        target_p = g.init(4800, targetd);
        vol_scale_p = g.init(1.0, vol_scaled);
        gate_p = g.init(1.0, gated);

        // 4. capture
        rec_buf = 1 - play_bufd;
        auto_mode = triggermode > 0.5;
        auto_run = auto_mode & (automode_on > 0.5);
        man_mode = auto_mode == 0;

        // auto: the metro
        counting = auto_run & (auto_cap0 == 0);
        mt1 = metro_timerd + 1;
        tick = counting & (mt1 >= metro_interval_p);
        min_i = min(automode_speedmin, automode_speedmax);
        max_i = max(automode_speedmin, automode_speedmax);
        r_int = n0 * 0.5 + 0.5;
        new_interval = max(64, g.keep(min_i + g.keep(r_int * (max_i - min_i))) * (ma.SR * 0.001));
        min_d = min(automode_grainmin, automode_grainmax);
        max_d = max(automode_grainmin, automode_grainmax);
        r_dur = n1 * 0.5 + 0.5;
        new_target = max(64, min(g.keep(min_d + g.keep(r_dur * (max_d - min_d))) * (ma.SR * 0.001), 288000));
        metro_timer = select2(auto_mode, metro_timerd,
                      select2(auto_run, 0, select2(counting, metro_timerd, select2(tick, mt1, 0))));
        metro_interval = select2(tick, metro_interval_p, new_interval);
        target = select2(tick, target_p, new_target);
        auto_cap1 = select2(tick, auto_cap0, 1);
        cap_timer1 = select2(tick, cap_timerd, 0);
        // auto: capturing
        capturing = auto_run & (auto_cap1 != 0);
        auto_poke = capturing & (cap_timer1 < 288000);
        cap_timer2 = cap_timer1 + 1;
        auto_done = capturing & (cap_timer2 >= target);
        cap_timer = select2(capturing, cap_timer1, cap_timer2);
        auto_cap = select2(auto_mode, auto_cap0,
                   select2(auto_run, 0, select2(auto_done, auto_cap1, 0)));

        // manual
        man_now = trigger > 0.5;
        man_poke = man_mode & man_now & (man_count0 < 288000);
        man_count1 = select2(man_poke, man_count0, man_count0 + 1);
        man_done = man_mode & (man_now == 0) & (g.init(0, prev_mand) != 0);
        man_count = select2(man_done, man_count1, 0);
        prev_man = select2(man_mode, prev_mand, man_now);

        poke_idx = select2(auto_mode, man_count0, cap_timer1);
        widx = select2(auto_poke | man_poke, 2 * BUF, rec_buf * BUF + poke_idx);

        jfc = auto_done | man_done;
        captured = select2(auto_mode, max(64, man_count1), target);

        // 5. new loop
        play_buf = select2(jfc, play_bufd, rec_buf);
        loop_len = select2(jfc, loop_len_p, max(64, min(captured, 288000)));
        loop_ms = select2(jfc, loop_ms_p, loop_len * g.divsr(1000.0));
        has_data = select2(jfc, has_data0, 1);
        play_ph1 = select2(jfc, play_ph0, select2(speed >= 0.0, 1.0, 0.0));
        pan_cur = select2(jfc, pan_curd, n2 * g.clip(0.0, 1.0, pan_percentage * 0.01));
        r_vol = n3 * 0.5 + 0.5;
        vol_scale = select2(jfc, vol_scale_p, 1.0 - g.keep(r_vol * g.clip(0.0, 0.8, g.keep(volume_percentage * 0.01) * 0.8)));
        r_hick = (n4 * 0.5 + 0.5) * 100.0;
        is_hickup = select2(jfc, is_hickupd, r_hick < hickup_percentage);

        // 6. playhead
        active = (has_data > 0.5) & (loop_len > 1);
        curr_idx = g.clip(0.0, loop_len - 1.0, g.keep(play_ph1 * loop_len));
        fade_len = min(g.mstosamps(1.5), floor(loop_len * 0.25));
        fade_gain = select2(fade_len > 1.0, 1.0,
                    select2(curr_idx < fade_len,
                        select2(curr_idx > (loop_len - fade_len), 1.0,
                            0.5 - 0.5 * cos(g.safediv(loop_len - curr_idx, fade_len) * PI)),
                        0.5 - 0.5 * cos(g.safediv(curr_idx, fade_len) * PI)));
        i0 = floor(curr_idx);
        i1 = min(i0 + 1, loop_len - 1);
        fr = curr_idx - i0;
        slot(i) = select2((j >= BUF) | (j < 0), play_buf * BUF + j, 2 * BUF) with { j = int(floor(i)); };
        ri0 = slot(i0);
        ri1 = slot(i1);
        target_gate = select2(is_hickup != 0, 1.0, 0.0);
        gate = select2(active, gate_p, g.fixdenorm(gate_p + g.keep((target_gate - gate_p) * 0.02)));
        theta = g.keep(g.clip(-1.0, 1.0, pan_cur) + 1.0) * 0.78539816339744828;
        safe_speed = select2(abs(speed) < 0.001, speed, 0.0);
        ph_inc = g.safediv(safe_speed, max(1.0, loop_len));
        play_ph = select2(active, play_ph1, g.wrap(0.0, 1.0, g.keep(play_ph1 + ph_inc)));

        // 7. decimation counter
        down_factor = floor(1.0 + g.clip(0.0, 1.0, downsample * 0.01) * 24.0);
        dc1 = down_countd + 1;
        dtick = dc1 >= down_factor;
        down_count = select2(dtick, dc1, 0);
    };
};

// ---------------------------------------------------------------- audio
// Data b0_L/b1_L (b0_R/b1_R) as one table of 2 * BUF slots and a trash slot,
// written at widx before this frame's peeks (one table per read)
peek(x, widx, ri) = select2(ri < 2 * BUF, 0.0, rwtable(2 * BUF + 1, 0.0, int(widx), x, int(ri)));

skipper(in1, in2, n0, n1, n2, n3, n4) = out1, out2, loop_ms, speed
with {
    c = ctrl(n0, n1, n2, n3, n4);
    widx = c : ba.selector(0, 11);
    active = c : ba.selector(1, 11);
    ri0 = c : ba.selector(2, 11);
    ri1 = c : ba.selector(3, 11);
    fr = c : ba.selector(4, 11);
    fade_gain = c : ba.selector(5, 11);
    vol_scale = c : ba.selector(6, 11);
    gate = c : ba.selector(7, 11);
    theta = c : ba.selector(8, 11);
    loop_ms = c : ba.selector(9, 11);
    dtick = c : ba.selector(10, 11);

    raw_L = g.mix(peek(in1, widx, ri0), peek(in1, widx, ri1), fr);
    raw_R = g.mix(peek(in2, widx, ri0), peek(in2, widx, ri1), fr);
    grain_L = g.keep(g.keep(g.keep(raw_L * fade_gain) * vol_scale) * gate);
    grain_R = g.keep(g.keep(g.keep(raw_R * fade_gain) * vol_scale) * gate);
    wet_L = select2(active, 0.0, g.keep(grain_L * cos(theta)) * 1.41421356);
    wet_R = select2(active, 0.0, g.keep(grain_R * sin(theta)) * 1.41421356);

    hold(x) = (\(h).(select2(dtick, h, x))) ~ _;
    ds_on = downsample > 0.5;
    ds_wet_L = select2(ds_on, wet_L, hold(wet_L));
    ds_wet_R = select2(ds_on, wet_R, hold(wet_R));
    lim_wet_L = ma.tanh(ds_wet_L * 1.15) * 0.95;
    lim_wet_R = ma.tanh(ds_wet_R * 1.15) * 0.95;
    eff_mix = g.clip(0.0, 1.0, mix_p * 0.01);
    out1 = g.mix(in1, lim_wet_L, eff_mix);
    out2 = g.mix(in2, lim_wet_R, eff_mix);
};

ba = library("basics.lib");

det = skipper;
process = (_, _, g.noises(5, 0), g.noises(5, 1), g.noises(5, 2), g.noises(5, 3), g.noises(5, 4)) : det;
