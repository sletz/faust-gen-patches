// MODELDRIVE: morphing four-model distortion
// (gen~: gendsp/modeldrive.gendsp)
//
// Each channel goes through four distortions computed at every sample, tanh
// overdrive, wavefolder, staircase quantizer (followed by a DC blocker, pole
// 0.995) and modulo wrap, morphed with equal-power weights (cos, sin of the
// fraction) between neighbours by `model`; then a one-pole low-pass (`tone`,
// coefficient w/(1 + w), w = 2 pi tone/sr, in [0.001, 0.999]), a tanh(1.1 x)
// soft clip, the makeup gain, and a linear dry/wet mix with the input.
// `level_comp` switches the per-model loudness weights (on: 0.36, fold
// 0.45 * 1.33/max(0.1, hi_f), 0.575, 0.76; off: 0.15, 0.45, 0.25, 1.024). The
// drive, from `drive` plus 100 in3, is clamped to [0, 1].
//
// in1, in2: audio L, R      in3: drive CV (in3 = 1 adds 100 to drive)
// out1, out2: L, R (dry/wet)
//
// Parameters (gen~'s ranges and defaults): drive (0..100 %, 30), model
// (0..100 %, 0), tone (100..18000 Hz, 12000), level_comp (0..1, 1; on above
// 0.5), gain (-24..12 dB, 0), mix (0..100 %, 100).
//
// Kept from gen~:
// - model maps to a morph position 0.03 * model in [0, 3]; at 100 % the
//   position is exactly 3, whose integer part selects the quantizer/wrap pair
//   with a fraction of 0: the output is the quantizer alone, not the wrap the
//   header announces for 100 %. The wrap is approached as model goes to 100
//   and never reached;
// - the gendsp's header names it pisound-drive.gendsp.
// Order of operations is gen's (keep() holds it against the normalizer).

declare name "modeldrive";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

drive = hslider("drive [unit:%]", 30, 0, 100, 0.01);
model = hslider("model [unit:%]", 0, 0, 100, 0.01);
tone = hslider("tone [unit:Hz]", 12000, 100, 18000, 0.1);
level_comp = hslider("level_comp", 1, 0, 1, 0.01);
gain = hslider("gain [unit:dB]", 0, -24, 12, 0.01);
mix = hslider("mix [unit:%]", 100, 0, 100, 0.01);

TWOPI = 6.2831853071795862;
HALFPI = 1.5707963267948966;
K = g.keep;

mdrive(in1, in2, in3) = out1, out2
with {
    eff_drive = g.clip(0, 1, K(drive + in3 * 100) * 0.01);
    comp_active = level_comp > 0.5;

    pos = g.clip(0, 3, model * 0.03);
    idx = floor(pos);
    fr = pos - idx;
    w0 = cos(fr * HALFPI);
    w1 = sin(fr * HALFPI);

    p3 = g.safepow(eff_drive, 0.3);
    p8 = g.safepow(eff_drive, 0.8);
    scale_d1 = 8 + (35.0 - 8.0) * p3;
    lo_f = K(-0.7 + (-0.3 - (-0.7)) * p8);
    hi_f = K(0.7 + (0.3 - 0.7) * p8);
    span = max(0.001, hi_f - lo_f);
    scale_f = 1 + (6.0 - 1.0) * p3;
    fold_comp = select2(comp_active, 1, K(K(g.safediv(0.7, max(0.1, hi_f))) * 1.9));
    scale_q = 5 + (1.05 - 5.0) * p3;
    scale_w = 1 + (6.0 - 1.0) * p3;

    // one channel: the four models, morphed
    dist(x) = select2(idx < 1, select2(idx < 2, m3 * w0 + m4 * w1, m2 * w0 + m3 * w1), m1 * w0 + m2 * w1)
    with {
        m1 = K(ma.tanh((x * 2) * scale_d1) * select2(comp_active, 0.15, 0.36));
        x_f = (x * 2) * scale_f;
        fold = lo_f + abs(g.wrap(0, 2 * span, K(K(x_f - lo_f) - span)) - span);
        m2 = K(K(g.clip(-1, 1, fold) * 0.45) * fold_comp);
        x_q = K(x * 0.6) * scale_q;
        q = g.safediv(K(ceil(x_q) + floor(x_q + 0.5)) - 0.5, scale_q);
        dc = (\(y).(K(q - q') + 0.995 * y)) ~ _;
        m3 = K(K(dc * 0.25) * select2(comp_active, 1.0, 2.3));
        wr = g.wrap(-0.5, 0.5, K(x * 12) * scale_w);
        m4 = K(K(wr * 0.8) * select2(comp_active, 1.28, 0.95));
    };

    tone_fc = g.clip(100, 18000, tone);
    tone_omega = K(tone_fc * g.divsr(TWOPI));
    tone_coeff = g.clip(0.001, 0.999, g.safediv(tone_omega, 1 + tone_omega));
    lp(x) = (\(h).(g.fixdenorm(h + tone_coeff * (x - h)))) ~ _;

    make_up = g.dbtoa(gain);
    lim_L = ma.tanh(lp(dist(in1)) * 1.1) * make_up;
    lim_R = ma.tanh(lp(dist(in2)) * 1.1) * make_up;

    eff_mix = g.clip(0, 1, mix * 0.01);
    out1 = g.mix(in1, lim_L, eff_mix);
    out2 = g.mix(in2, lim_R, eff_mix);
};

process = mdrive;
// no noise: det is the same program
det = mdrive;
