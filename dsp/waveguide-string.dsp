// WAVEGUIDE-STRING: 4-voice waveguide string (extended Karplus-Strong)
// (gen~: gendsp/waveguide-string.gendsp)
//
// An exciter (a decaying noise burst started by a trigger, plus the input
// itself) goes through a pick-position comb (a cubic-interpolated delay of
// pick_pos of the period, modulated +-5 % by two slow LFOs), then into four
// detuned waveguide loops, each a linear-interpolated delay, a first-order
// allpass (stiffness), a one-pole damping low-pass, a T60 loop gain and a
// tanh bridge saturation. The four voices are panned to two outputs, through
// a tanh, and mixed with the dry input.
//
// in1: excitation audio / strike (a rise above 0.1 triggers a burst)
// in2: pitch modulation (Hz, added to freq)
// out1, out2: string L, R (dry/wet)
//
// freq (Hz), detune (0..100 %: fine detune up to 4.5 Hz plus a spread of up to
// 2.5 octaves), decay_time (T60, s), damping, stiffness, pick_pos,
// strike_res (burst length 0.5..8 ms), nl_bridge, trig (> 0: a trigger at
// every sample, the burst restarted while held), mix_pct (%).
//
// As in gen: the dry part of out2 is in1 (not in2, the pitch CV, and there is
// no right input), so both outputs carry in1 dry.

declare name "waveguide-string";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

freq = hslider("freq [unit:Hz]", 110, 20, 2000, 0.01);
detune = hslider("detune [unit:%]", 5, 0, 100, 0.01);
decay_time = hslider("decay_time [unit:s]", 3.5, 0.1, 20, 0.01);
damping = hslider("damping", 0.3, 0, 1, 0.001);
stiffness = hslider("stiffness", 0.15, 0, 1, 0.001);
pick_pos = hslider("pick_pos", 0.22, 0.01, 0.99, 0.001);
strike_res = hslider("strike_res", 0.5, 0, 1, 0.001);
nl_bridge = hslider("nl_bridge", 0.25, 0, 1, 0.001);
trig = hslider("trig", 0, 0, 1, 1);
mix_pct = hslider("mix_pct [unit:%]", 100, 0, 100, 0.01);

TWOPI = 6.2831853071795862;
MAXD = 192000;   // the string delays are read at most sr - 10 samples back

// nz: the burst noise (gen's noise(), uniform in [-1, 1), drawn while the
// burst runs)
wstring(nz, in1, in2) = out1, out2
with {
    // --- 1. exciter and pick comb
    ext_trig = (in1 > 0.1) & (in1' <= 0.1);
    is_trig = ext_trig | (trig > 0);
    burst_len = g.clamp(4, 1200, g.scale(strike_res, 0, 1, 0.5, 8, 1) * (ma.SR * 0.001));
    // h_burst_cnt: set on a trigger, then counted down while > 0
    cnt_pre(c) = select2(is_trig, c, burst_len);
    h_burst_cnt = (\(c).(select2(cnt_pre(c) > 0, cnt_pre(c), cnt_pre(c) - 1))) ~ _;
    cnt = cnt_pre(h_burst_cnt');
    exc_noise = select2(cnt > 0, 0, nz * (cnt * 0.00083333333333333339));
    raw_exc = in1 * 0.5 + exc_noise * 0.8;

    ph1 = (\(p).(g.wrap(0, 1, p + g.safediv(0.13, ma.SR)))) ~ _;
    ph2 = (\(p).(g.wrap(0, 1, p + g.safediv(0.21, ma.SR)))) ~ _;
    pick_lfo = 0.65 * sin(ph1 * TWOPI) + 0.35 * sin(ph2 * TWOPI);
    eff_pick_pos = g.clamp(0.01, 0.99, pick_pos + pick_lfo * 0.05);
    base_f = g.clamp(10, ma.SR * 0.45, freq + in2);
    pick_samps = g.clamp(1, 4000, eff_pick_pos * g.safediv(ma.SR, base_f));
    pick_sig = raw_exc - g.rd_cubic(4096, 4096, 1, raw_exc, pick_samps);

    // --- 2. detune
    detune_norm = detune * 0.01;
    fine_hz = detune_norm * 4.5;
    wide_oct = g.safepow(detune_norm, 1.7) * 2.5;
    fmax = ma.SR * 0.45;
    f1 = g.clamp(10, fmax, (base_f - fine_hz) * g.safepow(2, (0 - wide_oct) * 1));
    f2 = g.clamp(10, fmax, (base_f - fine_hz * 0.33) * g.safepow(2, (0 - wide_oct) * 0.35));
    f3 = g.clamp(10, fmax, (base_f + fine_hz * 0.33) * g.safepow(2, wide_oct * 0.35));
    f4 = g.clamp(10, fmax, (base_f + fine_hz) * g.safepow(2, wide_oct * 1));

    // --- 3-5. one voice: allpass, damping, loop gain, bridge
    ap_coeff = g.scale(stiffness, 0, 1, 0, 0.72, 1);
    damp_alpha = g.scale(damping, 0, 1, 0.96, 0.04, 1);
    drive_term = 1 + nl_bridge * 3;
    voice(f) = (\(wd).(pick_sig + sat(wd), sat(wd))) ~ _ : (!, _)
    with {
        d_samps = g.clamp(2, int(ma.SR) - 10, g.safediv(ma.SR, f) - 2);
        gain = g.safepow(0.001, g.safediv(1, max(decay_time * f, 0.1)));
        sat(wd) = g.safediv(ma.tanh(dampv * gain * drive_term), drive_term)
        with {
            sig = g.rd_linear_fb(MAXD, 2 * ma.SR, wd, d_samps);
            disp = (\(ap_out).(sig * (0 - ap_coeff) + sig' + ap_out * ap_coeff)) ~ _;
            dampv = (\(h).(disp * (1 - damp_alpha) + h * damp_alpha)) ~ _;
        };
    };
    sat1 = voice(f1);
    sat2 = voice(f2);
    sat3 = voice(f3);
    sat4 = voice(f4);

    // --- 6. panning and mix
    outL = sat1 * 0.35 + sat2 * 0.15 + sat3 * 0.28 + sat4 * 0.12;
    outR = sat1 * 0.12 + sat2 * 0.28 + sat3 * 0.15 + sat4 * 0.35;
    wetL = ma.tanh(outL * 1.2);
    wetR = ma.tanh(outR * 1.2);
    bal = g.clamp(0, 1, mix_pct * 0.01);
    out1 = g.mix(in1, wetL, bal);
    out2 = g.mix(in1, wetR, bal);
};

process = wstring(g.noises(1, 0));
// the port with its noise as an input, for scripts/test_gen.py: in1, in2, noise
det(in1, in2, nz) = wstring(nz, in1, in2);
