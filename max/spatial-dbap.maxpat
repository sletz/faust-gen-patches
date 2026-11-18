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
            174.0,
            130.0,
            1076.0,
            880.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        675.0,
                        424.0,
                        130.0,
                        130.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        55.99999999999999,
                        182.66666666666666,
                        150.0,
                        30.0
                    ],
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u938001510",
                                "loop": 0,
                                "content_state": {}
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
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        652.6666666666666,
                        257.3333333333333,
                        84.0,
                        21.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "fontname": "Helvetica Neue",
                    "fontsize": 11.0,
                    "text": "s -to-visualizer-"
                }
            },
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        56.0,
                        13.333333333333334,
                        650.0,
                        33.0
                    ],
                    "fontface": 1,
                    "fontsize": 24.0,
                    "text": "3D Distance-Based Amplitude Panning (DBAP & KNN)"
                }
            },
            {
                "box": {
                    "id": "obj-sub",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        56.0,
                        46.666666666666664,
                        680.0,
                        21.0
                    ],
                    "fontsize": 13.0,
                    "text": "Dynamic CSV Layouts (maxBstudio 6ch / Grame 28ch Dome) \u2022 Continuous 32-Channel Spatial Engine"
                }
            },
            {
                "box": {
                    "id": "obj-grp-audio",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        61.0,
                        122.66666666666669,
                        140.0,
                        20.0
                    ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 1. Audio Source \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-grp-traj",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        276.0,
                        122.66666666666667,
                        199.0,
                        20.0
                    ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 2. 3D Trajectory Generator \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-chaos",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 6,
                    "patching_rect": [
                        281.0,
                        226.0,
                        185.0,
                        22.0
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
                    "sourcecode": "// lorenz-rossler-chaos: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/lorenz-rossler-chaos.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// LORENZ-ROSSLER-CHAOS: Lorenz and R\u00f6ssler strange attractors integrated by RK4\n// (gen~: gendsp/lorenz-rossler-chaos.gendsp)\n//\n// One RK4 step per sample of the Lorenz system (sigma = 10*max(drive, 0.05),\n// rho = param_rho, beta = 8/3) or of the R\u00f6ssler system (a = b = 0.2,\n// c = param_rho mapped 10..60 -> 4..9), dt = min(1.2*speed'/sr, 0.024) with\n// speed' = clamp(speed + 200*in2, 0.01, 1000). in1*inject*0.2 perturbs the x\n// fed to the derivatives (not the integrated x). The state starts at\n// (4, 0, 0.2), on the R\u00f6ssler attractor, and restarts there when a coordinate\n// leaves [-300, 300] or is NaN.\n//\n// in1: audio injection on x    in2: speed CV (+200 per unit)\n// out1, out2: x, y scaled to [-1, 1] (clamped)\n// out3: z centred and scaled to [-1, 1] (clamped): Lorenz (z - (rho - 1))*0.055,\n//       R\u00f6ssler (z - 2.5)*0.1\n// out4: trigger on the upward zero crossing of out1\n//\n// Parameters: system (0..1, def 1: < 0.5 Lorenz, else R\u00f6ssler),\n// speed (0.01..1000, def 2), drive (0..2, def 1: Lorenz sigma),\n// param_rho (10..60, def 30), inject (0..1, def 0).\n\ndeclare name \"lorenz-rossler-chaos\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nsystem = hslider(\"system\", 1, 0, 1, 1);\nspeed = hslider(\"speed\", 2, 0.01, 1000, 0.01);\ndrive = hslider(\"drive\", 1, 0, 2, 0.001);\nparam_rho = hslider(\"param_rho\", 30, 10, 60, 0.01);\ninject = hslider(\"inject\", 0, 0, 1, 0.001);\n\n// Faust's normalizer reorders this arithmetic (it distributes sigma over\n// (py - px), merges dt*1/6 with the parameters, factors the RK4 sums), and a\n// chaotic system turns each ulp of difference into a different trajectory\n// within a few thousand samples. Every operation goes through K, an identity\n// the normalizer does not see through (for finite x, which the reset above\n// |300| ensures), so that the program computes gen's expressions in\n// gen's order.\nK = g.keep;\nadd(a, b) = K(a + b);\nsub(a, b) = K(a - b);\nmul(a, b) = K(a * b);\n// x / SR as a true division (the normalizer turns /SR into *(1/SR))\ndivsr = g.divsr;\n\nlorenz_dx(px, py, pz, sigm) = mul(sigm, sub(py, px));\nlorenz_dy(px, py, pz, r_val) = sub(mul(px, sub(r_val, pz)), py);\nlorenz_dz(px, py, pz, bet) = sub(mul(px, py), mul(bet, pz));\n\nrossler_dx(px, py, pz) = sub(K(0 - py), pz);\nrossler_dy(px, py, pz, a_val) = add(px, mul(a_val, py));\nrossler_dz(px, py, pz, b_val, c_val) = add(b_val, mul(pz, sub(px, c_val)));\n\n// one RK4 step of the derivative triple (fx, fy, fz) from (x_in, y, z),\n// x itself (not x_in) integrated; the export writes dt/6 as dt*0.16666666666666666\n_rk4(fx, fy, fz, dt, x, x_in, y, z) = xn, yn, zn\nwith {\n    k1x = fx(x_in, y, z); k1y = fy(x_in, y, z); k1z = fz(x_in, y, z);\n    h = mul(0.5, dt);\n    a2x = add(x_in, mul(h, k1x)); a2y = add(y, mul(h, k1y)); a2z = add(z, mul(h, k1z));\n    k2x = fx(a2x, a2y, a2z); k2y = fy(a2x, a2y, a2z); k2z = fz(a2x, a2y, a2z);\n    a3x = add(x_in, mul(h, k2x)); a3y = add(y, mul(h, k2y)); a3z = add(z, mul(h, k2z));\n    k3x = fx(a3x, a3y, a3z); k3y = fy(a3x, a3y, a3z); k3z = fz(a3x, a3y, a3z);\n    a4x = add(x_in, mul(dt, k3x)); a4y = add(y, mul(dt, k3y)); a4z = add(z, mul(dt, k3z));\n    k4x = fx(a4x, a4y, a4z); k4y = fy(a4x, a4y, a4z); k4z = fz(a4x, a4y, a4z);\n    d6 = mul(dt, 0.16666666666666666);\n    rksum(k1, k2, k3, k4) = add(add(add(k1, mul(2, k2)), mul(2, k3)), k4);\n    xn = add(x, mul(d6, rksum(k1x, k2x, k3x, k4x)));\n    yn = add(y, mul(d6, rksum(k1y, k2y, k3y, k4y)));\n    zn = add(z, mul(d6, rksum(k1z, k2z, k3z, k4z)));\n};\n\nchaos(in1, in2) = norm_x, norm_y, norm_z, trig_pulse\nwith {\n    lor = system < 0.5;\n    eff_speed = g.clamp(0.01, 1000, add(speed, mul(in2, 200)));\n    dt = min(mul(divsr(eff_speed), 1.2), 0.024);\n\n    sig_param = mul(10, max(drive, 0.05));\n    rho_param = param_rho;\n    beta_param = 2.6666666666666665;\n    // scale(param_rho, 10, 60, 4, 9): ((rho - 10) * 0.02)^1 * 5 + 4\n    c_param = add(mul(mul(sub(param_rho, 10), 0.02), 5), 4);\n\n    step(x, y, z) = xr, yr, zr\n    with {\n        x_in = add(x, mul(mul(in1, inject), 0.2));\n        // the derivatives as functions of (px, py, pz), parameters bound\n        lx = _rk4(\\(px, py, pz).(lorenz_dx(px, py, pz, sig_param)),\n                  \\(px, py, pz).(lorenz_dy(px, py, pz, rho_param)),\n                  \\(px, py, pz).(lorenz_dz(px, py, pz, beta_param)),\n                  dt, x, x_in, y, z);\n        rx = _rk4(rossler_dx,\n                  \\(px, py, pz).(rossler_dy(px, py, pz, 0.2)),\n                  \\(px, py, pz).(rossler_dz(px, py, pz, 0.2, c_param)),\n                  dt, x, x_in, y, z);\n        xs = select2(lor, (rx : _, !, !), (lx : _, !, !));\n        ys = select2(lor, (rx : !, _, !), (lx : !, _, !));\n        zs = select2(lor, (rx : !, !, _), (lx : !, !, _));\n        blow = (abs(xs) > 300) | (abs(ys) > 300) | (abs(zs) > 300)\n             | ma.isnan(xs) | ma.isnan(ys) | ma.isnan(zs);\n        xr = select2(blow, xs, 4.0);\n        yr = select2(blow, ys, 0.0);\n        zr = select2(blow, zs, 0.2);\n    };\n    // History x(4.0), y(0.0), z(0.2)\n    st = step ~ (g.init(4.0), g.init(0.0), g.init(0.2));\n    xo = st : _, !, !;\n    yo = st : !, _, !;\n    zo = st : !, !, _;\n\n    norm_x = g.clamp(-1, 1, select2(lor, xo * 0.08, xo * 0.05));\n    norm_y = g.clamp(-1, 1, select2(lor, yo * 0.08, yo * 0.04));\n    norm_z = select2(lor, g.clamp(-1, 1, mul(sub(zo, 2.5), 0.1)),\n                          g.clamp(-1, 1, mul(sub(zo, sub(param_rho, 1.0)), 0.055)));\n    trig_pulse = (norm_x > 0) & (norm_x' <= 0);\n};\n\nprocess = chaos;\ndet = process;\n",
                    "sourcecode_size": 18962,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_lorenz_rossler_chaos"
                }
            },
            {
                "box": {
                    "id": "obj-js-loader",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        499.6666666666667,
                        226.0,
                        140.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "",
                        ""
                    ],
                    "saved_object_attributes": {
                        "filename": "dbap_csv_loader.js",
                        "parameter_enable": 0
                    },
                    "text": "js dbap_csv_loader.js"
                }
            },
            {
                "box": {
                    "id": "obj-buf-pos",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        419.3333333333333,
                        440.6666666666667,
                        121.0,
                        22.0
                    ],
                    "outlettype": [
                        "float",
                        "bang"
                    ],
                    "text": "buffer~ spk_pos 10 3"
                }
            },
            {
                "box": {
                    "id": "obj-layout-info",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        498.3333333333333,
                        257.3333333333333,
                        143.0,
                        19.0
                    ],
                    "fontface": 0,
                    "fontsize": 11.0,
                    "text": "Active Layout: None loaded"
                }
            },
            {
                "box": {
                    "id": "obj-grp-dbap",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        56.0,
                        376.0,
                        300.0,
                        20.0
                    ],
                    "fontface": 1,
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 4. 3D DBAP Spatial Engine (32 Outlets) \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-gen-dbap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        56.0,
                        440.6666666666667,
                        356.6666666666667,
                        22.0
                    ],
                    "outlettype": [
                        "multichannelsignal",
                        "",
                        ""
                    ],
                    "text": "mc.faustgen~",
                    "sourcecode": "// spatial-dbap: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/spatial-dbap.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// SPATIAL-DBAP: 3D distance-based amplitude panning (gen~: gendsp/spatial-dbap.gendsp,\n// an mc.gen~ patch: one instance per loudspeaker)\n//\n// In gen~ the patch runs in mc.gen~ (@chans 32 in its demo patch), one\n// instance per channel, each computing the gain of its own loudspeaker\n// (mc_channel). This program is the N instances together: N outputs, one per\n// loudspeaker (N = 32 below, as the demo patch; change it as @chans).\n//\n// The source (x, y, z, each slid over `smooth` samples, times room_scale) is\n// panned by DBAP over total_spk loudspeakers (num_speakers if > 0, else N):\n// the distance d_k to loudspeaker k is sqrt(|src - spk_k|^2 + blur'^2), its\n// weight d_k^-rolloff' (blur' = blur * width/100 clipped to 0.05..2,\n// rolloff' = rolloff * sharpness), tapered by `focus` towards the farthest\n// loudspeakers (1 - 1.5 * focus * (d_k - d_min)/(d_max - d_min), clipped to\n// 0..1), and the weights are normalized in power (sum of squares 1). With\n// air_damp > 0, each output goes through a one-pole lowpass whose cutoff\n// falls from 20 kHz towards 2.5 kHz with (d / room_scale)^2 * air_damp.\n//\n// The loudspeaker layout: in gen~ it is read from the buffer~ spk_pos (X, Y,\n// Z on 3 channels), which the demo patch's dbap_csv_loader.js fills from a\n// CSV file, when the buffer holds at least total_spk frames; otherwise the\n// loudspeakers are on a ring of radius 2 at ear level, loudspeaker k at the\n// angle 2*pi*k/total_spk (x = 2 sin, y = 2 cos). This program has no buffer\n// (as gen~ without a spk_pos buffer~, whose unbound Buffer has one frame):\n// the ring, except with total_spk = 1, where the one loudspeaker reads that\n// frame, at the origin.\n//\n// in1: audio (mono)    in2, in3, in4: source X, Y, Z (-1..1)\n// out1..outN: the loudspeaker feeds (0 beyond total_spk)\n//\n// Parameters: num_speakers (0..32, def 0: N), rolloff (0.1..4, def 1),\n// blur (0.01..2, def 0.25), focus (0..1, def 0), room_scale (0.1..20, def 2),\n// smooth (def 240 samples, min 1), width (1..200 %, def 100), sharpness\n// (0.5..4, def 1), air_damp (0..1, def 0).\n//\n// gen~ details kept: the lowpass state only runs while air_damp > 0 (it\n// resumes from where it stopped); smooth is declared with a minimum and no\n// maximum, which the C++ export bounds to [1, 1] (the default 240 kept);\n// gen~ in Max does not, and the slider here goes to 4800.\n\ndeclare name \"spatial-dbap\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nN = 32;      // the number of loudspeakers: mc.gen~'s @chans\nKMAX = 32;   // the patch's loops and Data dists(32)\n\nnum_speakers = hslider(\"num_speakers\", 0, 0, 32, 1);\nrolloff = hslider(\"rolloff\", 1, 0.1, 4, 0.001);\nblur = hslider(\"blur\", 0.25, 0.01, 2, 0.001);\nfocus = hslider(\"focus\", 0, 0, 1, 0.001);\nroom_scale = hslider(\"room_scale\", 2, 0.1, 20, 0.01);\nsmooth = hslider(\"smooth [unit:samples]\", 240, 1, 4800, 1);\nwidth = hslider(\"width [unit:%]\", 100, 1, 200, 0.01);\nsharpness = hslider(\"sharpness\", 1, 0.5, 4, 0.001);\nair_damp = hslider(\"air_damp\", 0, 0, 1, 0.001);\n\n// the export's inlined clamp: (v <= lo) ? lo : ((v >= hi) ? hi : v)\ntclamp = g.clip;\n// the unbound Buffer spk_pos: one frame\nBUFDIM = 1;\n\n// one instance: channel `ch` (mc_channel, 1-based) of `count` (mc_channelcount)\ndbap(ch, count, in1, in2, in3, in4) = out1\nwith {\n    total_spk = select2(num_speakers > 0, max(2, count), tclamp(1, 32, floor(num_speakers)));\n    my_idx = ch - 1;\n    src_x = g.slide(smooth, smooth, in2) * room_scale;\n    src_y = g.slide(smooth, smooth, in3) * room_scale;\n    src_z = g.slide(smooth, smooth, in4) * room_scale;\n    w_factor = tclamp(0.05, 2, width * 0.01);\n    eff_blur = blur * w_factor;\n    eff_roll = rolloff * sharpness;\n    has_buf = BUFDIM >= total_spk;\n\n    active(k) = k < total_spk;\n    // the distance to loudspeaker k\n    dist(k) = sqrt((((dx * dx) + (dy * dy)) + (dz * dz)) + (eff_blur * eff_blur))\n    with {\n        fb_ang = k * (6.283185307179586 / total_spk);\n        sx = select2(has_buf, 2 * sin(fb_ang), 0);\n        sy = select2(has_buf, 2 * cos(fb_ang), 0);\n        sz = 0;\n        dx = src_x - sx;\n        dy = src_y - sy;\n        dz = src_z - sz;\n    };\n    // folds over the active loudspeakers 0..KMAX-1, in the patch's order\n    fold(f, init) = init : seq(k, KMAX, (_ <: _, f(_, k) : select2(active(k))));\n    min_d = fold(\\(m, k).(min(m, dist(k))), 10000);\n    max_d = fold(\\(m, k).(max(m, dist(k))), 0.0001);\n    my_d = fold(\\(m, k).(select2(k == my_idx, m, dist(k))), 10000);\n\n    span = max(max_d - min_d, 0.0001);\n    weight(k) = select2(focus > 0, w0, w0 * taper)\n    with {\n        d = dist(k);\n        w0 = g.safepow(d, 0 - eff_roll);\n        rel_d = (d - min_d) / span;\n        taper = tclamp(0, 1, 1 - ((focus * rel_d) * 1.5));\n    };\n    energy = fold(\\(e, k).(e + (weight(k) * weight(k))), 0);\n    my_w = fold(\\(m, k).(select2(k == my_idx, m, weight(k))), 0);\n\n    norm_factor = 1 / sqrt(max(energy, 1e-12));\n    gain_target = select2(my_idx < total_spk, 0, my_w * norm_factor);\n    audio_out = in1 * gain_target;\n\n    damp = air_damp > 0;\n    d_norm = tclamp(0, 2, my_d / max(room_scale, 0.1));\n    cutoff_target = tclamp(2500, 20000, 20000 - (((d_norm * d_norm) * air_damp) * (20000 - 2500)));\n    w_rad = (6.283185307179586 * cutoff_target) / ma.SR;\n    alpha = tclamp(0.001, 1, w_rad / (w_rad + 1));\n    filtered = (\\(prev).(select2(damp, prev, (audio_out * alpha) + (prev * (1 - alpha))))) ~ _;\n    out1 = select2(damp, audio_out, filtered);\n};\n\nspatial(in1, in2, in3, in4) = par(c, N, dbap(c + 1, N, in1, in2, in3, in4));\n\nprocess = spatial;\ndet = process;\n",
                    "sourcecode_size": 19021,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_spatial_dbap"
                }
            },
            {
                "box": {
                    "id": "obj-mc-meter",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        56.0,
                        556.0,
                        115.33333333333333,
                        240.66666666666666
                    ],
                    "outlettype": [
                        "float"
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
                        203.33333333333334,
                        710.6666666666666,
                        45.0,
                        45.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-mcdac",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        176.66666666666666,
                        560.0,
                        138.0,
                        76.0
                    ],
                    "linecount": 5,
                    "text": "mc.dac~ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32"
                }
            },
            {
                "box": {
                    "id": "obj-snapshot-x",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        728.6666666666666,
                        193.33333333333334,
                        81.0,
                        22.0
                    ],
                    "outlettype": [
                        "float"
                    ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "obj-snapshot-y",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        804.6666666666666,
                        193.33333333333334,
                        81.0,
                        22.0
                    ],
                    "outlettype": [
                        "float"
                    ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "obj-snapshot-z",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        880.6666666666665,
                        193.33333333333337,
                        81.0,
                        22.0
                    ],
                    "outlettype": [
                        "float"
                    ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "obj-pak-xyz",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "patching_rect": [
                        652.6666666666666,
                        226.0,
                        246.99999999999994,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "pak /adm/obj/1/xyz 0. 0. 0."
                }
            },
            {
                "box": {
                    "id": "obj-drop",
                    "maxclass": "dropfile",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        499.6666666666667,
                        122.66666666666667,
                        130.0,
                        50.0
                    ],
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-drop-lbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        504.33333333333337,
                        137.33333333333334,
                        120.0,
                        18.0
                    ],
                    "fontsize": 10.0,
                    "text": "Drag & Drop CSV Layout"
                }
            },
            {
                "box": {
                    "id": "obj-msg-read",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        499.6666666666667,
                        195.33333333333334,
                        80.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "prepend read"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        481.0,
                        256.0,
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
                    "id": "obj-98",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        281.0,
                        146.0,
                        60.0,
                        22.0
                    ],
                    "text": "speed"
                }
            },
            {
                "box": {
                    "id": "obj-chaos-speed",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        341.0,
                        146.0,
                        80.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.01,
                    "maximum": 1000.0
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        341.0,
                        170.0,
                        120,
                        22
                    ],
                    "text": "prepend speed",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        466.0,
                        170.0,
                        90,
                        22
                    ],
                    "text": "set 2.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        281.0,
                        174.0,
                        60.0,
                        22.0
                    ],
                    "text": "system"
                }
            },
            {
                "box": {
                    "id": "obj-chaos-sys",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        341.0,
                        174.0,
                        80.0,
                        22.0
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
                    "id": "obj-102",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        341.0,
                        198.0,
                        120,
                        22
                    ],
                    "text": "prepend system",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        466.0,
                        198.0,
                        90,
                        22
                    ],
                    "text": "set 1",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        281.0,
                        178.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen lorenz-rossler-chaos replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/lorenz-rossler-chaos.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/spatial-dbap.maxpat.",
                    "textcolor": [
                        0.6,
                        0.1,
                        0.1,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "patching_rect": [
                        56.0,
                        414.6666666666667,
                        356.6666666666667,
                        22
                    ],
                    "text": "mc.pack~ 4",
                    "outlettype": [
                        "multichannelsignal"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        256.0,
                        470.6666666666667,
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
                        196.0,
                        400.6666666666667,
                        60.0,
                        22.0
                    ],
                    "text": "blur"
                }
            },
            {
                "box": {
                    "id": "obj-att-blur",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        256.0,
                        400.6666666666667,
                        70.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.01,
                    "maximum": 2.0
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        256.0,
                        424.6666666666667,
                        120,
                        22
                    ],
                    "text": "prepend blur",
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
                        381.0,
                        424.6666666666667,
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
                    "id": "obj-110",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        336.0,
                        400.6666666666667,
                        60.0,
                        22.0
                    ],
                    "text": "focus"
                }
            },
            {
                "box": {
                    "id": "obj-att-focus",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        396.0,
                        400.6666666666667,
                        70.0,
                        22.0
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
                        396.0,
                        424.6666666666667,
                        120,
                        22
                    ],
                    "text": "prepend focus",
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
                        521.0,
                        424.6666666666667,
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
                    "id": "obj-113",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        56.0,
                        400.6666666666667,
                        65.0,
                        22.0
                    ],
                    "text": "rolloff"
                }
            },
            {
                "box": {
                    "id": "obj-att-roll",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        121.0,
                        400.6666666666667,
                        65.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.1,
                    "maximum": 4.0
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        121.0,
                        424.6666666666667,
                        120,
                        22
                    ],
                    "text": "prepend rolloff",
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
                        246.0,
                        424.6666666666667,
                        90,
                        22
                    ],
                    "text": "set 1.0",
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
                        476.0,
                        400.6666666666667,
                        86.0,
                        22.0
                    ],
                    "text": "room_scale"
                }
            },
            {
                "box": {
                    "id": "obj-att-room",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        562.0,
                        400.6666666666667,
                        54.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.1,
                    "maximum": 20.0
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        562.0,
                        424.6666666666667,
                        120,
                        22
                    ],
                    "text": "prepend room_scale",
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
                        687.0,
                        424.6666666666667,
                        90,
                        22
                    ],
                    "text": "set 2.0",
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
                        56.0,
                        366.6666666666667,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen spatial-dbap replaced by mc.faustgen~ running the Faust port (faust-gen-patches/dsp/spatial-dbap.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/spatial-dbap.maxpat.",
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
                        "obj-chaos",
                        2
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-chaos",
                        0
                    ],
                    "destination": [
                        "obj-snapshot-x",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-chaos",
                        1
                    ],
                    "destination": [
                        "obj-snapshot-y",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-chaos",
                        2
                    ],
                    "destination": [
                        "obj-snapshot-z",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-drop",
                        0
                    ],
                    "destination": [
                        "obj-msg-read",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-js-loader",
                        2
                    ],
                    "destination": [
                        "obj-96",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-js-loader",
                        0
                    ],
                    "destination": [
                        "obj-gen-dbap",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-msg-read",
                        0
                    ],
                    "destination": [
                        "obj-js-loader",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-pak-xyz",
                        0
                    ],
                    "destination": [
                        "obj-96",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-snapshot-x",
                        0
                    ],
                    "destination": [
                        "obj-pak-xyz",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-snapshot-y",
                        0
                    ],
                    "destination": [
                        "obj-pak-xyz",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-snapshot-z",
                        0
                    ],
                    "destination": [
                        "obj-pak-xyz",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen-dbap",
                        0
                    ],
                    "destination": [
                        "obj-mc-meter",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen-dbap",
                        0
                    ],
                    "destination": [
                        "obj-mcdac",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-chaos-speed",
                        0
                    ],
                    "destination": [
                        "obj-99",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-99",
                        0
                    ],
                    "destination": [
                        "obj-chaos",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-97",
                        0
                    ],
                    "destination": [
                        "obj-100",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-100",
                        0
                    ],
                    "destination": [
                        "obj-chaos-speed",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-chaos-sys",
                        0
                    ],
                    "destination": [
                        "obj-102",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-102",
                        0
                    ],
                    "destination": [
                        "obj-chaos",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-97",
                        0
                    ],
                    "destination": [
                        "obj-103",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-103",
                        0
                    ],
                    "destination": [
                        "obj-chaos-sys",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-2",
                        0
                    ],
                    "destination": [
                        "obj-105",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-chaos",
                        2
                    ],
                    "destination": [
                        "obj-105",
                        3
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-chaos",
                        1
                    ],
                    "destination": [
                        "obj-105",
                        2
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-chaos",
                        0
                    ],
                    "destination": [
                        "obj-105",
                        1
                    ],
                    "order": 2
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-105",
                        0
                    ],
                    "destination": [
                        "obj-gen-dbap",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-att-blur",
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
                        "obj-gen-dbap",
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
                        "obj-att-blur",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-att-focus",
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
                        "obj-gen-dbap",
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
                        "obj-att-focus",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-att-roll",
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
                        "obj-gen-dbap",
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
                        "obj-att-roll",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-att-room",
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
                        "obj-gen-dbap",
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
                        "obj-att-room",
                        0
                    ],
                    "order": 0
                }
            }
        ],
        "autosave": 0
    }
}