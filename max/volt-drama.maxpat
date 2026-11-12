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
                    "id": "obj-12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        43.0,
                        134.0,
                        35.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        28.0,
                        56.0,
                        496.0,
                        47.0
                    ],
                    "fontsize": 18.0,
                    "linecount": 2,
                    "text": "2 models of saturations blended in a delay and unison\nDual-Stage Distortion, 24dB Moog Ladder & Recursive Delay"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        28.0,
                        7.0,
                        177.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "volt drama"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        43.0,
                        175.0,
                        255.0,
                        98.0
                    ],
                    "clipheight": 97.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u704008411",
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
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        116.0,
                        454.0,
                        70.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        43.0,
                        546.0,
                        45.0,
                        45.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        116.0,
                        488.0,
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
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                0.5,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                250.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                20000.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                0.35,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-13",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-15",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                -9.0
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                20000.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                0.4900000000000001,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                0.15000000000000002,
                                5,
                                "obj-13",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-15",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                -9.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                0.30000000000000004,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                6000.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                0.35,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-13",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-15",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                25.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                -9.0
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        43.0,
                        392.0,
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
                            "parameter_modmode": 3,
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
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "patching_rect": [
                        43.0,
                        322.0,
                        131.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "sourcecode": "// volt-drama: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/volt-drama.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// VOLT-DRAMA: high-grit distortion, Moog-style ladder and evolving drone delay\n// (gen~: gendsp/volt-drama.gendsp)\n//\n// Each channel: the input plus a two-tap delay (main tap and a \"ghost\" tap at\n// 0.618 of the time, mixed in when the feedback is low) goes through a blend of\n// two waveshapers (shape: 0 = polynomial \"warm\", 1 = Tarrabia diode clipper),\n// a DC blocker, -9 dB, and four one-pole low-passes (cutoff). The filtered\n// signal, tanh-saturated and scaled by feedback^2 * 1.15 (ducked to 20% when\n// the input envelope exceeds 0.6), is written back into the delay. A 4-voice\n// unison (short delays modulated at 0.13, 0.21, 0.37, 0.49 Hz) widens the\n// filtered mono sum; then dry/wet, gainout before a final tanh, DC blocker.\n// time, spread, uni_detune and feedback glide (gen slide, 2000/3000 samples).\n//\n// in1, in2: audio      out1, out2: audio\n// Parameters as the gendsp: drive, shape, feedback (0..1), time (ms), spread\n// (ms), cutoff (Hz), mix_global (%; the gendsp asks name=\"mix\", but the export\n// and the maxpat call it mix_global), gainout (dB), uni_mix, uni_detune, uni_width (%).\n\ndeclare name \"volt-drama\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\ndrive = hslider(\"drive\", 0.3, 0, 1, 0.001);\nshape = hslider(\"shape\", 0.5, 0, 1, 0.001);\nfeedback = hslider(\"feedback\", 0.4, 0, 1, 0.001);\ntime = hslider(\"time [unit:ms]\", 250, 1, 1000, 0.01);\nspread = hslider(\"spread [unit:ms]\", 10, 0, 50, 0.01);\ncutoff = hslider(\"cutoff [unit:Hz]\", 20000, 50, 20000, 0.1);\nmix_global = hslider(\"mix_global [unit:%]\", 50, 0, 100, 0.01);\ngainout = hslider(\"gainout [unit:dB]\", 0, -60, 12, 0.01);\nuni_mix = hslider(\"uni_mix [unit:%]\", 50, 0, 100, 0.01);\nuni_detune = hslider(\"uni_detune [unit:%]\", 30, 0, 100, 0.01);\nuni_width = hslider(\"uni_width [unit:%]\", 100, 0, 100, 0.01);\n\nTWOPI = 6.2831853071795862;\nDMAX = 48000;   // Delay delayL(48000), delayR(48000)\nUMAX = 2400;    // Delay uni_d1..4(2400)\n\n// genlib slide(x, up, down), state starting at 0\nslide = g.slide;\n\npoly_shaper(x, drive_val) = (m / (b + 1)) * 2\nwith { m = x * drive_val; b = (m * m) * 0.28; };\n\ntarrabia_shaper(x, drive_val) = (((1 + k) * x) / (1 + k * abs(x))) * 0.78\nwith { d = min(0.95, drive_val); k = (2 * d) / (1 - d); };\n\n// one-pole stage: History h = fixdenorm(lp), lp = mix(h, x, alpha) (lp, unfixed, goes on)\nstage(alpha, x) = g.mix(h', x, alpha)\nwith { h = (\\(hp).(g.fixdenorm(g.mix(hp, x, alpha)))) ~ _; };\nladder(alpha) = stage(alpha) : stage(alpha) : stage(alpha) : stage(alpha);\n\n// unison phase: h = wrap(h + f/sr, 0, 1)\nuph(f) = (\\(h).(g.wrap(0, 1, h + f / ma.SR))) ~ _;\n\n// one frame: the delay inputs fed back (already delayed by one sample) and the\n// audio inputs -> the delay inputs written, out1, out2\ncore(wLd, wRd, in1, in2) = wL, wR, out1, out2\nwith {\n    s_time = slide(2000, 2000, time);\n    s_spread = slide(2000, 2000, spread);\n    s_detune = slide(2000, 2000, uni_detune);\n    s_fb = slide(3000, 3000, feedback);\n\n    fb_amount = g.safepow(s_fb, 2) * 1.15;\n    ghost_amt = g.clamp(0, 0.4, 1.0 - s_fb * 1.5);\n    alpha = g.clamp(0.0001, 1.0, 1.0 - exp((-6.2831853071795862 * cutoff) / ma.SR));\n    d_samps = s_time * (ma.SR * 0.001);\n    spr_samps = s_spread * (ma.SR * 0.001);\n    wet_gain = 0.35481338923357547;   // dbtoa(-9), as the export folds it\n    final_amp = g.dbtoa(gainout);\n\n    // delay reads before the writes of the frame\n    tapL_main = g.rd_linear_fb(DMAX, DMAX, wLd, d_samps);\n    tapR_main = g.rd_linear_fb(DMAX, DMAX, wRd, d_samps + spr_samps);\n    tapL_ghost = g.rd_linear_fb(DMAX, DMAX, wLd, d_samps * 0.618);\n    tapR_ghost = g.rd_linear_fb(DMAX, DMAX, wRd, (d_samps + spr_samps) * 0.618);\n    tapL_sum = g.mix(tapL_main, tapL_ghost, ghost_amt);\n    tapR_sum = g.mix(tapR_main, tapR_ghost, ghost_amt);\n\n    h_env = (\\(h).(g.mix(abs(in1 + in2) * 0.5, h, 0.1))) ~ _;\n    duck_f = select2(h_env > 0.6, 1.0, 0.2);\n    final_fb_gain = fb_amount * duck_f;\n\n    procL = in1 + tapL_sum;\n    procR = in2 + tapR_sum;\n    d_val = drive * 8;\n    shaper(x) = g.mix(poly_shaper(x, d_val), tarrabia_shaper(x, d_val), shape);\n    cleanL = g.dcblock(shaper(procL)) * wet_gain;\n    cleanR = g.dcblock(shaper(procR)) * wet_gain;\n\n    filt_L = cleanL : ladder(alpha);\n    filt_R = cleanR : ladder(alpha);\n\n    u_depth = (s_detune * 0.2) * (ma.SR * 0.001);\n    u_width = uni_width * 0.01;\n    mono_in = (filt_L + filt_R) * 0.5;\n    // the unison delays are written before they are read: minimum delay 0\n    voice(ms, f) = g.rd_linear(4096, UMAX, 0, mono_in,\n                               ms * (ma.SR * 0.001) + sin(uph(f) * TWOPI) * u_depth);\n    v1 = voice(10, 0.13);\n    v2 = voice(15, 0.21);\n    v3 = voice(12, 0.37);\n    v4 = voice(18, 0.49);\n    u_L = (v1 + v2 * 0.5) + (v3 * (1 - u_width)) * 0.5;\n    u_R = (v4 + v3 * 0.5) + (v2 * (1 - u_width)) * 0.5;\n    wet_final_L = g.mix(filt_L, u_L, uni_mix * 0.01);\n    wet_final_R = g.mix(filt_R, u_R, uni_mix * 0.01);\n\n    wL = g.fixdenorm(ma.tanh(filt_L * final_fb_gain));\n    wR = g.fixdenorm(ma.tanh(filt_R * final_fb_gain));\n\n    m_val = mix_global * 0.01;\n    out_pre_L = ma.tanh(g.mix(in1, wet_final_L, m_val) * final_amp);\n    out_pre_R = ma.tanh(g.mix(in2, wet_final_R, m_val) * final_amp);\n    dc(s) = (\\(y).((s - s') + 0.995 * y)) ~ _;\n    out1 = dc(out_pre_L);\n    out2 = dc(out_pre_R);\n};\n\ndrama = core ~ (_, _) : !, !, _, _;\n\nprocess = drama;\ndet = drama;\n",
                    "sourcecode_size": 17533,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_volt_drama"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        243.0,
                        352.0,
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
                    "id": "obj-28",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        175.0,
                        60.0,
                        22.0
                    ],
                    "text": "drive"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        397.0,
                        175.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0,
                    "bgcolor": [
                        0.5372549019607843,
                        0.3568627450980392,
                        0.3568627450980392,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        397.0,
                        199.0,
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
                    "id": "obj-30",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        522.0,
                        199.0,
                        90,
                        22
                    ],
                    "text": "set 0.3",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        350.0,
                        65.0,
                        22.0
                    ],
                    "text": "uni_mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        402.0,
                        350.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.44313725490196076,
                        0.43529411764705883,
                        0.22745098039215686,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        402.0,
                        374.0,
                        120,
                        22
                    ],
                    "text": "prepend uni_mix",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        527.0,
                        374.0,
                        90,
                        22
                    ],
                    "text": "set 50.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        374.0,
                        86.0,
                        22.0
                    ],
                    "text": "uni_detune (%)"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        423.0,
                        374.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.44313725490196076,
                        0.43529411764705883,
                        0.22745098039215686,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        423.0,
                        398.0,
                        120,
                        22
                    ],
                    "text": "prepend uni_detune",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        548.0,
                        398.0,
                        90,
                        22
                    ],
                    "text": "set 30.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        397.0,
                        79.0,
                        22.0
                    ],
                    "text": "uni_width (%)"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        416.0,
                        397.0,
                        71.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.44313725490196076,
                        0.43529411764705883,
                        0.22745098039215686,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        416.0,
                        421.0,
                        120,
                        22
                    ],
                    "text": "prepend uni_width",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        541.0,
                        421.0,
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
                    "id": "obj-40",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        134.0,
                        86.0,
                        22.0
                    ],
                    "text": "mix_global (%)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        423.0,
                        134.0,
                        64.0,
                        22.0
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
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        423.0,
                        158.0,
                        120,
                        22
                    ],
                    "text": "prepend mix_global",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        548.0,
                        158.0,
                        90,
                        22
                    ],
                    "text": "set 50.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        442.0,
                        65.0,
                        22.0
                    ],
                    "text": "gainout (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        402.0,
                        442.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -60.0,
                    "maximum": 12.0
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        402.0,
                        466.0,
                        120,
                        22
                    ],
                    "text": "prepend gainout",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        527.0,
                        466.0,
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
                    "id": "obj-46",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        199.0,
                        60.0,
                        22.0
                    ],
                    "text": "shape"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        397.0,
                        199.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0,
                    "bgcolor": [
                        0.5372549019607843,
                        0.3568627450980392,
                        0.3568627450980392,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        397.0,
                        223.0,
                        120,
                        22
                    ],
                    "text": "prepend shape",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        522.0,
                        223.0,
                        90,
                        22
                    ],
                    "text": "set 0.5",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        237.0,
                        60.0,
                        22.0
                    ],
                    "text": "time (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        397.0,
                        237.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 1.0,
                    "maximum": 1000.0,
                    "bgcolor": [
                        0.38823529411764707,
                        0.4627450980392157,
                        0.3254901960784314,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        397.0,
                        261.0,
                        120,
                        22
                    ],
                    "text": "prepend time",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        522.0,
                        261.0,
                        90,
                        22
                    ],
                    "text": "set 250.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        262.0,
                        60.0,
                        22.0
                    ],
                    "text": "cutoff (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        397.0,
                        262.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 50.0,
                    "maximum": 20000.0,
                    "bgcolor": [
                        0.38823529411764707,
                        0.4627450980392157,
                        0.3254901960784314,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        397.0,
                        286.0,
                        120,
                        22
                    ],
                    "text": "prepend cutoff",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        522.0,
                        286.0,
                        90,
                        22
                    ],
                    "text": "set 20000.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        287.0,
                        72.0,
                        22.0
                    ],
                    "text": "feedback"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        409.0,
                        287.0,
                        78.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0,
                    "bgcolor": [
                        0.38823529411764707,
                        0.4627450980392157,
                        0.3254901960784314,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        409.0,
                        311.0,
                        120,
                        22
                    ],
                    "text": "prepend feedback",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        534.0,
                        311.0,
                        90,
                        22
                    ],
                    "text": "set 0.4",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        337.0,
                        311.0,
                        60.0,
                        22.0
                    ],
                    "text": "spread (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        397.0,
                        311.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 50.0,
                    "bgcolor": [
                        0.38823529411764707,
                        0.4627450980392157,
                        0.3254901960784314,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        397.0,
                        335.0,
                        120,
                        22
                    ],
                    "text": "prepend spread",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        522.0,
                        335.0,
                        90,
                        22
                    ],
                    "text": "set 10.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        43.0,
                        274.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen volt-drama replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/volt-drama.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/volt-drama.maxpat.",
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
                        "obj-10",
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
                        "obj-10",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-10",
                        1
                    ],
                    "destination": [
                        "obj-14",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-10",
                        0
                    ],
                    "destination": [
                        "obj-14",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-11",
                        0
                    ],
                    "destination": [
                        "obj-18",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-12",
                        0
                    ],
                    "destination": [
                        "obj-19",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-18",
                        2
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-18",
                        2
                    ],
                    "destination": [
                        "obj-19",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-19",
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
                        "obj-19",
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
                        "obj-13",
                        0
                    ],
                    "destination": [
                        "obj-29",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-29",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-30",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-30",
                        0
                    ],
                    "destination": [
                        "obj-13",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-15",
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
                        "obj-32",
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
                        "obj-27",
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
                        "obj-33",
                        0
                    ],
                    "destination": [
                        "obj-15",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-16",
                        0
                    ],
                    "destination": [
                        "obj-35",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-36",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-36",
                        0
                    ],
                    "destination": [
                        "obj-16",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-17",
                        0
                    ],
                    "destination": [
                        "obj-38",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-38",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-39",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-17",
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
                        "obj-41",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-41",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-42",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-42",
                        0
                    ],
                    "destination": [
                        "obj-2",
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
                        "obj-44",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-44",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-45",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-45",
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
                        "obj-3",
                        0
                    ],
                    "destination": [
                        "obj-47",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-47",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-48",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-48",
                        0
                    ],
                    "destination": [
                        "obj-3",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-4",
                        0
                    ],
                    "destination": [
                        "obj-50",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-50",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-51",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-51",
                        0
                    ],
                    "destination": [
                        "obj-4",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-5",
                        0
                    ],
                    "destination": [
                        "obj-53",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-53",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-54",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-54",
                        0
                    ],
                    "destination": [
                        "obj-5",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        0
                    ],
                    "destination": [
                        "obj-56",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-56",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-57",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-57",
                        0
                    ],
                    "destination": [
                        "obj-6",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-7",
                        0
                    ],
                    "destination": [
                        "obj-59",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-59",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-60",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-60",
                        0
                    ],
                    "destination": [
                        "obj-7",
                        0
                    ],
                    "order": 0
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
        "openrectmode": 0,
        "parameters": {
            "obj-10": [
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