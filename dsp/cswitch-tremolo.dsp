// CSWITCH-TREMOLO: harsh tremolo and granular chopper (gen~: gendsp/cswitch-tremolo.gendsp)
//
// Trapezoidal tremolo / granular chopper driven by an anti-lock phase
// accumulator. At each grain start three noises are sampled and held: a
// temporal jitter of the next grains' rate (2^noise, mixed in by time_rand),
// an equal-power pan position (rand_pan) and the centre of a 2-pole resonant
// band-pass (min_freq..max_freq, glided over 2 ms), mixed in by filter_depth.
//
// in1, in2: audio left, right
// out1, out2: processed left, right   out3: grain start impulse
// out4: trapezoidal envelope (0..1)
//
// Parameters: rate (0.01..500 Hz, def 10), time_rand (0..1, def 0),
// pwm (0.01..0.99, def 0.5: duty cycle), slope (0..100 ms, def 2: fades),
// depth (0..1, def 1), rand_pan (0..1, def 1), filter_depth (0..1, def 1),
// min_freq (20..20000 Hz, def 200), max_freq (20..20000 Hz, def 4000),
// q (0.1..50, def 10), reset (0..1, def 0: while > 0 the phase is held at its
// first step and every sample is a grain start).
//
// gen~ detail kept: the resonator's gain b0 = 1 - r does not normalize its
// peak, which is about 1/(2 sin(2 pi cf/sr)): +25.6 dB at 200 Hz, +45.6 dB at
// 20 Hz, 0 dB at 4 kHz (q = 10, 48 kHz).

declare name "cswitch-tremolo";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

rate = hslider("rate [unit:Hz]", 10, 0.01, 500, 0.01);
time_rand = hslider("time_rand", 0, 0, 1, 0.001);
pwm = hslider("pwm", 0.5, 0.01, 0.99, 0.001);
slope = hslider("slope [unit:ms]", 2, 0, 100, 0.01);
depth = hslider("depth", 1, 0, 1, 0.001);
rand_pan = hslider("rand_pan", 1, 0, 1, 0.001);
filter_depth = hslider("filter_depth", 1, 0, 1, 0.001);
min_freq = hslider("min_freq [unit:Hz]", 200, 20, 20000, 1);
max_freq = hslider("max_freq [unit:Hz]", 4000, 20, 20000, 1);
q = hslider("q", 10, 0.1, 50, 0.01);
reset = hslider("reset", 0, 0, 1, 1);

// x / SR as genlib's safediv(x, samplerate) divides: Faust's normalizer turns
// a division by the constant SR into a product by 1/SR (1 ulp off at times);
// max(SR, x*1e-300) is SR for any x used here and keeps a true division.
divsr = g.divsr;

// genlib's slide(x, up, down): s += (x > s ? 1/max(1,|up|) : 1/max(1,|down|)) * (x - s)
slide = g.slide;

// the phase loop: state (phase, noise_time), noise_time sampled at grain start
// and used for the rate from the next frame on. Outputs phase, noise_time,
// trig, current_step.
_phaseloop(nz_time) = _step ~ (_, _)
with {
    _step(ph, ntime) = phase, ntime_new, trig, current_step
    with {
        rst = reset > 0;
        ph0 = select2(rst, ph, 0);          // phase and last_trigger after the reset
        time_mod = g.mix(1.0, g.safepow(2.0, ntime), time_rand);
        effective_rate = g.safediv(rate, g.clamp(0.05, 10.0, time_mod));
        current_step = divsr(effective_rate);
        phase = g.fract(ph0 + current_step);
        trig = (phase < ph0) | rst;
        ntime_new = select2(trig, ntime, nz_time);
    };
};

// 2-pole resonator: y = b0*x + c*y1 - r*r*y2
_reso(b0, c, r, x) = (\(y1, y2).(((b0 * x) + (c * y1)) - ((r * r) * y2))) ~ (_ <: _, _');

chopper(in1, in2, nz_time, nz_pan, nz_filt) = out1, out2, trig, mod_envelope
with {
    phase = _phaseloop(nz_time) : _, !, !, !;
    trig = _phaseloop(nz_time) : !, !, _, !;
    current_step = _phaseloop(nz_time) : !, !, !, _;
    noise_pan = (\(h).(select2(trig, h, nz_pan))) ~ _;
    noise_filt = (\(h).(select2(trig, h, nz_filt))) ~ _;

    grain_duration_sec = g.safediv(1, current_step * ma.SR);
    fade_phase_length = g.clamp(0.0001, 0.5, g.safediv(slope * 0.001, grain_duration_sec));
    attack_ramp = g.clamp(0, 1, g.safediv(phase, fade_phase_length));
    decay_ramp = g.clamp(0, 1, g.safediv(pwm - phase, fade_phase_length));
    raw_envelope = min(attack_ramp, decay_ramp);
    mod_envelope = g.clamp(0, 1, raw_envelope);

    random_01 = noise_filt * 0.5 + 0.5;
    target_freq = g.mix(min_freq, max_freq, random_01);
    smooth_freq_samps = 0.002 * ma.SR;
    cf_smoothed = slide(smooth_freq_samps, smooth_freq_samps, target_freq);
    cf = g.clamp(20, ma.SR * 0.49, cf_smoothed);
    bw = g.safediv(cf, q);
    r = exp(divsr((0 - ma.PI) * bw));
    c = (2 * r) * cos(divsr((2 * ma.PI) * cf));
    b0 = 1 - r;
    filtered_l = _reso(b0, c, r, in1);
    filtered_r = _reso(b0, c, r, in2);

    effective_filter_depth = filter_depth * depth;
    audio_filtered_l = g.mix(in1, filtered_l, effective_filter_depth);
    audio_filtered_r = g.mix(in2, filtered_r, effective_filter_depth);

    mod_amp = g.mix(1.0, mod_envelope, depth);
    effective_pan_amount = rand_pan * depth;
    pan_pos = g.mix(0.5, noise_pan * 0.5 + 0.5, effective_pan_amount);
    pan_l = cos(pan_pos * (ma.PI / 2));
    pan_r = sin(pan_pos * (ma.PI / 2));
    out1 = (audio_filtered_l * mod_amp) * pan_l;
    out2 = (audio_filtered_r * mod_amp) * pan_r;
};

process(in1, in2) = chopper(in1, in2, g.noises(3, 0), g.noises(3, 1), g.noises(3, 2));
// the port with its noises as inputs: in1, in2, noise_time, noise_pan, noise_filt
det = chopper;
