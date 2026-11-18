// MULTIBAND-DRIVE: 3-band crossover distortion
// (gen~: gendsp/multiband-drive.gendsp)
//
// Each channel is split by two 4th-order crossovers (each side two cascaded
// RBJ Butterworth biquads, Q = 1/sqrt(2), in direct form I): low = LP4(x) at
// crossover1, rest = HP4(x) at crossover1, mid = LP4(rest) and high =
// HP4(rest) at crossover2. Each band goes through a distortion that morphs
// with equal-power weights between four models (tanh overdrive, wavefolder,
// staircase quantizer, modulo wrap), all four computed at every sample, then
// a dry/wet of the band with its distortion and the band level. The sum of
// the three bands goes through a DC blocker (pole 0.995), a tanh(1.05 x)
// soft clip, the makeup gain, and a linear dry/wet mix with the input.
//
// in1, in2: audio L, R
// out1, out2: L, R (dry/wet)
// out3, out4, out5: the low, mid and high bands, (L + R)/2, after their
// distortion and level, before the master stage
//
// Parameters (gen~'s ranges and defaults): crossover1 (20..2000 Hz, 250),
// crossover2 (200..18000 Hz, 3500); per band (low_, mid_, high_): band_gain
// (-48..12 dB, 0), drive_mix (0..100 %, 50), model_choice (0..100 %; low 0,
// mid 33.3, high 0); gain (-24..12 dB, 0), mix (0..100 %, 100).
// The crossovers are kept 40 Hz apart: f1 = min(crossover1, crossover2 - 40)
// in [20, 0.45 sr], f2 = max(crossover2, crossover1 + 40) in [40, 0.45 sr].
//
// Kept from gen~:
// - model_choice maps to a morph position 0.03 * model_choice in [0, 3]; the
//   gendsp says 0 % tanh, 33 % fold, 67 % quantizer, 100 % wrap, but at 100 %
//   the position is exactly 3, its integer part 3 selects the quantizer/wrap
//   pair with a fraction of 0: the output is the quantizer alone. The wrap is
//   approached as model_choice goes to 100 and never reached;
// - drive_mix is both the drive of the distortion (d_norm = drive_mix/100)
//   and the dry/wet of the band with it;
// - the quantizer (ceil(x) + floor(x + 0.5) - 0.5)/scale has an offset: on
//   silence a band whose morph includes it outputs a constant (-0.5/scale *
//   0.575, times the weights, the drive_mix and the level). The master DC
//   blocker removes it from out1/out2, the band monitors out3..out5 keep it;
// - a band level at or below -40 dB mutes the band (the header says -24 dB
//   for the notch/erase);
// - the low band is LP4(x) alone, without the allpass of the second
//   crossover: low + mid + high is not allpass-flat around crossover2.
// Order of operations is gen's (keep() holds it against the normalizer).

declare name "multiband-drive";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

crossover1 = hslider("crossover1 [unit:Hz]", 250, 20, 2000, 0.1);
crossover2 = hslider("crossover2 [unit:Hz]", 3500, 200, 18000, 0.1);
low_band_gain = hslider("low_band_gain [unit:dB]", 0, -48, 12, 0.01);
low_drive_mix = hslider("low_drive_mix [unit:%]", 50, 0, 100, 0.01);
low_model_choice = hslider("low_model_choice [unit:%]", 0, 0, 100, 0.01);
mid_band_gain = hslider("mid_band_gain [unit:dB]", 0, -48, 12, 0.01);
mid_drive_mix = hslider("mid_drive_mix [unit:%]", 50, 0, 100, 0.01);
mid_model_choice = hslider("mid_model_choice [unit:%]", 33.3, 0, 100, 0.01);
high_band_gain = hslider("high_band_gain [unit:dB]", 0, -48, 12, 0.01);
high_drive_mix = hslider("high_drive_mix [unit:%]", 50, 0, 100, 0.01);
high_model_choice = hslider("high_model_choice [unit:%]", 0, 0, 100, 0.01);
gain = hslider("gain [unit:dB]", 0, -24, 12, 0.01);
mix = hslider("mix [unit:%]", 100, 0, 100, 0.01);

TWOPI = 6.2831853071795862;
HALFPI = 1.5707963267948966;
K = g.keep;

// the four distortion models, morphed (distort_sample of the gendsp)
distort(x_in, d_norm, m_pos) = out_s
with {
    p3 = g.safepow(d_norm, 0.3);
    p8 = g.safepow(d_norm, 0.8);
    // 1: tanh overdrive
    scale_d1 = 8 + (35.0 - 8.0) * p3;
    m1 = K(ma.tanh((x_in * 2) * scale_d1) * 0.36);
    // 2: wavefolder
    lo_f = K(-0.7 + (-0.3 - (-0.7)) * p8);
    hi_f = K(0.7 + (0.3 - 0.7) * p8);
    scale_f = 1 + (6.0 - 1.0) * p3;
    x_f = (x_in * 2) * scale_f;
    span = max(0.001, hi_f - lo_f);
    fold_raw = lo_f + abs(g.wrap(0, 2 * span, K(K(x_f - lo_f) - span)) - span);
    clamp_f = g.clip(-1, 1, fold_raw);
    fold_comp = K(K(g.safediv(0.7, max(0.1, hi_f))) * 1.9);
    m2 = K(K(clamp_f * 0.45) * fold_comp);
    // 3: quantizer
    scale_q = 5 + (1.05 - 5.0) * p3;
    x_q = K(x_in * 0.6) * scale_q;
    q_sum = g.tdiv(K(ceil(x_q) + floor(x_q + 0.5)) - 0.5, scale_q);
    m3 = K(K(q_sum * 0.25) * 2.3);
    // 4: modulo wrap
    scale_w = 1 + (6.0 - 1.0) * p3;
    wrap_raw = g.wrap(-0.5, 0.5, K(x_in * 12) * scale_w);
    m4 = K(K(wrap_raw * 0.8) * 0.95);
    // equal-power morph
    idx = floor(m_pos);
    fr = m_pos - idx;
    w0 = cos(fr * HALFPI);
    w1 = sin(fr * HALFPI);
    out_s = select2(idx < 1, select2(idx < 2, m3 * w0 + m4 * w1, m2 * w0 + m3 * w1), m1 * w0 + m2 * w1);
};

// crossover coefficients at f (shared by the LP and the HP)
w_c(f) = g.divsr(K(TWOPI * f));
cos_w(f) = cos(w_c(f));
alpha(f) = sin(w_c(f)) * 0.70710678118;
a0(f) = 1 + alpha(f);
b0_lp(f) = K(g.safediv(K((1 - cos_w(f)) * 0.5), a0(f)));
b1_lp(f) = K(g.safediv(1 - cos_w(f), a0(f)));
a1(f) = K(g.safediv(-2 * cos_w(f), a0(f)));
a2(f) = K(g.safediv(1 - alpha(f), a0(f)));
b0_hp(f) = K(g.safediv(K((1 + cos_w(f)) * 0.5), a0(f)));
b1_hp(f) = K(g.safediv(0 - (1 + cos_w(f)), a0(f)));

// direct form I biquad, gen's order: y = b0 x + b1 x1 + b2 x2 - a1 y1 - a2 y2
biquad(b0, b1, b2, a1v, a2v, x) = (\(y1).(K(K(K(K(b0 * x) + b1 * x') + b2 * x'') - a1v * y1) - a2v * y1')) ~ _;
lp(f) = biquad(b0_lp(f), b1_lp(f), b0_lp(f), a1(f), a2(f));
hp(f) = biquad(b0_hp(f), b1_hp(f), b0_hp(f), a1(f), a2(f));

f1 = g.clip(20, ma.SR * 0.45, min(crossover1, crossover2 - 40));
f2 = g.clip(40, ma.SR * 0.45, max(crossover2, crossover1 + 40));
lp4(f) = lp(f) : lp(f);
hp4(f) = hp(f) : hp(f);

bandgain(gdb) = select2(gdb <= -40, g.dbtoa(gdb), 0);
m_pos(choice) = g.clip(0, 3, choice * 0.03);
proc(x, dm, choice, gdb) = K(K(g.mix(x, distort(x, dm * 0.01, m_pos(choice)), dm * 0.01)) * bandgain(gdb));

dcblk(s) = (\(y).(K(s - s') + 0.995 * y)) ~ _;

mbdrive(in1, in2) = out1, out2, out3, out4, out5
with {
    low_L = in1 : lp4(f1);
    rest_L = in1 : hp4(f1);
    mid_L = rest_L : lp4(f2);
    high_L = rest_L : hp4(f2);
    low_R = in2 : lp4(f1);
    rest_R = in2 : hp4(f1);
    mid_R = rest_R : lp4(f2);
    high_R = rest_R : hp4(f2);

    proc_low_L = proc(low_L, low_drive_mix, low_model_choice, low_band_gain);
    proc_low_R = proc(low_R, low_drive_mix, low_model_choice, low_band_gain);
    proc_mid_L = proc(mid_L, mid_drive_mix, mid_model_choice, mid_band_gain);
    proc_mid_R = proc(mid_R, mid_drive_mix, mid_model_choice, mid_band_gain);
    proc_high_L = proc(high_L, high_drive_mix, high_model_choice, high_band_gain);
    proc_high_R = proc(high_R, high_drive_mix, high_model_choice, high_band_gain);

    sum_raw_L = K(proc_low_L + proc_mid_L) + proc_high_L;
    sum_raw_R = K(proc_low_R + proc_mid_R) + proc_high_R;

    make_up = g.dbtoa(gain);
    lim_L = ma.tanh(dcblk(sum_raw_L) * 1.05) * make_up;
    lim_R = ma.tanh(dcblk(sum_raw_R) * 1.05) * make_up;

    eff_mix = g.clip(0, 1, mix * 0.01);
    out1 = g.mix(in1, lim_L, eff_mix);
    out2 = g.mix(in2, lim_R, eff_mix);
    out3 = (proc_low_L + proc_low_R) * 0.5;
    out4 = (proc_mid_L + proc_mid_R) * 0.5;
    out5 = (proc_high_L + proc_high_R) * 0.5;
};

process = mbdrive;
// no noise: det is the same program
det = mbdrive;
