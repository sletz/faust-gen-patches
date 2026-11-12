// ZDF-DIODE-LADDER: stereo zero-delay-feedback TB-303 style diode ladder
// (gen~: gendsp/zdf-diode-ladder.gendsp)
//
// A 4-pole TPT low-pass ladder per channel (stage gains G, 0.9 G, 0.8 G,
// 0.7 G), its feedback solved by a linear predictor and shaped by a tanh, a
// tanh input drive, and a ~40 Hz one-pole high-pass on the output. A stereo
// envelope follower (1.5 ms attack, 55 ms release) sweeps the cutoff by up to
// +-5 octaves (env_mod) and adds an accent (cutoff punch, resonance, drive).
//
// in1, in2: audio L, R      out1, out2: filtered L, R
//
// cutoff (Hz), resonance (0..1.2, k = 4.2 x), drive (%), env_mod (-100..100 %),
// accent (%).
//
// As in gen: the predictor is not the exact ZDF solution (y4 = G0G1G2G3 u
// + sum of (1 - Gi)-weighted states): S_total uses the raw states and adds
// G0G1G2G3*in_sat, so the feedback is an approximation; the accent also
// raises the input drive statically (accent*0.03), whatever the envelope.

declare name "zdf-diode-ladder";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
gn = library("genops.lib");

cutoff = hslider("cutoff [unit:Hz]", 1200, 20, 20000, 0.01);
resonance = hslider("resonance", 0.75, 0, 1.2, 0.001);
drive = hslider("drive [unit:%]", 20, 0, 100, 0.01);
env_mod = hslider("env_mod [unit:%]", 0, -100, 100, 0.01);
accent = hslider("accent [unit:%]", 0, 0, 100, 0.01);

// x / SR as genlib divides (safediv(x, sr), sr != 0). Faust's normalizer
// turns a division by the constant SR into a product by 1/SR, which is 1 ulp
// off for about a quarter of the cutoffs; with k up to 4.9 the ladder
// amplified that ulp of G to -180 dB transients. Dividing by
// max(SR, x*1e-300), which is SR for any cutoff, keeps a true division.
divsr = gn.divsr;
// an identity the normalizer does not see through (finite x): it keeps gen's
// evaluation order where the normalizer would factor or reassociate
// (x*a + x*b -> x*(a+b), constants folded across products, ns1 = 2 v0 + s1).
// Without them the ladder, near self-oscillation, amplified those last-bit
// differences to -180 dB transients; with them the default setting is
// bit-exact and the others agree to -245 dB or better.
keep = gn.keep;

// one channel: states s1..s4, h_in (the last y4), h_out (the last output)
diode_ladder(g0, g1, g2, g3, k, drive_gain, accent_amt, in_sig) =
    (\(s1, s2, s3, s4, h_in, h_out).(step(s1, s2, s3, s4, h_in, h_out))) ~ (_, _, _, _, _, _)
    : (!, !, !, !, !, _)
with {
    step(s1, s2, s3, s4, h_in, h_out) = ns1, ns2, ns3, ns4, y4, out_hpf
    with {
        in_sat = ma.tanh(in_sig * drive_gain);
        S_total = g3 * keep(s3 + g2 * keep(s2 + g1 * keep(s1 + g0 * in_sat)));
        denom = 1 + k * keep(keep(keep(g0 * g1) * g2) * g3);
        u = gn.safediv(in_sat - k * keep(s4 + S_total), denom);
        u_sat = ma.tanh(u * (1 + accent_amt * 0.02));
        v0 = keep((u_sat - s1) * g0); y1 = keep(v0 + s1); ns1 = y1 + v0;
        v1 = keep((y1 - s2) * g1); y2 = keep(v1 + s2); ns2 = y2 + v1;
        v2 = keep((y2 - s3) * g2); y3 = keep(v2 + s3); ns3 = y3 + v2;
        v3 = keep((y3 - s4) * g3); y4 = keep(v3 + s4); ns4 = y4 + v3;
        out_hpf = keep(y4 - h_in) + 0.995 * h_out;
    };
};

ladder(in1, in2) = gn.fixdenorm(in1 : diode_ladder(g0, g1, g2, g3, k, drive_gain, accent)),
                   gn.fixdenorm(in2 : diode_ladder(g0, g1, g2, g3, k, drive_gain, accent))
with {
    env_in = max(abs(in1), abs(in2));
    atk_c = 1 - exp(gn.safediv(-1, 0.0015 * ma.SR));
    rel_c = 1 - exp(gn.safediv(-1, 0.055 * ma.SR));
    h_env = (\(e).(e + select2(env_in > e, rel_c, atk_c) * (env_in - e))) ~ _;
    env_norm = gn.clamp(0, 1, gn.safepow(h_env * 2, 0.8));
    acc_dyn = keep((accent * 0.01) * env_norm);
    // keep the two products apart: the normalizer would factor env_norm out
    mod_oct = keep(((env_mod * 0.01) * 5) * env_norm) + acc_dyn * 1.2;
    mod_cutoff = gn.clamp(20, 20000, cutoff * gn.safepow(2, mod_oct));
    norm_f = divsr(mod_cutoff) * 3.1415926535897931;
    g = tan(gn.clamp(0.0001, 1.5, norm_f));
    G = gn.safediv(g, 1 + g);
    g0 = G;
    g1 = keep(G * 0.9);
    g2 = keep(G * 0.8);
    g3 = keep(G * 0.7);
    drive_gain = (1 + drive * 0.08) + accent * 0.03;
    k = gn.clamp(0, 4.9, (resonance + acc_dyn * 0.22) * 4.2);
};

process = ladder;
// no noise: det is the same program
det = ladder;
