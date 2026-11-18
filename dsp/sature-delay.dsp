// SATURE-DELAY: master character lo-fi and dying-battery analog delay
// (gen~: gendsp/sature-delay.gendsp)
//
// Stereo character delay with two degradation engines in its feedback loop:
//  - wow and flutter: the delay time (cubic interpolation) is slid over
//    15000 samples with a +-0.35 sample noise jitter, plus a clock droop
//    following the battery sag in mode 1;
//  - digital mode (mode < 0.5): bitcrusher (2^24 .. 2^4.5 steps) and sample
//    rate reduction (hold of 1..32 samples), from `crush`;
//  - battery mode (mode >= 0.5): a dying 9 V battery, RC supply sag following
//    the signal, asymmetric rails, bias shift, a smoothstep "velcro" gate
//    with crackle noise, and a lowpass closing as the supply sags;
//  - a 40 Hz Butterworth highpass (transposed direct form II), a tilt EQ around `freq`
//    (-1 dark .. +1 bright), two allpasses per channel for diffusion, a DC
//    blocker and a tanh limiter;
//  - a feedback AGC limiting high feedback at the edge of self-oscillation,
//    and a true ping-pong routing (mono sum -> L -> R -> L ...).
//
// in1, in2: audio L, R     out1, out2: dry/wet L, R
//
// Parameters: time (1..2000 ms), fb (0..1.2), tilt (-1..1),
// freq (40..15000 Hz), diff (0..1), crush (0..1), mode (0: digital,
// 1: battery), pingpong (0..1), mix_bal (0..1).
//
// Quirks kept from gen~:
//  - the highpass's r = 0.707 is Q's reciprocal written as a damping, and
//    pi is 3.14159: its cutoff is close to, not exactly, 40 Hz;
//  - the allpass delays (23, 51, 29, 57 ms) live in Delays of 16000 samples:
//    the reads are clamped to 16000 samples above 280.7 kHz (57 ms);
//  - the delay time slides up from 0 at start: while it is below 4 samples,
//    read_cubic's 4 points reach the write head and read stale ring slots
//    (genops.lib reproduces that ring: g.rd_cubic_fb);
//  - the 1-pole states of the engine not selected (counter and hold in
//    battery mode, sag lowpasses and h_noise in digital mode) are frozen, and
//    h_sag relaxes toward 1 in digital mode.

declare name "sature-delay";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");
si = library("signals.lib");

time = hslider("time [unit:ms]", 250, 1, 2000, 0.01);
fb = hslider("fb", 0.5, 0, 1.2, 0.001);
tilt = hslider("tilt", 0, -1, 1, 0.001);
freq = hslider("freq [unit:Hz]", 1000, 40, 15000, 1);
diff = hslider("diff", 0, 0, 1, 0.001);
crush = hslider("crush", 0, 0, 1, 0.001);
mode = hslider("mode [style:menu{'digital':0;'battery':1}]", 0, 0, 1, 1);
pingpong = hslider("pingpong", 0, 0, 1, 0.001);
mix_bal = hslider("mix_bal", 0.5, 0, 1, 0.001);

// ---------------------------------------------------------------- engines

// Mode Digital: bitcrush + SRR; returns yL*0.98, yR*0.98, cnt, newL, newR
digital_fx(sigL, sigR, amt, count, hL, hR) = yL * 0.98, yR * 0.98, cnt, newL, newR
with {
    c_log = 1 - g.safepow(1 - amt, 3);
    period = floor(1 + (g.safepow(c_log, 2) * (32 - 1)));
    cnt1 = count + 1;
    latch = cnt1 >= period;
    newL = select2(latch, hL, sigL);
    newR = select2(latch, hR, sigR);
    cnt = select2(latch, cnt1, 0);
    st = g.safepow(2, 24 + (c_log * (4.5 - 24)));
    yL = g.safediv(floor((abs(newL) * st) + 0.5), st) * g.sign(newL);
    yR = g.safediv(floor((abs(newR) * st) + 0.5), st) * g.sign(newR);
};

// one underpowered transistor stage
battery_stage(x, amt, v_sag, thresh, crackle) = select2(amt > 0.0001, x * 0.98, res)
with {
    ax = abs(x);
    gate_w = max(0.002, amt * 0.02);
    cond_raw = g.clamp(0, 1, g.safediv((ax + crackle) - thresh, gate_w));
    cond = (cond_raw * cond_raw) * (3 - (2 * cond_raw));
    rail_pos = max(0.2, v_sag);
    rail_neg = max(0.1, v_sag * 0.48);
    bias_shift = (amt * 0.14) * rail_pos;
    driven = (x * (1 + (amt * 1.4))) + bias_shift;
    sat = select2(driven >= 0, rail_neg * ma.tanh(g.safediv(driven, rail_neg)),
                               rail_pos * ma.tanh(g.safediv(driven, rail_pos)));
    dc_bias = rail_pos * ma.tanh(g.safediv(bias_shift, rail_pos));
    trim = g.safediv(0.98, 1 + (amt * 0.45));
    y = ((sat - dc_bias) * cond) * trim;
    res = g.clamp(-0.85, 0.85, y);
};

// Mode Battery; nz: the noise() of the frame (site 1);
// returns fL, fR, new_sag, fL, fR, new_noise
analog_fx(sigL, sigR, amt, h_sag, h_lpfL, h_lpfR, h_noise, nz) = fL, fR, new_sag, fL, fR, new_noise
with {
    draw = max(abs(sigL), abs(sigR));
    v_nom = 1 + (g.safepow(amt, 0.85) * (0.28 - 1));
    v_target = max(0.12, g.safediv(v_nom, 1 + ((draw * amt) * 3.5)));
    rc_coeff = select2(v_target < h_sag, 1 - exp(g.safediv(-1, 0.12 * ma.SR)),
                                         1 - exp(g.safediv(-1, 0.002 * ma.SR)));
    new_sag = h_sag + (rc_coeff * (v_target - h_sag));
    presence = min(draw * 50, 1);
    new_noise = g.mix(h_noise, nz, 0.35);
    crackle = ((new_noise * g.safepow(amt, 1.4)) * 0.012) * presence;
    thresh = (g.safepow(amt, 1.6) * 0.03) * (1.2 - new_sag);
    yL = battery_stage(sigL, amt, new_sag, thresh, crackle);
    yR = battery_stage(sigR, amt, new_sag, thresh, crackle);
    lp_cut = g.clamp(0.45, 1, 0.45 + (new_sag * 0.55));
    fL = g.mix(h_lpfL, yL, lp_cut);
    fR = g.mix(h_lpfR, yR, lp_cut);
};

// ---------------------------------------------------------------- filters

// hpf40_clean: transposed direct form II, states s1, s2
hpf40_clean(sig) = rec ~ (_, _) : !, !, _
with {
    rec(s1, s2) = new_s1, new_s2, y_hpf
    with {
        y_hpf = (a1_h * sig) + s1;
        new_s1 = ((a2_h * sig) - (b1_h * y_hpf)) + s2;
        new_s2 = (a3_h * sig) - (b2_h * y_hpf);
    };
    f_hpf = g.safediv(40, ma.SR);
    r_hpf = 0.707;
    c_hpf = tan(3.14159 * f_hpf);
    a1_h = g.safediv(1, (1 + (r_hpf * c_hpf)) + (c_hpf * c_hpf));
    a2_h = (0 - 2) * a1_h;
    a3_h = a1_h;
    b1_h = (2 * a1_h) * ((c_hpf * c_hpf) - 1);
    b2_h = a1_h * ((1 - (r_hpf * c_hpf)) + (c_hpf * c_hpf));
};

// tilt EQ: lows = mix(h_lp, sig, f_norm), h_lp = lows
tilt_process(sig, t_val, f_hinge) = (lows * g_low) + (highs * g_high)
with {
    f_hz = g.clamp(40, 18000, f_hinge);
    f_norm = g.clamp(0.002, 0.92, 1 - exp(g.safediv((0 - 6.2831853071795862) * f_hz, ma.SR)));
    lows = (\(h).(g.mix(h, sig, f_norm))) ~ _;
    highs = sig - lows;
    t_c = g.clamp(-1, 1, t_val);
    g_low = select2(t_c >= 0, 1 + ((0 - t_c) * (1.3 - 1)), 1 + (t_c * (0.1 - 1)));
    g_high = select2(t_c >= 0, 1 + ((0 - t_c) * (0.1 - 1)), 1 + (t_c * (1.3 - 1)));
};

// allpass on a Delay(16000) read (linear, before its write) at sz_ms ms
allpass_fx(g_ap, sz_ms, sig) = loop ~ _ : !, _
with {
    loop(vd) = v_ap, s_read + (v_ap * g_ap)
    with {
        s_read = g.rd_linear_fb(16000, 16000, vd, sz_ms * (ma.SR * 0.001));
        v_ap = sig - (s_read * g_ap);
    };
};

// dcblock_clean: y = sig - p_in + 0.9997*p_out
dcblock_clean(sig) = (\(y).((sig - sig') + (0.9997 * y))) ~ _;

// ---------------------------------------------------------------- main loop

dmaxd = int(ma.SR * 2);
iup = 1 / max(1, abs(15000));
idown = 1 / max(1, abs(15000));

diff_c = g.clamp(0, 1, diff);
v_dg = diff_c * 0.82;
fb_raw = g.clamp(0, 1.2, fb) * 1.04;
pp = g.clamp(0, 1, pingpong);
mb = g.clamp(0, 1, mix_bal);

// the time slide, the delay reads and the engines: a recursion over
// h_smTime (the slide), h_sag, h_cnt, h_hL, h_hR, h_batLpL, h_batLpR, h_noise;
// wLd, wRd: the delays' written signals one sample late; n0, n1: noise sites
degrade(sl0, sag0, cnt0, hL0, hR0, lpL0, lpR0, hn0, wLd, wRd, n0, n1)
    = sl, sag, cnt, hL, hR, lpL, lpR, hn, v_degL, v_degR
with {
    sag_droop = select2(mode >= 0.5, 0, ((1 - sag0) * crush) * 35);
    slide_input = ((time * (ma.SR * 0.001)) + (n0 * 0.35)) + sag_droop;
    sl = g.fixdenorm(sl0 + (select2(slide_input > sl0, idown, iup) * (slide_input - sl0)));
    v_tapL = g.rd_cubic_fb(384000, dmaxd, wLd, sl);
    v_tapR = g.rd_cubic_fb(384000, dmaxd, wRd, sl);
    dig = mode < 0.5;
    sel(d, a) = select2(dig, a, d);
    dfx = digital_fx(v_tapL, v_tapR, crush, cnt0, hL0, hR0);
    afx = analog_fx(v_tapL, v_tapR, crush, sag0, lpL0, lpR0, hn0, n1);
    dget(i) = dfx : ba.selector(i, 5) with { ba = library("basics.lib"); };
    aget(i) = afx : ba.selector(i, 6) with { ba = library("basics.lib"); };
    v_degL = sel(dget(0), aget(0));
    v_degR = sel(dget(1), aget(1));
    cnt = sel(dget(2), cnt0);
    hL = sel(dget(3), hL0);
    hR = sel(dget(4), hR0);
    sag = sel(sag0 + (0.001 * (1 - sag0)), aget(2));
    lpL = sel(lpL0, aget(3));
    lpR = sel(lpR0, aget(4));
    hn = sel(hn0, aget(5));
};

// h_sag starts at 1 (History h_sag(1.0)): g.init(1) on its fed-back value
degrade_rec = degrade ~ (_, g.init(1), _, _, _, _, _, _) : si.block(8), _, _;

sature(wLd, wRd, in1, in2, n0, n1) = wL, wR, out1, out2
with {
    deg = degrade_rec(wLd, wRd, n0, n1);
    v_degL = deg : _, !;
    v_degR = deg : !, _;
    v_tiL = tilt_process(hpf40_clean(v_degL), tilt, freq);
    v_tiR = tilt_process(hpf40_clean(v_degR), tilt, freq);
    v_dfL = v_tiL : allpass_fx(v_dg, 23) : allpass_fx(v_dg, 51);
    v_dfR = v_tiR : allpass_fx(v_dg, 29) : allpass_fx(v_dg, 57);
    v_procL = g.mix(v_tiL, v_dfL, diff_c);
    v_procR = g.mix(v_tiR, v_dfR, diff_c);
    v_finalL = g.clamp(-1, 1, ma.tanh(dcblock_clean(v_procL)));
    v_finalR = g.clamp(-1, 1, ma.tanh(dcblock_clean(v_procR)));
    peak_env = max(abs(v_finalL), abs(v_finalR));
    h_fb_env = (\(h).(h + (0.005 * (peak_env - h)))) ~ _;
    agc_duck = g.safediv(1, 1 + (max(0, h_fb_env - 0.35) * 1.6));
    v_fb_eff = min(fb_raw * agc_duck, 1.04);
    pp_in = (in1 + in2) * 0.5;
    v_feedL = g.mix(in1, pp_in, pp) + (g.mix(v_finalL, v_finalR, pp) * v_fb_eff);
    v_feedR = g.mix(in2, 0, pp) + (g.mix(v_finalR, v_finalL, pp) * v_fb_eff);
    wL = g.fixdenorm(v_feedL);
    wR = g.fixdenorm(v_feedR);
    out1 = g.mix(in1, v_finalL, mb);
    out2 = g.mix(in2, v_finalR, mb);
};

// the port with its noises as inputs: in1, in2, noise site 0 (time jitter),
// noise site 1 (battery crackle)
det = sature ~ (_, _) : si.block(2), _, _;
process = (_, _, g.noises(2, 0), g.noises(2, 1)) : det;
