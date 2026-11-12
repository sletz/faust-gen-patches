{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "boxes": [
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        20.0,
                        281.0,
                        47.0
                    ],
                    "fontface": 0,
                    "fontsize": 36.0,
                    "text": "curvature-shaper"
                }
            },
            {
                "box": {
                    "id": "obj-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        92.0,
                        349.0,
                        24.0
                    ],
                    "fontface": 0,
                    "fontsize": 16.0,
                    "text": "Symmetric S-Curve & Exact Inverse Interpolator"
                }
            },
            {
                "box": {
                    "id": "obj-lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        398.0,
                        133.0,
                        58.0,
                        22.0
                    ],
                    "hidden": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-mode",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        37.0,
                        168.0,
                        171.0,
                        20.0
                    ],
                    "text": "0: Phasor~ Ramp  |  1: Manual"
                }
            },
            {
                "box": {
                    "id": "obj-mode",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        37.0,
                        190.0,
                        24.0,
                        24.0
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-mode-plus",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        37.0,
                        225.0,
                        29.5,
                        22.0
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "obj-phasor",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        82.0,
                        191.0,
                        62.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "phasor~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-manual-num",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        127.0,
                        225.0,
                        50.0,
                        22.0
                    ],
                    "format": 6,
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-sig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        127.0,
                        255.0,
                        31.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [
                        37.0,
                        290.0,
                        109.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "selector~ 2 1"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-shape",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        210.0,
                        199.0,
                        168.0,
                        33.0
                    ],
                    "linecount": 2,
                    "text": "Shape Presets (-1: Inv S-Curve, 0: Lin, +1: S-Curve)"
                }
            },
            {
                "box": {
                    "id": "obj-p-m1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        203.0,
                        240.0,
                        32.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "-1."
                }
            },
            {
                "box": {
                    "id": "obj-p-m05",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        243.0,
                        240.0,
                        35.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "-0.5"
                }
            },
            {
                "box": {
                    "id": "obj-p-0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        286.0,
                        240.0,
                        29.5,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "0."
                }
            },
            {
                "box": {
                    "id": "obj-p-05",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        240.0,
                        32.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "0.5"
                }
            },
            {
                "box": {
                    "id": "obj-p-1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        363.0,
                        240.0,
                        29.5,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "1."
                }
            },
            {
                "box": {
                    "id": "obj-shape-num",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        203.0,
                        275.0,
                        55.0,
                        22.0
                    ],
                    "format": 6,
                    "maximum": 1.0,
                    "minimum": -1.0,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-msg-shape",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        203.0,
                        320.0,
                        61.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "shape $1"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-a",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        398.0,
                        217.0,
                        50.0,
                        20.0
                    ],
                    "text": "Start a"
                }
            },
            {
                "box": {
                    "id": "obj-a-num",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        398.0,
                        240.0,
                        55.0,
                        22.0
                    ],
                    "format": 6,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-msg-a",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        398.0,
                        320.0,
                        37.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "a $1"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-b",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        455.0,
                        217.0,
                        50.0,
                        20.0
                    ],
                    "text": "End b"
                }
            },
            {
                "box": {
                    "id": "obj-b-num",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        455.0,
                        240.0,
                        55.0,
                        22.0
                    ],
                    "format": 6,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-msg-b",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        455.0,
                        320.0,
                        37.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "b $1"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-steep",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        512.0,
                        217.0,
                        70.0,
                        20.0
                    ],
                    "text": "Steepness"
                }
            },
            {
                "box": {
                    "id": "obj-steep-num",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        512.0,
                        240.0,
                        55.0,
                        22.0
                    ],
                    "format": 6,
                    "maximum": 10.0,
                    "minimum": 0.5,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-msg-steep",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        512.0,
                        320.0,
                        80.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "steepness $1"
                }
            },
            {
                "box": {
                    "id": "obj-init-a",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        398.0,
                        185.0,
                        29.5,
                        22.0
                    ],
                    "hidden": 1,
                    "outlettype": [
                        ""
                    ],
                    "text": "0."
                }
            },
            {
                "box": {
                    "id": "obj-init-b",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        455.0,
                        185.0,
                        29.5,
                        22.0
                    ],
                    "hidden": 1,
                    "outlettype": [
                        ""
                    ],
                    "text": "1."
                }
            },
            {
                "box": {
                    "id": "obj-init-steep",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        512.0,
                        185.0,
                        29.5,
                        22.0
                    ],
                    "hidden": 1,
                    "outlettype": [
                        ""
                    ],
                    "text": "4."
                }
            },
            {
                "box": {
                    "id": "obj-gen",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "patching_rect": [
                        37.0,
                        380.0,
                        269.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "sourcecode": "// curvature-shaper: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/curvature-shaper.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// CURVATURE-SHAPER: symmetric S-curve and exact inverse interpolator\n// (gen~: gendsp/curvature-shaper.gendsp)\n//\n// Interpolates between a and b along a symmetric dual-power curve of the\n// phase in1, controlled by the bipolar `shape`:\n//   shape > 0: S-curve (ease-in on [0, 0.5], point-symmetric ease-out on [0.5, 1])\n//   shape = 0: linear\n//   shape < 0: the exact functional inverse of the S-curve of -shape\n// with exponent p = 2^(clamp(shape + in2, -1, 1) * steepness).\n//\n// in1: phase / ramp (0..1)     in2: additive signal-rate modulation of shape\n// out1: mix(a, b, curved)      out2: the curve, 0..1\n//\n// Parameters: a (start value, def 0), b (end value, def 1), shape (-1..1),\n// steepness (0.5..10, def 4), clamp_in (0/1, def 1: clamp in1 to [0, 1]).\n// a and b are declared without min/max in the gendsp: the export clamps them\n// to [0, 1] (setparameter), gen~ in Max does not; the range here is wider.\n\ndeclare name \"curvature-shaper\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\na = hslider(\"a\", 0, -10, 10, 0.001);\nb = hslider(\"b\", 1, -10, 10, 0.001);\nshape = hslider(\"shape\", 0, -1, 1, 0.001);\nsteepness = hslider(\"steepness\", 4, 0.5, 10, 0.01);\nclamp_in = hslider(\"clamp_in\", 1, 0, 1, 1);\n\nshaper(in1, in2) = g.mix(a, b, curved), curved\nwith {\n    x = select2(clamp_in >= 0.5, in1, g.clamp(0, 1, in1));\n    s_eff = g.clamp(-1, 1, shape + in2);\n    p = g.safepow(2, s_eff * steepness);\n    // the four branches; the pow bases are guarded where the branch is not taken\n    lo = 0.5 * g.safepow(2 * min(x, 0.5), p);\n    hi = 1 - 0.5 * g.safepow(2 * (1 - max(x, 0.5)), p);\n    curved = select2(x <= 0, select2(x >= 1, select2(x < 0.5, hi, lo), 1), 0);\n};\n\nprocess = shaper;\ndet = process;\n",
                    "sourcecode_size": 13884,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_curvature_shaper"
                }
            },
            {
                "box": {
                    "id": "obj-num-out",
                    "maxclass": "number~",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        67.0,
                        418.0,
                        85.0,
                        22.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "mode": 2,
                    "outlettype": [
                        "signal",
                        "float"
                    ],
                    "sig": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-lbl-sc1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        37.0,
                        455.0,
                        200.0,
                        20.0
                    ],
                    "text": "Out 1: Interpolated (a to b)"
                }
            },
            {
                "box": {
                    "id": "obj-scope-interp",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        37.0,
                        480.0,
                        118.0,
                        92.0
                    ],
                    "bgcolor": [
                        0.06,
                        0.08,
                        0.11,
                        1.0
                    ],
                    "bufsize": 256,
                    "calccount": 16,
                    "fgcolor": [
                        0.3,
                        0.9,
                        0.5,
                        1.0
                    ],
                    "gridcolor": [
                        0.2,
                        0.25,
                        0.3,
                        0.35
                    ],
                    "range": [
                        -0.1,
                        1.1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl-sc2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        287.0,
                        455.0,
                        240.0,
                        20.0
                    ],
                    "text": "Out 2: Normalized Transfer Curve (0..1)"
                }
            },
            {
                "box": {
                    "id": "obj-scope-norm",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        287.0,
                        480.0,
                        118.0,
                        92.0
                    ],
                    "bgcolor": [
                        0.06,
                        0.08,
                        0.11,
                        1.0
                    ],
                    "bufsize": 256,
                    "calccount": 16,
                    "fgcolor": [
                        0.22,
                        0.74,
                        0.97,
                        1.0
                    ],
                    "gridcolor": [
                        0.2,
                        0.25,
                        0.3,
                        0.35
                    ],
                    "range": [
                        -0.1,
                        1.1
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        429.0,
                        503.5,
                        45.0,
                        45.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-lbl-dac",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        419.0,
                        558.5,
                        121.0,
                        20.0
                    ],
                    "text": "Turn Audio ON to run"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        237.0,
                        410.0,
                        60,
                        22
                    ],
                    "text": "loadbang",
                    "outlettype": [
                        "bang"
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        37.0,
                        332.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen curvature-shaper replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/curvature-shaper.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/curvature-shaper.maxpat.",
                    "textcolor": [
                        0.6,
                        0.1,
                        0.1,
                        1.0
                    ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "obj-a-num",
                        0
                    ],
                    "destination": [
                        "obj-msg-a",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-b-num",
                        0
                    ],
                    "destination": [
                        "obj-msg-b",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        0
                    ],
                    "destination": [
                        "obj-num-out",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        0
                    ],
                    "destination": [
                        "obj-scope-interp",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        1
                    ],
                    "destination": [
                        "obj-scope-norm",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-init-a",
                        0
                    ],
                    "destination": [
                        "obj-a-num",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-init-b",
                        0
                    ],
                    "destination": [
                        "obj-b-num",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-init-steep",
                        0
                    ],
                    "destination": [
                        "obj-steep-num",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-lb",
                        0
                    ],
                    "destination": [
                        "obj-init-a",
                        0
                    ],
                    "hidden": 1,
                    "order": 2
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-lb",
                        0
                    ],
                    "destination": [
                        "obj-init-b",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-lb",
                        0
                    ],
                    "destination": [
                        "obj-init-steep",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-lb",
                        0
                    ],
                    "destination": [
                        "obj-p-05",
                        0
                    ],
                    "hidden": 1,
                    "order": 3
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-manual-num",
                        0
                    ],
                    "destination": [
                        "obj-sig",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-mode",
                        0
                    ],
                    "destination": [
                        "obj-mode-plus",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-mode-plus",
                        0
                    ],
                    "destination": [
                        "obj-sel",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-msg-a",
                        0
                    ],
                    "destination": [
                        "obj-gen",
                        0
                    ],
                    "midpoints": [
                        407.5,
                        367.5,
                        46.5,
                        367.5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-msg-b",
                        0
                    ],
                    "destination": [
                        "obj-gen",
                        0
                    ],
                    "midpoints": [
                        464.5,
                        367.5,
                        46.5,
                        367.5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-msg-shape",
                        0
                    ],
                    "destination": [
                        "obj-gen",
                        0
                    ],
                    "midpoints": [
                        212.5,
                        367.5,
                        46.5,
                        367.5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-msg-steep",
                        0
                    ],
                    "destination": [
                        "obj-gen",
                        0
                    ],
                    "midpoints": [
                        521.5,
                        367.5,
                        46.5,
                        367.5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-0",
                        0
                    ],
                    "destination": [
                        "obj-shape-num",
                        0
                    ],
                    "midpoints": [
                        295.5,
                        268.5,
                        212.5,
                        268.5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-05",
                        0
                    ],
                    "destination": [
                        "obj-shape-num",
                        0
                    ],
                    "midpoints": [
                        332.5,
                        268.5,
                        212.5,
                        268.5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-1",
                        0
                    ],
                    "destination": [
                        "obj-shape-num",
                        0
                    ],
                    "midpoints": [
                        372.5,
                        268.5,
                        212.5,
                        268.5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-m05",
                        0
                    ],
                    "destination": [
                        "obj-shape-num",
                        0
                    ],
                    "midpoints": [
                        252.5,
                        268.5,
                        212.5,
                        268.5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-p-m1",
                        0
                    ],
                    "destination": [
                        "obj-shape-num",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-phasor",
                        0
                    ],
                    "destination": [
                        "obj-sel",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sel",
                        0
                    ],
                    "destination": [
                        "obj-gen",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-shape-num",
                        0
                    ],
                    "destination": [
                        "obj-msg-shape",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sig",
                        0
                    ],
                    "destination": [
                        "obj-sel",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-steep-num",
                        0
                    ],
                    "destination": [
                        "obj-msg-steep",
                        0
                    ]
                }
            }
        ],
        "autosave": 0,
        "openrect": [
            50.0,
            50.0,
            600.0,
            600.0
        ],
        "openrectmode": 0
    }
}