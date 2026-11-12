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
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        31.5,
                        106.0,
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
                    "id": "obj-15",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        31.5,
                        57.0,
                        423.0,
                        47.0
                    ],
                    "fontsize": 18.0,
                    "linecount": 2,
                    "text": "Sort of overdrive/ringmod. Simulates a dying battery\nVoltage-Starved Ring Modulator with Pitch Tracking"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        160.0,
                        489.0,
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
                    "id": "obj-13",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        160.0,
                        524.0,
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
                                "obj-21",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-53",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-54",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                -6.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                400.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                800.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                0.05
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-53",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-54",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                -16.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                400.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                800.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-53",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-54",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                -16.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                400.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                2500.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-53",
                                "flonum",
                                "float",
                                0.25,
                                5,
                                "obj-54",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                90.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                -16.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                44.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                900.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                400.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                4000.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                0.07
                            ]
                        },
                        {
                            "number": 5,
                            "data": [
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                12.0,
                                5,
                                "obj-53",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-54",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                95.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                63.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                6.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                -10.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                207.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                400.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                250.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                0.4
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        31.5,
                        133.0,
                        329.0,
                        41.0
                    ],
                    "clipheight": 40.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u814008767",
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
                    "id": "obj-26",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        31.5,
                        5.0,
                        191.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "volt syphon"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        31.0,
                        469.0,
                        97.0,
                        95.0
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
                    "relative": 1,
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
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        31.0,
                        571.0,
                        35.0,
                        22.0
                    ],
                    "text": "dac~"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "patching_rect": [
                        31.0,
                        435.0,
                        136.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "sourcecode": "// volt-syphon: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/volt-syphon.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// VOLT-SYPHON: \"starving battery\" dual-engine ring modulator (gen~: gendsp/volt-syphon.gendsp)\n//\n// A ring modulator simulating a dying battery. Two internal carriers: a fixed\n// sine (freq_main, level freq_main_amp) and a sine whose pitch follows the\n// amplitude of in1 between freq_min and freq_max; autofollow crossfades them.\n// The carrier is gated off when in1 is silent. Each channel goes through an\n// envelope gate (threshold `gate`, jittered by `instability` noise), a sag\n// (tanh drop of the gate envelope), a tone low-pass on the envelope, an\n// envelope compressor with makeup, gainout and a tanh clip, a DC blocker, and\n// a dry/wet mix. selfmod mixes the input itself into the carrier.\n//\n// in1: audio in (modulator)   in2: audio in right (carrier with selfmod)\n// out1, out2: modulated audio\n// Parameters as the gendsp: freq_main, freq_main_amp, freq_min, freq_max,\n// autofollow, sag, gate, instability, compression, selfmod, tone, mix,\n// gainout, and the technical rise, fall (envelope ms) and gate_gainin.\n\ndeclare name \"volt-syphon\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nfreq_main = hslider(\"freq_main [unit:Hz]\", 800, 20, 5000, 0.01);\nfreq_main_amp = hslider(\"freq_main_amp\", 0.05, 0, 1, 0.001);\nfreq_min = hslider(\"freq_min [unit:Hz]\", 80, 20, 2000, 0.01);\nfreq_max = hslider(\"freq_max [unit:Hz]\", 800, 20, 5000, 0.01);\nautofollow = hslider(\"autofollow [unit:%]\", 0, 0, 100, 0.01);\nmix = hslider(\"mix [unit:%]\", 100, 0, 100, 0.01);\ngate = hslider(\"gate [unit:%]\", 0, 0, 100, 0.01);\nsag = hslider(\"sag [unit:%]\", 0, 0, 100, 0.01);\ntone = hslider(\"tone [unit:%]\", 50, 0, 100, 0.01);\ninstability = hslider(\"instability [unit:%]\", 20, 0, 100, 0.01);\ncompression = hslider(\"compression [unit:%]\", 50, 0, 100, 0.01);\nselfmod = hslider(\"selfmod [unit:%]\", 0, 0, 100, 0.01);\ngainout = hslider(\"gainout [unit:dB]\", 0, -60, 12, 0.01);\nrise = hslider(\"rise [unit:ms]\", 2, 2, 2000, 0.01);\nfall = hslider(\"fall [unit:ms]\", 500, 2, 2000, 0.01);\ngate_gainin = hslider(\"gate_gainin\", 3, 0, 15, 0.01);\n\nTWOPI = 6.2831853071795862;\n\n// h += inc; if (h > 1) h -= 1\nph(inc) = (\\(h).(select2(h + inc > 1, h + inc, (h + inc) - 1))) ~ _;\n// one-pole History: h = mix(x, h, a)\nonepole(a, x) = (\\(h).(g.mix(x, h, a))) ~ _;\n// t60(mstosamps(ms)) as the export computes it\nt60ms(ms) = exp(-6.9077552789821368 / (ms * (ma.SR * 0.001)));\n\n// one channel of gate / sag / tone: returns h_lp\nenvelope(d_gate, input_presence, src) = env : lp\nwith {\n    is_above = (abs(src) > d_gate) & input_presence;\n    t = select2(is_above, 0, g.mix(1.0, ma.tanh(src - d_gate), sag * 0.01));\n    env = (\\(h).(g.fixdenorm(g.mix(t, h, g.clamp(0, 1,\n            t60ms(max(select2(t > h, fall, rise), 1))))))) ~ _;\n    lp(e) = (\\(h).(g.mix(e, h, g.clamp(0.01, 1, 1 - ((tone * 0.01) * (1 - e)))))) ~ _;\n};\n\nsyphon(nz, in1, in2) = out1, out2\nwith {\n    main_sine = sin(ph(freq_main / ma.SR) * TWOPI) * freq_main_amp;\n    h_pitch_env = onepole(0.995, abs(in1) * gate_gainin);\n    p_norm = g.clamp(0, 1, h_pitch_env);\n    ratio = freq_max / max(freq_min, 1);\n    sweep_f = freq_min * g.safepow(ratio, p_norm);\n    sweep_sine = sin(ph(sweep_f / ma.SR) * TWOPI) * 0.4;\n    input_presence = abs(in1) > 0.0001;\n    carrier_base = g.mix(main_sine, sweep_sine, autofollow * 0.01) * select2(input_presence, 0, 1);\n\n    g_val = gate * 0.01;\n    h_drift = onepole(0.999, (nz * (instability * 0.01)) * 0.01);\n    d_gate = g.clamp(0, 1, g_val + h_drift);\n    v_scale = select2(gate <= 0, 0.6, 3.3);\n\n    carrier_L = g.mix(carrier_base, in1, selfmod * 0.01);\n    carrier_R = g.mix(carrier_base, in2, selfmod * 0.01);\n\n    h_lp_L = envelope(d_gate, input_presence, in1 * gate_gainin);\n    h_lp_R = envelope(d_gate, input_presence, in2 * gate_gainin);\n\n    comp_val = compression * 0.01;\n    mod_L = (carrier_L * h_lp_L) * v_scale;\n    mod_R = (carrier_R * h_lp_R) * v_scale;\n    wet(m) = (m / (1 + (onepole(0.99, abs(m)) * comp_val) * 10)) * (1 + comp_val * 4);\n    out_amp = g.dbtoa(gainout);\n    sig_L = ma.tanh(wet(mod_L) * out_amp);\n    sig_R = ma.tanh(wet(mod_R) * out_amp);\n    // dc = sig - sig' + 0.995*dc'\n    dc(s) = (\\(y).((s - s') + 0.995 * y)) ~ _;\n    out1 = g.mix(in1, dc(sig_L), mix * 0.01);\n    out2 = g.mix(in2, dc(sig_R), mix * 0.01);\n};\n\nprocess = syphon(g.noises(1, 0));\n// the port with its noise as an input, for scripts/test_gen.py: in1, in2, noise\ndet(in1, in2, nz) = syphon(nz, in1, in2);\n",
                    "sourcecode_size": 16576,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_volt_syphon"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        231.0,
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
                    "id": "obj-60",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        179.0,
                        141.0,
                        22.0
                    ],
                    "text": "mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        315.0,
                        179.0,
                        59.0,
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
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        315.0,
                        203.0,
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
                    "id": "obj-62",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        440.0,
                        203.0,
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
                    "id": "obj-63",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        304.0,
                        140.0,
                        22.0
                    ],
                    "text": "selfmod (%)"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        314.0,
                        304.0,
                        60.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.35294117647058826,
                        0.35294117647058826,
                        0.35294117647058826,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        314.0,
                        328.0,
                        120,
                        22
                    ],
                    "text": "prepend selfmod",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        439.0,
                        328.0,
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
                    "id": "obj-66",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        384.0,
                        258.0,
                        141.0,
                        22.0
                    ],
                    "text": "freq_min (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        525.0,
                        258.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 20.0,
                    "maximum": 2000.0,
                    "bgcolor": [
                        0.40784313725490196,
                        0.058823529411764705,
                        0.40784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        525.0,
                        282.0,
                        120,
                        22
                    ],
                    "text": "prepend freq_min",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        650.0,
                        282.0,
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
                    "id": "obj-69",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        364.0,
                        140.0,
                        22.0
                    ],
                    "text": "freq_main_amp"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        314.0,
                        364.0,
                        60.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0,
                    "bgcolor": [
                        0.17647058823529413,
                        0.17647058823529413,
                        0.3686274509803922,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        314.0,
                        388.0,
                        120,
                        22
                    ],
                    "text": "prepend freq_main_amp",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        439.0,
                        388.0,
                        90,
                        22
                    ],
                    "text": "set 0.05",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        340.0,
                        140.0,
                        22.0
                    ],
                    "text": "freq_main (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        314.0,
                        340.0,
                        60.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 20.0,
                    "maximum": 5000.0,
                    "bgcolor": [
                        0.17647058823529413,
                        0.17647058823529413,
                        0.3686274509803922,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        314.0,
                        364.0,
                        120,
                        22
                    ],
                    "text": "prepend freq_main",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        439.0,
                        364.0,
                        90,
                        22
                    ],
                    "text": "set 800.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        384.0,
                        300.0,
                        141.0,
                        22.0
                    ],
                    "text": "sag (%)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        525.0,
                        300.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.3686274509803922,
                        0.3568627450980392,
                        0.027450980392156862,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        525.0,
                        324.0,
                        120,
                        22
                    ],
                    "text": "prepend sag",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        650.0,
                        324.0,
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
                    "id": "obj-78",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        255.0,
                        141.0,
                        22.0
                    ],
                    "text": "rise (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        315.0,
                        255.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 2.0,
                    "maximum": 2000.0,
                    "bgcolor": [
                        0.35294117647058826,
                        0.35294117647058826,
                        0.35294117647058826,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        315.0,
                        279.0,
                        120,
                        22
                    ],
                    "text": "prepend rise",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        440.0,
                        279.0,
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
                    "id": "obj-81",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        279.0,
                        141.0,
                        22.0
                    ],
                    "text": "fall (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        315.0,
                        279.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 2.0,
                    "maximum": 2000.0,
                    "bgcolor": [
                        0.35294117647058826,
                        0.35294117647058826,
                        0.35294117647058826,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        315.0,
                        303.0,
                        120,
                        22
                    ],
                    "text": "prepend fall",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        440.0,
                        303.0,
                        90,
                        22
                    ],
                    "text": "set 500.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        384.0,
                        326.0,
                        141.0,
                        22.0
                    ],
                    "text": "tone (%)"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        525.0,
                        326.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.3686274509803922,
                        0.3568627450980392,
                        0.027450980392156862,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        525.0,
                        350.0,
                        120,
                        22
                    ],
                    "text": "prepend tone",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        650.0,
                        350.0,
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
                    "id": "obj-87",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        408.0,
                        140.0,
                        22.0
                    ],
                    "text": "compression (%)"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        314.0,
                        408.0,
                        60.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.09411764705882353,
                        0.3333333333333333,
                        0.19607843137254902,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        314.0,
                        432.0,
                        120,
                        22
                    ],
                    "text": "prepend compression",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        439.0,
                        432.0,
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
                    "id": "obj-90",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        384.0,
                        353.0,
                        140.0,
                        22.0
                    ],
                    "text": "instability (%)"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        524.0,
                        353.0,
                        60.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.3686274509803922,
                        0.3568627450980392,
                        0.027450980392156862,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        524.0,
                        377.0,
                        120,
                        22
                    ],
                    "text": "prepend instability",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        649.0,
                        377.0,
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
                    "id": "obj-93",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        230.0,
                        140.0,
                        22.0
                    ],
                    "text": "gate (%)"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        314.0,
                        230.0,
                        60.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.35294117647058826,
                        0.35294117647058826,
                        0.35294117647058826,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        314.0,
                        254.0,
                        120,
                        22
                    ],
                    "text": "prepend gate",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        439.0,
                        254.0,
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
                    "id": "obj-96",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        205.0,
                        141.0,
                        22.0
                    ],
                    "text": "gate_gainin"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        315.0,
                        205.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 15.0,
                    "bgcolor": [
                        0.35294117647058826,
                        0.35294117647058826,
                        0.35294117647058826,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        315.0,
                        229.0,
                        120,
                        22
                    ],
                    "text": "prepend gate_gainin",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        440.0,
                        229.0,
                        90,
                        22
                    ],
                    "text": "set 3.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        174.0,
                        432.0,
                        140.0,
                        22.0
                    ],
                    "text": "gainout (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        314.0,
                        432.0,
                        60.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -60.0,
                    "maximum": 12.0,
                    "bgcolor": [
                        0.09411764705882353,
                        0.3333333333333333,
                        0.19607843137254902,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        314.0,
                        456.0,
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
                    "id": "obj-101",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        439.0,
                        456.0,
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
                    "id": "obj-102",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        384.0,
                        232.0,
                        141.0,
                        22.0
                    ],
                    "text": "freq_max (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        525.0,
                        232.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 20.0,
                    "maximum": 5000.0,
                    "bgcolor": [
                        0.40784313725490196,
                        0.058823529411764705,
                        0.40784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        525.0,
                        256.0,
                        120,
                        22
                    ],
                    "text": "prepend freq_max",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        650.0,
                        256.0,
                        90,
                        22
                    ],
                    "text": "set 800.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        384.0,
                        206.0,
                        141.0,
                        22.0
                    ],
                    "text": "autofollow (%)"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        525.0,
                        206.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.40784313725490196,
                        0.058823529411764705,
                        0.40784313725490196,
                        1.0
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
                        525.0,
                        230.0,
                        120,
                        22
                    ],
                    "text": "prepend autofollow",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        650.0,
                        230.0,
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
                    "id": "obj-108",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        31.0,
                        387.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen volt-syphon replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/volt-syphon.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/volt-syphon.maxpat.",
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
                        "obj-11",
                        1
                    ],
                    "destination": [
                        "obj-7",
                        1
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
                        "obj-7",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-13",
                        2
                    ],
                    "destination": [
                        "obj-11",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-13",
                        2
                    ],
                    "destination": [
                        "obj-57",
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
                        0
                    ],
                    "destination": [
                        "obj-11",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-5",
                        0
                    ],
                    "destination": [
                        "obj-13",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-57",
                        1
                    ],
                    "destination": [
                        "obj-31",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-57",
                        0
                    ],
                    "destination": [
                        "obj-31",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-7",
                        1
                    ],
                    "destination": [
                        "obj-57",
                        1
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
                        "obj-57",
                        0
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
                        "obj-61",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-61",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-62",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-62",
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
                        "obj-12",
                        0
                    ],
                    "destination": [
                        "obj-64",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-64",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-65",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-65",
                        0
                    ],
                    "destination": [
                        "obj-12",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-14",
                        0
                    ],
                    "destination": [
                        "obj-67",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-67",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-68",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-68",
                        0
                    ],
                    "destination": [
                        "obj-14",
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
                        "obj-70",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-70",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-71",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-71",
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
                        "obj-73",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-74",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-74",
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
                        "obj-76",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-76",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-77",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-77",
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
                        "obj-21",
                        0
                    ],
                    "destination": [
                        "obj-79",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-79",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-80",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-80",
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
                        "obj-82",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-82",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-83",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-83",
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
                        "obj-85",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-85",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-86",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-86",
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
                        "obj-88",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-88",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-89",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-89",
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
                        "obj-53",
                        0
                    ],
                    "destination": [
                        "obj-91",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-91",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-92",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-92",
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
                        "obj-54",
                        0
                    ],
                    "destination": [
                        "obj-94",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-94",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-95",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-95",
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
                        "obj-58",
                        0
                    ],
                    "destination": [
                        "obj-97",
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
                        "obj-7",
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
                        "obj-98",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-98",
                        0
                    ],
                    "destination": [
                        "obj-58",
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
                        "obj-7",
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
                        "obj-101",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-101",
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
                        "obj-8",
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
                        "obj-7",
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
                        "obj-104",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-104",
                        0
                    ],
                    "destination": [
                        "obj-8",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-9",
                        0
                    ],
                    "destination": [
                        "obj-106",
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
                        "obj-7",
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
                        "obj-107",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-107",
                        0
                    ],
                    "destination": [
                        "obj-9",
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
            "obj-57": [
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