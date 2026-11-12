// CURVATURE-SHAPER: symmetric S-curve and exact inverse interpolator
// (gen~: gendsp/curvature-shaper.gendsp)
//
// Interpolates between a and b along a symmetric dual-power curve of the
// phase in1, controlled by the bipolar `shape`:
//   shape > 0: S-curve (ease-in on [0, 0.5], point-symmetric ease-out on [0.5, 1])
//   shape = 0: linear
//   shape < 0: the exact functional inverse of the S-curve of -shape
// with exponent p = 2^(clamp(shape + in2, -1, 1) * steepness).
//
// in1: phase / ramp (0..1)     in2: additive signal-rate modulation of shape
// out1: mix(a, b, curved)      out2: the curve, 0..1
//
// Parameters: a (start value, def 0), b (end value, def 1), shape (-1..1),
// steepness (0.5..10, def 4), clamp_in (0/1, def 1: clamp in1 to [0, 1]).
// a and b are declared without min/max in the gendsp: the export clamps them
// to [0, 1] (setparameter), gen~ in Max does not; the range here is wider.

declare name "curvature-shaper";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");

a = hslider("a", 0, -10, 10, 0.001);
b = hslider("b", 1, -10, 10, 0.001);
shape = hslider("shape", 0, -1, 1, 0.001);
steepness = hslider("steepness", 4, 0.5, 10, 0.01);
clamp_in = hslider("clamp_in", 1, 0, 1, 1);

shaper(in1, in2) = g.mix(a, b, curved), curved
with {
    x = select2(clamp_in >= 0.5, in1, g.clamp(0, 1, in1));
    s_eff = g.clamp(-1, 1, shape + in2);
    p = g.safepow(2, s_eff * steepness);
    // the four branches; the pow bases are guarded where the branch is not taken
    lo = 0.5 * g.safepow(2 * min(x, 0.5), p);
    hi = 1 - 0.5 * g.safepow(2 * (1 - max(x, 0.5)), p);
    curved = select2(x <= 0, select2(x >= 1, select2(x < 0.5, hi, lo), 1), 0);
};

process = shaper;
det = process;
