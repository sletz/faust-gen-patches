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
        "rect": [
            120.0,
            150.0,
            743.0,
            703.0
        ],
        "default_fontname": "Lato",
        "boxes": [
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        44.0,
                        412.0,
                        53.0,
                        21.0
                    ],
                    "fontface": 1,
                    "fontname": "Lato",
                    "fontsize": 12.0,
                    "text": "Audio in"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        158.5,
                        412.0,
                        58.0,
                        21.0
                    ],
                    "fontface": 1,
                    "fontname": "Lato",
                    "fontsize": 12.0,
                    "text": "Exciter in"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        15.0,
                        342.0,
                        40.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 30.0,
                    "text": "Rings (Modal Resonator)"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        58.0,
                        559.0,
                        36.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "linecount": 2,
                    "text": "Physical modeling modal resonator based on Mutable Instruments Rings (24 modes ZDF SVF).\nVibrating strings, bars, chimes & plates with internal strum exciter and stereo spatialization."
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        32.0,
                        120.0,
                        35.0,
                        23.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        32.0,
                        150.0,
                        230.0,
                        85.0
                    ],
                    "clipheight": 84.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u251008633",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            }
                        ]
                    },
                    "mode": "basic",
                    "outlettype": [
                        "signal",
                        "signal",
                        "signal",
                        "",
                        "dictionary"
                    ],
                    "parameter_enable": 0,
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        395.0,
                        121.0,
                        20.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 Strum Exciter \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        280.0,
                        479.0,
                        24.0,
                        24.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        280.0,
                        418.0,
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
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        280.0,
                        448.0,
                        71.0,
                        23.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "text": "metro 2000"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        310.0,
                        420.0,
                        75.0,
                        19.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 11.0,
                    "text": "Auto Pluck"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 6,
                    "patching_rect": [
                        32.0,
                        435.0,
                        124.5,
                        23.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "varname": "faust_rings",
                    "sourcecode": "// rings: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/rings.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// RINGS: 24-mode modal resonator after Mutable Instruments Rings\n// (gen~: gendsp/rings.gendsp)\n//\n// An exciter (the mean of the inputs through a tanh drive, plus, on a strum,\n// a 2 ms raised-cosine hammer pulse and a decaying noise burst, scaled by\n// `internal_exciter`) goes through a one-pole low-pass (42 Hz .. 18 kHz from\n// `brightness`), then into 24 parallel trapezoidal (ZDF) state-variable\n// band-passes. Mode k is tuned to (k+1)*f0 * (1 + k*stiff), the stiffness\n// taken from `structure` (subharmonic below 0.25, harmonic at 0.25..0.3,\n// bar and bell up to 0.9, plate and gong above), with a Q of 500..1.6e6 from\n// `damping` lowered from mode to mode by a loss from `brightness` and\n// `structure`, and a gain of 0.5 + 0.5 cos(2 pi k position) (pluck position\n// comb). The even-indexed modes (k = 0, 2, ...) are summed to the left, the\n// odd-indexed to the right, cross-mixed by `stereo_spread`, DC-blocked,\n// soft-limited (tanh), raised by `gain` and mixed with the dry inputs.\n//\n// in1, in2: audio L, R (excitation)    in3: strum trigger (a rise above 0.1)\n// out1, out2: processed L, R    out3: the filtered exciter    out4: the\n// strum envelope (1 on a strum, x0.995 per sample)\n//\n// Parameters: pitch (12..108, MIDI, default 48), structure (0..1, 0.25),\n// brightness (0..1, 0.6), damping (0..1, 0.6), position (0..1, 0.25),\n// stereo_spread (0..100 %, 80), internal_exciter (0..100 %, 80), drive\n// (0..100 %, 20), gain (-24..12 dB, 0), mix (0..100 %, 100), strum (0..1, a\n// rise above 0 strums).\n//\n// As in gen:\n// - the export drops the GenExpr's per-mode decay of the stiffness\n//   (`cur_stiff *= 0.93` or `0.98` in the loop is absent from the exported\n//   C++): the stretch grows by the same `stiff` at every mode, so the\n//   partials spread linearly (1 + k*stiff) instead of converging as in\n//   Rings; a stiffness of up to 2 (structure 1) puts most modes at the\n//   0.48 clamp;\n// - the modes are state-variable filters with no Rings-like normalization:\n//   the level grows with the Q, and a long `damping` near 1 rings for\n//   minutes (Q up to 1.6e6 on the fundamental);\n// - the header's \"odd modes left, even modes right\" counts from 1: mode\n//   index 0 (the fundamental) goes left;\n// - a strum during the hammer pulse restarts it; the noise burst decays from\n//   1 by x0.985 per sample, from the first frame of the strum.\n//\n// Noise sites (export order): 0 the pluck noise (one call per frame).\n\ndeclare name \"rings\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nsi = library(\"signals.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\npitch = hslider(\"pitch\", 48, 12, 108, 0.01);\nstructure = hslider(\"structure\", 0.25, 0, 1, 0.001);\nbrightness = hslider(\"brightness\", 0.6, 0, 1, 0.001);\ndamping = hslider(\"damping\", 0.6, 0, 1, 0.001);\nposition = hslider(\"position\", 0.25, 0, 1, 0.001);\nstereo_spread = hslider(\"stereo_spread [unit:%]\", 80, 0, 100, 0.01);\ninternal_exciter = hslider(\"internal_exciter [unit:%]\", 80, 0, 100, 0.01);\ndrive = hslider(\"drive [unit:%]\", 20, 0, 100, 0.01);\ngain = hslider(\"gain [unit:dB]\", 0, -24, 12, 0.01);\nmix_p = hslider(\"mix [unit:%]\", 100, 0, 100, 0.01);\nstrum = hslider(\"strum\", 0, 0, 1, 1);\n\nPI = 3.1415926535897931;\nTWOPI = 6.2831853071795862;\nN = 24;\n\n// ---------------------------------------------------------------- exciter\ntdiv = g.tdiv;   // the export's safediv(ph, strike_samps), as a true division\n\n// the strike state: h_strike_ph (from -1), h_noise_env, h_strum_env; the\n// outputs: the pulse, the noise envelope and the strum envelope after their\n// update\nstrike(hit) = (body ~ (_, _, _)) : (!, !, !, _, _, _)\nwith {\n    ss = max(16.0, ma.SR * 0.002);\n    body(phd, ned, sed) = ph_new, ne, se, pulse, ne, se\n    with {\n        ph = select2(hit, g.init(-1, phd), 0.0);\n        on = ph >= 0.0;\n        pulse = select2(on, 0.0, 0.5 - 0.5 * cos(TWOPI * tdiv(ph, ss)));\n        ph1 = ph + 1.0;\n        ph_new = select2(on, ph, select2(ph1 >= ss, ph1, -1.0));\n        ne = g.fixdenorm(select2(hit, ned, 1.0) * 0.985);\n        se = select2(hit, g.fixdenorm(sed * 0.995), 1.0);\n    };\n};\n\n// ---------------------------------------------------------------- modes\neff_br = g.clip(0.01, 1.0, brightness);\n\nstiff = select2(structure < 0.25, select2(structure < 0.3, select2(structure < 0.9, st_gong, st_bar), 0.0), st_sub)\nwith {\n    st_sub = 0 - (0.25 - structure) * 0.25;\n    gb = (structure - 0.3) * 1.6666666666666667;\n    st_bar = g.keep(0.01 * g.safepow(10.0, g.keep(gb) * 2.005)) - 0.01;\n    gg = (structure - 0.9) * 10.0;\n    st_gong = 1.5 - cos(g.keep(gg * gg) * PI) * 0.5;\n};\n\nf0 = g.clip(g.divsr(20.0), 0.45, g.divsr(g.keep(440.0 * g.safepow(2.0, (pitch - 69.0) * 0.083333333333333329))));\nq_base = g.keep(500.0 * g.safepow(10.0, g.clip(0.0, 1.0, damping) * 3.5));\nbr = g.keep(eff_br * (1.0 - g.keep(0.2 * g.safepow(1.0 - structure, 8))));\nq_loss = g.keep(g.keep(g.keep(br * (2.0 - br)) * 0.85) + 0.15);\nq_rate = g.keep(g.keep(structure * (2.0 - structure)) * 0.1);\n\n// the loop's running values at mode i (cur_stiff is never updated in the\n// export: stretch grows by stiff at every mode)\nharmonic(0) = f0;\nharmonic(i) = g.keep(harmonic(i - 1) + f0);\nstretch(0) = 1.0;\nstretch(i) = g.keep(stretch(i - 1) + stiff);\ncur_qloss(0) = q_loss;\ncur_qloss(i) = g.keep(c + g.keep(q_rate * (1.0 - c))) with { c = cur_qloss(i - 1); };\ncur_q(0) = q_base;\ncur_q(i) = g.keep(cur_q(i - 1) * cur_qloss(i));\n\n// mode i: Data s1[i], s2[i] as two recursive signals; output bp * amp\nmode(i, exc) = (body ~ (_, _)) : (!, !, _)\nwith {\n    pf = g.clip(g.divsr(10.0), 0.48, g.keep(harmonic(i) * stretch(i)));\n    res = 1.0 + g.keep(pf * cur_q(i));\n    g_m = tan(PI * pf);\n    r_m = g.safediv(1.0, res);\n    h_m = g.safediv(1.0, g.keep(1.0 + g.keep(r_m * g_m)) + g.keep(g_m * g_m));\n    amp = g.keep(0.5 + 0.5 * cos(g.keep(TWOPI * i) * position));\n    body(s1, s2) = g.fixdenorm(2.0 * v1 + s1), g.fixdenorm(2.0 * v2 + s2), bp * amp\n    with {\n        hp = g.keep(g.keep(g.keep(exc - g.keep((r_m + g_m) * s1)) - s2) * h_m);\n        v1 = g.keep(g_m * hp);\n        bp = v1 + s1;\n        v2 = g.keep(g_m * bp);\n    };\n};\n\n// ---------------------------------------------------------------- program\nrings(in1, in2, in3, nz) = out1, out2, out3, out4\nwith {\n    trig_in3 = (in3 > 0.1) & ((in3 > 0.1)' <= 0.1);\n    trig_param = (strum > 0.0) & ((strum > 0.0)' <= 0.0);\n    hit = trig_in3 | trig_param;\n    st = strike(hit);\n    strike_pulse = st : _, !, !;\n    noise_env = st : !, _, !;\n    strum_env = st : !, !, _;\n    pluck_noise = nz * noise_env * 0.4;\n    exc_level = g.clip(0.0, 1.0, internal_exciter * 0.01);\n    acoustic_exciter = (strike_pulse * 1.6 + pluck_noise) * exc_level;\n\n    audio_in = g.keep((in1 + in2) * 0.5);\n    in_drive = g.keep(1.0 + g.keep(drive * 0.01) * 2.0);\n    raw_exc = g.keep(ma.tanh(audio_in * in_drive) + acoustic_exciter);\n\n    exc_cutoff = g.clip(40.0, ma.SR * 0.45, 40.0 * g.safepow(450.0, eff_br));\n    exc_g = tan(g.divsr(g.keep(PI * exc_cutoff)));\n    exc_alpha = g.safediv(exc_g, 1.0 + exc_g);\n    exc_sig = (\\(h).(h + exc_alpha * (raw_exc - h))) ~ _;\n\n    // sums in the loop's order, from 0.0\n    sum_odd = 0.0 : seq(k, N / 2, + (mode(2 * k, exc_sig)) : g.keep);\n    sum_even = 0.0 : seq(k, N / 2, + (mode(2 * k + 1, exc_sig)) : g.keep);\n\n    sp = g.clip(0.0, 1.0, stereo_spread * 0.01);\n    pan_L = g.keep(sum_odd * (1.0 + sp * 0.5) + sum_even * (1.0 - sp * 0.5));\n    pan_R = g.keep(sum_even * (1.0 + sp * 0.5) + sum_odd * (1.0 - sp * 0.5));\n    dc(x) = g.keep(x - x') : (+ ~ *(0.995));\n    make_up = g.dbtoa(gain);\n    lim_L = g.keep(g.keep(ma.tanh(dc(pan_L) * 0.5) * 1.8) * make_up);\n    lim_R = g.keep(g.keep(ma.tanh(dc(pan_R) * 0.5) * 1.8) * make_up);\n    eff_mix = g.clip(0.0, 1.0, mix_p * 0.01);\n    out1 = g.keep(in1 * (1.0 - eff_mix)) + lim_L * eff_mix;\n    out2 = g.keep(in2 * (1.0 - eff_mix)) + lim_R * eff_mix;\n    out3 = exc_sig;\n    out4 = strum_env;\n};\n\ndet = rings;\nprocess = (_, _, _, g.noises(1, 0)) : det;\n",
                    "sourcecode_size": 21356,
                    "sample_format": 1,
                    "version": "1.87"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        32.0,
                        475.0,
                        48.0,
                        136.0
                    ],
                    "lastchannelcount": 0,
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        "float",
                        "list"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                -70.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "live.gain~",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        620.0,
                        45.0,
                        45.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        95.0,
                        485.0,
                        70.0,
                        23.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        95.0,
                        520.0,
                        100.0,
                        40.0
                    ],
                    "outlettype": [
                        "preset",
                        "int",
                        "preset",
                        "int",
                        ""
                    ],
                    "preset_data": [
                        {
                            "number": 1,
                            "data": [
                                5,
                                "obj-35",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                -2.0,
                                5,
                                "obj-33",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                25.0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                0.6000000000000001,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                0.2,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                0.6500000000000001,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                62.0,
                                5,
                                "obj-42",
                                "toggle",
                                "int",
                                1,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u251008633",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute"
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-35",
                                "flonum",
                                "float",
                                45.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                -3.0,
                                5,
                                "obj-33",
                                "flonum",
                                "float",
                                25.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                81.0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                0.7200000000000002,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                0.6000000000000001,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                0.19000000000000003,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                36.0,
                                5,
                                "obj-42",
                                "toggle",
                                "int",
                                1,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u251008633",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute"
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-35",
                                "flonum",
                                "float",
                                45.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                -10.0,
                                5,
                                "obj-33",
                                "flonum",
                                "float",
                                25.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                81.0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                0.7200000000000002,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                0.6000000000000001,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                0.19000000000000003,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                21.0,
                                5,
                                "obj-42",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u251008633",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute"
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        120.0,
                        208.0,
                        20.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 Modal Structure & Tuning \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        325.0,
                        206.0,
                        56.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 11.0,
                    "linecount": 4,
                    "text": "Structure Map:\n\u2022 < 0.25 : Subharmonic / Wood\n\u2022 = 0.25 : Ideal Harmonic String\n\u2022 0.3..0.85 : Bar / Chime / Bell / Drum"
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        515.0,
                        120.0,
                        209.0,
                        20.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 Exciter & Spatialization \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        280.0,
                        507.0,
                        41.0,
                        23.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "click~"
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        232.0,
                        465.0,
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
                    "id": "obj-107",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        150.0,
                        60.0,
                        23.0
                    ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        340.0,
                        150.0,
                        150.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 12.0,
                    "maximum": 108.0
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        340.0,
                        175.0,
                        120,
                        22
                    ],
                    "text": "prepend pitch",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        465.0,
                        175.0,
                        90,
                        22
                    ],
                    "text": "set 48.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-110",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        185.0,
                        79.0,
                        23.0
                    ],
                    "text": "structure"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        359.0,
                        185.0,
                        131.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        359.0,
                        210.0,
                        120,
                        22
                    ],
                    "text": "prepend structure",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        484.0,
                        210.0,
                        90,
                        22
                    ],
                    "text": "set 0.25",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        220.0,
                        86.0,
                        23.0
                    ],
                    "text": "brightness"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        366.0,
                        220.0,
                        124.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        366.0,
                        245.0,
                        120,
                        22
                    ],
                    "text": "prepend brightness",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-115",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        491.0,
                        245.0,
                        90,
                        22
                    ],
                    "text": "set 0.6",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-116",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        255.0,
                        65.0,
                        23.0
                    ],
                    "text": "damping"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        345.0,
                        255.0,
                        145.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        345.0,
                        280.0,
                        120,
                        22
                    ],
                    "text": "prepend damping",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-118",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        470.0,
                        280.0,
                        90,
                        22
                    ],
                    "text": "set 0.6",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        290.0,
                        72.0,
                        23.0
                    ],
                    "text": "position"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        352.0,
                        290.0,
                        138.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-120",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        352.0,
                        315.0,
                        120,
                        22
                    ],
                    "text": "prepend position",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-121",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        477.0,
                        315.0,
                        90,
                        22
                    ],
                    "text": "set 0.25",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-122",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        515.0,
                        150.0,
                        108.0,
                        23.0
                    ],
                    "text": "internal_exciter (%)"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        623.0,
                        150.0,
                        102.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0
                }
            },
            {
                "box": {
                    "id": "obj-123",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        623.0,
                        175.0,
                        120,
                        22
                    ],
                    "text": "prepend internal_exciter",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-124",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        748.0,
                        175.0,
                        90,
                        22
                    ],
                    "text": "set 80.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-125",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        515.0,
                        185.0,
                        108.0,
                        23.0
                    ],
                    "text": "stereo_spread (%)"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        623.0,
                        185.0,
                        102.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0
                }
            },
            {
                "box": {
                    "id": "obj-126",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        623.0,
                        210.0,
                        120,
                        22
                    ],
                    "text": "prepend stereo_spread",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-127",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        748.0,
                        210.0,
                        90,
                        22
                    ],
                    "text": "set 80.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-128",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        515.0,
                        220.0,
                        108.77622377622379,
                        23.0
                    ],
                    "text": "drive (%)"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        623.7762237762238,
                        220.0,
                        101.22377622377621,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0
                }
            },
            {
                "box": {
                    "id": "obj-129",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        623.7762237762238,
                        245.0,
                        120,
                        22
                    ],
                    "text": "prepend drive",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-130",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        748.7762237762238,
                        245.0,
                        90,
                        22
                    ],
                    "text": "set 20.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-131",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        515.0,
                        255.0,
                        108.77622377622379,
                        23.0
                    ],
                    "text": "gain (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        623.7762237762238,
                        255.0,
                        101.22377622377621,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -24.0,
                    "maximum": 12.0
                }
            },
            {
                "box": {
                    "id": "obj-132",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        623.7762237762238,
                        280.0,
                        120,
                        22
                    ],
                    "text": "prepend gain",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-133",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        748.7762237762238,
                        280.0,
                        90,
                        22
                    ],
                    "text": "set 0.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-134",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        515.0,
                        290.0,
                        110.17482517482517,
                        23.0
                    ],
                    "text": "mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        625.1748251748252,
                        290.0,
                        99.82517482517483,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0
                }
            },
            {
                "box": {
                    "id": "obj-135",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        625.1748251748252,
                        315.0,
                        120,
                        22
                    ],
                    "text": "prepend mix",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-136",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        750.1748251748252,
                        315.0,
                        90,
                        22
                    ],
                    "text": "set 100.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-137",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        387.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen rings replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/rings.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/rings.maxpat.",
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
                        "obj-1",
                        1
                    ],
                    "destination": [
                        "obj-3",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-1",
                        0
                    ],
                    "destination": [
                        "obj-3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-13",
                        0
                    ],
                    "destination": [
                        "obj-2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-17",
                        0
                    ],
                    "destination": [
                        "obj-20",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-2",
                        2
                    ],
                    "destination": [
                        "obj-3",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-20",
                        1
                    ],
                    "destination": [
                        "obj-1",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-20",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        1
                    ],
                    "destination": [
                        "obj-6",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        0
                    ],
                    "destination": [
                        "obj-6",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-40",
                        0
                    ],
                    "destination": [
                        "obj-45",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-42",
                        0
                    ],
                    "destination": [
                        "obj-43",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-43",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-45",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-21",
                        0
                    ],
                    "destination": [
                        "obj-108",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-108",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-109",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-109",
                        0
                    ],
                    "destination": [
                        "obj-21",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-22",
                        0
                    ],
                    "destination": [
                        "obj-111",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-111",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-112",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-22",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-23",
                        0
                    ],
                    "destination": [
                        "obj-114",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-114",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-115",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-115",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-24",
                        0
                    ],
                    "destination": [
                        "obj-117",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-117",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-118",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-118",
                        0
                    ],
                    "destination": [
                        "obj-24",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-25",
                        0
                    ],
                    "destination": [
                        "obj-120",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-120",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-121",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-121",
                        0
                    ],
                    "destination": [
                        "obj-25",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-31",
                        0
                    ],
                    "destination": [
                        "obj-123",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-123",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-124",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-124",
                        0
                    ],
                    "destination": [
                        "obj-31",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-32",
                        0
                    ],
                    "destination": [
                        "obj-126",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-126",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-127",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-127",
                        0
                    ],
                    "destination": [
                        "obj-32",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-33",
                        0
                    ],
                    "destination": [
                        "obj-129",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-129",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-130",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-130",
                        0
                    ],
                    "destination": [
                        "obj-33",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-34",
                        0
                    ],
                    "destination": [
                        "obj-132",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-132",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-133",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-133",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-35",
                        0
                    ],
                    "destination": [
                        "obj-135",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-135",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-136",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-136",
                        0
                    ],
                    "destination": [
                        "obj-35",
                        0
                    ],
                    "order": 0
                }
            }
        ],
        "autosave": 0,
        "parameters": {
            "obj-3": [
                "live.gain~",
                "live.gain~",
                0
            ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ],
                    "buttons": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ]
                }
            },
            "inherited_shortname": 1
        }
    }
}