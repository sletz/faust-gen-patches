// ERBEVERB-CLONE: Tom Erbe inspired 4x4 unitary FDN reverb (gen~: gendsp/erbeverb-clone.gendsp)
//
// Loose implementation of the Make Noise / Tom Erbe Erbe-Verb: the mono sum
// goes through a predelay and two allpasses (g = 0.6, 400 and 600 samples
// times the slid size) into 4 delay lines (1531, 2237, 3163, 4453 samples
// times the size, +-5*depth samples of sine modulation), mixed by a
// normalized Hadamard matrix, damped by one-poles (`absorb`), fed back through
// tanh (`decay`, 100 % = unity) and dcblocked. L = (r1 + r3)/2, R = (r2 + r4)/2
// go through a tilt (one-pole split), the dry/wet mix and tanh.
//
// in1, in2: audio L, R     out1, out2: wet audio L, R (dry/wet by mix)
//
// Parameters: size (0.5..100 %), decay (0..110 %), absorb (0..100 %),
// tilt (-1..1), predelay (0..100 ms), speed (0.1..10 Hz), depth (0..20),
// mix_rev (0..100 %; gen's Param mix_rev, exposed as "mix" in Max).
//
// gen~ detail kept: the predelay is read before its write, so predelay = 0
// still delays by one sample.

declare name "erbeverb-clone";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");
si = library("signals.lib");

size = hslider("size [unit:%]", 50, 0.5, 100, 0.01);
decay = hslider("decay [unit:%]", 60, 0, 110, 0.01);
absorb = hslider("absorb [unit:%]", 40, 0, 100, 0.01);
tilt = hslider("tilt", 0, -1, 1, 0.001);
predelay = hslider("predelay [unit:ms]", 10, 0, 100, 0.01);
speed = hslider("speed [unit:Hz]", 1, 0.1, 10, 0.001);
depth = hslider("depth", 2, 0, 20, 0.001);
mix_rev = hslider("mix_rev [unit:%]", 50, 0, 100, 0.01);

// the export's inlined clamp: (v <= lo) ? lo : ((v >= hi) ? hi : v)
tclamp = g.clip;

s_size = (\(s).(g.fixdenorm(s + (1.0 / 2000) * ((size * 0.01) - s)))) ~ _;
h_ph = (\(p).(g.wrap(0, 1, p + g.safediv(speed, ma.SR)))) ~ _;
lfo = sin(h_ph * 6.2831853071795862) * (depth * 5);
t1 = tclamp(10, 14000, (1531 * s_size) + lfo);
t2 = tclamp(10, 14000, (2237 * s_size) - lfo);
t3 = tclamp(10, 14000, (3163 * s_size) + lfo);
t4 = tclamp(10, 14000, (4453 * s_size) - lfo);

// allpass on a Delay of 2000 read (linear) at D before and after its write
ap(D, x) = g.rd_linear(2000, 2000, 0, v, D) + v * 0.6
with { v = (\(vd).(x - g.rd_linear_fb(2000, 2000, vd, D) * 0.6)) ~ _; };

lp1(a, x) = (\(h).(g.mix(x, h, a))) ~ _;

fb_amount = decay * 0.01;
damp = absorb * 0.01;

// the FDN: outputs r1..r4
fdn(diff_in) = (loop ~ si.bus(4)) : si.block(4), si.bus(4)
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

tiltf(raw) = select2(tilt < 0, g.mix(raw, raw - t_lp, tilt), g.mix(raw, t_lp, abs(tilt)))
with { t_lp = lp1(0.1, raw); };

erbeverb(in1, in2) = out1, out2
with {
    sig_in = (in1 + in2) * 0.5;
    p_sig = g.rd_linear(9600, 9600, 1, sig_in, predelay * (ma.SR * 0.001));
    diff_in = p_sig : ap(400 * s_size) : ap(600 * s_size);
    r = fdn(diff_in);
    raw_L = ((r : _, !, !, !) + (r : !, !, _, !)) * 0.5;
    raw_R = ((r : !, _, !, !) + (r : !, !, !, _)) * 0.5;
    out1 = ma.tanh(g.mix(in1, tiltf(raw_L), mix_rev * 0.01));
    out2 = ma.tanh(g.mix(in2, tiltf(raw_R), mix_rev * 0.01));
};

process = erbeverb;
det = erbeverb;
