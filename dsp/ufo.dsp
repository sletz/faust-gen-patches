// UFO: multi-waveform LFO with curvature shaping and rampsmooth (gen~: gendsp/ufo.gendsp)
//
// Original LFO by Dric, rampsmooth codebox by Maurizio Giri, modified by Max
// Bruckert; one codebox in the gendsp.
//
// A phase accumulator (frequency from in1, clipped to 0.0001..1000 Hz) reset
// to 0 by a rising edge of in2 through 0.5, free running or limited to
// `shotnumbers` cycles in one-shot mode, wrapped, multiplied by `expc`
// (2: two cycles per period), raised to `exp1`, wrapped again, then read by
// one of six waveforms (`lfosel`): 0 cosine, 1 triangle, 2 saw, 3 square,
// 4 sample and hold of noise (a new value when the phase crosses 0.5 upward),
// 5 that S&H through a linear rampsmooth over one period (SR/fc samples).
// The output stage maps to 0..1 (clipped), raises to `exp2`, back to -1..1,
// scales by `gain`, subtracts `offset` percent, clips to -1..1, then
// optionally inverts and maps to 0..1 (`unipolar`).
//
// in1: frequency in Hz (0.0001..1000)    in2: trigger (reset / restart in one-shot)
// out1: the LFO (bipolar, or unipolar)
//
// Parameters: lfosel (0..5, def 0), exp1 (0.05..20, def 1), expc (0..8,
// def 1), exp2 (0.05..20, def 1), oneshot (0/1), shotnumbers (0..128, def 1),
// gain (0..10, def 1), offset (-100..100 %, def 0), invert (0/1),
// unipolar (0/1). The switches and lfosel are compared to x.5 thresholds.
//
// Quirks kept from gen~:
// - the one-shot phase is wrap(0 - clamp(acc, 0, shotnumbers)): it runs from
//   1 down to 0, `shotnumbers` times, then holds;
// - the accumulator is never wrapped: in single precision the period is
//   1 % long after 10 s at 3.7 Hz;
// - rampsmooth's test `delta(sh) == 0 && delta(rampup) == 0 &&
//   delta(rampdown) == 0` short-circuits, so the second and third delta update
//   their history only on some frames, and a frequency change restarts the
//   ramp twice.

declare name "ufo";
declare author "Max Bruckert, after Dric and Maurizio Giri (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
si = library("signals.lib");
g = library("genops.lib");

lfosel = hslider("lfosel [style:menu{'cos':0;'triangle':1;'saw':2;'square':3;'random':4;'random smooth':5}]", 0, 0, 5, 1);
exp1 = hslider("exp1", 1, 0.05, 20, 0.01);
expc = hslider("expc", 1, 0, 8, 0.01);
exp2 = hslider("exp2", 1, 0.05, 20, 0.01);
oneshot = hslider("oneshot [style:menu{'free':0;'one-shot':1}]", 0, 0, 1, 1);
shotnumbers = hslider("shotnumbers", 1, 0, 128, 0.01);
gain = hslider("gain", 1, 0, 10, 0.01);
offset = hslider("offset [unit:%]", 0, -100, 100, 0.01);
invert = hslider("invert [style:menu{'off':0;'on':1}]", 0, 0, 1, 1);
unipolar = hslider("unipolar [style:menu{'off':0;'on':1}]", 0, 0, 1, 1);

// genlib's clamp as the export writes it inline: x <= lo ? lo : (x >= hi ? hi : x)
clip = g.clip;

// the sample rate as a signal Faust cannot fold: Faust rewrites x/SR as
// x*(1/SR), one rounding off gen's fc / samplerate for some frequencies;
// dividing by this recursive copy keeps a true division.
sr = max(ma.SR) ~ _;

TWOPI = 6.2831853071795862;

// rampsmooth: a linear ramp of `ramp` samples (rampup = rampdown) toward each
// new value of insig. delta(rampup) only updates its history (hru) on frames
// where insig did not move, delta(rampdown) (hrd) only where neither did.
rampsmooth(insig, ru, rd) = loop ~ si.bus(6) : (_, !, !, !, !, !)
with {
    loop(last, dir, sc, inc, hru, hrd) = out, dir2, sc2, inc2, hru2, hrd2
    with {
        c1 = (insig - insig') == 0;
        c2 = c1 & ((ru - hru) == 0);
        c3 = c2 & ((rd - hrd) == 0);
        hru2 = select2(c1, hru, ru);
        hrd2 = select2(c2, hrd, rd);
        // nothing moved: go on with the ramp, or land on insig
        adv = sc < select2(dir > 0, rd, ru);
        outA = select2(adv, insig, last + inc);
        scA = select2(adv, sc, sc + 1);
        // something moved: a new ramp from the last output
        dv = insig - last;
        up = dv > 0;
        incB = select2(up, g.safediv(dv, rd), g.safediv(dv, ru));
        out = select2(c3, last + incB, outA);
        sc2 = select2(c3, 1, scA);
        dir2 = select2(c3, select2(up, -1, 1), dir);
        inc2 = select2(c3, incB, inc);
    };
};

// nz: gen's noise(), read on the frames where the phase crosses 0.5
ufo(nz, in1, in2) = out1
with {
    fc = clip(0.0001, 1000, in1);
    trig_high = in2 > 0.5;
    is_trig = trig_high & (trig_high' == 0);
    acc = (\(h).(select2(is_trig, h + g.safediv(fc, sr), 0))) ~ _;
    raw_acc = select2(oneshot > 0.5, acc, 0 - clip(0, shotnumbers, acc));
    w_base = g.wrap(0, 1, raw_acc);
    ph = g.wrap(0, 1, g.safepow(w_base * expc, exp1));

    cos_out = cos(ph * TWOPI);
    tri_out = select2(ph < 0.5, 3 - ph * 4, ph * 4 - 1);
    saw_out = ph * 2 - 1;
    sq_out = select2(ph < 0.5, -1, 1);
    is_sh_cross = (ph >= 0.5) & (ph' < 0.5);
    sh_out = (\(h).(select2(is_sh_cross, h, nz))) ~ _;
    ramp_samps = max(1, g.safediv(ma.SR, max(fc, 0.0001)));
    rs_out = rampsmooth(sh_out, ramp_samps, ramp_samps);

    raw_lfo = select2(lfosel < 0.5,
                select2(lfosel < 1.5,
                  select2(lfosel < 2.5,
                    select2(lfosel < 3.5,
                      select2(lfosel < 4.5, rs_out, sh_out),
                      sq_out),
                    saw_out),
                  tri_out),
                cos_out);
    u_norm = clip(0, 1, raw_lfo * 0.5 + 0.5);
    b_curv = g.safepow(u_norm, exp2) * 2 - 1;
    b_clipped = clip(-1, 1, (b_curv * gain) - (offset * 0.01));
    b_inv = select2(invert > 0.5, b_clipped, 0 - b_clipped);
    out1 = select2(unipolar > 0.5, b_inv, b_inv * 0.5 + 0.5);
};

process(f, trig) = ufo(g.noises(1, 0), f, trig);
// the port with its noise as an input, for scripts/test_gen.py: in1, in2, noise
det(f, trig, nz) = ufo(nz, f, trig);
