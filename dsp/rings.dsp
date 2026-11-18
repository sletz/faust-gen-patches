// RINGS: 24-mode modal resonator after Mutable Instruments Rings
// (gen~: gendsp/rings.gendsp)
//
// An exciter (the mean of the inputs through a tanh drive, plus, on a strum,
// a 2 ms raised-cosine hammer pulse and a decaying noise burst, scaled by
// `internal_exciter`) goes through a one-pole low-pass (42 Hz .. 18 kHz from
// `brightness`), then into 24 parallel trapezoidal (ZDF) state-variable
// band-passes. Mode k is tuned to (k+1)*f0 * (1 + k*stiff), the stiffness
// taken from `structure` (subharmonic below 0.25, harmonic at 0.25..0.3,
// bar and bell up to 0.9, plate and gong above), with a Q of 500..1.6e6 from
// `damping` lowered from mode to mode by a loss from `brightness` and
// `structure`, and a gain of 0.5 + 0.5 cos(2 pi k position) (pluck position
// comb). The even-indexed modes (k = 0, 2, ...) are summed to the left, the
// odd-indexed to the right, cross-mixed by `stereo_spread`, DC-blocked,
// soft-limited (tanh), raised by `gain` and mixed with the dry inputs.
//
// in1, in2: audio L, R (excitation)    in3: strum trigger (a rise above 0.1)
// out1, out2: processed L, R    out3: the filtered exciter    out4: the
// strum envelope (1 on a strum, x0.995 per sample)
//
// Parameters: pitch (12..108, MIDI, default 48), structure (0..1, 0.25),
// brightness (0..1, 0.6), damping (0..1, 0.6), position (0..1, 0.25),
// stereo_spread (0..100 %, 80), internal_exciter (0..100 %, 80), drive
// (0..100 %, 20), gain (-24..12 dB, 0), mix (0..100 %, 100), strum (0..1, a
// rise above 0 strums).
//
// As in gen:
// - the export drops the GenExpr's per-mode decay of the stiffness
//   (`cur_stiff *= 0.93` or `0.98` in the loop is absent from the exported
//   C++): the stretch grows by the same `stiff` at every mode, so the
//   partials spread linearly (1 + k*stiff) instead of converging as in
//   Rings; a stiffness of up to 2 (structure 1) puts most modes at the
//   0.48 clamp;
// - the modes are state-variable filters with no Rings-like normalization:
//   the level grows with the Q, and a long `damping` near 1 rings for
//   minutes (Q up to 1.6e6 on the fundamental);
// - the header's "odd modes left, even modes right" counts from 1: mode
//   index 0 (the fundamental) goes left;
// - a strum during the hammer pulse restarts it; the noise burst decays from
//   1 by x0.985 per sample, from the first frame of the strum.
//
// Noise sites (export order): 0 the pluck noise (one call per frame).

declare name "rings";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
si = library("signals.lib");
g = library("genops.lib");

pitch = hslider("pitch", 48, 12, 108, 0.01);
structure = hslider("structure", 0.25, 0, 1, 0.001);
brightness = hslider("brightness", 0.6, 0, 1, 0.001);
damping = hslider("damping", 0.6, 0, 1, 0.001);
position = hslider("position", 0.25, 0, 1, 0.001);
stereo_spread = hslider("stereo_spread [unit:%]", 80, 0, 100, 0.01);
internal_exciter = hslider("internal_exciter [unit:%]", 80, 0, 100, 0.01);
drive = hslider("drive [unit:%]", 20, 0, 100, 0.01);
gain = hslider("gain [unit:dB]", 0, -24, 12, 0.01);
mix_p = hslider("mix [unit:%]", 100, 0, 100, 0.01);
strum = hslider("strum", 0, 0, 1, 1);

PI = 3.1415926535897931;
TWOPI = 6.2831853071795862;
N = 24;

// ---------------------------------------------------------------- exciter
tdiv = g.tdiv;   // the export's safediv(ph, strike_samps), as a true division

// the strike state: h_strike_ph (from -1), h_noise_env, h_strum_env; the
// outputs: the pulse, the noise envelope and the strum envelope after their
// update
strike(hit) = (body ~ (_, _, _)) : (!, !, !, _, _, _)
with {
    ss = max(16.0, ma.SR * 0.002);
    body(phd, ned, sed) = ph_new, ne, se, pulse, ne, se
    with {
        ph = select2(hit, g.init(-1, phd), 0.0);
        on = ph >= 0.0;
        pulse = select2(on, 0.0, 0.5 - 0.5 * cos(TWOPI * tdiv(ph, ss)));
        ph1 = ph + 1.0;
        ph_new = select2(on, ph, select2(ph1 >= ss, ph1, -1.0));
        ne = g.fixdenorm(select2(hit, ned, 1.0) * 0.985);
        se = select2(hit, g.fixdenorm(sed * 0.995), 1.0);
    };
};

// ---------------------------------------------------------------- modes
eff_br = g.clip(0.01, 1.0, brightness);

stiff = select2(structure < 0.25, select2(structure < 0.3, select2(structure < 0.9, st_gong, st_bar), 0.0), st_sub)
with {
    st_sub = 0 - (0.25 - structure) * 0.25;
    gb = (structure - 0.3) * 1.6666666666666667;
    st_bar = g.keep(0.01 * g.safepow(10.0, g.keep(gb) * 2.005)) - 0.01;
    gg = (structure - 0.9) * 10.0;
    st_gong = 1.5 - cos(g.keep(gg * gg) * PI) * 0.5;
};

f0 = g.clip(g.divsr(20.0), 0.45, g.divsr(g.keep(440.0 * g.safepow(2.0, (pitch - 69.0) * 0.083333333333333329))));
q_base = g.keep(500.0 * g.safepow(10.0, g.clip(0.0, 1.0, damping) * 3.5));
br = g.keep(eff_br * (1.0 - g.keep(0.2 * g.safepow(1.0 - structure, 8))));
q_loss = g.keep(g.keep(g.keep(br * (2.0 - br)) * 0.85) + 0.15);
q_rate = g.keep(g.keep(structure * (2.0 - structure)) * 0.1);

// the loop's running values at mode i (cur_stiff is never updated in the
// export: stretch grows by stiff at every mode)
harmonic(0) = f0;
harmonic(i) = g.keep(harmonic(i - 1) + f0);
stretch(0) = 1.0;
stretch(i) = g.keep(stretch(i - 1) + stiff);
cur_qloss(0) = q_loss;
cur_qloss(i) = g.keep(c + g.keep(q_rate * (1.0 - c))) with { c = cur_qloss(i - 1); };
cur_q(0) = q_base;
cur_q(i) = g.keep(cur_q(i - 1) * cur_qloss(i));

// mode i: Data s1[i], s2[i] as two recursive signals; output bp * amp
mode(i, exc) = (body ~ (_, _)) : (!, !, _)
with {
    pf = g.clip(g.divsr(10.0), 0.48, g.keep(harmonic(i) * stretch(i)));
    res = 1.0 + g.keep(pf * cur_q(i));
    g_m = tan(PI * pf);
    r_m = g.safediv(1.0, res);
    h_m = g.safediv(1.0, g.keep(1.0 + g.keep(r_m * g_m)) + g.keep(g_m * g_m));
    amp = g.keep(0.5 + 0.5 * cos(g.keep(TWOPI * i) * position));
    body(s1, s2) = g.fixdenorm(2.0 * v1 + s1), g.fixdenorm(2.0 * v2 + s2), bp * amp
    with {
        hp = g.keep(g.keep(g.keep(exc - g.keep((r_m + g_m) * s1)) - s2) * h_m);
        v1 = g.keep(g_m * hp);
        bp = v1 + s1;
        v2 = g.keep(g_m * bp);
    };
};

// ---------------------------------------------------------------- program
rings(in1, in2, in3, nz) = out1, out2, out3, out4
with {
    trig_in3 = (in3 > 0.1) & ((in3 > 0.1)' <= 0.1);
    trig_param = (strum > 0.0) & ((strum > 0.0)' <= 0.0);
    hit = trig_in3 | trig_param;
    st = strike(hit);
    strike_pulse = st : _, !, !;
    noise_env = st : !, _, !;
    strum_env = st : !, !, _;
    pluck_noise = nz * noise_env * 0.4;
    exc_level = g.clip(0.0, 1.0, internal_exciter * 0.01);
    acoustic_exciter = (strike_pulse * 1.6 + pluck_noise) * exc_level;

    audio_in = g.keep((in1 + in2) * 0.5);
    in_drive = g.keep(1.0 + g.keep(drive * 0.01) * 2.0);
    raw_exc = g.keep(ma.tanh(audio_in * in_drive) + acoustic_exciter);

    exc_cutoff = g.clip(40.0, ma.SR * 0.45, 40.0 * g.safepow(450.0, eff_br));
    exc_g = tan(g.divsr(g.keep(PI * exc_cutoff)));
    exc_alpha = g.safediv(exc_g, 1.0 + exc_g);
    exc_sig = (\(h).(h + exc_alpha * (raw_exc - h))) ~ _;

    // sums in the loop's order, from 0.0
    sum_odd = 0.0 : seq(k, N / 2, + (mode(2 * k, exc_sig)) : g.keep);
    sum_even = 0.0 : seq(k, N / 2, + (mode(2 * k + 1, exc_sig)) : g.keep);

    sp = g.clip(0.0, 1.0, stereo_spread * 0.01);
    pan_L = g.keep(sum_odd * (1.0 + sp * 0.5) + sum_even * (1.0 - sp * 0.5));
    pan_R = g.keep(sum_even * (1.0 + sp * 0.5) + sum_odd * (1.0 - sp * 0.5));
    dc(x) = g.keep(x - x') : (+ ~ *(0.995));
    make_up = g.dbtoa(gain);
    lim_L = g.keep(g.keep(ma.tanh(dc(pan_L) * 0.5) * 1.8) * make_up);
    lim_R = g.keep(g.keep(ma.tanh(dc(pan_R) * 0.5) * 1.8) * make_up);
    eff_mix = g.clip(0.0, 1.0, mix_p * 0.01);
    out1 = g.keep(in1 * (1.0 - eff_mix)) + lim_L * eff_mix;
    out2 = g.keep(in2 * (1.0 - eff_mix)) + lim_R * eff_mix;
    out3 = exc_sig;
    out4 = strum_env;
};

det = rings;
process = (_, _, _, g.noises(1, 0)) : det;
