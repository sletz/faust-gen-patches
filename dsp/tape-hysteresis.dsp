// TAPE-HYSTERESIS: Jiles-Atherton magnetic tape hysteresis waveshaper
// (gen~: gendsp/tape-hysteresis.gendsp)
//
// A discrete Jiles-Atherton step per channel (anhysteretic tanh magnetization,
// irreversible pinning when the domain lag follows the sweep direction,
// reversible bowing, magnetization bounded to +-1.2), then a one-pole
// playback-head low-pass set by the tape speed, a 1-pole DC blocker, makeup
// gain and a dry/wet mix.
//
// in1, in2: audio L, R      out1, out2: tape processed L, R
//
// drive (0..100): input field scale 1 + 0.06 drive; bias (0..100): field
// offset (bias - 50)*0.005; coercivity, remanence: J-A k and alpha (0.45 x);
// speed_khz: head loss low-pass; mix_pct (0..100 %); gainout (dB).

declare name "tape-hysteresis";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

drive = hslider("drive", 40, 0, 100, 0.01);
bias = hslider("bias", 50, 0, 100, 0.01);
coercivity = hslider("coercivity", 0.3, 0.01, 1, 0.001);
remanence = hslider("remanence", 0.25, 0, 1, 0.001);
speed_khz = hslider("speed_khz [unit:kHz]", 15, 4, 20, 0.01);
mix_pct = hslider("mix_pct [unit:%]", 100, 0, 100, 0.01);
gainout = hslider("gainout [unit:dB]", 0, -24, 12, 0.01);

// the Jiles-Atherton step: the new magnetization
hysteresis_step(in_sig, h_prev, m_prev, k_coerc, rem_val) = m_new
with {
    alpha_rem = g.clamp(0, 1, rem_val) * 0.45;
    k_c = max(0.02, k_coerc);
    he = in_sig + alpha_rem * m_prev;
    man = ma.tanh(he * 1.4);
    dh = in_sig - h_prev;
    del = select2(dh >= 0, -1, 1);
    diff_m = man - m_prev;
    pin_denom = max(k_c - (del * alpha_rem) * diff_m, 0.02);
    dm_irr = select2((del * diff_m) > 0, 0, g.safediv(del * diff_m, pin_denom) * dh);
    dm_rev = (0.22 * diff_m) * min(abs(dh) * 4, 1);
    m_new = g.clamp(-1.2, 1.2, (m_prev + dm_irr * 0.75) + dm_rev);
};

channel(x) = g.fixdenorm(x * (1 - bal) + wet * bal)
with {
    h_scale = 1 + drive * 0.06;
    b_offset = (bias - 50) * 0.005;
    h_in = x * h_scale + b_offset;
    mag = (\(m).(hysteresis_step(h_in, h_in', m, coercivity, remanence))) ~ _;
    lpf_alpha = g.clamp(0.05, 0.85, 1 - g.safediv(speed_khz * 1000, ma.SR) * 2);
    head = (\(h).(mag * (1 - lpf_alpha) + h * lpf_alpha)) ~ _;
    dc = (\(y).((head - head') + 0.9985 * y)) ~ _;
    wet = dc * g.dbtoa(gainout);
    bal = g.clamp(0, 1, mix_pct * 0.01);
};

tape = channel, channel;

process = tape;
// no noise: det is the same program
det = tape;
