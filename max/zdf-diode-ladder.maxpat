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
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        112.0,
                        105.0,
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
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        112.0,
                        129.0,
                        334.0,
                        59.0
                    ],
                    "clipheight": 28.5,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "drumLoop.aif",
                                "filename": "drumLoop.aif",
                                "filekind": "audiofile",
                                "id": "u764007122",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            },
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u571007144",
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
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        254.0,
                        464.0,
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
                    "id": "obj-20",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        254.0,
                        494.0,
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
                                "obj-8",
                                "playlist~",
                                "preset_count",
                                2,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "drumLoop.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "drumLoop.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u764007122",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u571007144",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-8",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                1200.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                0.75,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.0
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-8",
                                "playlist~",
                                "preset_count",
                                2,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "drumLoop.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "drumLoop.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u764007122",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u571007144",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-8",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                576.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                0.8500000000000002,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                16.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-1",
                                "attrui",
                                "attr",
                                "h_env",
                                5,
                                "obj-1",
                                "attrui",
                                "float",
                                5.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-8",
                                "playlist~",
                                "preset_count",
                                2,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "drumLoop.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "drumLoop.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u764007122",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u571007144",
                                7,
                                "obj-8",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-8",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                250.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                0.7,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-1",
                                "attrui",
                                "attr",
                                "h_env",
                                5,
                                "obj-1",
                                "attrui",
                                "float",
                                10.0
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        20.0,
                        522.0,
                        47.0
                    ],
                    "fontface": 0,
                    "fontsize": 36.0,
                    "text": "ZDF TB-303 Diode Ladder Filter"
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
                        65.0,
                        416.0,
                        24.0
                    ],
                    "fontface": 0,
                    "fontsize": 16.0,
                    "text": "classic Roland TB-303 4-stage diode ladder lowpass filter"
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        112.0,
                        542.0,
                        45.0,
                        45.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-gain",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        112.0,
                        372.0,
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
                                -70
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
                    "id": "obj-gen",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "patching_rect": [
                        112.0,
                        327.0,
                        178.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "sourcecode": "// zdf-diode-ladder: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/zdf-diode-ladder.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// ZDF-DIODE-LADDER: stereo zero-delay-feedback TB-303 style diode ladder\n// (gen~: gendsp/zdf-diode-ladder.gendsp)\n//\n// A 4-pole TPT low-pass ladder per channel (stage gains G, 0.9 G, 0.8 G,\n// 0.7 G), its feedback solved by a linear predictor and shaped by a tanh, a\n// tanh input drive, and a ~40 Hz one-pole high-pass on the output. A stereo\n// envelope follower (1.5 ms attack, 55 ms release) sweeps the cutoff by up to\n// +-5 octaves (env_mod) and adds an accent (cutoff punch, resonance, drive).\n//\n// in1, in2: audio L, R      out1, out2: filtered L, R\n//\n// cutoff (Hz), resonance (0..1.2, k = 4.2 x), drive (%), env_mod (-100..100 %),\n// accent (%).\n//\n// As in gen: the predictor is not the exact ZDF solution (y4 = G0G1G2G3 u\n// + sum of (1 - Gi)-weighted states): S_total uses the raw states and adds\n// G0G1G2G3*in_sat, so the feedback is an approximation; the accent also\n// raises the input drive statically (accent*0.03), whatever the envelope.\n\ndeclare name \"zdf-diode-ladder\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ngn = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\ncutoff = hslider(\"cutoff [unit:Hz]\", 1200, 20, 20000, 0.01);\nresonance = hslider(\"resonance\", 0.75, 0, 1.2, 0.001);\ndrive = hslider(\"drive [unit:%]\", 20, 0, 100, 0.01);\nenv_mod = hslider(\"env_mod [unit:%]\", 0, -100, 100, 0.01);\naccent = hslider(\"accent [unit:%]\", 0, 0, 100, 0.01);\n\n// x / SR as genlib divides (safediv(x, sr), sr != 0). Faust's normalizer\n// turns a division by the constant SR into a product by 1/SR, which is 1 ulp\n// off for about a quarter of the cutoffs; with k up to 4.9 the ladder\n// amplified that ulp of G to -180 dB transients. Dividing by\n// max(SR, x*1e-300), which is SR for any cutoff, keeps a true division.\ndivsr = gn.divsr;\n// an identity the normalizer does not see through (finite x): it keeps gen's\n// evaluation order where the normalizer would factor or reassociate\n// (x*a + x*b -> x*(a+b), constants folded across products, ns1 = 2 v0 + s1).\n// Without them the ladder, near self-oscillation, amplified those last-bit\n// differences to -180 dB transients; with them the default setting is\n// bit-exact and the others agree to -245 dB or better.\nkeep = gn.keep;\n\n// one channel: states s1..s4, h_in (the last y4), h_out (the last output)\ndiode_ladder(g0, g1, g2, g3, k, drive_gain, accent_amt, in_sig) =\n    (\\(s1, s2, s3, s4, h_in, h_out).(step(s1, s2, s3, s4, h_in, h_out))) ~ (_, _, _, _, _, _)\n    : (!, !, !, !, !, _)\nwith {\n    step(s1, s2, s3, s4, h_in, h_out) = ns1, ns2, ns3, ns4, y4, out_hpf\n    with {\n        in_sat = ma.tanh(in_sig * drive_gain);\n        S_total = g3 * keep(s3 + g2 * keep(s2 + g1 * keep(s1 + g0 * in_sat)));\n        denom = 1 + k * keep(keep(keep(g0 * g1) * g2) * g3);\n        u = gn.safediv(in_sat - k * keep(s4 + S_total), denom);\n        u_sat = ma.tanh(u * (1 + accent_amt * 0.02));\n        v0 = keep((u_sat - s1) * g0); y1 = keep(v0 + s1); ns1 = y1 + v0;\n        v1 = keep((y1 - s2) * g1); y2 = keep(v1 + s2); ns2 = y2 + v1;\n        v2 = keep((y2 - s3) * g2); y3 = keep(v2 + s3); ns3 = y3 + v2;\n        v3 = keep((y3 - s4) * g3); y4 = keep(v3 + s4); ns4 = y4 + v3;\n        out_hpf = keep(y4 - h_in) + 0.995 * h_out;\n    };\n};\n\nladder(in1, in2) = gn.fixdenorm(in1 : diode_ladder(g0, g1, g2, g3, k, drive_gain, accent)),\n                   gn.fixdenorm(in2 : diode_ladder(g0, g1, g2, g3, k, drive_gain, accent))\nwith {\n    env_in = max(abs(in1), abs(in2));\n    atk_c = 1 - exp(gn.safediv(-1, 0.0015 * ma.SR));\n    rel_c = 1 - exp(gn.safediv(-1, 0.055 * ma.SR));\n    h_env = (\\(e).(e + select2(env_in > e, rel_c, atk_c) * (env_in - e))) ~ _;\n    env_norm = gn.clamp(0, 1, gn.safepow(h_env * 2, 0.8));\n    acc_dyn = keep((accent * 0.01) * env_norm);\n    // keep the two products apart: the normalizer would factor env_norm out\n    mod_oct = keep(((env_mod * 0.01) * 5) * env_norm) + acc_dyn * 1.2;\n    mod_cutoff = gn.clamp(20, 20000, cutoff * gn.safepow(2, mod_oct));\n    norm_f = divsr(mod_cutoff) * 3.1415926535897931;\n    g = tan(gn.clamp(0.0001, 1.5, norm_f));\n    G = gn.safediv(g, 1 + g);\n    g0 = G;\n    g1 = keep(G * 0.9);\n    g2 = keep(G * 0.8);\n    g3 = keep(G * 0.7);\n    drive_gain = (1 + drive * 0.08) + accent * 0.03;\n    k = gn.clamp(0, 4.9, (resonance + acc_dyn * 0.22) * 4.2);\n};\n\nprocess = ladder;\n// no noise: det is the same program\ndet = ladder;\n",
                    "sourcecode_size": 16485,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_zdf_diode_ladder"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        312.0,
                        357.0,
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
                    "id": "obj-23",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        302.0,
                        337.0,
                        300.0,
                        22.0
                    ],
                    "text": "gen~ History 'h_env': internal state in Faust, not settable",
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
                    "id": "obj-24",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        302.0,
                        280.0,
                        60.0,
                        22.0
                    ],
                    "text": "accent (%)"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        362.0,
                        280.0,
                        90.0,
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
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        362.0,
                        304.0,
                        120,
                        22
                    ],
                    "text": "prepend accent",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        487.0,
                        304.0,
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
                    "id": "obj-27",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        302.0,
                        308.0,
                        65.0,
                        22.0
                    ],
                    "text": "env_mod (%)"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        367.0,
                        308.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -100.0,
                    "maximum": 100.0
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        367.0,
                        332.0,
                        120,
                        22
                    ],
                    "text": "prepend env_mod",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        492.0,
                        332.0,
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
                    "id": "obj-30",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        302.0,
                        197.0,
                        60.0,
                        22.0
                    ],
                    "text": "cutoff (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        362.0,
                        197.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 20.0,
                    "maximum": 20000.0
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        362.0,
                        221.0,
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
                    "id": "obj-32",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        487.0,
                        221.0,
                        90,
                        22
                    ],
                    "text": "set 1200.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        302.0,
                        224.0,
                        79.0,
                        22.0
                    ],
                    "text": "resonance"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        381.0,
                        224.0,
                        71.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.2
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        381.0,
                        248.0,
                        120,
                        22
                    ],
                    "text": "prepend resonance",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        506.0,
                        248.0,
                        90,
                        22
                    ],
                    "text": "set 0.75",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        302.0,
                        252.0,
                        60.0,
                        22.0
                    ],
                    "text": "drive (%)"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        362.0,
                        252.0,
                        90.0,
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
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        362.0,
                        276.0,
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
                    "id": "obj-38",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        487.0,
                        276.0,
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
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        112.0,
                        279.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen zdf-diode-ladder replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/zdf-diode-ladder.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/zdf-diode-ladder.maxpat.",
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
                        "obj-20",
                        2
                    ],
                    "destination": [
                        "obj-gain",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-21",
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
                        "obj-7",
                        0
                    ],
                    "destination": [
                        "obj-8",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-8",
                        1
                    ],
                    "destination": [
                        "obj-gen",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-8",
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
                        "obj-gain",
                        1
                    ],
                    "destination": [
                        "obj-ezdac",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gain",
                        0
                    ],
                    "destination": [
                        "obj-ezdac",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        1
                    ],
                    "destination": [
                        "obj-gain",
                        1
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
                        "obj-gain",
                        0
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
                        "obj-25",
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
                        "obj-gen",
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
                        "obj-26",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-26",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-11",
                        0
                    ],
                    "destination": [
                        "obj-28",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-28",
                        0
                    ],
                    "destination": [
                        "obj-gen",
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
                        "obj-11",
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
                        "obj-31",
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
                        "obj-gen",
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
                        "obj-2",
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
                        "obj-34",
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
                        "obj-gen",
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
                        "obj-4",
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
                        "obj-37",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-37",
                        0
                    ],
                    "destination": [
                        "obj-gen",
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
                        "obj-6",
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
            "obj-gain": [
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