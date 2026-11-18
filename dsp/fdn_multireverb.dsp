// FDN_MULTIREVERB: multichannel 4x4 Hadamard FDN reverb (gen~: gendsp/fdn_multireverb.gendsp,
// an mc.gen~ patch: one instance per channel)
//
// In gen~ the patch runs in mc.gen~, one instance per channel. This program
// is the N instances together: N inputs and N outputs, channel k processing
// input k (N = 8 below; change it as @chans on mc.gen~). Each channel has its
// own reverb, decorrelated from the others by its index: its delay lengths
// are detuned by sin(k * phi) * 6 % * spread, and its LFO phase is offset by
// (k-1)/N * spread.
//
// Per channel: a predelay (0..100 ms), two allpasses (g = 0.6, 400 and 600
// samples times the slid size), a 4x4 Hadamard FDN (lines of 1531, 2237,
// 3163, 4453 samples times the size, sine-modulated by `speed`/`depth`,
// feedback `decay` through tanh, one-pole damping `absorb`, dcblocked), a
// tap that depends on the channel (k mod 4 picks one of four line
// combinations), a tilt (-1 dark .. +1 bright), the dry/wet mix (slid) and a
// tanh.
//
// in1..inN: audio    out1..outN: dry/wet
//
// Parameters: size (0.5..100 %, def 90), decay (0..110 %, def 82), spread
// (0..100 %, def 90), absorb (0..100 %, def 10), tilt (-1..1, def -0.1),
// predelay (0..100 ms, def 10), speed (0.1..10 Hz, def 1), depth (0..20,
// def 5), mix (0..100 %, def 25).
//
// `mix` is the GenExpr's Param mix_rev(25, name="mix"): gen~ in Max shows it as
// mix, the C++ export as mix_rev.

declare name "fdn_multireverb";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
si = library("signals.lib");
g = library("genops.lib");

N = 8;   // the number of channels: mc.gen~'s @chans

size = hslider("size [unit:%]", 90, 0.5, 100, 0.01);
decay = hslider("decay [unit:%]", 82, 0, 110, 0.01);
spread = hslider("spread [unit:%]", 90, 0, 100, 0.01);
absorb = hslider("absorb [unit:%]", 10, 0, 100, 0.01);
tilt = hslider("tilt", -0.1, -1, 1, 0.001);
predelay = hslider("predelay [unit:ms]", 10, 0, 100, 0.01);
speed = hslider("speed [unit:Hz]", 1, 0.1, 10, 0.001);
depth = hslider("depth", 5, 0, 20, 0.001);
mix_rev = hslider("mix [unit:%]", 25, 0, 100, 0.01);

TWOPI = 6.2831853071795862;

// the export's inlined clamp: (v <= lo) ? lo : ((v >= hi) ? hi : v)
tclamp = g.clip;

lp1(a, x) = (\(h).(g.mix(x, h, a))) ~ _;

// allpass on a Delay of 2000 read (linear) at D before and after its write
rap(D, x) = g.rd_linear(2000, 2000, 0, v, D) + v * 0.6
with { v = (\(vd).(x - g.rd_linear_fb(2000, 2000, vd, D) * 0.6)) ~ _; };

// the FDN on lines of lengths t1..t4: outputs r1..r4
fdn(t1, t2, t3, t4, fb_amount, damp, diff_in) = (loop ~ si.bus(4)) : si.block(4), si.bus(4)
with {
    loop(w1d, w2d, w3d, w4d) = w(h1), w(h2), w(h3), w(h4), r1, r2, r3, r4
    with {
        r1 = g.rd_linear_fb(15000, 15000, w1d, t1);
        r2 = g.rd_linear_fb(15000, 15000, w2d, t2);
        r3 = g.rd_linear_fb(15000, 15000, w3d, t3);
        r4 = g.rd_linear_fb(15000, 15000, w4d, t4);
        h1 = lp1(damp, (((r1 + r2) + r3) + r4) * 0.5);
        h2 = lp1(damp, (((r1 - r2) + r3) - r4) * 0.5);
        h3 = lp1(damp, (((r1 + r2) - r3) - r4) * 0.5);
        h4 = lp1(damp, (((r1 - r2) - r3) + r4) * 0.5);
        w(h) = g.fixdenorm(g.dcblock(diff_in + ma.tanh(h * fb_amount)));
    };
};

// one instance: channel `ch` (mc_channel, 1-based) of `count` (mc_channelcount)
reverb(ch, count, in1) = out1
with {
    n_chans = max(1, count);
    ch_idx = ch - 1;
    ch_pos = select2(n_chans > 1, 0, ch_idx / n_chans);
    s_spread = spread * 0.01;
    ch_detune = (sin((ch_idx + 1) * 1.6180339887) * 0.06) * s_spread;
    s_size = g.slide(2000, 2000, size / 100);
    h_ph = (\(p).(g.wrap(0, 1, p + g.safediv(speed, ma.SR)))) ~ _;
    lfo_ph = g.wrap(0, 1, h_ph + (ch_pos * s_spread));
    lfo = sin(lfo_ph * TWOPI) * (depth * 5);
    scale_ch = s_size * (1 + ch_detune);
    t1 = tclamp(10, 14000, (1531 * scale_ch) + lfo);
    t2 = tclamp(10, 14000, (2237 * scale_ch) - lfo);
    t3 = tclamp(10, 14000, (3163 * scale_ch) + lfo);
    t4 = tclamp(10, 14000, (4453 * scale_ch) - lfo);
    p_sig = g.rd_linear(9600, 9600, 1, in1, predelay * (ma.SR * 0.001));
    ap1_time = (400 * s_size) * (1 + (ch_detune * 0.5));
    ap2_time = (600 * s_size) * (1 - (ch_detune * 0.5));
    diff_in = p_sig : rap(ap1_time) : rap(ap2_time);
    rr = fdn(t1, t2, t3, t4, decay / 100, absorb / 100, diff_in);
    r1 = rr : _, !, !, !;
    r2 = rr : !, _, !, !;
    r3 = rr : !, !, _, !;
    r4 = rr : !, !, !, _;
    tap = ch_idx % 4;
    raw = select2(tap == 1, select2(tap == 2, select2(tap == 3, (r1 + r3) * 0.5, (r2 - r3) * 0.5),
                                              (r1 - r4) * 0.5),
                            (r2 + r4) * 0.5);
    t_lp = lp1(0.1, raw);
    res = select2(tilt < 0, g.mix(raw, raw - t_lp, tilt), g.mix(raw, t_lp, abs(tilt)));
    s_mix = g.slide(240, 240, tclamp(0, 1, mix_rev * 0.01));
    out1 = ma.tanh(g.mix(in1, res, s_mix));
};

multireverb = par(c, N, reverb(c + 1, N));

process = multireverb;
det = process;
