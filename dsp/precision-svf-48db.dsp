// PRECISION-SVF-48DB: stereo 48 dB/octave state-variable filter
// (gen~: gendsp/precision-svf-48db.gendsp)
//
// Four cascaded 2-pole SVF stages per chain (a low-pass chain and a high-pass
// chain, per channel), crossfaded by `mode` (0 = high-pass, 1 = low-pass, an
// equal-power morph in between), an AGC that compensates the level away from
// 1 kHz, a wet input gain (tanh), an asymmetric tanh drive and a clip at
// +-0.97 on the wet path, an equal-power dry/wet mix and a DC blocker.
// Every parameter is glided by a one-pole of `smooth` ms, the frequency in
// log. `width` spreads the left/right cutoffs by +-12 %.
//
// in1, in2: audio L, R      out1, out2: filtered L, R
//
// The damping is fixed at sqrt(2) (Butterworth stages, no resonance
// control) and mode only morphs high-pass to low-pass. The stage update (v1 + 2 g hp, lp + g v1n) is the TPT one (2 bp - v1,
// 2 lp - v2) written another way, kept in gen's order.

declare name "precision-svf-48db";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

frequency = hslider("frequency [unit:Hz]", 1000, 20, 20000, 0.01);
mode = hslider("mode", 1, 0, 1, 0.001);
mix = hslider("mix", 1, 0, 1, 0.001);
gain = hslider("gain [unit:dB]", 0, 0, 24, 0.01);
drive = hslider("drive [unit:dB]", 0, 0, 24, 0.01);
width = hslider("width", 0, 0, 1, 0.001);
agc = hslider("agc", 0.5, 0, 1, 0.001);
smooth = hslider("smooth [unit:ms]", 50, 0, 1000, 0.1);

damp = 1.41421356;

// one 2-pole stage: x in, (lp, hp) out
stage(gc, h, x) = (\(v1, v2).(nv1, nv2, lp, hp
    with {
        hp = (((x - damp * v1) - gc * v1) - v2) * h;
        v1n = gc * hp + v1;
        lp = gc * v1n + v2;
        nv1 = v1n + gc * hp;
        nv2 = lp + gc * v1n;
    })) ~ (_, _) : (!, !, _, _);

lpchain(gc, h) = seq(i, 4, stage(gc, h) : (_, !));
hpchain(gc, h) = seq(i, 4, stage(gc, h) : (!, _));

svf(in1, in2) = out1, out2
with {
    ms = max(0.1, smooth);
    alpha = 1 - exp(g.safediv(-1, (ms * 0.001) * ma.SR));
    glide(init, target) = (\(s).(s + alpha * (target - s))) ~ g.init(init);
    s_log_f = glide(6.907755, log(g.clamp(20, 20000, frequency)));
    current_freq = exp(s_log_f);
    s_mode = glide(1, g.clamp(0, 1, mode));
    s_mix = glide(1, g.clamp(0, 1, mix));
    s_gain = glide(0, g.clamp(0, 24, gain));
    s_drive = glide(0, g.clamp(0, 24, drive));
    s_width = glide(0, g.clamp(0, 1, width));

    w_off = s_width * 0.12;
    fL = g.clamp(20, ma.SR * 0.45, current_freq * (1 - w_off));
    fR = g.clamp(20, ma.SR * 0.45, current_freq * (1 + w_off));
    gL = tan(g.safediv(3.1415926535897931 * fL, ma.SR));
    gR = tan(g.safediv(3.1415926535897931 * fR, ma.SR));
    hL = g.safediv(1, (1 + damp * gL) + gL * gL);
    hR = g.safediv(1, (1 + damp * gR) + gR * gR);

    wet_in_amp = g.safepow(10, s_gain * 0.05);
    wL = ma.tanh(in1 * wet_in_amp);
    wR = ma.tanh(in2 * wet_in_amp);

    tLP_L = wL : lpchain(gL, hL);
    tHP_L = wL : hpchain(gL, hL);
    tLP_R = wR : lpchain(gR, hR);
    tHP_R = wR : hpchain(gR, hR);

    angle_m = s_mode * 1.57079632679;
    wet_fL = tHP_L * cos(angle_m) + tLP_L * sin(angle_m);
    wet_fR = tHP_R * cos(angle_m) + tLP_R * sin(angle_m);

    log_f_diff = log(current_freq * 0.001) * (1 / log(2));
    gain_agc = 1 + (agc * g.mix(abs(min(log_f_diff, 0)), abs(max(0, log_f_diff)), s_mode)) * 0.25;
    wet_out_amp = g.safepow(10, s_drive * 0.05);
    xL = (wet_fL * gain_agc) * wet_out_amp;
    xR = (wet_fR * gain_agc) * wet_out_amp;
    distL = ma.tanh(xL + 0.06 * ma.tanh(xL * 0.5));
    distR = ma.tanh(xR + 0.06 * ma.tanh(xR * 0.5));
    wet_finalL = g.clamp(-0.97, 0.97, distL * 1.25);
    wet_finalR = g.clamp(-0.97, 0.97, distR * 1.25);

    angle_x = s_mix * 1.57079632679;
    out1 = g.dcblock(in1 * cos(angle_x) + wet_finalL * sin(angle_x));
    out2 = g.dcblock(in2 * cos(angle_x) + wet_finalR * sin(angle_x));
};

process = svf;
// no noise: det is the same program
det = svf;
