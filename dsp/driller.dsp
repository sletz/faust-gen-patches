// DRILLER: stochastic beat-repeat / drill delay (gen~: gendsp/driller.gendsp)
//
// The input plus a feedback of the drill (tanh(1.05 x) `feedback`, at most
// 0.95) is written into a 192000-sample Delay per channel. A beat clock of
// period `maindelay` ms (+ in3) refreshes, at each beat (in modes 0 and 1)
// or when `mode` changes: the ping-pong side toggles, a draw decides
// whether this beat is degraded (`degrade_prob`, if `degrade` > 0.5), and
// unless `probability` (+ in4) is 0, a draw against it picks a new tap: a
// rest (`mute_prob`) or one of the six taps (1: the main period, 2..6: the
// period divided by div2..div6) with a pan jitter (`pan_spread`); otherwise
// the tap is kept. The slice length becomes floor(period / ratio) (at least
// 2 samples), and the read head (4-point cubic) loops it: after each slice
// the delay grows by the slice length, so the same audio repeats, with
// 1.5 ms raised-cosine fades at the seams. Each tap has a gain (vol1..vol6)
// crossfaded by one-pole weights (0.05 per sample); the right read is
// `stereo_spread` x 12 ms further. Then a pan by tap (slewed, 0.03), an
// adaptive one-pole high-pass (20 Hz + 45 Hz per ratio step, `roll_filter`),
// a lo-fi stage (decimation by up to 25, bit crush down to 3 bits, drive)
// faded in by `degrade` on degraded beats, the dry (mode 0 only) and `mix`.
//
// in1, in2: audio L, R    in3: main delay CV (ms, added to maindelay)
// in4: probability CV (%, added to probability)
// out1, out2: processed L, R
// out3: the current tap (0 rest, 1 main, 2..6 the divisions)
//
// Parameters (gen~'s ranges and defaults): maindelay (10..4000 ms, 500),
// div2..div6 (1..32: 2, 4, 8, 10, 12), vol1..vol6 (0..3: 1, 0.8, 0.8, 0.7,
// 0.7, 0.65), probability (0..100 %, 75), mute_prob (0..100 %, 10),
// feedback (0..100 %, 60), stereo_spread (0..100 %, 30),
// pan_spread (0..100 %, 50), roll_filter (0..100 %, 50),
// degrade (0..100 %, 0), degrade_prob (0..100 %, 30), mode (0..2, 0:
// overlay, 1: insert, 2: capture), mix (0..100 %, 100).
//
// gen~ quirks kept:
// - the feedback is applied in every mode (the header says overlay only);
// - in mode 2 (capture) nothing refreshes the slice after the mode change, so
//   the delay keeps growing by a slice at each loop until it reaches the
//   190000-sample clamp (about 4 s at 48 kHz): from there it is a plain
//   delay of 190000 samples, not a held loop;
// - in modes 0 and 1 the delay grows the same way within a beat; the slice
//   is cut at the beat when the period is not a multiple of it;
// - the beat clock is a phase in [0, 2pi) stepped by 2pi/period: its wraps
//   and the period in samples (floor of mstosamps) need not agree;
// - a rest (tap 0) keeps the pan jitter of the last pick, and a slice of the
//   main period; the jitter is set to 0 only when probability is 0;
// - the counters `h_sub_count`, `h_down_count` and the delay are not reset
//   when `mode` returns to 0 except through the refresh.
//
// Noise sites (export order): 0 the degradation draw, 1 the probability
// draw, 2 the rest draw, 3 the tap pick, 4 the pan jitter (each on a refresh).

declare name "driller";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");
si = library("signals.lib");

maindelay = hslider("maindelay [unit:ms]", 500, 10, 4000, 0.01);
div2 = hslider("div2", 2, 1, 32, 0.001);
div3 = hslider("div3", 4, 1, 32, 0.001);
div4 = hslider("div4", 8, 1, 32, 0.001);
div5 = hslider("div5", 10, 1, 32, 0.001);
div6 = hslider("div6", 12, 1, 32, 0.001);
vol1 = hslider("vol1", 1.0, 0, 3, 0.001);
vol2 = hslider("vol2", 0.8, 0, 3, 0.001);
vol3 = hslider("vol3", 0.8, 0, 3, 0.001);
vol4 = hslider("vol4", 0.7, 0, 3, 0.001);
vol5 = hslider("vol5", 0.7, 0, 3, 0.001);
vol6 = hslider("vol6", 0.65, 0, 3, 0.001);
probability = hslider("probability [unit:%]", 75, 0, 100, 0.01);
mute_prob = hslider("mute_prob [unit:%]", 10, 0, 100, 0.01);
feedback = hslider("feedback [unit:%]", 60, 0, 100, 0.01);
stereo_spread = hslider("stereo_spread [unit:%]", 30, 0, 100, 0.01);
pan_spread = hslider("pan_spread [unit:%]", 50, 0, 100, 0.01);
roll_filter = hslider("roll_filter [unit:%]", 50, 0, 100, 0.01);
degrade = hslider("degrade [unit:%]", 0, 0, 100, 0.01);
degrade_prob = hslider("degrade_prob [unit:%]", 30, 0, 100, 0.01);
mode = hslider("mode [style:menu{'overlay':0;'insert':1;'capture':2}]", 0, 0, 2, 1);
mix = hslider("mix [unit:%]", 100, 0, 100, 0.01);

PI = 3.1415926535897931;
TWOPI = 6.2831853071795862;

// k: g.keep, an identity the Faust normalizer does not see through: it pins
// the intermediate values of the GenExpr that Faust would otherwise expand,
// factor, reorder or constant-fold (the export computes them as written)
k = g.keep;
// sr * 0.001 as the export computes mstosamps (Faust would fold 1.5 * 0.001)
ms2s(ms) = ms * k(ma.SR * 0.001);
tdiv = g.tdiv;   // safediv(n, d) for d > 0, as a true division

r2 = max(1.0, div2);
r3 = max(1.0, div3);
r4 = max(1.0, div4);
r5 = max(1.0, div5);
r6 = max(1.0, div6);
// the ratio of a tap (0: 1)
ratio(t) = select2(t == 0, select2(t == 1, select2(t == 2, select2(t == 3,
             select2(t == 4, select2(t == 5, r6, r5), r4), r3), r2), 1.0), 1.0);

// ---------------------------------------------------------------- control
// states: beat phase, tap, ping-pong, degraded, jitter, slice length, delay,
// slice counter; outputs, after the refresh: tap, ping-pong, degraded,
// jitter, slice length, delay (read), counter (fade)
ctrl(in3, in4, n0, n1, n2, n3, n4) = (body ~ si.bus(8)) : si.block(8), si.bus(7)
with {
    eff_main = g.clip(10.0, 4000.0, maindelay + in3);
    n_main = g.mstosamps(eff_main);
    inc_beat = g.divsr(k(g.safediv(1000.0, eff_main) * TWOPI));
    mode_changed = mode != mode';
    eff_p = g.clip(0.0, 100.0, probability + in4);
    eff_m = g.clip(0.0, 100.0, mute_prob);
    eff_deg_p = g.clip(0.0, 100.0, degrade_prob);
    u(n) = (n * 0.5 + 0.5) * 100.0;

    body(phd, tapd0, ppd, degd, jitd, sld0, dd0, cntd) =
        ph, tap, pp, isdeg, jit, sl, dl, cnt,
        tap, pp, isdeg, jit, sl, d0, cnt0
    with {
        tapd = g.init(1, tapd0);
        sld = g.init(24000, sld0);
        dd = g.init(24000, dd0);
        ph = g.wrap(0.0, TWOPI, k(phd + inc_beat));
        is_beat = ph < phd;
        refresh = (is_beat & (mode < 1.5)) | mode_changed;

        pp = select2(refresh, ppd, select2(ppd > 0.5, 1.0, 0.0));
        isdeg = select2(refresh, degd, (u(n0) < eff_deg_p) & (degrade > 0.5));
        locked = eff_p <= 0.001;
        drawn = u(n1) < eff_p;
        rest = u(n2) < eff_m;
        pick = g.clip(1, 6, floor((n3 * 0.5 + 0.5) * 6.0) + 1);
        jit_new = k(k(n4 * 0.4) * (pan_spread * 0.01));
        tap = select2(refresh, tapd,
                select2(locked, select2(drawn, tapd, select2(rest, pick, 0)), 1));
        jit = select2(refresh, jitd,
                select2(locked, select2(drawn & (rest == 0), jitd, jit_new), 0.0));
        new_sub = max(2.0, floor(g.safediv(n_main, ratio(tap))));
        sl = select2(refresh, sld, new_sub);
        d0 = select2(refresh, dd, new_sub);
        cnt0 = select2(refresh, cntd, 0);
        cnt1 = cnt0 + 1;
        loop_end = cnt1 >= sl;
        cnt = select2(loop_end, cnt1, 0);
        dl = select2(loop_end, d0, k(d0 + sl));
    };
};

// one-pole weight towards target t, history starting at init
weight(init, t) = (\(hd).(g.fixdenorm(g.init(init, hd) + (t - g.init(init, hd)) * 0.05))) ~ _;

// ---------------------------------------------------------------- audio
driller(in1, in2, in3, in4, n0, n1, n2, n3, n4) = out1, out2, out3
with {
    c = ctrl(in3, in4, n0, n1, n2, n3, n4);
    tap = c : _, !, !, !, !, !, !;
    pp = c : !, _, !, !, !, !, !;
    isdeg = c : !, !, _, !, !, !, !;
    jit = c : !, !, !, _, !, !, !;
    sl = c : !, !, !, !, _, !, !;
    d0 = c : !, !, !, !, !, _, !;
    cnt0 = c : !, !, !, !, !, !, _;

    user_fb = g.clip(0.0, 0.95, feedback * 0.01);
    spr_samps = ms2s(k(k(stereo_spread * 0.01) * 12.0));
    read_D_L = g.clip(2.0, 190000.0, d0);
    read_D_R = g.clip(2.0, 190000.0, k(d0 + spr_samps));

    fade_samps = min(ms2s(1.5), floor(sl * 0.25));
    fade_gain = select2(fade_samps > 1.0, 1.0,
                  select2(cnt0 < fade_samps,
                    select2(cnt0 > sl - fade_samps, 1.0,
                      0.5 - 0.5 * cos(k(tdiv(sl - cnt0, fade_samps)) * PI)),
                    0.5 - 0.5 * cos(k(tdiv(cnt0, fade_samps)) * PI)));

    w1 = weight(1.0, select2(tap == 1, 0.0, 1.0));
    w2 = weight(0.0, select2(tap == 2, 0.0, 1.0));
    w3 = weight(0.0, select2(tap == 3, 0.0, 1.0));
    w4 = weight(0.0, select2(tap == 4, 0.0, 1.0));
    w5 = weight(0.0, select2(tap == 5, 0.0, 1.0));
    w6 = weight(0.0, select2(tap == 6, 0.0, 1.0));
    active_vol = k(k(k(k(k(k(g.clip(0.0, 3.0, vol1) * w1) + k(g.clip(0.0, 3.0, vol2) * w2))
               + k(g.clip(0.0, 3.0, vol3) * w3)) + k(g.clip(0.0, 3.0, vol4) * w4))
               + k(g.clip(0.0, 3.0, vol5) * w5)) + k(g.clip(0.0, 3.0, vol6) * w6));

    // the recording loop: the feedback is the previous frame's drill
    rec = loop ~ (_, _) : !, !, _, _
    with {
        loop(fbL, fbR) = g.fixdenorm(dcL), g.fixdenorm(dcR), dcL, dcR
        with {
            xL = in1 + k(ma.tanh(fbL * 1.05) * user_fb);
            xR = in2 + k(ma.tanh(fbR * 1.05) * user_fb);
            dcL = k(k(g.rd_cubic(192000, 192000, 0, xL, read_D_L) * fade_gain) * active_vol);
            dcR = k(k(g.rd_cubic(192000, 192000, 0, xR, read_D_R) * fade_gain) * active_vol);
        };
    };
    drill_clean_L = rec : _, !;
    drill_clean_R = rec : !, _;

    // pan by tap
    base_pan = select2(tap == 0, select2(tap == 1, select2(tap == 2, select2(tap == 3,
                 select2(tap == 4, select2(tap == 5, select2(pp > 0.5, 0.95, -0.95), 0.75), -0.75),
                 0.35), -0.35), 0.0), 0.0);
    pan_target = g.clip(-1.0, 1.0, k(base_pan * (pan_spread * 0.01)) + jit);
    pan_cur = (\(h).(g.fixdenorm(h + k((pan_target - h) * 0.03)))) ~ _;
    theta_pan = k(pan_cur + 1.0) * (PI * 0.25);
    pan_drill_L = k(drill_clean_L * k(cos(theta_pan) * 1.41421356));
    pan_drill_R = k(drill_clean_R * k(sin(theta_pan) * 1.41421356));

    // adaptive one-pole high-pass
    f_hp = g.clip(20.0, 2500.0, 20.0 + k(k(k(ratio(tap) - 1.0) * 45.0) * (roll_filter * 0.01)));
    alpha_hp = g.safediv(1.0, 1.0 + g.divsr(k(f_hp * TWOPI)));
    hpf(x) = (\(y).(k(alpha_hp * k(k(y + x) - x')))) ~ _;
    filt_mix = g.clip(0.0, 1.0, roll_filter * 0.01);
    filt_drill_L = k(g.mix(pan_drill_L, hpf(pan_drill_L), filt_mix));
    filt_drill_R = k(g.mix(pan_drill_R, hpf(pan_drill_R), filt_mix));

    // lo-fi degradation
    target_deg = select2(isdeg != 0, 0.0, g.clip(0.0, 1.0, degrade * 0.01));
    deg = (\(h).(g.fixdenorm(h + k((target_deg - h) * 0.05)))) ~ _;
    down_factor = floor(1.0 + k(deg * 24.0));
    take = (\(cd).(select2(cd + 1 >= down_factor, cd + 1, 0))) ~ _ : ==(0);
    hold(x) = (\(h).(select2(take, h, x))) ~ _;
    bit_steps = floor(g.safepow(2.0, max(3.0, 16.0 - k(deg * 12.0))));
    crush(x) = k(tdiv(floor(k(x * bit_steps) + 0.5), bit_steps));
    drive_gain = 1.0 + k(deg * 2.5);
    drive_norm = g.safediv(1.0, 1.0 + k(deg * 0.35));
    driven(x) = k(ma.tanh(k(crush(hold(x)) * drive_gain)) * drive_norm);
    drill_L = k(g.mix(filt_drill_L, driven(filt_drill_L), deg));
    drill_R = k(g.mix(filt_drill_R, driven(filt_drill_R), deg));

    wet_L = select2(mode < 0.5, drill_L, in1 + drill_L);
    wet_R = select2(mode < 0.5, drill_R, in2 + drill_R);
    mix_val = g.clip(0.0, 1.0, mix * 0.01);
    out1 = g.mix(in1, wet_L, mix_val);
    out2 = g.mix(in2, wet_R, mix_val);
    out3 = tap;
};

// the port with its noises as inputs: in1..in4, noise sites 0 (degradation),
// 1 (probability), 2 (rest), 3 (tap pick), 4 (pan jitter)
det = driller;
process = (_, _, _, _, g.noises(5, 0), g.noises(5, 1), g.noises(5, 2), g.noises(5, 3), g.noises(5, 4)) : det;
