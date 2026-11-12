// VOLT-SYPHON: "starving battery" dual-engine ring modulator (gen~: gendsp/volt-syphon.gendsp)
//
// A ring modulator simulating a dying battery. Two internal carriers: a fixed
// sine (freq_main, level freq_main_amp) and a sine whose pitch follows the
// amplitude of in1 between freq_min and freq_max; autofollow crossfades them.
// The carrier is gated off when in1 is silent. Each channel goes through an
// envelope gate (threshold `gate`, jittered by `instability` noise), a sag
// (tanh drop of the gate envelope), a tone low-pass on the envelope, an
// envelope compressor with makeup, gainout and a tanh clip, a DC blocker, and
// a dry/wet mix. selfmod mixes the input itself into the carrier.
//
// in1: audio in (modulator)   in2: audio in right (carrier with selfmod)
// out1, out2: modulated audio
// Parameters as the gendsp: freq_main, freq_main_amp, freq_min, freq_max,
// autofollow, sag, gate, instability, compression, selfmod, tone, mix,
// gainout, and the technical rise, fall (envelope ms) and gate_gainin.

declare name "volt-syphon";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

freq_main = hslider("freq_main [unit:Hz]", 800, 20, 5000, 0.01);
freq_main_amp = hslider("freq_main_amp", 0.05, 0, 1, 0.001);
freq_min = hslider("freq_min [unit:Hz]", 80, 20, 2000, 0.01);
freq_max = hslider("freq_max [unit:Hz]", 800, 20, 5000, 0.01);
autofollow = hslider("autofollow [unit:%]", 0, 0, 100, 0.01);
mix = hslider("mix [unit:%]", 100, 0, 100, 0.01);
gate = hslider("gate [unit:%]", 0, 0, 100, 0.01);
sag = hslider("sag [unit:%]", 0, 0, 100, 0.01);
tone = hslider("tone [unit:%]", 50, 0, 100, 0.01);
instability = hslider("instability [unit:%]", 20, 0, 100, 0.01);
compression = hslider("compression [unit:%]", 50, 0, 100, 0.01);
selfmod = hslider("selfmod [unit:%]", 0, 0, 100, 0.01);
gainout = hslider("gainout [unit:dB]", 0, -60, 12, 0.01);
rise = hslider("rise [unit:ms]", 2, 2, 2000, 0.01);
fall = hslider("fall [unit:ms]", 500, 2, 2000, 0.01);
gate_gainin = hslider("gate_gainin", 3, 0, 15, 0.01);

TWOPI = 6.2831853071795862;

// h += inc; if (h > 1) h -= 1
ph(inc) = (\(h).(select2(h + inc > 1, h + inc, (h + inc) - 1))) ~ _;
// one-pole History: h = mix(x, h, a)
onepole(a, x) = (\(h).(g.mix(x, h, a))) ~ _;
// t60(mstosamps(ms)) as the export computes it
t60ms(ms) = exp(-6.9077552789821368 / (ms * (ma.SR * 0.001)));

// one channel of gate / sag / tone: returns h_lp
envelope(d_gate, input_presence, src) = env : lp
with {
    is_above = (abs(src) > d_gate) & input_presence;
    t = select2(is_above, 0, g.mix(1.0, ma.tanh(src - d_gate), sag * 0.01));
    env = (\(h).(g.fixdenorm(g.mix(t, h, g.clamp(0, 1,
            t60ms(max(select2(t > h, fall, rise), 1))))))) ~ _;
    lp(e) = (\(h).(g.mix(e, h, g.clamp(0.01, 1, 1 - ((tone * 0.01) * (1 - e)))))) ~ _;
};

syphon(nz, in1, in2) = out1, out2
with {
    main_sine = sin(ph(freq_main / ma.SR) * TWOPI) * freq_main_amp;
    h_pitch_env = onepole(0.995, abs(in1) * gate_gainin);
    p_norm = g.clamp(0, 1, h_pitch_env);
    ratio = freq_max / max(freq_min, 1);
    sweep_f = freq_min * g.safepow(ratio, p_norm);
    sweep_sine = sin(ph(sweep_f / ma.SR) * TWOPI) * 0.4;
    input_presence = abs(in1) > 0.0001;
    carrier_base = g.mix(main_sine, sweep_sine, autofollow * 0.01) * select2(input_presence, 0, 1);

    g_val = gate * 0.01;
    h_drift = onepole(0.999, (nz * (instability * 0.01)) * 0.01);
    d_gate = g.clamp(0, 1, g_val + h_drift);
    v_scale = select2(gate <= 0, 0.6, 3.3);

    carrier_L = g.mix(carrier_base, in1, selfmod * 0.01);
    carrier_R = g.mix(carrier_base, in2, selfmod * 0.01);

    h_lp_L = envelope(d_gate, input_presence, in1 * gate_gainin);
    h_lp_R = envelope(d_gate, input_presence, in2 * gate_gainin);

    comp_val = compression * 0.01;
    mod_L = (carrier_L * h_lp_L) * v_scale;
    mod_R = (carrier_R * h_lp_R) * v_scale;
    wet(m) = (m / (1 + (onepole(0.99, abs(m)) * comp_val) * 10)) * (1 + comp_val * 4);
    out_amp = g.dbtoa(gainout);
    sig_L = ma.tanh(wet(mod_L) * out_amp);
    sig_R = ma.tanh(wet(mod_R) * out_amp);
    // dc = sig - sig' + 0.995*dc'
    dc(s) = (\(y).((s - s') + 0.995 * y)) ~ _;
    out1 = g.mix(in1, dc(sig_L), mix * 0.01);
    out2 = g.mix(in2, dc(sig_R), mix * 0.01);
};

process = syphon(g.noises(1, 0));
// the port with its noise as an input, for scripts/test_gen.py: in1, in2, noise
det(in1, in2, nz) = syphon(nz, in1, in2);
