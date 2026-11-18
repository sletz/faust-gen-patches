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
        "subpatcher_template": "maxb-default-template",
        "boxes": [
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        21.0,
                        725.0,
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
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        162.0,
                        685.0,
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
                    "id": "obj-3",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        162.0,
                        717.0,
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
                                "obj-80",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-79",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-78",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-77",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-76",
                                "flonum",
                                "float",
                                0.65,
                                5,
                                "obj-75",
                                "flonum",
                                "float",
                                0.7,
                                5,
                                "obj-74",
                                "flonum",
                                "float",
                                0.7,
                                5,
                                "obj-73",
                                "flonum",
                                "float",
                                0.8,
                                5,
                                "obj-72",
                                "flonum",
                                "float",
                                0.8,
                                5,
                                "obj-71",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                0.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                600.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                4.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                8.0,
                                5,
                                "obj-43",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-41",
                                "flonum",
                                "float",
                                12.0,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-57",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-56",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-49",
                                "flonum",
                                "float",
                                100.0,
                                6,
                                "obj-61",
                                "number~",
                                "list",
                                0.0,
                                0.0
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-80",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-79",
                                "flonum",
                                "float",
                                61.0,
                                5,
                                "obj-78",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-77",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-76",
                                "flonum",
                                "float",
                                0.65,
                                5,
                                "obj-75",
                                "flonum",
                                "float",
                                0.7,
                                5,
                                "obj-74",
                                "flonum",
                                "float",
                                0.7,
                                5,
                                "obj-73",
                                "flonum",
                                "float",
                                0.8,
                                5,
                                "obj-72",
                                "flonum",
                                "float",
                                0.8,
                                5,
                                "obj-71",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                1.1,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                1.2,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                1.3,
                                5,
                                "obj-43",
                                "flonum",
                                "float",
                                1.4,
                                5,
                                "obj-41",
                                "flonum",
                                "float",
                                1.5,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                35.0,
                                5,
                                "obj-57",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-56",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                1.0,
                                5,
                                "obj-49",
                                "flonum",
                                "float",
                                100.0,
                                6,
                                "obj-61",
                                "number~",
                                "list",
                                0.0,
                                0.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-80",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-79",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-78",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-77",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-76",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-75",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-74",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-73",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-72",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-71",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                1.1,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                1.2,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                1.3,
                                5,
                                "obj-43",
                                "flonum",
                                "float",
                                1.4,
                                5,
                                "obj-41",
                                "flonum",
                                "float",
                                1.5,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-57",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-56",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                1.0,
                                5,
                                "obj-49",
                                "flonum",
                                "float",
                                100.0,
                                6,
                                "obj-61",
                                "number~",
                                "list",
                                0.0,
                                0.0
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-80",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-79",
                                "flonum",
                                "float",
                                55.0,
                                5,
                                "obj-78",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-77",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-76",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-75",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-74",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-73",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-72",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-71",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                85.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                1.1,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                1.2,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                1.3,
                                5,
                                "obj-43",
                                "flonum",
                                "float",
                                1.4,
                                5,
                                "obj-41",
                                "flonum",
                                "float",
                                1.5,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-58",
                                "flonum",
                                "float",
                                65.0,
                                5,
                                "obj-57",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-56",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                1.0,
                                5,
                                "obj-49",
                                "flonum",
                                "float",
                                70.0,
                                6,
                                "obj-61",
                                "number~",
                                "list",
                                0.0,
                                0.0
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        197.0,
                        624.0,
                        94.0,
                        20.0
                    ],
                    "text": "active delay line"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        24.0,
                        6.0,
                        102.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "Driller"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        24.0,
                        72.0,
                        669.0,
                        114.0
                    ],
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "linecount": 6,
                    "text": "Dynamic stutter, glitch repeater, etc\nDivides a fundamental delay period (maindelay) into 5 integer or fractional subdivisions. On every cycle wrap of the fundamental clock, a stochastic Bernoulli trial selects between the normal delay tap, one of the rapid drill subdivisions, or momentary silence/dropout (mute_prob). Cubic Hermite interpolation and anti-click slew filters ensure smooth, click-free glitch transitions."
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "number~",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        132.0,
                        623.0,
                        56.0,
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
                    "id": "obj-33",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        47.0,
                        207.0,
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
                    "id": "obj-34",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        47.0,
                        623.0,
                        62.0,
                        93.0
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
                    "showname": 0,
                    "varname": "live.gain~"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 5,
                    "patching_rect": [
                        47.0,
                        585.0,
                        104.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "varname": "faust_driller",
                    "sourcecode": "// driller: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/driller.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// DRILLER: stochastic beat-repeat / drill delay (gen~: gendsp/driller.gendsp)\n//\n// The input plus a feedback of the drill (tanh(1.05 x) `feedback`, at most\n// 0.95) is written into a 192000-sample Delay per channel. A beat clock of\n// period `maindelay` ms (+ in3) refreshes, at each beat (in modes 0 and 1)\n// or when `mode` changes: the ping-pong side toggles, a draw decides\n// whether this beat is degraded (`degrade_prob`, if `degrade` > 0.5), and\n// unless `probability` (+ in4) is 0, a draw against it picks a new tap: a\n// rest (`mute_prob`) or one of the six taps (1: the main period, 2..6: the\n// period divided by div2..div6) with a pan jitter (`pan_spread`); otherwise\n// the tap is kept. The slice length becomes floor(period / ratio) (at least\n// 2 samples), and the read head (4-point cubic) loops it: after each slice\n// the delay grows by the slice length, so the same audio repeats, with\n// 1.5 ms raised-cosine fades at the seams. Each tap has a gain (vol1..vol6)\n// crossfaded by one-pole weights (0.05 per sample); the right read is\n// `stereo_spread` x 12 ms further. Then a pan by tap (slewed, 0.03), an\n// adaptive one-pole high-pass (20 Hz + 45 Hz per ratio step, `roll_filter`),\n// a lo-fi stage (decimation by up to 25, bit crush down to 3 bits, drive)\n// faded in by `degrade` on degraded beats, the dry (mode 0 only) and `mix`.\n//\n// in1, in2: audio L, R    in3: main delay CV (ms, added to maindelay)\n// in4: probability CV (%, added to probability)\n// out1, out2: processed L, R\n// out3: the current tap (0 rest, 1 main, 2..6 the divisions)\n//\n// Parameters (gen~'s ranges and defaults): maindelay (10..4000 ms, 500),\n// div2..div6 (1..32: 2, 4, 8, 10, 12), vol1..vol6 (0..3: 1, 0.8, 0.8, 0.7,\n// 0.7, 0.65), probability (0..100 %, 75), mute_prob (0..100 %, 10),\n// feedback (0..100 %, 60), stereo_spread (0..100 %, 30),\n// pan_spread (0..100 %, 50), roll_filter (0..100 %, 50),\n// degrade (0..100 %, 0), degrade_prob (0..100 %, 30), mode (0..2, 0:\n// overlay, 1: insert, 2: capture), mix (0..100 %, 100).\n//\n// gen~ quirks kept:\n// - the feedback is applied in every mode (the header says overlay only);\n// - in mode 2 (capture) nothing refreshes the slice after the mode change, so\n//   the delay keeps growing by a slice at each loop until it reaches the\n//   190000-sample clamp (about 4 s at 48 kHz): from there it is a plain\n//   delay of 190000 samples, not a held loop;\n// - in modes 0 and 1 the delay grows the same way within a beat; the slice\n//   is cut at the beat when the period is not a multiple of it;\n// - the beat clock is a phase in [0, 2pi) stepped by 2pi/period: its wraps\n//   and the period in samples (floor of mstosamps) need not agree;\n// - a rest (tap 0) keeps the pan jitter of the last pick, and a slice of the\n//   main period; the jitter is set to 0 only when probability is 0;\n// - the counters `h_sub_count`, `h_down_count` and the delay are not reset\n//   when `mode` returns to 0 except through the refresh.\n//\n// Noise sites (export order): 0 the degradation draw, 1 the probability\n// draw, 2 the rest draw, 3 the tap pick, 4 the pan jitter (each on a refresh).\n\ndeclare name \"driller\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\nma = library(\"maths.lib\");\nsi = library(\"signals.lib\");\n\nmaindelay = hslider(\"maindelay [unit:ms]\", 500, 10, 4000, 0.01);\ndiv2 = hslider(\"div2\", 2, 1, 32, 0.001);\ndiv3 = hslider(\"div3\", 4, 1, 32, 0.001);\ndiv4 = hslider(\"div4\", 8, 1, 32, 0.001);\ndiv5 = hslider(\"div5\", 10, 1, 32, 0.001);\ndiv6 = hslider(\"div6\", 12, 1, 32, 0.001);\nvol1 = hslider(\"vol1\", 1.0, 0, 3, 0.001);\nvol2 = hslider(\"vol2\", 0.8, 0, 3, 0.001);\nvol3 = hslider(\"vol3\", 0.8, 0, 3, 0.001);\nvol4 = hslider(\"vol4\", 0.7, 0, 3, 0.001);\nvol5 = hslider(\"vol5\", 0.7, 0, 3, 0.001);\nvol6 = hslider(\"vol6\", 0.65, 0, 3, 0.001);\nprobability = hslider(\"probability [unit:%]\", 75, 0, 100, 0.01);\nmute_prob = hslider(\"mute_prob [unit:%]\", 10, 0, 100, 0.01);\nfeedback = hslider(\"feedback [unit:%]\", 60, 0, 100, 0.01);\nstereo_spread = hslider(\"stereo_spread [unit:%]\", 30, 0, 100, 0.01);\npan_spread = hslider(\"pan_spread [unit:%]\", 50, 0, 100, 0.01);\nroll_filter = hslider(\"roll_filter [unit:%]\", 50, 0, 100, 0.01);\ndegrade = hslider(\"degrade [unit:%]\", 0, 0, 100, 0.01);\ndegrade_prob = hslider(\"degrade_prob [unit:%]\", 30, 0, 100, 0.01);\nmode = hslider(\"mode [style:menu{'overlay':0;'insert':1;'capture':2}]\", 0, 0, 2, 1);\nmix = hslider(\"mix [unit:%]\", 100, 0, 100, 0.01);\n\nPI = 3.1415926535897931;\nTWOPI = 6.2831853071795862;\n\n// k: g.keep, an identity the Faust normalizer does not see through: it pins\n// the intermediate values of the GenExpr that Faust would otherwise expand,\n// factor, reorder or constant-fold (the export computes them as written)\nk = g.keep;\n// sr * 0.001 as the export computes mstosamps (Faust would fold 1.5 * 0.001)\nms2s(ms) = ms * k(ma.SR * 0.001);\ntdiv = g.tdiv;   // safediv(n, d) for d > 0, as a true division\n\nr2 = max(1.0, div2);\nr3 = max(1.0, div3);\nr4 = max(1.0, div4);\nr5 = max(1.0, div5);\nr6 = max(1.0, div6);\n// the ratio of a tap (0: 1)\nratio(t) = select2(t == 0, select2(t == 1, select2(t == 2, select2(t == 3,\n             select2(t == 4, select2(t == 5, r6, r5), r4), r3), r2), 1.0), 1.0);\n\n// ---------------------------------------------------------------- control\n// states: beat phase, tap, ping-pong, degraded, jitter, slice length, delay,\n// slice counter; outputs, after the refresh: tap, ping-pong, degraded,\n// jitter, slice length, delay (read), counter (fade)\nctrl(in3, in4, n0, n1, n2, n3, n4) = (body ~ si.bus(8)) : si.block(8), si.bus(7)\nwith {\n    eff_main = g.clip(10.0, 4000.0, maindelay + in3);\n    n_main = g.mstosamps(eff_main);\n    inc_beat = g.divsr(k(g.safediv(1000.0, eff_main) * TWOPI));\n    mode_changed = mode != mode';\n    eff_p = g.clip(0.0, 100.0, probability + in4);\n    eff_m = g.clip(0.0, 100.0, mute_prob);\n    eff_deg_p = g.clip(0.0, 100.0, degrade_prob);\n    u(n) = (n * 0.5 + 0.5) * 100.0;\n\n    body(phd, tapd0, ppd, degd, jitd, sld0, dd0, cntd) =\n        ph, tap, pp, isdeg, jit, sl, dl, cnt,\n        tap, pp, isdeg, jit, sl, d0, cnt0\n    with {\n        tapd = g.init(1, tapd0);\n        sld = g.init(24000, sld0);\n        dd = g.init(24000, dd0);\n        ph = g.wrap(0.0, TWOPI, k(phd + inc_beat));\n        is_beat = ph < phd;\n        refresh = (is_beat & (mode < 1.5)) | mode_changed;\n\n        pp = select2(refresh, ppd, select2(ppd > 0.5, 1.0, 0.0));\n        isdeg = select2(refresh, degd, (u(n0) < eff_deg_p) & (degrade > 0.5));\n        locked = eff_p <= 0.001;\n        drawn = u(n1) < eff_p;\n        rest = u(n2) < eff_m;\n        pick = g.clip(1, 6, floor((n3 * 0.5 + 0.5) * 6.0) + 1);\n        jit_new = k(k(n4 * 0.4) * (pan_spread * 0.01));\n        tap = select2(refresh, tapd,\n                select2(locked, select2(drawn, tapd, select2(rest, pick, 0)), 1));\n        jit = select2(refresh, jitd,\n                select2(locked, select2(drawn & (rest == 0), jitd, jit_new), 0.0));\n        new_sub = max(2.0, floor(g.safediv(n_main, ratio(tap))));\n        sl = select2(refresh, sld, new_sub);\n        d0 = select2(refresh, dd, new_sub);\n        cnt0 = select2(refresh, cntd, 0);\n        cnt1 = cnt0 + 1;\n        loop_end = cnt1 >= sl;\n        cnt = select2(loop_end, cnt1, 0);\n        dl = select2(loop_end, d0, k(d0 + sl));\n    };\n};\n\n// one-pole weight towards target t, history starting at init\nweight(init, t) = (\\(hd).(g.fixdenorm(g.init(init, hd) + (t - g.init(init, hd)) * 0.05))) ~ _;\n\n// ---------------------------------------------------------------- audio\ndriller(in1, in2, in3, in4, n0, n1, n2, n3, n4) = out1, out2, out3\nwith {\n    c = ctrl(in3, in4, n0, n1, n2, n3, n4);\n    tap = c : _, !, !, !, !, !, !;\n    pp = c : !, _, !, !, !, !, !;\n    isdeg = c : !, !, _, !, !, !, !;\n    jit = c : !, !, !, _, !, !, !;\n    sl = c : !, !, !, !, _, !, !;\n    d0 = c : !, !, !, !, !, _, !;\n    cnt0 = c : !, !, !, !, !, !, _;\n\n    user_fb = g.clip(0.0, 0.95, feedback * 0.01);\n    spr_samps = ms2s(k(k(stereo_spread * 0.01) * 12.0));\n    read_D_L = g.clip(2.0, 190000.0, d0);\n    read_D_R = g.clip(2.0, 190000.0, k(d0 + spr_samps));\n\n    fade_samps = min(ms2s(1.5), floor(sl * 0.25));\n    fade_gain = select2(fade_samps > 1.0, 1.0,\n                  select2(cnt0 < fade_samps,\n                    select2(cnt0 > sl - fade_samps, 1.0,\n                      0.5 - 0.5 * cos(k(tdiv(sl - cnt0, fade_samps)) * PI)),\n                    0.5 - 0.5 * cos(k(tdiv(cnt0, fade_samps)) * PI)));\n\n    w1 = weight(1.0, select2(tap == 1, 0.0, 1.0));\n    w2 = weight(0.0, select2(tap == 2, 0.0, 1.0));\n    w3 = weight(0.0, select2(tap == 3, 0.0, 1.0));\n    w4 = weight(0.0, select2(tap == 4, 0.0, 1.0));\n    w5 = weight(0.0, select2(tap == 5, 0.0, 1.0));\n    w6 = weight(0.0, select2(tap == 6, 0.0, 1.0));\n    active_vol = k(k(k(k(k(k(g.clip(0.0, 3.0, vol1) * w1) + k(g.clip(0.0, 3.0, vol2) * w2))\n               + k(g.clip(0.0, 3.0, vol3) * w3)) + k(g.clip(0.0, 3.0, vol4) * w4))\n               + k(g.clip(0.0, 3.0, vol5) * w5)) + k(g.clip(0.0, 3.0, vol6) * w6));\n\n    // the recording loop: the feedback is the previous frame's drill\n    rec = loop ~ (_, _) : !, !, _, _\n    with {\n        loop(fbL, fbR) = g.fixdenorm(dcL), g.fixdenorm(dcR), dcL, dcR\n        with {\n            xL = in1 + k(ma.tanh(fbL * 1.05) * user_fb);\n            xR = in2 + k(ma.tanh(fbR * 1.05) * user_fb);\n            dcL = k(k(g.rd_cubic(192000, 192000, 0, xL, read_D_L) * fade_gain) * active_vol);\n            dcR = k(k(g.rd_cubic(192000, 192000, 0, xR, read_D_R) * fade_gain) * active_vol);\n        };\n    };\n    drill_clean_L = rec : _, !;\n    drill_clean_R = rec : !, _;\n\n    // pan by tap\n    base_pan = select2(tap == 0, select2(tap == 1, select2(tap == 2, select2(tap == 3,\n                 select2(tap == 4, select2(tap == 5, select2(pp > 0.5, 0.95, -0.95), 0.75), -0.75),\n                 0.35), -0.35), 0.0), 0.0);\n    pan_target = g.clip(-1.0, 1.0, k(base_pan * (pan_spread * 0.01)) + jit);\n    pan_cur = (\\(h).(g.fixdenorm(h + k((pan_target - h) * 0.03)))) ~ _;\n    theta_pan = k(pan_cur + 1.0) * (PI * 0.25);\n    pan_drill_L = k(drill_clean_L * k(cos(theta_pan) * 1.41421356));\n    pan_drill_R = k(drill_clean_R * k(sin(theta_pan) * 1.41421356));\n    // (the reference build computes cos and sin of theta_pan with one\n    // __sincos call, whose sine is 1 ulp off libm's sin for about 1 % of the\n    // angles: out2 differs from it by about -310 dB where the pan moves)\n\n    // adaptive one-pole high-pass\n    f_hp = g.clip(20.0, 2500.0, 20.0 + k(k(k(ratio(tap) - 1.0) * 45.0) * (roll_filter * 0.01)));\n    alpha_hp = g.safediv(1.0, 1.0 + g.divsr(k(f_hp * TWOPI)));\n    hpf(x) = (\\(y).(k(alpha_hp * k(k(y + x) - x')))) ~ _;\n    filt_mix = g.clip(0.0, 1.0, roll_filter * 0.01);\n    filt_drill_L = k(g.mix(pan_drill_L, hpf(pan_drill_L), filt_mix));\n    filt_drill_R = k(g.mix(pan_drill_R, hpf(pan_drill_R), filt_mix));\n\n    // lo-fi degradation\n    target_deg = select2(isdeg != 0, 0.0, g.clip(0.0, 1.0, degrade * 0.01));\n    deg = (\\(h).(g.fixdenorm(h + k((target_deg - h) * 0.05)))) ~ _;\n    down_factor = floor(1.0 + k(deg * 24.0));\n    take = (\\(cd).(select2(cd + 1 >= down_factor, cd + 1, 0))) ~ _ : ==(0);\n    hold(x) = (\\(h).(select2(take, h, x))) ~ _;\n    bit_steps = floor(g.safepow(2.0, max(3.0, 16.0 - k(deg * 12.0))));\n    crush(x) = k(tdiv(floor(k(x * bit_steps) + 0.5), bit_steps));\n    drive_gain = 1.0 + k(deg * 2.5);\n    drive_norm = g.safediv(1.0, 1.0 + k(deg * 0.35));\n    driven(x) = k(ma.tanh(k(crush(hold(x)) * drive_gain)) * drive_norm);\n    drill_L = k(g.mix(filt_drill_L, driven(filt_drill_L), deg));\n    drill_R = k(g.mix(filt_drill_R, driven(filt_drill_R), deg));\n\n    wet_L = select2(mode < 0.5, drill_L, in1 + drill_L);\n    wet_R = select2(mode < 0.5, drill_R, in2 + drill_R);\n    mix_val = g.clip(0.0, 1.0, mix * 0.01);\n    out1 = g.mix(in1, wet_L, mix_val);\n    out2 = g.mix(in2, wet_R, mix_val);\n    out3 = tap;\n};\n\n// the port with its noises as inputs: in1..in4, noise sites 0 (degradation),\n// 1 (probability), 2 (rest), 3 (tap pick), 4 (pan jitter)\ndet = driller;\nprocess = (_, _, _, _, g.noises(5, 0), g.noises(5, 1), g.noises(5, 2), g.noises(5, 3), g.noises(5, 4)) : det;\n",
                    "sourcecode_size": 25563,
                    "sample_format": 1,
                    "version": "1.87"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "live.menu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        47.0,
                        364.0,
                        65.0,
                        18.0
                    ],
                    "activebgcolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "bordercolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "fontsize": 12.0,
                    "hltcolor": [
                        0.364705882352941,
                        0.619607843137255,
                        0.741176470588235,
                        1.0
                    ],
                    "outlettype": [
                        "",
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "activebgcolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "hltcolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "tricolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_enum": [
                                "overlay",
                                "insert",
                                "capture"
                            ],
                            "parameter_initial": [
                                1.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "live.menu[1]",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.menu",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "tricolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "varname": "live.menu[1]"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        21.0,
                        769.0,
                        74.0,
                        22.0
                    ],
                    "text": "dac~"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        47.0,
                        234.0,
                        337.0,
                        67.0
                    ],
                    "clipheight": 32.5,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "tabla-solo.wav",
                                "filename": "tabla-solo.wav",
                                "filekind": "audiofile",
                                "id": "u160003594",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            },
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u637004891",
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
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        247.0,
                        615.0,
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
                    "id": "obj-82",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        446.0,
                        130.0,
                        22.0
                    ],
                    "text": "div2"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        177.0,
                        446.0,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 1.0,
                    "maximum": 32.0
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        177.0,
                        470.0,
                        120,
                        22
                    ],
                    "text": "prepend div2",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        302.0,
                        470.0,
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
                    "id": "obj-85",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        422.0,
                        130.0,
                        22.0
                    ],
                    "text": "maindelay (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        177.0,
                        422.0,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 10.0,
                    "maximum": 4000.0
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        177.0,
                        446.0,
                        120,
                        22
                    ],
                    "text": "prepend maindelay",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        302.0,
                        446.0,
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
                    "id": "obj-88",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        470.0,
                        130.0,
                        22.0
                    ],
                    "text": "div3"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        177.0,
                        470.0,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 1.0,
                    "maximum": 32.0
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        177.0,
                        494.0,
                        120,
                        22
                    ],
                    "text": "prepend div3",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        302.0,
                        494.0,
                        90,
                        22
                    ],
                    "text": "set 4.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        494.0,
                        130.0,
                        22.0
                    ],
                    "text": "div4"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        177.0,
                        494.0,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 1.0,
                    "maximum": 32.0
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        177.0,
                        518.0,
                        120,
                        22
                    ],
                    "text": "prepend div4",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        302.0,
                        518.0,
                        90,
                        22
                    ],
                    "text": "set 8.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        314.0,
                        130.0,
                        22.0
                    ],
                    "text": "probability (%)"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        414.0,
                        314.0,
                        50.0,
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
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        414.0,
                        338.0,
                        120,
                        22
                    ],
                    "text": "prepend probability",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        539.0,
                        338.0,
                        90,
                        22
                    ],
                    "text": "set 75.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        544.0,
                        130.0,
                        22.0
                    ],
                    "text": "div6"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        177.0,
                        544.0,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 1.0,
                    "maximum": 32.0
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        177.0,
                        568.0,
                        120,
                        22
                    ],
                    "text": "prepend div6",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        302.0,
                        568.0,
                        90,
                        22
                    ],
                    "text": "set 12.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        520.0,
                        130.0,
                        22.0
                    ],
                    "text": "div5"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        177.0,
                        520.0,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 1.0,
                    "maximum": 32.0
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        177.0,
                        544.0,
                        120,
                        22
                    ],
                    "text": "prepend div5",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        302.0,
                        544.0,
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
                    "id": "obj-103",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        334.0,
                        130.0,
                        22.0
                    ],
                    "text": "mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        177.0,
                        334.0,
                        50.0,
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
                    "id": "obj-104",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        177.0,
                        358.0,
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
                    "id": "obj-105",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        302.0,
                        358.0,
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
                    "id": "obj-106",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        386.0,
                        130.0,
                        22.0
                    ],
                    "text": "mode"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        177.0,
                        386.0,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 2.0
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        177.0,
                        410.0,
                        120,
                        22
                    ],
                    "text": "prepend mode",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        302.0,
                        410.0,
                        90,
                        22
                    ],
                    "text": "set 0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        520.0,
                        314.0,
                        130.0,
                        22.0
                    ],
                    "text": "stereo_spread (%)"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        650.0,
                        314.0,
                        50.0,
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
                    "id": "obj-110",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        650.0,
                        338.0,
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
                    "id": "obj-111",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        775.0,
                        338.0,
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
                    "id": "obj-112",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        362.0,
                        130.0,
                        22.0
                    ],
                    "text": "feedback (%)"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        414.0,
                        362.0,
                        50.0,
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
                    "id": "obj-113",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        414.0,
                        386.0,
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
                    "id": "obj-114",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        539.0,
                        386.0,
                        90,
                        22
                    ],
                    "text": "set 60.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-115",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        338.0,
                        130.0,
                        22.0
                    ],
                    "text": "mute_prob (%)"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        414.0,
                        338.0,
                        50.0,
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
                    "id": "obj-116",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        414.0,
                        362.0,
                        120,
                        22
                    ],
                    "text": "prepend mute_prob",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        539.0,
                        362.0,
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
                    "id": "obj-118",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        422.0,
                        60.0,
                        22.0
                    ],
                    "text": "vol1"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        344.0,
                        422.0,
                        120.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 3.0
                }
            },
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        344.0,
                        446.0,
                        120,
                        22
                    ],
                    "text": "prepend vol1",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-120",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        469.0,
                        446.0,
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
                    "id": "obj-121",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        446.0,
                        60.0,
                        22.0
                    ],
                    "text": "vol2"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        344.0,
                        446.0,
                        120.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 3.0
                }
            },
            {
                "box": {
                    "id": "obj-122",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        344.0,
                        470.0,
                        120,
                        22
                    ],
                    "text": "prepend vol2",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-123",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        469.0,
                        470.0,
                        90,
                        22
                    ],
                    "text": "set 0.8",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-124",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        470.0,
                        60.0,
                        22.0
                    ],
                    "text": "vol3"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        344.0,
                        470.0,
                        120.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 3.0
                }
            },
            {
                "box": {
                    "id": "obj-125",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        344.0,
                        494.0,
                        120,
                        22
                    ],
                    "text": "prepend vol3",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-126",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        469.0,
                        494.0,
                        90,
                        22
                    ],
                    "text": "set 0.8",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-127",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        494.0,
                        60.0,
                        22.0
                    ],
                    "text": "vol4"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        344.0,
                        494.0,
                        120.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 3.0
                }
            },
            {
                "box": {
                    "id": "obj-128",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        344.0,
                        518.0,
                        120,
                        22
                    ],
                    "text": "prepend vol4",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-129",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        469.0,
                        518.0,
                        90,
                        22
                    ],
                    "text": "set 0.7",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-130",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        520.0,
                        60.0,
                        22.0
                    ],
                    "text": "vol5"
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        344.0,
                        520.0,
                        120.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 3.0
                }
            },
            {
                "box": {
                    "id": "obj-131",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        344.0,
                        544.0,
                        120,
                        22
                    ],
                    "text": "prepend vol5",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-132",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        469.0,
                        544.0,
                        90,
                        22
                    ],
                    "text": "set 0.7",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-133",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        284.0,
                        544.0,
                        60.0,
                        22.0
                    ],
                    "text": "vol6"
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        344.0,
                        544.0,
                        120.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 3.0
                }
            },
            {
                "box": {
                    "id": "obj-134",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        344.0,
                        568.0,
                        120,
                        22
                    ],
                    "text": "prepend vol6",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-135",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        469.0,
                        568.0,
                        90,
                        22
                    ],
                    "text": "set 0.65",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-136",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        520.0,
                        338.0,
                        130.0,
                        22.0
                    ],
                    "text": "pan_spread (%)"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        650.0,
                        338.0,
                        50.0,
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
                    "id": "obj-137",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        650.0,
                        362.0,
                        120,
                        22
                    ],
                    "text": "prepend pan_spread",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-138",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        775.0,
                        362.0,
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
                    "id": "obj-139",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        509.0,
                        422.0,
                        130.0,
                        22.0
                    ],
                    "text": "roll_filter (%)"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        639.0,
                        422.0,
                        50.0,
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
                    "id": "obj-140",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        639.0,
                        446.0,
                        120,
                        22
                    ],
                    "text": "prepend roll_filter",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-141",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        764.0,
                        446.0,
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
                    "id": "obj-142",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        509.0,
                        446.0,
                        130.0,
                        22.0
                    ],
                    "text": "degrade (%)"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        639.0,
                        446.0,
                        50.0,
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
                    "id": "obj-143",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        639.0,
                        470.0,
                        120,
                        22
                    ],
                    "text": "prepend degrade",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-144",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        764.0,
                        470.0,
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
                    "id": "obj-145",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        509.0,
                        470.0,
                        130.0,
                        22.0
                    ],
                    "text": "degrade_prob (%)"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        639.0,
                        470.0,
                        50.0,
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
                    "id": "obj-146",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        639.0,
                        494.0,
                        120,
                        22
                    ],
                    "text": "prepend degrade_prob",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-147",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        764.0,
                        494.0,
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
                    "id": "obj-148",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        47.0,
                        537.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen driller replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/driller.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/driller.maxpat.",
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
                        "obj-3",
                        2
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        2
                    ],
                    "destination": [
                        "obj-6",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        2
                    ],
                    "destination": [
                        "obj-9",
                        0
                    ],
                    "hidden": 1,
                    "order": 2
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-33",
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
                        "obj-34",
                        1
                    ],
                    "destination": [
                        "obj-8",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-34",
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
                        "obj-40",
                        1
                    ],
                    "destination": [
                        "obj-34",
                        1
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
                        "obj-34",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-40",
                        2
                    ],
                    "destination": [
                        "obj-61",
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
                        "obj-3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        1
                    ],
                    "destination": [
                        "obj-40",
                        1
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-9",
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
                        "obj-12",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-84",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-84",
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
                        "obj-2",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-87",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-87",
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
                        "obj-31",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-90",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-90",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-93",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-93",
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
                        "obj-39",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-96",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-96",
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
                        "obj-41",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-41",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-43",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-43",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-49",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-105",
                        0
                    ],
                    "destination": [
                        "obj-49",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-55",
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
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-55",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-20",
                        0
                    ],
                    "destination": [
                        "obj-55",
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
                        "obj-110",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-110",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-56",
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
                        "obj-113",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-113",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-57",
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
                        "obj-116",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-116",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-58",
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
                        "obj-119",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-119",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-71",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-72",
                        0
                    ],
                    "destination": [
                        "obj-122",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-122",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-72",
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
                        "obj-125",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-125",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-73",
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
                        "obj-128",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-128",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-74",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-75",
                        0
                    ],
                    "destination": [
                        "obj-131",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-131",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-75",
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
                        "obj-134",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-134",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
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
                        "obj-76",
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
                        "obj-137",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-137",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-138",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-138",
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
                        "obj-78",
                        0
                    ],
                    "destination": [
                        "obj-140",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-140",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-141",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-141",
                        0
                    ],
                    "destination": [
                        "obj-78",
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
                        "obj-143",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-143",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-144",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-144",
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
                        "obj-80",
                        0
                    ],
                    "destination": [
                        "obj-146",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-146",
                        0
                    ],
                    "destination": [
                        "obj-40",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-147",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-147",
                        0
                    ],
                    "destination": [
                        "obj-80",
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
            740.0,
            800.0
        ],
        "openrectmode": 0,
        "parameters": {
            "obj-20": [
                "live.menu[1]",
                "live.menu",
                0
            ],
            "obj-34": [
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
        },
        "textcolor": [
            1.0,
            1.0,
            1.0,
            1.0
        ],
        "bgcolor": [
            0.274509803921569,
            0.274509803921569,
            0.274509803921569,
            1.0
        ],
        "editing_bgcolor": [
            0.274509803921569,
            0.274509803921569,
            0.274509803921569,
            1.0
        ]
    }
}