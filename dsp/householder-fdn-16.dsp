// HOUSEHOLDER-FDN-16: 16x16 Householder matrix spatial FDN reverb
// (gen~: gendsp/householder-fdn-16.gendsp)
//
// A 16-line feedback delay network: 16 delay lines of 509..4409 samples
// (times `size`), their lengths modulated by a sine/cosine LFO, each tap
// damped by a one-pole lowpass, mixed by the Householder reflection
// H = I - (2/16)*1*1^T (one global sum), scaled by the decay gain and
// written back through tanh. The stereo input is injected with alternating
// signs on the 16 lines; the wet outputs are alternating-sign sums of the
// even (left) and odd (right) taps.
//
// in1, in2: audio L, R     out1, out2: dry/wet L, R
//
// Parameters: size (0.1..2, delay length factor), decay (0.1..30),
// damping (0..1), mod_amt (0..20 samples of LFO excursion),
// mod_rate (0.1..5 Hz), mix (0..100 %).
//
// Quirk kept from gen~: the comment calls `decay` a T60 target, but the
// feedback gain is pow(0.001, 1/max(decay*SR/2000, 10)) applied once per
// trip through the lines (509..4409 samples, not once per sample): the decay
// time depends on `size` and on the sample rate, and is not `decay` seconds.

declare name "householder-fdn-16";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");
ba = library("basics.lib");
si = library("signals.lib");

size = hslider("size", 1.0, 0.1, 2.0, 0.001);
decay = hslider("decay", 4.5, 0.1, 30, 0.01);
damping = hslider("damping", 0.35, 0, 1, 0.001);
mod_amt = hslider("mod_amt", 3.0, 0, 20, 0.01);
mod_rate = hslider("mod_rate [unit:Hz]", 0.7, 0.1, 5, 0.01);
mix = hslider("mix [unit:%]", 50, 0, 100, 0.01);

// LFO phase: h_lfo_ph = wrap(h_lfo_ph + mod_rate/SR, 0, 1), the new phase read
h_lfo_ph = (+(mod_rate / ma.SR) : g.wrap(0, 1)) ~ _;
lfo_sin = sin(h_lfo_ph * 6.2831853071795862) * mod_amt;
lfo_cos = cos(h_lfo_ph * 6.2831853071795862) * mod_amt;

sz = g.clamp(0.1, 2.5, size);

// line k: base prime length, LFO (0: sin, 1: cos), sign (0: +, 1: -), factor
// (1: none, as gen~ writes it)
BASE = (509, 631, 769, 919, 1087, 1277, 1487, 1709, 1973, 2251, 2557, 2879, 3221, 3593, 3989, 4409);
WHICH = (0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0);
NEG = (0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1);
FAC = (1, 1, 1, 1, 0.7, 0.7, 0.8, 0.8, 0.9, 0.9, 1, 1, 1.1, 1.1, 1.2, 1.2);

len(k) = g.clamp(10, 15000, select2(neg, a + m, a - m))
with {
    a = ba.take(k + 1, BASE) * sz;
    l = select2(ba.take(k + 1, WHICH), lfo_sin, lfo_cos);
    f = ba.take(k + 1, FAC);
    m = ba.if(f == 1, l, l * f);
    neg = ba.take(k + 1, NEG);
};

d_alpha = g.clamp(0, 0.95, damping * 0.7);
fb_gain = g.safepow(0.001, g.safediv(1, max(decay * (ma.SR * 0.0005), 10)));
bal = mix * 0.01;

// tap k: Delay d_k(16000) read (linear, before its write) at len_k, then the
// one-pole damping h_k = t*(1-a) + h_k*a
tap(k, wd) = g.rd_linear_fb(16000, 16000, wd, len(k)) : (\(t).((\(h).(t * (1 - d_alpha) + h * d_alpha)) ~ _));

fdn(wd0, wd1, wd2, wd3, wd4, wd5, wd6, wd7, wd8, wd9, wd10, wd11, wd12, wd13, wd14, wd15, in1, in2)
    = par(k, 16, wr(k)), out1, out2
with {
    wd = (wd0, wd1, wd2, wd3, wd4, wd5, wd6, wd7, wd8, wd9, wd10, wd11, wd12, wd13, wd14, wd15);
    t(k) = tap(k, ba.take(k + 1, wd));
    sum16 = t(0) + t(1) + t(2) + t(3) + t(4) + t(5) + t(6) + t(7) + t(8) + t(9) + t(10)
          + t(11) + t(12) + t(13) + t(14) + t(15);
    scale_sum = sum16 * 0.125;
    inL = in1 * 0.25;
    inR = in2 * 0.25;
    // the input injected with signs +inL, +inR, -inL, -inR, ...
    v(k) = ba.take((k % 4) + 1, ((t(k) - scale_sum) + inL, (t(k) - scale_sum) + inR,
                                 (t(k) - scale_sum) - inL, (t(k) - scale_sum) - inR));
    wr(k) = ma.tanh(v(k) * fb_gain);
    wetL = ((((((((t(0) - t(2)) + t(4)) - t(6)) + t(8)) - t(10)) + t(12)) - t(14))) * 0.35;
    wetR = ((((((((t(1) - t(3)) + t(5)) - t(7)) + t(9)) - t(11)) + t(13)) - t(15))) * 0.35;
    out1 = (in1 * (1.0 - bal)) + (wetL * bal);
    out2 = (in2 * (1.0 - bal)) + (wetR * bal);
};

process = fdn ~ si.bus(16) : si.block(16), _, _;
// no noise() in the patch: det is process
det = process;
