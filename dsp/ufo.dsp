// UFO: multi-waveform LFO with curvature shaping and rampsmooth (gen~: gendsp/ufo.gendsp)
//
// A phase accumulator (frequency from in1, clipped to 0.0001..1000 Hz) reset
// by a rising edge of in2 above 0.5, free running or limited to `shotnumbers`
// cycles in one-shot mode (where the phase runs downward), wrapped,
// multiplied by `expc` (2: two cycles per period), raised to `exp1`,
// wrapped again, then read by one of six waveforms (`lfosel`): 0 cosine,
// 1 triangle, 2 saw, 3 square, 4 sample and hold of noise (new value when the
// phase crosses 0.5), 5 that S&H through a linear rampsmooth over one period.
// The output stage maps to 0..1, raises to `exp2`, back to -1..1, scales by
// `gain`, subtracts `offset` percent, clips to -1..1, then optionally
// inverts and maps to 0..1 (`unipolar`).
//
// in1: frequency in Hz (0.0001..1000)    in2: trigger (reset / restart in one-shot)
// out1: the LFO (bipolar, or unipolar)
//
// The gen~ params have no min/max (the export clamps them to [0, 1]); the
// ranges here are those of the demo patch (ufo.maxpat).

declare name "ufo";
declare author "Max Bruckert, after Dric and Maurizio Giri (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
u = library("ufo.lib");

lfosel = hslider("lfosel [style:menu{'cos':0;'triangle':1;'saw':2;'square':3;'random':4;'random smooth':5}]", 0, 0, 5, 1);
exp1 = hslider("exp1", 1, 0.1, 20, 0.01);
expc = hslider("expc", 1, 0, 4, 0.01);
exp2 = hslider("exp2", 1, 0.1, 20, 0.01);
oneshot = hslider("oneshot [style:menu{'free':0;'one-shot':1}]", 0, 0, 1, 1);
shotnumbers = hslider("shotnumbers", 1, 0, 128, 0.01);
gain = hslider("gain", 1, 0, 10, 0.01);
offset = hslider("offset [unit:%]", 0, -100, 100, 0.01);
invert = hslider("invert [style:menu{'off':0;'on':1}]", 0, 0, 1, 1);
unipolar = hslider("unipolar [style:menu{'off':0;'on':1}]", 0, 0, 1, 1);

lfo(nz, f, trig) = u.ufo(f, trig, lfosel, exp1, expc, exp2, oneshot, shotnumbers, gain, offset, invert, unipolar, nz);

process(f, trig) = lfo(g.noises(1, 0), f, trig);
// the port with its noise as an input, for scripts/test_gen.py: in1, in2, noise
det(f, trig, nz) = lfo(nz, f, trig);
