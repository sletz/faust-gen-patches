// cswitch-tremolo as the demo patch runs it: `mc.gen~ @chans 2 @gen cswitch-tremolo`,
// two instances, each fed one channel of the MC input on its in1 (in2 left at 0),
// each outlet an MC signal of the two instances' output.
//
// mc.faustgen~ is multichannel the other way (one instance, its inputs the
// channels of the MC input, its outputs the channels of the MC output), so this
// program holds the two instances, with independent noises, and orders its 8
// outputs out1 of both, out2 of both, out3 of both, out4 of both; the patch
// splits them with mc.separate~ 2 2 2 2.

declare name "cswitch-tremolo (2 instances)";
declare license "MIT";

m = library("../dsp/cswitch-tremolo.dsp");
g = library("../dsp/genops.lib");
ro = library("routes.lib");

inst(c, x) = m.chopper(x, 0, g.noises(6, 3 * c), g.noises(6, 3 * c + 1), g.noises(6, 3 * c + 2));

process = par(c, 2, inst(c)) : ro.interleave(4, 2);
