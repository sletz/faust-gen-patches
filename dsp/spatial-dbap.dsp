// SPATIAL-DBAP: 3D distance-based amplitude panning (gen~: gendsp/spatial-dbap.gendsp,
// an mc.gen~ patch: one instance per loudspeaker)
//
// In gen~ the patch runs in mc.gen~ (@chans 32 in its demo patch), one
// instance per channel, each computing the gain of its own loudspeaker
// (mc_channel). This program is the N instances together: N outputs, one per
// loudspeaker (N = 32 below, as the demo patch; change it as @chans).
//
// The source (x, y, z, each slid over `smooth` samples, times room_scale) is
// panned by DBAP over total_spk loudspeakers (num_speakers if > 0, else N):
// the distance d_k to loudspeaker k is sqrt(|src - spk_k|^2 + blur'^2), its
// weight d_k^-rolloff' (blur' = blur * width/100 clipped to 0.05..2,
// rolloff' = rolloff * sharpness), tapered by `focus` towards the farthest
// loudspeakers (1 - 1.5 * focus * (d_k - d_min)/(d_max - d_min), clipped to
// 0..1), and the weights are normalized in power (sum of squares 1). With
// air_damp > 0, each output goes through a one-pole lowpass whose cutoff
// falls from 20 kHz towards 2.5 kHz with (d / room_scale)^2 * air_damp.
//
// The loudspeaker layout: in gen~ it is read from the buffer~ spk_pos (X, Y,
// Z on 3 channels), which the demo patch's dbap_csv_loader.js fills from a
// CSV file, when the buffer holds at least total_spk frames; otherwise the
// loudspeakers are on a ring of radius 2 at ear level, loudspeaker k at the
// angle 2*pi*k/total_spk (x = 2 sin, y = 2 cos). This program has no buffer
// (as gen~ without a spk_pos buffer~, whose unbound Buffer has one frame):
// the ring, except with total_spk = 1, where the one loudspeaker reads that
// frame, at the origin.
//
// in1: audio (mono)    in2, in3, in4: source X, Y, Z (-1..1)
// out1..outN: the loudspeaker feeds (0 beyond total_spk)
//
// Parameters: num_speakers (0..32, def 0: N), rolloff (0.1..4, def 1),
// blur (0.01..2, def 0.25), focus (0..1, def 0), room_scale (0.1..20, def 2),
// smooth (def 240 samples, min 1), width (1..200 %, def 100), sharpness
// (0.5..4, def 1), air_damp (0..1, def 0).
//
// gen~ details kept: the lowpass state only runs while air_damp > 0 (it
// resumes from where it stopped); smooth is declared with a minimum and no
// maximum, which the C++ export bounds to [1, 1] (the default 240 kept);
// gen~ in Max does not, and the slider here goes to 4800.

declare name "spatial-dbap";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

N = 32;      // the number of loudspeakers: mc.gen~'s @chans
KMAX = 32;   // the patch's loops and Data dists(32)

num_speakers = hslider("num_speakers", 0, 0, 32, 1);
rolloff = hslider("rolloff", 1, 0.1, 4, 0.001);
blur = hslider("blur", 0.25, 0.01, 2, 0.001);
focus = hslider("focus", 0, 0, 1, 0.001);
room_scale = hslider("room_scale", 2, 0.1, 20, 0.01);
smooth = hslider("smooth [unit:samples]", 240, 1, 4800, 1);
width = hslider("width [unit:%]", 100, 1, 200, 0.01);
sharpness = hslider("sharpness", 1, 0.5, 4, 0.001);
air_damp = hslider("air_damp", 0, 0, 1, 0.001);

// the export's inlined clamp: (v <= lo) ? lo : ((v >= hi) ? hi : v)
tclamp = g.clip;
// the unbound Buffer spk_pos: one frame
BUFDIM = 1;

// one instance: channel `ch` (mc_channel, 1-based) of `count` (mc_channelcount)
dbap(ch, count, in1, in2, in3, in4) = out1
with {
    total_spk = select2(num_speakers > 0, max(2, count), tclamp(1, 32, floor(num_speakers)));
    my_idx = ch - 1;
    src_x = g.slide(smooth, smooth, in2) * room_scale;
    src_y = g.slide(smooth, smooth, in3) * room_scale;
    src_z = g.slide(smooth, smooth, in4) * room_scale;
    w_factor = tclamp(0.05, 2, width * 0.01);
    eff_blur = blur * w_factor;
    eff_roll = rolloff * sharpness;
    has_buf = BUFDIM >= total_spk;

    active(k) = k < total_spk;
    // the distance to loudspeaker k
    dist(k) = sqrt((((dx * dx) + (dy * dy)) + (dz * dz)) + (eff_blur * eff_blur))
    with {
        fb_ang = k * (6.283185307179586 / total_spk);
        sx = select2(has_buf, 2 * sin(fb_ang), 0);
        sy = select2(has_buf, 2 * cos(fb_ang), 0);
        sz = 0;
        dx = src_x - sx;
        dy = src_y - sy;
        dz = src_z - sz;
    };
    // folds over the active loudspeakers 0..KMAX-1, in the patch's order
    fold(f, init) = init : seq(k, KMAX, (_ <: _, f(_, k) : select2(active(k))));
    min_d = fold(\(m, k).(min(m, dist(k))), 10000);
    max_d = fold(\(m, k).(max(m, dist(k))), 0.0001);
    my_d = fold(\(m, k).(select2(k == my_idx, m, dist(k))), 10000);

    span = max(max_d - min_d, 0.0001);
    weight(k) = select2(focus > 0, w0, w0 * taper)
    with {
        d = dist(k);
        w0 = g.safepow(d, 0 - eff_roll);
        rel_d = (d - min_d) / span;
        taper = tclamp(0, 1, 1 - ((focus * rel_d) * 1.5));
    };
    energy = fold(\(e, k).(e + (weight(k) * weight(k))), 0);
    my_w = fold(\(m, k).(select2(k == my_idx, m, weight(k))), 0);

    norm_factor = 1 / sqrt(max(energy, 1e-12));
    gain_target = select2(my_idx < total_spk, 0, my_w * norm_factor);
    audio_out = in1 * gain_target;

    damp = air_damp > 0;
    d_norm = tclamp(0, 2, my_d / max(room_scale, 0.1));
    cutoff_target = tclamp(2500, 20000, 20000 - (((d_norm * d_norm) * air_damp) * (20000 - 2500)));
    w_rad = (6.283185307179586 * cutoff_target) / ma.SR;
    alpha = tclamp(0.001, 1, w_rad / (w_rad + 1));
    filtered = (\(prev).(select2(damp, prev, (audio_out * alpha) + (prev * (1 - alpha))))) ~ _;
    out1 = select2(damp, audio_out, filtered);
};

spatial(in1, in2, in3, in4) = par(c, N, dbap(c + 1, N, in1, in2, in3, in4));

process = spatial;
det = process;
