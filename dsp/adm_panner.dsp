// ADM_PANNER: multichannel panner, circular or linear array (gen~: gendsp/adm_panner.gendsp,
// an mc.gen~ patch: one instance per loudspeaker)
//
// In gen~ the patch runs in mc.gen~, one instance per channel, each
// computing the gain of its own loudspeaker (mc_channel) among
// mc_channelcount. This program is the N instances together: N outputs, one
// per loudspeaker (N = 8 below; change it to set the number of loudspeakers,
// as @chans does on mc.gen~).
//
// The source position (x, y, slid over `smooth` samples) is panned:
//  - mode 0, circular: loudspeaker k at the angle (k - 0.5)/N of the circle
//    (as atan2(x, y): 0 in front, clockwise), a cosine beam of half-width
//    (2/N)*width around the source's angle, raised to `sharpness`, scaled by
//    0.3 + 0.7*distance (distance = |(x, y)| clipped to 1);
//  - mode 1, linear: loudspeaker k at k/(N-1) on a line, the source at
//    (x + 1)/2, a cosine beam of half-width (1.5/(N-1))*width.
// Each output is in1 through a one-pole lowpass (air damping) whose cutoff
// falls from 20 kHz towards 2.5 kHz with distance^2 * air_damp (in linear
// mode the distance is 1), times the gain of its loudspeaker.
//
// in1: audio    in2: X (-1..1)    in3: Y (-1..1)
// out1..outN: the loudspeaker feeds
//
// Parameters: mode (0/1, def 0), width (1..200 %, def 100), sharpness
// (1..8, def 2.5), air_damp (0..1, def 0.65), smooth (def 240 samples, min 1).
//
// gen~ details kept: the gains are not power-normalized (a source between
// two loudspeakers of a narrow beam is quieter); smooth is declared with a
// minimum and no maximum, which the C++ export bounds to [1, 1] (the default
// 240 kept); gen~ in Max does not, and the slider here goes to 4800.

declare name "adm_panner";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

N = 8;   // the number of loudspeakers: mc.gen~'s @chans

mode = hslider("mode [style:menu{'circular':0;'linear':1}]", 0, 0, 1, 1);
width = hslider("width [unit:%]", 100, 1, 200, 0.01);
sharpness = hslider("sharpness", 2.5, 1, 8, 0.01);
air_damp = hslider("air_damp", 0.65, 0, 1, 0.001);
smooth = hslider("smooth [unit:samples]", 240, 1, 4800, 1);

PI = 3.1415926535897931;
TWOPI = 6.2831853071795862;

// one instance: channel `ch` (mc_channel, 1-based) of `count` (mc_channelcount)
panner(ch, count, in1, in2, in3) = out1
with {
    speakers = max(2, count);
    ch_idx = ch - 1;
    x_s = g.slide(smooth, smooth, in2);
    y_s = g.slide(smooth, smooth, in3);
    w_norm = g.clip(0.05, 2, width * 0.01);
    beam_gain(dist, beam) = select2(dist < beam, 0, g.safepow(cos((dist / beam) * (PI * 0.5)), sharpness));

    // mode 1: linear
    src_pos = g.clip(0, 1, (x_s + 1) * 0.5);
    spk_lin = ch_idx / (speakers - 1);
    gain_lin = beam_gain(abs(src_pos - spk_lin), (1.5 / (speakers - 1)) * w_norm);

    // mode 0: circular; cartopol(y_s, x_s)
    r = sqrt((y_s * y_s) + (x_s * x_s));
    angle = atan2(x_s, y_s);
    d_circ = g.clip(0, 1, r);
    teta_norm = g.wrap(0, 1, angle / TWOPI);
    speaker_pos = g.wrap(0, 1, (ch_idx - 0.5) / speakers);
    diff = abs(teta_norm - speaker_pos);
    ang_dist = min(diff, 1 - diff) * 2;
    gain_circ = beam_gain(ang_dist, (2 / speakers) * w_norm) * ((d_circ * 0.7) + 0.3);

    lin = mode > 0.5;
    gain_spatial = select2(lin, gain_circ, gain_lin);
    d = select2(lin, d_circ, 1);

    cutoff_target = g.clip(2500, 20000, 20000 - (((d * d) * air_damp) * (20000 - 2500)));
    w = (TWOPI * cutoff_target) / ma.SR;
    alpha = g.clip(0.001, 1, w / (w + 1));
    filtered = (\(prev).((in1 * alpha) + (prev * (1 - alpha)))) ~ _;
    out1 = filtered * gain_spatial;
};

adm(in1, in2, in3) = par(c, N, panner(c + 1, N, in1, in2, in3));

process = adm;
det = process;
