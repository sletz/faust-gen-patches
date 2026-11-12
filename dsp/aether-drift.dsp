// AETHER-DRIFT: parallel cloud echo and 8-stage allpass reverb (gen~: gendsp/aether-drift.gendsp)
//
// High-diffusion spatial processor with parallel stereo delay and reverb
// chains. The stereo delay (0..2 s, slid over ~1000 samples, one-pole damping
// in its feedback, dcblock in the loop) feeds, with the dry mono sum, an
// 8-stage cascade of fixed allpasses (g = 0.75) into a cross-coupled "cloud"
// tank: two allpass pairs (g = +-0.7*diffusion), two dcblocked delays and two
// sine-modulated delays with one-pole damping. Delay and reverb are summed,
// mixed with the dry signal, gained, soft-clipped by tanh and DC-blocked.
//
// in1, in2: audio L, R     out1, out2: processed L, R (dry/wet)
//
// Parameters: mix (0..100 %), gainout (-60..12 dB), del_vol (-60..6 dB),
// del_time (0..100 % of 2000 ms), del_fb, del_damp, del_to_rev (0..100 %),
// rev_vol (-60..6 dB), rev_size (0..99 %), rev_diff, rev_damp, rev_mod (0..100 %).
//
// Quirk kept from gen~: the modulated tank reads d2.read(4217 + lfo1) and
// d4.read(4845 + lfo2) on Delays whose maximum is exactly 4217 and 4845, so
// gen clamps every positive LFO excursion: the modulation only shortens the
// delays (half-wave).

declare name "aether-drift";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");

mix = hslider("mix [unit:%]", 50, 0, 100, 0.01);
gainout = hslider("gainout [unit:dB]", 0, -60, 12, 0.01);
del_vol = hslider("del_vol [unit:dB]", -6, -60, 6, 0.01);
del_time = hslider("del_time [unit:%]", 40, 0, 100, 0.01);
del_fb = hslider("del_fb [unit:%]", 60, 0, 100, 0.01);
del_damp = hslider("del_damp [unit:%]", 30, 0, 100, 0.01);
del_to_rev = hslider("del_to_rev [unit:%]", 50, 0, 100, 0.01);
rev_vol = hslider("rev_vol [unit:dB]", -6, -60, 6, 0.01);
rev_size = hslider("rev_size [unit:%]", 85, 0, 99, 0.01);
rev_diff = hslider("rev_diff [unit:%]", 85, 0, 100, 0.01);
rev_damp = hslider("rev_damp [unit:%]", 40, 0, 100, 0.01);
rev_mod = hslider("rev_mod [unit:%]", 40, 0, 100, 0.01);

// slide(x, 1000, 1000), state starting at 0
slide(x) = (\(s).(g.fixdenorm(s + (1.0 / 1000) * (x - s)))) ~ _;

// one-pole damping: h = mix(x, h, a)
lp1(a, x) = (\(h).(g.mix(x, h, a))) ~ _;

// ---------------------------------------------------------------- delay
DMAX = 2 * 192000;
dmaxd = int(ma.SR * 2);
d_samps = slide(del_time * 0.01) * 2000 * (ma.SR * 0.001);

// one channel: the delay line in its feedback loop; outputs wet_del
delch(off, x) = (loop ~ _) : !, _
with {
    loop(wd) = w, wet
    with {
        wet = g.rd_linear_fb(DMAX, dmaxd, wd, d_samps + off);
        h = lp1(del_damp * 0.01, wet);
        w = g.dcblock(x + h * (del_fb * 0.01));
    };
};

// ---------------------------------------------------------------- reverb
// a fixed allpass on a Delay of maximum N read at N (read_step) before and
// after its write: v = x - v[n-N]*c, out = v[n-N] + v*c
ap(N, c, x) = v@N + v * c
with { v = (\(vd).(x - (vd @ (N - 1)) * c)) ~ _; };

diffuser = ap(151, 0.75) : ap(233, 0.75) : ap(347, 0.75) : ap(563, 0.75)
         : ap(761, 0.75) : ap(997, 0.75) : ap(1153, 0.75) : ap(1427, 0.75);

d_c = 0.7 * (rev_diff * 0.01);
dec = rev_size * 0.01;
damp = rev_damp * 0.01;
lfo1 = (g.cycle(0.07) * (rev_mod * 0.2)) * 30;
lfo2 = (g.cycle(0.11) * (rev_mod * 0.2)) * 30;

// the cross-coupled tank; y1d, y3d: dcblock(r_at2), dcblock(r_at4) one sample
// late (the `~`), so that d1.read(4453) after d1's write is y1d@4452.
// outputs: d1.read(4453), d3.read(3163), r_at2, r_at4
tank(diffused_in) = (loop ~ (_, _)) : !, !, _, _, _, _
with {
    loop(y1d, y3d) = y1, y3, d1r, d3r, r_at2, r_at4
    with {
        d1r = y1d @ 4452;           // = d2 written this frame
        d3r = y3d @ 3162;           // = d4 written this frame
        s_d2 = g.rd_linear(4217, 4217, 1, d1r, 4217 + lfo1);
        s_d4 = g.rd_linear(4845, 4845, 1, d3r, 4845 + lfo2);
        h_rev_lp1 = lp1(damp, s_d2);
        h_rev_lp2 = lp1(damp, s_d4);
        fbL = diffused_in + h_rev_lp2 * dec;
        r_at2 = fbL : ap(707, 0 - d_c) : ap(503, d_c);
        y1 = g.dcblock(r_at2);
        fbR = diffused_in + h_rev_lp1 * dec;
        r_at4 = fbR : ap(769, 0 - d_c) : ap(613, d_c);
        y3 = g.dcblock(r_at4);
    };
};

// ---------------------------------------------------------------- mix
dcout(x) = (x - x') : (+ ~ *(0.995));

drift(in1, in2) = out1, out2
with {
    wet_del_L = delch(0, in1);
    wet_del_R = delch(5, in2);
    sig_del_L = wet_del_L * g.dbtoa(del_vol);
    sig_del_R = wet_del_R * g.dbtoa(del_vol);
    rev_in = ((in1 + in2) * 0.5) + (((wet_del_L + wet_del_R) * 0.5) * (del_to_rev * 0.01));
    rv = tank(diffuser(rev_in));
    d1r = rv : _, !, !, !;
    d3r = rv : !, _, !, !;
    r_at2 = rv : !, !, _, !;
    r_at4 = rv : !, !, !, _;
    sig_rev_L = ((d1r + r_at2) - r_at4) * g.dbtoa(rev_vol);
    sig_rev_R = ((d3r + r_at4) - r_at2) * g.dbtoa(rev_vol);
    fx_L = sig_del_L + sig_rev_L;
    fx_R = sig_del_R + sig_rev_R;
    mix_L = g.mix(in1, fx_L, mix * 0.01);
    mix_R = g.mix(in2, fx_R, mix * 0.01);
    out1 = dcout(ma.tanh(mix_L * g.dbtoa(gainout)));
    out2 = dcout(ma.tanh(mix_R * g.dbtoa(gainout)));
};

process = drift;
det = drift;
