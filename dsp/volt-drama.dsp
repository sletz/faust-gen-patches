// VOLT-DRAMA: high-grit distortion, Moog-style ladder and evolving drone delay
// (gen~: gendsp/volt-drama.gendsp)
//
// Each channel: the input plus a two-tap delay (main tap and a "ghost" tap at
// 0.618 of the time, mixed in when the feedback is low) goes through a blend of
// two waveshapers (shape: 0 = polynomial "warm", 1 = Tarrabia diode clipper),
// a DC blocker, -9 dB, and four one-pole low-passes (cutoff). The filtered
// signal, tanh-saturated and scaled by feedback^2 * 1.15 (ducked to 20% when
// the input envelope exceeds 0.6), is written back into the delay. A 4-voice
// unison (short delays modulated at 0.13, 0.21, 0.37, 0.49 Hz) widens the
// filtered mono sum; then dry/wet, gainout before a final tanh, DC blocker.
// time, spread, uni_detune and feedback glide (gen slide, 2000/3000 samples).
//
// in1, in2: audio      out1, out2: audio
// Parameters as the gendsp: drive, shape, feedback (0..1), time (ms), spread
// (ms), cutoff (Hz), mix_global (%; the gendsp asks name="mix", but the export
// and the maxpat call it mix_global), gainout (dB), uni_mix, uni_detune, uni_width (%).

declare name "volt-drama";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

drive = hslider("drive", 0.3, 0, 1, 0.001);
shape = hslider("shape", 0.5, 0, 1, 0.001);
feedback = hslider("feedback", 0.4, 0, 1, 0.001);
time = hslider("time [unit:ms]", 250, 1, 1000, 0.01);
spread = hslider("spread [unit:ms]", 10, 0, 50, 0.01);
cutoff = hslider("cutoff [unit:Hz]", 20000, 50, 20000, 0.1);
mix_global = hslider("mix_global [unit:%]", 50, 0, 100, 0.01);
gainout = hslider("gainout [unit:dB]", 0, -60, 12, 0.01);
uni_mix = hslider("uni_mix [unit:%]", 50, 0, 100, 0.01);
uni_detune = hslider("uni_detune [unit:%]", 30, 0, 100, 0.01);
uni_width = hslider("uni_width [unit:%]", 100, 0, 100, 0.01);

TWOPI = 6.2831853071795862;
DMAX = 48000;   // Delay delayL(48000), delayR(48000)
UMAX = 2400;    // Delay uni_d1..4(2400)

// genlib slide(x, up, down), state starting at 0
slide = g.slide;

poly_shaper(x, drive_val) = (m / (b + 1)) * 2
with { m = x * drive_val; b = (m * m) * 0.28; };

tarrabia_shaper(x, drive_val) = (((1 + k) * x) / (1 + k * abs(x))) * 0.78
with { d = min(0.95, drive_val); k = (2 * d) / (1 - d); };

// one-pole stage: History h = fixdenorm(lp), lp = mix(h, x, alpha) (lp, unfixed, goes on)
stage(alpha, x) = g.mix(h', x, alpha)
with { h = (\(hp).(g.fixdenorm(g.mix(hp, x, alpha)))) ~ _; };
ladder(alpha) = stage(alpha) : stage(alpha) : stage(alpha) : stage(alpha);

// unison phase: h = wrap(h + f/sr, 0, 1)
uph(f) = (\(h).(g.wrap(0, 1, h + f / ma.SR))) ~ _;

// one frame: the delay inputs fed back (already delayed by one sample) and the
// audio inputs -> the delay inputs written, out1, out2
core(wLd, wRd, in1, in2) = wL, wR, out1, out2
with {
    s_time = slide(2000, 2000, time);
    s_spread = slide(2000, 2000, spread);
    s_detune = slide(2000, 2000, uni_detune);
    s_fb = slide(3000, 3000, feedback);

    fb_amount = g.safepow(s_fb, 2) * 1.15;
    ghost_amt = g.clamp(0, 0.4, 1.0 - s_fb * 1.5);
    alpha = g.clamp(0.0001, 1.0, 1.0 - exp((-6.2831853071795862 * cutoff) / ma.SR));
    d_samps = s_time * (ma.SR * 0.001);
    spr_samps = s_spread * (ma.SR * 0.001);
    wet_gain = 0.35481338923357547;   // dbtoa(-9), as the export folds it
    final_amp = g.dbtoa(gainout);

    // delay reads before the writes of the frame
    tapL_main = g.rd_linear_fb(DMAX, DMAX, wLd, d_samps);
    tapR_main = g.rd_linear_fb(DMAX, DMAX, wRd, d_samps + spr_samps);
    tapL_ghost = g.rd_linear_fb(DMAX, DMAX, wLd, d_samps * 0.618);
    tapR_ghost = g.rd_linear_fb(DMAX, DMAX, wRd, (d_samps + spr_samps) * 0.618);
    tapL_sum = g.mix(tapL_main, tapL_ghost, ghost_amt);
    tapR_sum = g.mix(tapR_main, tapR_ghost, ghost_amt);

    h_env = (\(h).(g.mix(abs(in1 + in2) * 0.5, h, 0.1))) ~ _;
    duck_f = select2(h_env > 0.6, 1.0, 0.2);
    final_fb_gain = fb_amount * duck_f;

    procL = in1 + tapL_sum;
    procR = in2 + tapR_sum;
    d_val = drive * 8;
    shaper(x) = g.mix(poly_shaper(x, d_val), tarrabia_shaper(x, d_val), shape);
    cleanL = g.dcblock(shaper(procL)) * wet_gain;
    cleanR = g.dcblock(shaper(procR)) * wet_gain;

    filt_L = cleanL : ladder(alpha);
    filt_R = cleanR : ladder(alpha);

    u_depth = (s_detune * 0.2) * (ma.SR * 0.001);
    u_width = uni_width * 0.01;
    mono_in = (filt_L + filt_R) * 0.5;
    // the unison delays are written before they are read: minimum delay 0
    voice(ms, f) = g.rd_linear(4096, UMAX, 0, mono_in,
                               ms * (ma.SR * 0.001) + sin(uph(f) * TWOPI) * u_depth);
    v1 = voice(10, 0.13);
    v2 = voice(15, 0.21);
    v3 = voice(12, 0.37);
    v4 = voice(18, 0.49);
    u_L = (v1 + v2 * 0.5) + (v3 * (1 - u_width)) * 0.5;
    u_R = (v4 + v3 * 0.5) + (v2 * (1 - u_width)) * 0.5;
    wet_final_L = g.mix(filt_L, u_L, uni_mix * 0.01);
    wet_final_R = g.mix(filt_R, u_R, uni_mix * 0.01);

    wL = g.fixdenorm(ma.tanh(filt_L * final_fb_gain));
    wR = g.fixdenorm(ma.tanh(filt_R * final_fb_gain));

    m_val = mix_global * 0.01;
    out_pre_L = ma.tanh(g.mix(in1, wet_final_L, m_val) * final_amp);
    out_pre_R = ma.tanh(g.mix(in2, wet_final_R, m_val) * final_amp);
    dc(s) = (\(y).((s - s') + 0.995 * y)) ~ _;
    out1 = dc(out_pre_L);
    out2 = dc(out_pre_R);
};

drama = core ~ (_, _) : !, !, _, _;

process = drama;
det = drama;
