// LP_BUTTERWORTH: 24 dB/oct low-pass, two RBJ biquads (gen~: gendsp/lp_butterworth.gendsp)
//
// Utility of GEN-patches: a 4th-order Butterworth low-pass whose cutoff glides
// to `freq` with a one-pole of `smooth` ms; the biquad coefficients follow the
// glide at every sample.

declare name "lp_butterworth";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
bw = library("butterworth.lib");

freq = hslider("freq [unit:Hz]", 80, 10, 20000, 0.1);
smooth = hslider("smooth [unit:ms]", 100, 0, 1000, 1);

process = bw.lp(freq, smooth);
det = process;
