// FM-SUPERMOD: stereo bell phase modulation and audio processor
// (gen~: gendsp/fm-supermod.gendsp)
//
// Two sine modulators with self-feedback (DX7-style: the last output, times
// `feedback`, added to the phase) phase-modulate two sine carriers, L and R,
// detuned by `stereo_spread` (+-0.3 % on the carriers, +0.2 % more on the
// right modulator) with a quarter-cycle (at most) phase offset on the right.
// The modulator ratio is free, rounded to integers, or snapped to Risset's
// bell partials (`quantize`; in that mode the right modulator beats 1.2 Hz
// above). An optional fixed 2nd-order low-pass follows the carriers. Then:
// mode 1 rings the inputs by the carriers (x1.5), or plays the carriers
// (x0.4) when there is no input; mode 2 reads the inputs through a 4 ms
// cubic delay modulated by the carriers (Doppler FM, depth from fm_index);
// mode 3 plays the carriers with the input added to the modulator phases.
// A warm asymmetric tanh, the dry/wet `mix`; mode 0 mutes.
//
// in1: audio L, or the MIDI note when use_note_in = 1
// in2: audio R, and the ratio CV (in2 * 0.05 is added to ratio)
// in3: fm_index CV (added)    in4: feedback CV (added)
// out1, out2: processed L, R
//
// Parameters: mode (0..3: off, ring mod, time FM, adaptive FM; default 1),
// freq (20..10000 Hz, 220), ratio (0.01..30, 1.414), quantize (0..2: free,
// integers, Risset; 0), fm_index (0..50, 1.8), feedback (0..2, 0.25),
// stereo_spread (0..100 %, 50), use_note_in (0/1, 0), filter_lp (0/1, 0),
// mix (0..100 %, 100).
//
// As in gen:
// - in2 is both the right audio input and the ratio CV: right-channel audio
//   modulates the ratio by +-0.05 per unit; when in2 is exactly 0 the right
//   channel takes in1;
// - mode 1 switches between ring modulation and the plain carriers on the
//   presence of input (|in1| or |in2| > 0.0001), sample by sample;
// - with use_note_in = 1 the dry signal is 0 (mix < 100 % fades the output
//   down), and in2 still moves the ratio;
// - the low-pass has fixed coefficients: its cutoff follows the sample rate;
// - in mode 3 the input only reaches the output through the dry mix and
//   the phase injection (it is not in the wet signal).
//
// No noise: det = the program.

declare name "fm-supermod";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

mode = hslider("mode", 1, 0, 3, 1);
freq = hslider("freq [unit:Hz]", 220, 20, 10000, 0.01);
ratio = hslider("ratio", 1.414, 0.01, 30, 0.001);
quantize = hslider("quantize", 0, 0, 2, 1);
fm_index = hslider("fm_index", 1.8, 0, 50, 0.01);
feedback = hslider("feedback", 0.25, 0, 2, 0.001);
stereo_spread = hslider("stereo_spread [unit:%]", 50, 0, 100, 0.01);
use_note_in = hslider("use_note_in", 0, 0, 1, 1);
filter_lp = hslider("filter_lp", 0, 0, 1, 1);
mix_p = hslider("mix [unit:%]", 100, 0, 100, 0.01);

TWOPI = 6.2831853071795862;
HALFPI = 1.5707963267948966;
MAXD = 4800;

biquad_lp(sig) = (\(y1, y2).(y(y1, y2), y1)) ~ (_, _) : (_, !)
with {
    y(y1, y2) = g.keep(g.keep(g.keep(g.keep(sig * 0.469) + g.keep(sig' * 0.938)) + g.keep(sig'' * 0.469))
                - g.keep(y1 * 0.74)) - g.keep(y2 * 0.137);
};

saturate_hot(x) = ma.tanh(b * 1.25) * 0.95
with { b = x + 0.08 * g.keep(x * abs(x)); };

supermod(in1, in2, in3, in4) = out1, out2
with {
    note_mode = use_note_in > 0.5;
    eff_note = g.clip(0, 128, in1);
    f_base = select2(note_mode, max(freq, 10.0), g.mtof(eff_note));
    spr = g.keep(stereo_spread * 0.01);
    f_car_L = g.keep(f_base * (1.0 - g.keep(spr * 0.003)));
    f_car_R = g.keep(f_base * (1.0 + g.keep(spr * 0.003)));

    raw_ratio = g.clip(0.01, 30.0, ratio + in2 * 0.05);
    risset_ratio = select2(raw_ratio < 0.74, select2(raw_ratio < 1.05, select2(raw_ratio < 1.30,
                   select2(raw_ratio < 1.55, select2(raw_ratio < 1.85, select2(raw_ratio < 2.37,
                   select2(raw_ratio < 2.87, select2(raw_ratio < 3.38, select2(raw_ratio < 3.91,
                   select2(raw_ratio < 4.50, floor(raw_ratio) * 1.19 - 0.1, 4.07), 3.76), 3.00), 2.74),
                   2.00), 1.70), 1.414), 1.19), 0.92), 0.56);
    eff_ratio = select2(quantize < 0.5, select2(quantize < 1.5, risset_ratio,
                max(1.0, floor(raw_ratio + 0.5))), raw_ratio);
    risset_beat = select2(quantize >= 1.5, 0.0, 1.2);

    f_mod_L = g.keep(f_car_L * eff_ratio);
    f_mod_R = g.keep(g.keep(f_car_R * eff_ratio) * (1.0 + g.keep(spr * 0.002))) + risset_beat;

    eff_index = g.clip(0.0, 50.0, fm_index + in3);
    eff_fb = g.clip(0.0, 2.0, feedback + in4);

    // modulators with self-FM
    inc_mod_L = g.divsr(g.keep(f_mod_L * TWOPI));
    inc_mod_R = g.divsr(g.keep(f_mod_R * TWOPI));
    ph_mod_L = (\(p).(g.wrap(0, TWOPI, g.keep(p + inc_mod_L)))) ~ _;
    ph_mod_R = (\(p).(g.wrap(0, TWOPI, g.keep(p + inc_mod_R)))) ~ _;

    audio_in_L = in1;
    audio_in_R = select2(in2 != 0, in1, in2);
    clean_audio_in = select2(note_mode, audio_in_L * 0.5 + audio_in_R * 0.5, 0.0);
    audio_inject = select2(mode >= 2.5, 0.0, g.keep(clean_audio_in * eff_index) * 0.5);

    raw_mod_L = (\(md).(sin(g.keep(ph_mod_L + g.keep(md * eff_fb)) + audio_inject))) ~ g.fixdenorm;
    raw_mod_R = (\(md).(sin(g.keep(ph_mod_R + g.keep(md * eff_fb)) + audio_inject))) ~ g.fixdenorm;

    // carriers
    inc_car_L = g.divsr(g.keep(f_car_L * TWOPI));
    inc_car_R = g.divsr(g.keep(f_car_R * TWOPI));
    ph_car_L = (\(p).(g.wrap(0, TWOPI, g.keep(p + inc_car_L)))) ~ _;
    ph_car_R = (\(p).(g.wrap(0, TWOPI, g.keep(p + inc_car_R)))) ~ _;
    spatial_offset = g.keep(spr * HALFPI) * 0.5;
    bell_car_L = sin(ph_car_L + g.keep(raw_mod_L * eff_index));
    bell_car_R = sin(g.keep(ph_car_R + spatial_offset) + g.keep(raw_mod_R * eff_index));

    lp_on = filter_lp > 0.5;
    filt_car_L = select2(lp_on, bell_car_L, biquad_lp(bell_car_L));
    filt_car_R = select2(lp_on, bell_car_R, biquad_lp(bell_car_R));

    // audio modes
    dry_L = select2(note_mode, audio_in_L, 0.0);
    dry_R = select2(note_mode, audio_in_R, 0.0);
    synth_gain = 0.40;
    has_audio = ((abs(in1) > 0.0001) | (abs(in2) > 0.0001)) & (use_note_in < 0.5);
    m1_L = select2(has_audio, filt_car_L * synth_gain, g.keep(dry_L * filt_car_L) * 1.5);
    m1_R = select2(has_audio, filt_car_R * synth_gain, g.keep(dry_R * filt_car_R) * 1.5);

    span_ms = min(3.8, g.keep(eff_index * 0.08) + 0.1);
    mod_time_L = g.keep(4.0 + g.keep(filt_car_L * span_ms)) * (ma.SR * 0.001);
    mod_time_R = g.keep(4.0 + g.keep(filt_car_R * span_ms)) * (ma.SR * 0.001);
    // Delay dly(4800), written then read (cubic) in the frame
    m2_L = g.rd_cubic(MAXD, MAXD, 0, dry_L, mod_time_L);
    m2_R = g.rd_cubic(MAXD, MAXD, 0, dry_R, mod_time_R);

    m3_L = filt_car_L * synth_gain;
    m3_R = filt_car_R * synth_gain;

    raw_wet_L = select2(mode < 1.5, select2(mode < 2.5, m3_L, m2_L), m1_L);
    raw_wet_R = select2(mode < 1.5, select2(mode < 2.5, m3_R, m2_R), m1_R);

    sat_wet_L = saturate_hot(raw_wet_L);
    sat_wet_R = saturate_hot(raw_wet_R);

    mix_val = g.clip(0.0, 1.0, mix_p * 0.01);
    is_active = mode >= 0.5;
    out1 = select2(is_active, 0, g.mix(dry_L, sat_wet_L, mix_val));
    out2 = select2(is_active, 0, g.mix(dry_R, sat_wet_R, mix_val));
};

det = supermod;
process = (_, _, _, _) : det;
