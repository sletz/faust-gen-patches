// UFO-CORE-SIMPLE: the phase core of the UFO LFO (gen~: gendsp/ufo-core-simple.gendsp)
//
// The phase generator of ufo / ufo-core alone: an accumulator of f/SR (in1
// clipped to 0.0001..1000 Hz) reset by a rising edge of in6 above 0.5, free
// running, or in one-shot mode clipped to `shotnumbers` cycles and negated
// (the phase runs downward), wrapped to 0..1, multiplied by `expc`, raised
// to `exp1`, then mapped to x*2-1. Unlike ufo it is not wrapped after the
// pow: with expc > 1 the output exceeds 1 (up to expc^exp1*2-1).
//
// in1: frequency in Hz (0.0001..1000)   in2: + exp1 ("exponant")
// in3: + expc ("exponant cycle")   in4: + oneshot   in5: + shotnumbers
// in6: trigger (reset / restart in one-shot)
// out1: the shaped phase, -1..1
//
// The gen~ params have no min/max (the export clamps them to [0, 1]); the
// ranges here are those of the demo patch (ufo.maxpat).

declare name "ufo-core-simple";
declare author "Max Bruckert, after Dric and Maurizio Giri (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
u = library("ufo.lib");

exp1 = hslider("exp1", 1, 0.1, 20, 0.01);
expc = hslider("expc", 1, 0, 4, 0.01);
oneshot = hslider("oneshot [style:menu{'free':0;'one-shot':1}]", 0, 0, 1, 1);
shotnumbers = hslider("shotnumbers", 1, 0, 128, 0.01);

process(f, i2, i3, i4, i5, trig) = u.core(f, trig, exp1 + i2, i3 + expc, i4 + oneshot, i5 + shotnumbers);
// no noise: det is the process
det = process;
