// HP_BUTTERWORTH: 24 dB/oct high-pass, two RBJ biquads (gen~: gendsp/hp_butterworth.gendsp)
//
// Utility of GEN-patches: a 4th-order Butterworth high-pass whose cutoff glides
// to `freq` with a one-pole of `smooth` ms; the biquad coefficients follow the
// glide at every sample.

declare name "hp_butterworth";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
bw = library("butterworth.lib");

freq = hslider("freq [unit:Hz]", 80, 10, 1000, 0.1);
smooth = hslider("smooth [unit:ms]", 100, 0, 1000, 1);

process = bw.hp(freq, smooth);
det = process;
