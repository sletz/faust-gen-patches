// FILTERBANK-8: 8-band resonant filterbank with soft clipping
// (gen~: gendsp/filterbank-8.gendsp)
//
// Each channel is driven into a tanh (drive), then split into eight 2-pole
// band-passes (ZDF/TPT state-variable filters) an octave apart, C2 to C9
// (65.41, 130.81, 261.63, 523.25, 1046.50, 2093.00, 4186.01, 8372.02 Hz),
// transposed together by freq_shift and clamped to [10 Hz, 0.45 sr]. All
// bands share the damping d = 1/q_global. Each band's band-pass, normalized
// by d and boosted by q_global^0.45, goes through a tanh (soft_clip sets its
// drive, 1 + 1.5 soft_clip/100, and 1/sqrt of it its output level), is
// weighted by its level (gain_1..gain_8, in dB) and panned: odd bands
// (1 + s, 1 - s) on (L, R), even bands (1 - s, 1 + s), s = stereo_spread/200.
// The sum of the eight bands goes through a DC blocker (pole 0.995), a soft
// clip 2.5 tanh(0.4 x), the makeup gain, and a linear dry/wet mix.
//
// in1, in2: audio L, R
// out1, out2: L, R (dry/wet)
// out3: bands 1-4, (L + R)/2, before the DC blocker, clip, gain and mix
// out4: bands 5-8, the same
//
// Parameters (gen~'s ranges and defaults): freq_shift (-24..24 semitones, 0),
// q_global (0.5..50, 4), drive (0..100, 20), soft_clip (0..100, 50),
// stereo_spread (0..100, 50), gain_1..gain_8 (-48..12 dB, 0), gain (-24..12
// dB, 0), mix (0..100 %, 100).
//
// Kept from gen~:
// - a band level at or below -40 dB mutes the band (the gendsp's header says
//   -48 dB); between -40 and -48 dB the slider does nothing more;
// - soft_clip is described as a "non-linear feedback saturation", but there
//   is no feedback: it is the drive of the per-band tanh, outside the filter;
// - the clamp to 0.45 sr stops band 8 short: at 48 kHz it stays at 21.6 kHz
//   above freq_shift +16.4 (at +24 it would be at 33.5 kHz), closing on
//   band 7 (16.7 kHz at +24);
// - the panning weights are not a pan law: at stereo_spread 100 a band is
//   at 1.5 on one side and 0.5 on the other;
// - out3 and out4 are the band sums before the master stage, at the band
//   levels and pan weights.
// Order of operations is gen's (keep() holds it against the normalizer).

declare name "filterbank-8";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
ba = library("basics.lib");
g = library("genops.lib");

freq_shift = hslider("freq_shift [unit:st]", 0, -24, 24, 0.01);
q_global = hslider("q_global", 4, 0.5, 50, 0.01);
drive = hslider("drive", 20, 0, 100, 0.01);
soft_clip = hslider("soft_clip", 50, 0, 100, 0.01);
stereo_spread = hslider("stereo_spread", 50, 0, 100, 0.01);
gain_1 = hslider("gain_1 [unit:dB]", 0, -48, 12, 0.01);
gain_2 = hslider("gain_2 [unit:dB]", 0, -48, 12, 0.01);
gain_3 = hslider("gain_3 [unit:dB]", 0, -48, 12, 0.01);
gain_4 = hslider("gain_4 [unit:dB]", 0, -48, 12, 0.01);
gain_5 = hslider("gain_5 [unit:dB]", 0, -48, 12, 0.01);
gain_6 = hslider("gain_6 [unit:dB]", 0, -48, 12, 0.01);
gain_7 = hslider("gain_7 [unit:dB]", 0, -48, 12, 0.01);
gain_8 = hslider("gain_8 [unit:dB]", 0, -48, 12, 0.01);
gain = hslider("gain [unit:dB]", 0, -24, 12, 0.01);
mix = hslider("mix [unit:%]", 100, 0, 100, 0.01);

PI = 3.1415926535897931;
K = g.keep;

// tuning and resonance, shared by every band
transp = g.safepow(2, freq_shift * (1.0 / 12.0));
eff_q = max(0.5, q_global);
d = g.safediv(1, eff_q);
res_boost = g.safepow(eff_q, 0.45);
clip_drive = 1 + K(soft_clip * 0.01) * 1.5;
clip_norm = g.safediv(1, sqrt(clip_drive));

centers = (65.41, 130.81, 261.63, 523.25, 1046.50, 2093.00, 4186.01, 8372.02);
fc(i) = g.clip(10, ma.SR * 0.45, ba.take(i + 1, centers) * transp);
gc(i) = tan(g.divsr(K(PI * fc(i))));
hc(i) = g.safediv(1, 1 + gc(i) * (gc(i) + d));

gains = (gain_1, gain_2, gain_3, gain_4, gain_5, gain_6, gain_7, gain_8);
kc(i) = select2(gl <= -40, g.dbtoa(gl), 0) with { gl = ba.take(i + 1, gains); };

sp = g.clip(0, 1, stereo_spread * 0.01) * 0.5;
pan_odd_L = 1 + sp; pan_odd_R = 1 - sp;
pan_evn_L = 1 - sp; pan_evn_R = 1 + sp;
panL(i) = select2(i % 2, pan_odd_L, pan_evn_L);   // band i+1: odd when i is even
panR(i) = select2(i % 2, pan_odd_R, pan_evn_R);

// one ZDF SVF band: the band-pass output, states s1, s2 updated as gen writes
// (v1, v2 kept: in the subnormal tail 2*(g*x) and (2*g)*x round differently)
svfbp(gv, hv, x) = (\(s1, s2).(ns1, ns2, bp
    with {
        hp = K(x - (gv + d) * s1) - s2;
        hpv = K(hp * hv);
        v1 = K(gv * hpv);
        bp = v1 + s1;
        ns1 = 2 * v1 + s1;
        v2 = K(gv * bp);
        ns2 = 2 * v2 + s2;
    })) ~ (_, _) : (!, !, _);

sat(bp) = K(ma.tanh(K(K(bp * d) * res_boost) * clip_drive) * clip_norm);

// band i of one channel, weighted and panned (pan: panL or panR)
band(pan, i, x) = K(sat(svfbp(gc(i), hc(i), x)) * kc(i)) * pan(i);

// the four-band subgroup sums, gen's order
sub4(pan, i0, x) = K(K(K(band(pan, i0, x) + band(pan, i0 + 1, x)) + band(pan, i0 + 2, x)) + band(pan, i0 + 3, x));

dcblk(s) = (\(y).(K(s - s') + 0.995 * y)) ~ _;

fbank(in1, in2) = out1, out2, out3, out4
with {
    in_drive = 1 + K(drive * 0.01) * 2;
    x_L = ma.tanh(in1 * in_drive);
    x_R = ma.tanh(in2 * in_drive);

    low_sub_L = sub4(panL, 0, x_L);
    high_sub_L = sub4(panL, 4, x_L);
    low_sub_R = sub4(panR, 0, x_R);
    high_sub_R = sub4(panR, 4, x_R);

    sum_raw_L = low_sub_L + high_sub_L;
    sum_raw_R = low_sub_R + high_sub_R;

    make_up = g.dbtoa(gain);
    lim_L = K(ma.tanh(dcblk(sum_raw_L) * 0.4) * 2.5) * make_up;
    lim_R = K(ma.tanh(dcblk(sum_raw_R) * 0.4) * 2.5) * make_up;

    eff_mix = g.clip(0, 1, mix * 0.01);
    out1 = g.mix(in1, lim_L, eff_mix);
    out2 = g.mix(in2, lim_R, eff_mix);
    out3 = (low_sub_L + low_sub_R) * 0.5;
    out4 = (high_sub_L + high_sub_R) * 0.5;
};

process = fbank;
// no noise: det is the same program
det = fbank;
