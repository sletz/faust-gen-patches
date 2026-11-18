// PULSAR-SYNTH: continuous pulsar synthesis (Curtis Roads)
// (gen~: gendsp/pulsar-synth.gendsp)
//
// A period phasor at f0; in each period, a pulsaret (a waveform of
// `formant_f` Hz under a window) fills the first `duty_ratio` of the period,
// silence the rest. At every new period a noise draw decides whether the
// pulsar sounds (masking) and the pan alternates. A rising edge of in1
// through 0.5 resets the phase to 0 and starts a new period.
//
// in1: reset / sync trigger (> 0.5)    in2: formant frequency modulation (Hz)
// out1, out2: pulsar audio L, R
//
// wave_shape: 0 sine, 1 triangle, 2 chirp, 3 harmonics; win_type: 0 rectangle,
// 1 Hann, 2 Gaussian, 3 exponential decay. Both are compared to integers by
// gen (`== 0`, `== 1`, `== 2`): a fractional value falls to the last branch.

declare name "pulsar-synth";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

f0 = hslider("f0 [unit:Hz]", 25, 0.1, 500, 0.01);
formant_f = hslider("formant_f [unit:Hz]", 650, 20, 8000, 0.01);
duty_ratio = hslider("duty_ratio", 0.3, 0.01, 1, 0.001);
wave_shape = hslider("wave_shape [style:menu{'sine':0;'triangle':1;'chirp':2;'harmonics':3}]", 0, 0, 3, 1);
win_type = hslider("win_type [style:menu{'rectangle':0;'hann':1;'gauss':2;'expdecay':3}]", 1, 0, 3, 1);
masking = hslider("masking", 0, 0, 1, 0.001);
pan_spread = hslider("pan_spread", 0.5, 0, 1, 0.001);

TWOPI = 6.2831853071795862;

// nz: the noise of the trigger (gen's noise(), uniform in [-1, 1))
pulsar(nz, in1, in2) = sig * pan_L, sig * pan_R
with {
    f0_step = g.safediv(g.clamp(0.05, 500, f0), ma.SR);
    trig_sync = (in1 > 0.5) & (in1' <= 0.5);
    phase_f0 = (\(h).(select2(trig_sync, g.wrap(0, 1, h + f0_step), 0))) ~ _;
    trig = ((phase_f0' + f0_step) >= 1) | trig_sync;
    h_pulsar_active = (\(a).(select2(trig, a, abs(nz) > masking))) ~ g.init(1);
    h_pulse_count = (\(c).(select2(trig, c, c + 1))) ~ _;

    d_ratio = g.clamp(0.005, 0.999, duty_ratio);
    in_pulsaret = phase_f0 < d_ratio;

    p_norm = g.safediv(phase_f0, d_ratio);
    xg = (p_norm - 0.5) * 5;
    w = select2(win_type == 0,
          select2(win_type == 1,
            select2(win_type == 2, exp((0 - p_norm) * 4), exp((-0.5 * xg) * xg)),
            0.5 * (1 - cos(p_norm * TWOPI))),
          1);
    eff_formant = g.clamp(20, 12000, formant_f + in2);
    pulsar_cycles = eff_formant * g.safediv(d_ratio, max(f0, 0.1));
    p_wave_phase = g.wrap(0, 1, p_norm * pulsar_cycles);
    chirp_ph = p_wave_phase * (1 + p_norm * 2);
    osc = select2(wave_shape == 0,
            select2(wave_shape == 1,
              select2(wave_shape == 2,
                sin(p_wave_phase * TWOPI) * 0.7 + sin((p_wave_phase * 4) * 3.1415926535897931) * 0.3,
                sin(g.wrap(0, 1, chirp_ph) * TWOPI)),
              abs(p_wave_phase - 0.5) * 4 - 1),
            sin(p_wave_phase * TWOPI));
    sig = select2(in_pulsaret & h_pulsar_active, 0, osc * w);

    pan_dir = select2(fmod(h_pulse_count, 2) != 0, -1, 1);
    pan_pos = 0.5 + (pan_dir * pan_spread) * 0.45;
    pan_L = cos(pan_pos * 1.5707963267948966);
    pan_R = sin(pan_pos * 1.5707963267948966);
};

process = pulsar(g.noises(1, 0));
// the port with its noise as an input, for scripts/test_gen.py: in1, in2, noise
det(in1, in2, nz) = pulsar(nz, in1, in2);
