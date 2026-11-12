// UFO-CORE: the UFO LFO flattened for RNBO, every parameter with a signal inlet
// (gen~: gendsp/ufo-core.gendsp)
//
// ufo.gendsp without its nested gen (RNBO cannot nest gen abstractions), and
// with inlets 2..11 summed with the parameters (in + param), so that each
// can be modulated at audio rate; with those inlets at zero it computes
// exactly what ufo does (see ufo.dsp, ufo.lib).
//
// in1: frequency in Hz (0.0001..1000)   in2: + lfosel   in3: + exp1
// in4: + expc   in5: + exp2   in6: + oneshot   in7: + shotnumbers   in8: + gain
// in9: + offset   in10: + invert   in11: + unipolar
// in12: trigger (reset / restart in one-shot)
// out1: the LFO ("bipolar", or unipolar)
//
// The gen~ params have no min/max (the export clamps them to [0, 1]); the
// ranges here are those of the demo patch (ufo.maxpat).

declare name "ufo-core";
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

lfo(nz, f, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, trig) =
    u.ufo(f, trig, i2 + lfosel, exp1 + i3, i4 + expc, i5 + exp2, i6 + oneshot, i7 + shotnumbers,
          i8 + gain, i9 + offset, i10 + invert, i11 + unipolar, nz);

process = lfo(g.noises(1, 0));
// the port with its noise as an input, for scripts/test_gen.py: in1..in12, noise
det(f, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, trig, nz) = lfo(nz, f, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, trig);
