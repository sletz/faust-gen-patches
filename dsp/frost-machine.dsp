// FROST-MACHINE: industrial lush / dark ambient sound processor
// (gen~: gendsp/frost-machine.gendsp)
//
// Industrial sound sculpture inspired by Ben Frost's music:
//  1. input damping: a one-pole lowpass (p_damp_hz) darkening the input;
//  2. pre-diffusion: 4 fixed allpasses per channel (512..1571 samples,
//     g = 0.7, 0.6, 0.5, 0.4) smearing the attacks;
//  3. reverb core: a cross-coupled stereo loop of two allpasses per channel
//     (g = 0.7, 0.6) on delays of (50 + 400*p_size) ms times 0.41/0.89 (L) and
//     0.47/0.83 (R), modulated by a sine/cosine LFO (p_mod_ms, p_mod_hz,
//     linear interpolation), each channel's output fed to the other's input
//     scaled by p_decay_pct;
//  4. fuzz: asymmetric hard clip of the reverb output (gain p_fuzz_db,
//     clamp to [-1.1, 0.8]);
//  5. tone: a one-pole lowpass after the fuzz (p_fuzz_hz);
//  6. "la vague": ducking of the wet signal by an envelope of the dry input
//     (5 ms attack, p_release_ms release), (thresh/env)^2.5 above p_pump_db;
//  7. wet gain (x2, p_gain_wet_db) and dry/wet mix (p_mix_pct).
//
// in1, in2: audio L, R     out1, out2: processed L, R
//
// Parameters: p_size (0..1), p_decay_pct (0..100 %, clipped to 0.98),
// p_damp_hz (100..16000 Hz), p_mod_ms (0..20 ms), p_mod_hz (0..5 Hz),
// p_fuzz_db (0..60 dB), p_fuzz_hz (100..8000 Hz), p_pump_db (-60..0 dB),
// p_release_ms (10..5000 ms), p_gain_wet_db (-60..24 dB), p_mix_pct (0..100 %).
//
// Note: the gendsp's header comment documents another version of the patch
// (4 inlets with a sidechain and an aux input, p_absorb_pct, p_fuzz_drive,
// p_fuzz_mix, p_tone_freq, p_duck_amt, p_duck_rel_ms, p_wet_gain_db, p_mix,
// a soft-clip limiter): the code has 2 inputs, the parameters above, no
// limiter, and ducks on the dry input L+R. The port follows the code.

declare name "frost-machine";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");
si = library("signals.lib");

p_size = hslider("p_size", 0.6, 0, 1, 0.001);
p_decay_pct = hslider("p_decay_pct [unit:%]", 94, 0, 100, 0.01);
p_damp_hz = hslider("p_damp_hz [unit:Hz]", 3000, 100, 16000, 1);
p_mod_ms = hslider("p_mod_ms [unit:ms]", 6.0, 0, 20, 0.01);
p_mod_hz = hslider("p_mod_hz [unit:Hz]", 0.2, 0, 5, 0.001);
p_fuzz_db = hslider("p_fuzz_db [unit:dB]", 35, 0, 60, 0.01);
p_fuzz_hz = hslider("p_fuzz_hz [unit:Hz]", 800, 100, 8000, 1);
p_pump_db = hslider("p_pump_db [unit:dB]", -30, -60, 0, 0.01);
p_release_ms = hslider("p_release_ms [unit:ms]", 2000, 10, 5000, 1);
p_gain_wet_db = hslider("p_gain_wet_db [unit:dB]", 0, -60, 24, 0.01);
p_mix_pct = hslider("p_mix_pct [unit:%]", 50, 0, 100, 0.01);

TWOPI_NEG = 0 - 6.2831853071795862;

// ---------------------------------------------------------------- LFO, damping
ph = (+(g.safediv(p_mod_hz, ma.SR)) : g.wrap(0, 1)) ~ _;
lfoL = sin((ph * 2) * 3.1415926535897931);
lfoR = cos((ph * 2) * 3.1415926535897931);

cd = exp(g.safediv(TWOPI_NEG * p_damp_hz, ma.SR));
// h_d = fixdenorm(x*(1 - cd) + h_d*cd), the new value read
damp(x) = (\(h).(g.fixdenorm((x * (1 - cd)) + (h * cd)))) ~ _;

// ---------------------------------------------------------------- pre-diffusion
// Delay of maximum >= N read at N (read_step, before its write: delay N):
// r = w@N, w = x + c*r, out = -c*x + r
ap(N, c, x) = ((0 - c) * x) + (w @ N)
with { w = (\(wd).(x + (c * (wd @ (N - 1))))) ~ _; };

preL = ap(512, 0.7) : ap(773, 0.6) : ap(1131, 0.5) : ap(1571, 0.4);
preR = ap(523, 0.7) : ap(761, 0.6) : ap(1153, 0.5) : ap(1549, 0.4);

// ---------------------------------------------------------------- reverb core
v_decay = g.clamp(0, 0.98, p_decay_pct * 0.01);
m_depth = p_mod_ms * (ma.SR * 0.001);
s_base = (50 + (p_size * 400)) * (ma.SR * 0.001);

// the cross-coupled loop: the four Delays' written signals and hR_fb come back
// one sample late (the `~`); outputs vL2, vR2 after the five fed back
tank(wL1d, wL2d, wR1d, wR2d, hR_fbd, xL, xR) = wL1, wL2, wR1, wR2, hR_fb, vL2, vR2
with {
    nL = xL + (hR_fbd * v_decay);
    sL1 = (s_base * 0.41) + (lfoL * m_depth);
    rL1 = g.rd_linear_fb(12000, 12000, wL1d, sL1);
    vL1 = ((0 - 0.7) * nL) + rL1;
    wL1 = nL + (0.7 * vL1);
    sL2 = (s_base * 0.89) + (lfoR * m_depth);
    rL2 = g.rd_linear_fb(18000, 18000, wL2d, sL2);
    vL2 = ((0 - 0.6) * vL1) + rL2;
    wL2 = vL1 + (0.6 * vL2);
    hL_fb = g.fixdenorm(vL2);

    nR = xR + (hL_fb * v_decay);
    sR1 = (s_base * 0.47) + (lfoR * m_depth);
    rR1 = g.rd_linear_fb(12000, 12000, wR1d, sR1);
    vR1 = ((0 - 0.7) * nR) + rR1;
    wR1 = nR + (0.7 * vR1);
    sR2 = (s_base * 0.83) + (lfoL * m_depth);
    rR2 = g.rd_linear_fb(18000, 18000, wR2d, sR2);
    vR2 = ((0 - 0.6) * vR1) + rR2;
    wR2 = vR1 + (0.6 * vR2);
    hR_fb = g.fixdenorm(vR2);
};

// ---------------------------------------------------------------- fuzz, tone
f_gain = g.safepow(10, p_fuzz_db * 0.05);
fuzz(v) = g.clamp(-1.1, 0.8, v * f_gain);
cf_f = exp(g.safediv(TWOPI_NEG * p_fuzz_hz, ma.SR));
// f = x*(1-cf) + h*cf, h = fixdenorm(f): f is output
tone(x) = (\(h).(g.fixdenorm(f(h)), f(h))) ~ _ : !, _
with { f(h) = (x * (1 - cf_f)) + (h * cf_f); };

// ---------------------------------------------------------------- la vague
c_atk = exp(g.safediv(-1, ma.SR * 0.005));
c_rel = exp(g.safediv(-1, ma.SR * (p_release_ms * 0.001)));
v_thresh = g.safepow(10, p_pump_db * 0.05);
env(a) = (\(h).(select2(a > h, a + (c_rel * (h - a)), a + (c_atk * (h - a))))) ~ _;
gain_vague(h) = select2(h > v_thresh, 1, g.safepow(g.safediv(v_thresh, h), 2.5));

// ---------------------------------------------------------------- mix
v_gain_wet = g.safepow(10, p_gain_wet_db * 0.05);
v_mix = p_mix_pct * 0.01;

frost(in1, in2) = (damp(in1) : preL), (damp(in2) : preR)
    : (tank ~ si.bus(5)) : si.block(5), (fuzz : tone), (fuzz : tone)
    : mixout
with {
    gv = gain_vague(env((abs(in1) + abs(in2)) * 0.5));
    mixout(fL, fR) = out1, out2
    with {
        wetL_final = ((fL * gv) * v_gain_wet) * 2;
        wetR_final = ((fR * gv) * v_gain_wet) * 2;
        out1 = (in1 * (1 - v_mix)) + (wetL_final * v_mix);
        out2 = (in2 * (1 - v_mix)) + (wetR_final * v_mix);
    };
};

process = frost;
// no noise() in the patch: det is process
det = process;
