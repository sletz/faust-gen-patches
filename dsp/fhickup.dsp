// FHICKUP: overdrive, random amplitude chopper and morphing telephone filter
// (gen~: gendsp/fhickup.gendsp)
//
// An atan overdrive (gain 1 + 1255 (drive/100)^3.664, compensated by a
// linear map of atan(gain) and by 1 - 0.8 drive/100); then the "hickup": a
// phasor of `hickfreq` Hz draws, at each wrap, a new noise value per channel
// whose sign opens (< 0) or closes the gate, slewed over `hickclick` ms,
// crossfaded from a unipolar gate to a bipolar ring modulator (`ringmod`) and
// mixed in by `hickmix` (+ in4); a DC blocker (pole 0.995); a TPT state
// variable filter (k = 1/1.414) at `freq`, moved up to +-3 octaves by an
// input envelope follower (5 ms attack, 60 ms release, `env_to_filt`), whose
// output morphs low-pass -> band-pass -> high-pass (`filter_morph`); a tanh
// soft limiter (tanh(1.2 x) 0.95) and the dry/wet `mix`.
//
// in1, in2: audio L, R    in3: drive CV (added to drive)
// in4: hickup depth CV (added to hickmix, in %)
// out1, out2: processed L, R
//
// Parameters (gen~'s ranges and defaults): drive (0..100 %, 15),
// freq (50..8000 Hz, 1200), filter_morph (0..100 %, 50),
// env_to_filt (-100..100 %, 0), hickfreq (0.1..1000 Hz, 8),
// hickclick (0.5..100 ms, 15), hickmix (0..100 %, 60), ringmod (0..100 %, 0),
// stereo_spread (0..100 %, 40), mix (0..100 %, 100).
//
// gen~ quirks kept:
// - `stereo_spread` does nothing: the GenExpr computes `spr` from it and
//   never uses it. The two choppers run on the same phase (both histories
//   start at 0 and step by the same increment); they differ only by their
//   noise draws.
// - the gates start closed for the first period (h_rnd starts at 0, and the
//   gate opens on h_rnd < 0) while their slewed value starts at 1.
//
// Noise sites (export order): 0 the left draw, 1 the right draw (each on a
// phasor wrap).

declare name "fhickup";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");

drive = hslider("drive [unit:%]", 15, 0, 100, 0.01);
freq = hslider("freq [unit:Hz]", 1200, 50, 8000, 0.01);
filter_morph = hslider("filter_morph [unit:%]", 50, 0, 100, 0.01);
env_to_filt = hslider("env_to_filt [unit:%]", 0, -100, 100, 0.01);
hickfreq = hslider("hickfreq [unit:Hz]", 8, 0.1, 1000, 0.01);
hickclick = hslider("hickclick [unit:ms]", 15, 0.5, 100, 0.01);
hickmix = hslider("hickmix [unit:%]", 60, 0, 100, 0.01);
ringmod = hslider("ringmod [unit:%]", 0, 0, 100, 0.01);
stereo_spread = hslider("stereo_spread [unit:%]", 40, 0, 100, 0.01);
mix = hslider("mix [unit:%]", 100, 0, 100, 0.01);

PI = 3.1415926535897931;
TWOPI = 6.2831853071795862;

// envelope follower (reads the updated history)
envf(in_mag) = (\(h).(g.fixdenorm(h + (in_mag - h) * select2(in_mag > h, env_rel, env_att)))) ~ _
with {
    // 5 * (sr * 0.001), not 0.005 * sr as Faust would fold g.mstosamps(5.0)
    env_att = g.safediv(1, max(1, 5.0 * g.keep(ma.SR * 0.001)));
    env_rel = g.safediv(1, max(1, 60.0 * g.keep(ma.SR * 0.001)));
};

// k: g.keep, an identity the Faust normalizer does not see through. The
// port pins with it the intermediate values of the GenExpr that Faust would
// otherwise expand, factor or reorder (the export computes them as written:
// e.g. mix(sat, sat*gate, m) would become sat*(1 - m*(1 - gate)))
k = g.keep;

// the chopper phase (the same for L and R), and its wraps
inc = g.divsr(g.keep(g.clip(0.1, 1000, hickfreq) * TWOPI));
ph = (\(p).(g.wrap(0, TWOPI, k(p + inc)))) ~ _;
wrapped = ph < ph';

slew_alpha = g.safediv(1, max(1, g.mstosamps(g.clip(0.5, 100, hickclick))));
rm_amt = g.clip(0, 1, ringmod * 0.01);

// one gate: the noise held at each wrap, its sign slewed (history starts at 1)
gate(nz) = (\(hd).(g.fixdenorm(g.init(1, hd) + (raw - g.init(1, hd)) * slew_alpha))) ~ _
with {
    rnd = (\(r).(select2(wrapped, r, nz))) ~ _;
    raw = select2(rnd < 0, 0, 1);
};

// DC blocker on fixdenormed histories
dcb(x) = (\(yd).(k(x - g.fixdenorm(x')) + 0.995 * yd)) ~ g.fixdenorm;

// TPT SVF: hp, bp, lp
K2 = 1.4144271570014144;  // 2 k, k = 1/1.414, as gen folds it
svf(gc, x) = (loop ~ (_, _)) : !, !, _, _, _
with {
    loop(s1, s2) = g.fixdenorm(gc * hp + bp), g.fixdenorm(gc * bp + lp), hp, bp, lp
    with {
        hp = k(g.safediv(k(x - (K2 + gc) * s1) - s2, k(1.0 + K2 * gc) + gc * gc));
        bp = k(gc * hp + s1);
        lp = k(gc * bp + s2);
    };
};

fhickup(in1, in2, in3, in4, nL, nR) = out1, out2
with {
    env = envf(max(abs(in1), abs(in2)));

    eff_drive = g.clip(0, 100, drive + in3);
    gain = 1.0 + g.safepow(eff_drive * 0.01, 3.664) * 1255.0;
    // gen folds / (1.570796 - 0.785398) into * 1.2732398096251836 and
    // (1 - 0.18) into 0.82000000000000006; g.keep stops Faust folding further
    comp = 1.0 - g.keep((atan(gain) - 0.785398) * 1.2732398096251836) * (1.0 - 0.18);
    drv_scale = 1.0 - g.keep(eff_drive * 0.01) * 0.8;
    sat_L = k(k(atan(in1 * gain) * comp) * drv_scale);
    sat_R = k(k(atan(in2 * gain) * comp) * drv_scale);

    gL = gate(nL);
    gR = gate(nR);
    eff_gate_L = k(g.mix(gL, k(gL * 2.0 - 1.0), rm_amt));
    eff_gate_R = k(g.mix(gR, k(gR * 2.0 - 1.0), rm_amt));
    eff_hickmix = g.clip(0, 1, hickmix * 0.01 + g.keep(in4 * 0.01));
    dc_L = dcb(k(g.mix(sat_L, k(sat_L * eff_gate_L), eff_hickmix)));
    dc_R = dcb(k(g.mix(sat_R, k(sat_R * eff_gate_R), eff_hickmix)));

    oct_shift = g.keep(g.keep(env_to_filt * 0.01) * env) * 3.0;
    // (the reference build turns safepow(2, x) into exp2(x), 1 ulp off pow
    // for some x: with env_to_filt != 0 the outputs differ by about -290 dB)
    f_clamped = g.clip(50, ma.SR * 0.45, freq * g.safepow(2.0, oct_shift));
    gc = tan(g.divsr(g.keep(PI * f_clamped)));

    fL = svf(gc, dc_L);
    fR = svf(gc, dc_R);
    morph_pos = g.clip(0, 1, filter_morph * 0.01);
    morph(hp, bp, lp) = k(select2(morph_pos < 0.5,
                                g.mix(bp, hp, (morph_pos - 0.5) * 2.0),
                                g.mix(lp, bp, morph_pos * 2.0)));
    filt_L = fL : morph;
    filt_R = fR : morph;

    wet_L = k(ma.tanh(filt_L * 1.2) * 0.95);
    wet_R = k(ma.tanh(filt_R * 1.2) * 0.95);
    mix_val = g.clip(0, 1, mix * 0.01);
    // stereo_spread kept in the interface, without effect (as in gen~)
    out1 = attach(g.mix(in1, wet_L, mix_val), stereo_spread);
    out2 = g.mix(in2, wet_R, mix_val);
};

// the port with its noises as inputs: in1..in4, noise site 0 (left draw),
// noise site 1 (right draw)
det = fhickup;
process = (_, _, _, _, g.noises(2, 0), g.noises(2, 1)) : det;
