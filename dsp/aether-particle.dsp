// AETHER-PARTICLE: granular microsound cloud and 4x4 Hadamard FDN (gen~: gendsp/aether-particle.gendsp)
//
// The input (plus the grain cloud fed back through tanh, dcblocked) is
// written into a 20 s ring buffer per channel. A clock of `g_density` Hz,
// jittered by a Box-Muller Gaussian (`g_std_density` %), fires grains with
// probability `g_prob`; each fire takes the first free of 4 voices, with a
// Gaussian duration (`g_size` +- `g_std_size` ms), a read position `g_pos` %
// behind the write head (+- `g_std_pos`), a right-channel skew (`g_skew`),
// and, with probability `g_crush`, a sample-and-hold of 2..81 samples. Each
// voice reads at speed `g_pitch` (no interpolation) under a window that
// morphs from perc (0) through spline (0.5) to trapezoid (1) (`g_window`).
// The cloud goes through a 10 ms predelay, two slid allpasses and a 4x4
// Hadamard FDN (sizes `r_size`, sine-modulated by `r_speed`/`r_depth`,
// feedback `r_decay` through tanh, damping `r_absorb`, dcblocked), a tilt
// (`r_tilt`), then the dry/grain/reverb mixes (`g_mix`, `r_mix`), `gainout`,
// a DC blocker and tanh.
//
// in1, in2: audio L, R     out1, out2: processed L, R
//
// Parameters: gainout (-60..12 dB), clear, freeze (0/1), g_mix, g_prob
// (0..100 %), g_density (0.001..60 Hz), g_std_density, g_pos, g_std_pos
// (0..100 %), g_size (2..2000 ms), g_std_size (0..1000 ms), g_pitch (-4..4),
// g_window (0..1), g_crush, g_regen, g_skew (0..100 %), r_mix (0..100 %),
// r_size (0.5..100 %), r_decay (0..110 %), r_absorb (0..100 %), r_tilt (-1..1),
// r_speed (0.1..10 Hz), r_depth (0..20).
//
// gen~ quirks kept: `freeze` and `clear` both write zeros at the write head
// (neither holds nor flushes the buffer at once: the buffer empties over 20 s);
// get_window's guard `if (p < 0 || p >= 1) return 0` is absent from the
// export (harmless: a voice only runs while tmr < dur).
//
// Noise sites (export order): 0 the g_prob trial, 1 the g_crush trial, 2 the
// crush factor, 3 and 4 box_muller's u1 and u2, called twice per firing frame
// (the density jitter, then the grain Gaussian).

declare name "aether-particle";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");
si = library("signals.lib");

gainout = hslider("gainout [unit:dB]", 0, -60, 12, 0.01);
clear = hslider("clear", 0, 0, 1, 1);
freeze = hslider("freeze", 0, 0, 1, 1);
g_mix = hslider("g_mix [unit:%]", 50, 0, 100, 0.01);
g_prob = hslider("g_prob [unit:%]", 100, 0, 100, 0.01);
g_density = hslider("g_density [unit:Hz]", 4, 0.001, 60, 0.001);
g_std_density = hslider("g_std_density [unit:%]", 20, 0, 100, 0.01);
g_pos = hslider("g_pos [unit:%]", 10, 0, 100, 0.01);
g_std_pos = hslider("g_std_pos [unit:%]", 5, 0, 100, 0.01);
g_size = hslider("g_size [unit:ms]", 200, 2, 2000, 0.01);
g_std_size = hslider("g_std_size [unit:ms]", 50, 0, 1000, 0.01);
g_pitch = hslider("g_pitch", 1, -4, 4, 0.001);
g_window = hslider("g_window", 0.5, 0, 1, 0.001);
g_crush = hslider("g_crush [unit:%]", 30, 0, 100, 0.01);
g_regen = hslider("g_regen [unit:%]", 40, 0, 100, 0.01);
g_skew = hslider("g_skew [unit:%]", 0, 0, 100, 0.01);
r_mix = hslider("r_mix [unit:%]", 40, 0, 100, 0.01);
r_size = hslider("r_size [unit:%]", 50, 0.5, 100, 0.01);
r_decay = hslider("r_decay [unit:%]", 60, 0, 110, 0.01);
r_absorb = hslider("r_absorb [unit:%]", 40, 0, 100, 0.01);
r_tilt = hslider("r_tilt", 0, -1, 1, 0.001);
r_speed = hslider("r_speed [unit:Hz]", 1, 0.1, 10, 0.001);
r_depth = hslider("r_depth", 2, 0, 20, 0.001);

// the export's inlined clamp: (v <= lo) ? lo : ((v >= hi) ? hi : v)
tclamp = g.clip;

// ---------------------------------------------------------------- grains
BUFMAX = 20 * 192000;           // compile-time bound of dim
dim = int(ma.SR * 20);          // Data g_bufferL(samplerate * 20)
hw = (+(1) : g.wrap(0, dim)) ~ _;   // h_g_write after its increment
wn = hw';                           // the slot poked this frame

box_muller(na, nb) = sqrt((-2) * log(u1)) * cos(u2)
with {
    u1 = tclamp(0.0001, 1, abs(na));
    u2 = nb * 3.1415926535897931;
};

get_window(p, shape) = select2(shape < 0.5, g.mix(spline, trap, (shape - 0.5) * 2), g.mix(perc, spline, shape * 2))
with {
    tri = 1 - abs((p * 2) - 1);
    spline = (3 * g.safepow(tri, 2)) - (2 * g.safepow(tri, 3));
    perc = g.safepow(tri, 4);
    trap = tclamp(0, 1, tri * 3);
};

// one voice: from its states of the previous frame (d: fed back) and the
// firing of this frame (set), its new states and what the audio part needs
voice(set, d, p_st, cr, skw, tmrd, durd, ptrd, crshd, skd, cntd) = environment {
    tmr_p = g.init(999999, tmrd);
    dur_p = g.init(100, durd);
    ptr_p = ptrd;
    crsh_p = g.init(1, crshd);
    tmr0 = select2(set, tmr_p, 0);
    dur = select2(set, dur_p, d);
    ptr0 = select2(set, ptr_p, p_st);
    crsh = select2(set, crsh_p, cr);
    sk = select2(set, skd, skw);
    cnt0 = select2(set, cntd, 0);
    active = tmr0 < dur;
    ptr = select2(active, ptr0, g.wrap(0, dim, ptr0 + g_pitch));
    cnt1 = cnt0 + 1;
    upd = active & (cnt1 >= crsh);
    cnt = select2(active, cnt0, select2(upd, cnt1, 0));
    tmr = select2(active, tmr0, tmr0 + 1);
    w_env = get_window(g.safediv(tmr0, dur), g_window);
    idxL = ptr;
    idxR = g.wrap(0, dim, ptr - sk);
};

// the scheduler and the 4 voices: 26 states (clock, next, then tmr, dur,
// ptr, crsh, sk, cnt per voice), outputs per voice: active, upd, idxL, idxR, w_env
ctrl(n0, n1, n2, n3a, n3b, n4a, n4b) = (body ~ si.bus(26)) : si.block(26), si.bus(20)
with {
    body(clockd, nextd,
         t1, du1, p1, c1, s1, k1, t2, du2, p2, c2, s2, k2,
         t3, du3, p3, c3, s3, k3, t4, du4, p4, c4, s4, k4) =
        clock, next,
        V1.tmr, V1.dur, V1.ptr, V1.crsh, V1.sk, V1.cnt,
        V2.tmr, V2.dur, V2.ptr, V2.crsh, V2.sk, V2.cnt,
        V3.tmr, V3.dur, V3.ptr, V3.crsh, V3.sk, V3.cnt,
        V4.tmr, V4.dur, V4.ptr, V4.crsh, V4.sk, V4.cnt,
        V1.active, V1.upd, V1.idxL, V1.idxR, V1.w_env,
        V2.active, V2.upd, V2.idxL, V2.idxR, V2.w_env,
        V3.active, V3.upd, V3.idxL, V3.idxR, V3.w_env,
        V4.active, V4.upd, V4.idxL, V4.idxR, V4.w_env
    with {
        next_p = g.init(1, nextd);
        clock1 = clockd + 1;
        fire = clock1 >= next_p;
        clock = select2(fire, clock1, 0);
        bp = g.safediv(ma.SR, select2(g_density < 0.001, g_density, 0.001));
        jt = 1 + (box_muller(n3a, n4a) * (g_std_density * 0.01));
        next = select2(fire, next_p, tclamp(40, int(ma.SR * 5), bp * jt));
        trial = fire & (((n0 * 0.5) + 0.5) < (g_prob * 0.01));
        free1 = g.init(999999, t1) >= g.init(100, du1);
        free2 = g.init(999999, t2) >= g.init(100, du2);
        free3 = g.init(999999, t3) >= g.init(100, du3);
        free4 = g.init(999999, t4) >= g.init(100, du4);
        v_idx = select2(free1, select2(free2, select2(free3, select2(free4, 0, 4), 3), 2), 1);
        go = trial & (v_idx > 0);
        gauss = box_muller(n3b, n4b);
        maxa = g_size + (gauss * g_std_size);
        d = select2(maxa < 1, maxa, 1) * (ma.SR * 0.001);
        ms = dim;
        v103 = ((g_pos * 0.01) * ms) + (((gauss * (g_std_pos * 0.01)) * ms) * 0.2);
        off = tclamp(10, (ms - d) - 100, v103);
        skw = (g.safepow(g_skew * 0.01, 3) * 1000) * (ma.SR * 0.001);
        cr = select2(((n1 * 0.5) + 0.5) < (g_crush * 0.01), 1, floor(abs(n2) * 80) + 2);
        p_st = g.wrap(0, ms, hw - off);
        V1 = voice(go & (v_idx == 1), d, p_st, cr, skw, t1, du1, p1, c1, s1, k1);
        V2 = voice(go & (v_idx == 2), d, p_st, cr, skw, t2, du2, p2, c2, s2, k2);
        V3 = voice(go & (v_idx == 3), d, p_st, cr, skw, t3, du3, p3, c3, s3, k3);
        V4 = voice(go & (v_idx == 4), d, p_st, cr, skw, t4, du4, p4, c4, s4, k4);
    };
};

// peek(buf, idx) after this frame's poke: the slot j holds x@((wn - j) mod dim)
peek(x, idx) = select2((j >= dim) | (j < 0), x @ max(0, min(BUFMAX, k)), 0)
with {
    j = int(floor(idx));
    kk = wn - j;
    k = select2(kk < 0, kk, kk + dim);
};

// the audio part of a voice: sample-and-hold of the buffer, windowed
vout(xL, xR, active, upd, idxL, idxR, w_env) = oL, oR
with {
    sL = (\(s).(select2(upd, s, peek(xL, idxL)))) ~ _;
    sR = (\(s).(select2(upd, s, peek(xR, idxR)))) ~ _;
    oL = select2(active, 0, sL * w_env);
    oR = select2(active, 0, sR * w_env);
};

is_clearing = clear > 0.5;
fb_g = select2(is_clearing, g_regen * 0.01, 0);
cond_in = (freeze > 0.5) | is_clearing;

// grains(in1, in2, the 20 voice signals): wet_granL, wet_granR
grains(in1, in2, a1, u1, l1, r1, w1, a2, u2, l2, r2, w2, a3, u3, l3, r3, w3, a4, u4, l4, r4, w4) =
    (loop ~ (_, _)) : !, !, _, _
with {
    loop(fbLd, fbRd) = g.fixdenorm(wet_granL), g.fixdenorm(wet_granR), wet_granL, wet_granR
    with {
        in_effL = select2(cond_in, g.dcblock(in1 + ma.tanh(fbLd * fb_g)), 0);
        in_effR = select2(cond_in, g.dcblock(in2 + ma.tanh(fbRd * fb_g)), 0);
        o1 = vout(in_effL, in_effR, a1, u1, l1, r1, w1);
        o2 = vout(in_effL, in_effR, a2, u2, l2, r2, w2);
        o3 = vout(in_effL, in_effR, a3, u3, l3, r3, w3);
        o4 = vout(in_effL, in_effR, a4, u4, l4, r4, w4);
        wet_granL = ((((o1 : _, !) + (o2 : _, !)) + (o3 : _, !)) + (o4 : _, !)) * 0.5;
        wet_granR = ((((o1 : !, _) + (o2 : !, _)) + (o3 : !, _)) + (o4 : !, _)) * 0.5;
    };
};

// ---------------------------------------------------------------- reverb
rs_size = (\(s).(g.fixdenorm(s + (1.0 / 2000) * ((r_size * 0.01) - s)))) ~ _;
rh_ph = (\(p).(g.wrap(0, 1, p + g.safediv(r_speed, ma.SR)))) ~ _;
rlfo = sin(rh_ph * 6.2831853071795862) * (r_depth * 5);
rt1 = tclamp(10, 14000, (1531 * rs_size) + rlfo);
rt2 = tclamp(10, 14000, (2237 * rs_size) - rlfo);
rt3 = tclamp(10, 14000, (3163 * rs_size) + rlfo);
rt4 = tclamp(10, 14000, (4453 * rs_size) - rlfo);

// allpass on a Delay of 2000 read (linear) at D before and after its write
rap(D, x) = g.rd_linear(2000, 2000, 0, v, D) + v * 0.6
with { v = (\(vd).(x - g.rd_linear_fb(2000, 2000, vd, D) * 0.6)) ~ _; };

lp1(a, x) = (\(h).(g.mix(x, h, a))) ~ _;

rfb = r_decay * 0.01;
rdamp = r_absorb * 0.01;

// the FDN: outputs rr1..rr4
fdn(r_diff_in) = (loop ~ si.bus(4)) : si.block(4), si.bus(4)
with {
    loop(w1d, w2d, w3d, w4d) = w(rh1), w(rh2), w(rh3), w(rh4), rr1, rr2, rr3, rr4
    with {
        rr1 = g.rd_linear_fb(15000, 15000, w1d, rt1);
        rr2 = g.rd_linear_fb(15000, 15000, w2d, rt2);
        rr3 = g.rd_linear_fb(15000, 15000, w3d, rt3);
        rr4 = g.rd_linear_fb(15000, 15000, w4d, rt4);
        rh1 = lp1(rdamp, (((rr1 + rr2) + rr3) + rr4) * 0.5);
        rh2 = lp1(rdamp, (((rr1 - rr2) + rr3) - rr4) * 0.5);
        rh3 = lp1(rdamp, (((rr1 + rr2) - rr3) - rr4) * 0.5);
        rh4 = lp1(rdamp, (((rr1 - rr2) - rr3) + rr4) * 0.5);
        w(rh) = g.fixdenorm(g.dcblock(r_diff_in + ma.tanh(rh * rfb)));
    };
};

tilt(rraw) = select2(r_tilt < 0, g.mix(rraw, rraw - rt_lp, r_tilt), g.mix(rraw, rt_lp, abs(r_tilt)))
with { rt_lp = lp1(0.1, rraw); };

reverb(r_in) = rresL, rresR
with {
    r_pre = g.rd_linear(9600, 9600, 1, r_in, 10 * (ma.SR * 0.001));
    r_diff_in = r_pre : rap(400 * rs_size) : rap(600 * rs_size);
    rr = fdn(r_diff_in);
    rr1 = rr : _, !, !, !;
    rr2 = rr : !, _, !, !;
    rr3 = rr : !, !, _, !;
    rr4 = rr : !, !, !, _;
    rresL = tilt((rr1 + rr3) * 0.5);
    rresR = tilt((rr2 + rr4) * 0.5);
};

// ---------------------------------------------------------------- output
dcout(x) = (x - x') : (+ ~ *(0.995));

particle(in1, in2, n0, n1, n2, n3a, n3b, n4a, n4b) = out1, out2
with {
    wg = (in1, in2, ctrl(n0, n1, n2, n3a, n3b, n4a, n4b)) : grains;
    wet_granL = wg : _, !;
    wet_granR = wg : !, _;
    rv = reverb((wet_granL + wet_granR) * 0.5);
    rresL = rv : _, !;
    rresR = rv : !, _;
    finalL = g.mix(g.mix(in1, wet_granL, g_mix * 0.01), rresL, r_mix * 0.01) * g.dbtoa(gainout);
    finalR = g.mix(g.mix(in2, wet_granR, g_mix * 0.01), rresR, r_mix * 0.01) * g.dbtoa(gainout);
    out1 = ma.tanh(dcout(finalL));
    out2 = ma.tanh(dcout(finalR));
};

process(in1, in2) = particle(in1, in2, g.noises(7, 0), g.noises(7, 1), g.noises(7, 2),
                             g.noises(7, 3), g.noises(7, 4), g.noises(7, 5), g.noises(7, 6));
// in1, in2, then noise site 0, 1, 2, site 3 (2 calls), site 4 (2 calls)
det = particle;
