// DELAYS-DELAYS: 32-tap sculptural delay with ladder filters and 16-channel
// spatialization (gen~: gendsp/delays-delays.gendsp)
//
// Two delay lines (L, R) are read by 32 taps whose times and amplitudes come
// from a 2-channel buffer~ `buf_taps` (ch 0: time in ms, ch 1: amplitude). Each
// tap is glided towards its time (smooth_time), the right line is read later
// by up to 250 ms * i/31 depending on spread, and each tap runs a 4-pole
// "ladder" (four one-poles, tanh feedback k = 4*res mapped to 0.6..0.98) whose
// cutoff is spread between f_start and f_end over the taps (f_direction:
// 0 descending, 1 ascending, 2 pseudo-random, 3 by the tap amplitude); f_type
// morphs LP (0) -> HP (1) -> BP (2), f_mix blends raw and filtered taps. The
// tap sum, tanh-saturated and DC-blocked, is fed back (feedback, rescaled to
// 0..0.75), with input-envelope ducking. Stereo mode: out1, out2 = dry/wet
// (constant-power mix) of the sums; mc_mode 1: each tap is panned on a ring of
// 16 outputs (offset, spread = rotation). A third line carries the input
// onset trigger (100 ms lockout) so that each tap reports its hit.
//
// in1, in2: audio
// out1..out16: audio (stereo on 1-2, or 16 channels), out17: input onset
// trigger (4800 samples), out18: tap hit pulse, out19: index of the last tap
// hit, out20: its amplitude
//
// Parameters: mix (0..1), mc_mode (0/1), gain (0..5), spread (-100..100),
// offset (0..1), ducking (0..1), smooth_time (0..0.999), clear (0/1),
// f_type (0..2), f_start, f_end (20..20000 Hz, used within 20..16000),
// f_direction (0..3), feedback, f_mix, res (0..100).
//
// The buffer: in GEN-patches/delays-delays.maxpat, `buffer~ ---buf_taps @samps
// 32 @chans 2` is filled by the v8ui tap_manager.js from its parameters (max
// delay, gravity in/out, sphere position, window...), which the UI changes at
// run time. This port holds the content the patch loads (pattr ma_sphere
// restore: 5000 ms, gravity -70/34, Gaussian window around 0.328), as float32,
// as constants: scripts/delays_delays_buffer.py computes them (and the file
// ref/buffers/delays_delays.buf_taps.txt the reference reads). With a constant
// buffer the glissando (smooth_ms) is the identity: c_ms = t_target from the
// first frame; it is kept as gen computes it.
//
// Each of the 16 output channels has its own DC blocker (y = x - x1 +
// 0.995*y1), and the taps are spread on a ring of 16 positions.
//
// Quirks kept from gen~:
// - the DC blockers' loop assigns `prev_in = peek(dc_in, n)`, and prev_in is
//   the History of the onset trigger: after the loop it holds dc_in[15] as it
//   was before this frame's poke, i.e. tanh(bus 15 / 4) two frames back, and
//   the trigger tests that value == 0 instead of the previous input
//   threshold. While bus 16 is silent (the default tap table puts only its
//   last tap, of amplitude 0, there) the trigger is no longer an onset
//   detector: it fires again every 100 ms as long as the input is above the
//   threshold; once taps reach bus 16 (spread, offset) it no longer fires;
// - the comments' "f_on" toggle does not exist in the GenExpr.

declare name "delays-delays";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
ba = library("basics.lib");
g = library("genops.lib");

mix = hslider("mix", 0.5, 0, 1, 0.001);
mc_mode = hslider("mc_mode [style:menu{'stereo':0;'16 channels':1}]", 0, 0, 1, 1);
gain = hslider("gain", 1, 0, 5, 0.001);
spread = hslider("spread", 0, -100, 100, 0.01);
offset = hslider("offset", 0, 0, 1, 0.001);
ducking = hslider("ducking", 0, 0, 1, 0.001);
smooth_time = hslider("smooth_time", 0.9, 0, 0.999, 0.001);
clear = hslider("clear", 0, 0, 1, 1);
f_type = hslider("f_type", 0, 0, 2, 0.001);
f_start = hslider("f_start [unit:Hz]", 16000, 20, 20000, 1);
f_end = hslider("f_end [unit:Hz]", 800, 20, 20000, 1);
f_direction = hslider("f_direction [style:menu{'desc':0;'asc':1;'random':2;'amplitude':3}]", 0, 0, 3, 1);
feedback = hslider("feedback", 0, 0, 100, 0.01);
f_mix = hslider("f_mix", 0, 0, 100, 0.01);
res = hslider("res", 0, 0, 100, 0.01);

// buf_taps as the patch loads it (scripts/delays_delays_buffer.py --faust), float32 values
buf_t = (0.10000000149011612, 1.317352294921875, 6.953027248382568, 18.39894676208496, 36.698299407958984, 62.69457244873047, 97.11022186279297, 140.5844268798828, 193.6947784423828, 256.9709167480469, 330.9039306640625, 415.953125, 512.5508422851562, 621.1063842773438, 742.0090942382812, 875.6306762695312, 1022.3271484375, 1182.440673828125, 1356.300537109375, 1544.2249755859375, 1746.521484375, 1963.488037109375, 2195.413818359375, 2442.579833984375, 2705.259521484375, 2983.71923828125, 3278.218994140625, 3589.012451171875, 3916.347412109375, 4260.46630859375, 4621.6064453125, 5000.0);
buf_a = (0.6277148723602295, 0.6761665344238281, 0.7264364957809448, 0.7770863175392151, 0.8264593482017517, 0.8727630972862244, 0.9141733646392822, 0.9489516019821167, 0.9755649566650391, 0.992798388004303, 0.9998462200164795, 0.9963749647140503, 0.9825491309165955, 0.9590185880661011, 0.9268677830696106, 0.8875328898429871, 0.8426955938339233, 0.7941644191741943, 0.7437552809715271, 0.6931816339492798, 0.6439641118049622, 0.5973644852638245, 0.5543472170829773, 0.5155686736106873, 0.48138952255249023, 0.4519070088863373, 0.4269992411136627, 0.4063768684864044, 0.38963526487350464, 0.3763033151626587, 0.1829427033662796, 0.0);
NT = 32;
NC = 16;

DMAXD = 1500000;   // Delay dL(1500000), dR(1500000), dS(1500000)
MAXD = 1500000;    // compile-time bound of the Faust lines

I31 = 0.032258064516129031;   // i/31 as the export computes it
// History s(init) smoothed: s = mix(s, target, a)
smoothed(a, init, target) = (\(s).(s + a * (target - s))) ~ g.init(init);
// left fold f(0) ... f(n): (((f(0) [op] f(1)) ...)
lsum(f, 0) = f(0);
lsum(f, n) = lsum(f, n - 1) + f(n);

// one frame: the L and R delay inputs fed back (delayed by one sample), the
// audio inputs -> the L and R delay inputs written, the 20 outputs
core(wLd, wRd, in1, in2) = wL, wR, outs, ui_master_trig, tap_hit_pulse, h_idx, h_amp
with {
    in1_c = g.dcblock(in1);
    in2_c = g.dcblock(in2);
    in_abs = (abs(in1_c) + abs(in2_c)) * 0.5;

    // master UI trigger, 100 ms lockout; prev_in: dc_in[15] of the previous
    // frame before its poke (see the quirk above)
    above = in_abs > 0.005;
    prev_in = mcx(NC - 1)'';
    arm(tp) = select2(above & (prev_in == 0) & (tp == 0), tp, 4800);
    trig_timer = (\(tp).(max(0, arm(tp) - 1))) ~ _;
    ui_master_trig = arm(trig_timer') > 0;

    env_fol = (\(e).(e + select2(in_abs > e, 0.0008, 0.2) * (in_abs - e))) ~ _;
    duck = 1 + ducking * ((1 - g.safepow(g.clamp(0, 1, env_fol * 5), 1.5) * 0.95) - 1);

    s_f_mx = smoothed(0.05, 0, g.clamp(0, 1, f_mix * 0.01));
    s_f_type = smoothed(0.05, 0, g.clamp(0, 2, f_type));
    s_off = smoothed(0.1, 0, offset);
    s_spr = smoothed(0.1, 0, spread);
    s_gn = smoothed(0.1, 0, g.clamp(0, 5, gain));
    s_mx = smoothed(0.1, 0, g.clamp(0, 1, mix));
    s_mode = smoothed(0.1, 0, mc_mode);
    s_f_st = smoothed(0.05, 16000, g.clamp(20, 16000, f_start));
    s_f_ed = smoothed(0.05, 800, g.clamp(20, 16000, f_end));
    s_res = smoothed(0.05, 0.5, 0.6 + g.clamp(0, 1, res * 0.01) * 0.38);

    angle = s_mx * 1.57079632679;
    dry_v = cos(angle);
    wet_v = sin(angle);
    fb_amt = g.safepow(g.clamp(0, 1, feedback * 0.01), 1.2) * 0.75;
    mc_step = select2(s_spr < 0, 0.4838709677419355 + (s_spr * 0.01) * 2,
                                 0.4838709677419355 * (1 + s_spr * 0.01));
    f_min = min(s_f_st, s_f_ed);
    f_max = max(s_f_st, s_f_ed);
    log_ratio = log(f_max / f_min);
    k_res = 4 * s_res;
    mute = select2(clear > 0, 1, 0);
    ws = ui_master_trig * mute;   // dS.write

    // ---- tap i
    t_target(i) = ba.take(i + 1, buf_t);
    t_amp(i) = ba.take(i + 1, buf_a);
    // smooth_ms[i] (0 at start): p = (p <= 0) ? t_target : p; c = mix(p, t_target, 1 - smooth)
    c_ms(i) = (\(p).(g.mix(pm(p), t_target(i), 1 - g.clamp(0, 0.999, smooth_time)))) ~ _
    with { pm(p) = select2(p <= 0, p, t_target(i)); };
    t_samp(i) = c_ms(i) * (ma.SR * 0.001);
    sigL(i) = g.rd_linear_fb(MAXD, DMAXD, wLd, t_samp(i));
    sigR(i) = g.rd_linear_fb(MAXD, DMAXD, wRd,
        t_samp(i) + ((((s_spr + 100) * 0.005) * 250) * (i * I31)) * (ma.SR * 0.001));

    rnd(i) = g.fract(sin(i * 12.98) * 43758);
    mod(i) = select2(f_direction == 0,
                select2(f_direction == 1,
                    select2(f_direction == 2, t_amp(i), rnd(i)),
                    i * I31),
                1 - i * I31);
    f_coeff(i) = (f_min * exp(mod(i) * log_ratio) * 2) / ma.SR;

    // 4 one-poles with tanh feedback; outputs l1..l4 of the frame
    ladder(f, x) = (\(p1, p2, p3, p4).(st(f, x, p1, p2, p3, p4))) ~ (_, _, _, _)
    with {
        st(f, x, p1, p2, p3, p4) = l1, l2, l3, l4
        with {
            l_in = x - k_res * ma.tanh(p4);
            l1 = p1 + f * (l_in - p1);
            l2 = p2 + f * (l1 - p2);
            l3 = p3 + f * (l2 - p3);
            l4 = p4 + f * (l3 - p4);
        };
    };
    shape(x, l1, l2, l3, l4) = select2(s_f_type < 1,
            g.mix(hp, (l2 - l4) * 2, g.clamp(0, 1, s_f_type - 1)),
            g.mix(l4, hp, s_f_type))
    with { hp = (((x - 4 * l1) + 6 * l2) - 4 * l3) + l4; };
    filt(i, x) = g.mix(x, ladder(f_coeff(i), x) : shape(x), s_f_mx) * t_amp(i);
    fL(i) = filt(i, sigL(i));
    fR(i) = filt(i, sigR(i));

    // MC spatialisation
    mono(i) = (fL(i) + fR(i)) * 0.5;
    pos(i) = g.wrap(0, 16, (s_off * 16) + (i * mc_step));
    idx(i) = floor(pos(i));
    fr(i) = g.fract(pos(i));
    idx2(i) = g.wrap(0, 16, idx(i) + 1);
    // mc_bus[c] after taps 0..n, in gen's order (idx written, then idx2)
    bus(c, 0) = bstep(c, 0, 0);
    bus(c, n) = bstep(c, n, bus(c, n - 1));
    bstep(c, i, acc) = select2(idx2(i) == c, a1, a1 + mono(i) * fr(i))
    with { a1 = select2(idx(i) == c, acc, acc + mono(i) * (1 - fr(i))); };

    // elastic sync: dS read 5 ms ahead (step, before its write)
    is_hit(i) = g.rd_step(MAXD, DMAXD, 1, ws, max(0, c_ms(i) - 5) * (ma.SR * 0.001)) > 0.5;
    hit(i) = is_hit(i) & (is_hit(i)' == 0);
    tap_hit_pulse = lsum(hit, NT - 1) > 0;
    hsel(v, prev, 0) = select2(hit(0), prev, v(0));
    hsel(v, prev, n) = select2(hit(n), hsel(v, prev, n - 1), v(n));
    h_idx = (\(p).(hsel(\(i).(i), p, NT - 1))) ~ g.init(-1);
    h_amp = (\(p).(hsel(t_amp, p, NT - 1))) ~ _;

    sumL = lsum(fL, NT - 1);
    sumR = lsum(fR, NT - 1);

    // FB & writing
    wL = (in1_c + (g.dcblock(ma.tanh(sumL * 0.05)) * fb_amt) * duck) * mute;
    wR = (in2_c + (g.dcblock(ma.tanh(sumR * 0.05)) * fb_amt) * duck) * mute;

    gn = ((s_gn * duck) * wet_v) * mute;
    dry = dry_v * mute;
    s_L = (in1 * dry) + g.dcblock(ma.tanh(sumL * 0.1)) * gn;
    s_R = (in2 * dry) + g.dcblock(ma.tanh(sumR * 0.1)) * gn;

    // a DC blocker per channel: y = x - x1 + 0.995*y1 (Data dc_in, dc_out)
    mcx(n) = ma.tanh(bus(n, NT - 1) * 0.25);
    dcy = par(n, NC, (mcx(n) - mcx(n)') : (+ ~ *(0.995)));
    chan(n, y) = g.mix(select2(n == 0, select2(n == 1, 0, s_R), s_L), mc, s_mode)
    with { mc = y * gn + select2(n < 2, 0, select2(n == 0, in2, in1) * dry); };
    outs = dcy : par(n, NC, chan(n));
};

delays = core ~ (_, _) : !, !, par(n, 20, _);

process = delays;
det = delays;
