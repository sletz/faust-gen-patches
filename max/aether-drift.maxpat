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
        "lefttoolbarpinned": 1,
        "toptoolbarpinned": 1,
        "righttoolbarpinned": 1,
        "bottomtoolbarpinned": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        24.0,
                        55.0,
                        256.0,
                        67.0
                    ],
                    "fontsize": 18.0,
                    "linecount": 3,
                    "text": "Digital delay and reverb loosely based on Clouds reverb (enhanced Dattoro)"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        255.0,
                        483.0,
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
                        255.0,
                        518.0,
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
                                "obj-26",
                                "flonum",
                                "float",
                                -60.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                0.9,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                97.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                -6.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                45.0,
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
                                "obj-10",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                6.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                99.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                100.0
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-26",
                                "flonum",
                                "float",
                                -12.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                95.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                -6.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                15.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-10",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                6.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                90.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                60.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-26",
                                "flonum",
                                "float",
                                -3.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                8.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                45.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                95.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                -12.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-10",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                95.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                60.0
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-26",
                                "flonum",
                                "float",
                                -16.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                65.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                85.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                -3.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-14",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-10",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                6.0,
                                5,
                                "obj-17",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                70.0
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        110.0,
                        525.0,
                        45.0,
                        45.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        24.0,
                        6.0,
                        185.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "Aether drift"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        24.0,
                        161.0,
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
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        24.0,
                        194.0,
                        69.0,
                        22.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "text": "metro 3000"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        199.0,
                        364.0,
                        25.806450843811035,
                        136.03227031230927
                    ],
                    "numleds": 20,
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        171.0,
                        364.0,
                        25.806450843811035,
                        136.03227031230927
                    ],
                    "numleds": 20,
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        110.0,
                        364.0,
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
                            "parameter_longname": "live.gain~[1]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[1]"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "patching_rect": [
                        24.0,
                        309.0,
                        132.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "sourcecode": "// aether-drift: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/aether-drift.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// AETHER-DRIFT: parallel cloud echo and 8-stage allpass reverb (gen~: gendsp/aether-drift.gendsp)\n//\n// High-diffusion spatial processor with parallel stereo delay and reverb\n// chains. The stereo delay (0..2 s, slid over ~1000 samples, one-pole damping\n// in its feedback, dcblock in the loop) feeds, with the dry mono sum, an\n// 8-stage cascade of fixed allpasses (g = 0.75) into a cross-coupled \"cloud\"\n// tank: two allpass pairs (g = +-0.7*diffusion), two dcblocked delays and two\n// sine-modulated delays with one-pole damping. Delay and reverb are summed,\n// mixed with the dry signal, gained, soft-clipped by tanh and DC-blocked.\n//\n// in1, in2: audio L, R     out1, out2: processed L, R (dry/wet)\n//\n// Parameters: mix (0..100 %), gainout (-60..12 dB), del_vol (-60..6 dB),\n// del_time (0..100 % of 2000 ms), del_fb, del_damp, del_to_rev (0..100 %),\n// rev_vol (-60..6 dB), rev_size (0..99 %), rev_diff, rev_damp, rev_mod (0..100 %).\n//\n// Quirk kept from gen~: the modulated tank reads d2.read(4217 + lfo1) and\n// d4.read(4845 + lfo2) on Delays whose maximum is exactly 4217 and 4845, so\n// gen clamps every positive LFO excursion: the modulation only shortens the\n// delays (half-wave).\n\ndeclare name \"aether-drift\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\nma = library(\"maths.lib\");\n\nmix = hslider(\"mix [unit:%]\", 50, 0, 100, 0.01);\ngainout = hslider(\"gainout [unit:dB]\", 0, -60, 12, 0.01);\ndel_vol = hslider(\"del_vol [unit:dB]\", -6, -60, 6, 0.01);\ndel_time = hslider(\"del_time [unit:%]\", 40, 0, 100, 0.01);\ndel_fb = hslider(\"del_fb [unit:%]\", 60, 0, 100, 0.01);\ndel_damp = hslider(\"del_damp [unit:%]\", 30, 0, 100, 0.01);\ndel_to_rev = hslider(\"del_to_rev [unit:%]\", 50, 0, 100, 0.01);\nrev_vol = hslider(\"rev_vol [unit:dB]\", -6, -60, 6, 0.01);\nrev_size = hslider(\"rev_size [unit:%]\", 85, 0, 99, 0.01);\nrev_diff = hslider(\"rev_diff [unit:%]\", 85, 0, 100, 0.01);\nrev_damp = hslider(\"rev_damp [unit:%]\", 40, 0, 100, 0.01);\nrev_mod = hslider(\"rev_mod [unit:%]\", 40, 0, 100, 0.01);\n\n// slide(x, 1000, 1000), state starting at 0\nslide(x) = (\\(s).(g.fixdenorm(s + (1.0 / 1000) * (x - s)))) ~ _;\n\n// one-pole damping: h = mix(x, h, a)\nlp1(a, x) = (\\(h).(g.mix(x, h, a))) ~ _;\n\n// ---------------------------------------------------------------- delay\nDMAX = 2 * 192000;\ndmaxd = int(ma.SR * 2);\nd_samps = slide(del_time * 0.01) * 2000 * (ma.SR * 0.001);\n\n// one channel: the delay line in its feedback loop; outputs wet_del\ndelch(off, x) = (loop ~ _) : !, _\nwith {\n    loop(wd) = w, wet\n    with {\n        wet = g.rd_linear_fb(DMAX, dmaxd, wd, d_samps + off);\n        h = lp1(del_damp * 0.01, wet);\n        w = g.dcblock(x + h * (del_fb * 0.01));\n    };\n};\n\n// ---------------------------------------------------------------- reverb\n// a fixed allpass on a Delay of maximum N read at N (read_step) before and\n// after its write: v = x - v[n-N]*c, out = v[n-N] + v*c\nap(N, c, x) = v@N + v * c\nwith { v = (\\(vd).(x - (vd @ (N - 1)) * c)) ~ _; };\n\ndiffuser = ap(151, 0.75) : ap(233, 0.75) : ap(347, 0.75) : ap(563, 0.75)\n         : ap(761, 0.75) : ap(997, 0.75) : ap(1153, 0.75) : ap(1427, 0.75);\n\nd_c = 0.7 * (rev_diff * 0.01);\ndec = rev_size * 0.01;\ndamp = rev_damp * 0.01;\nlfo1 = (g.cycle(0.07) * (rev_mod * 0.2)) * 30;\nlfo2 = (g.cycle(0.11) * (rev_mod * 0.2)) * 30;\n\n// the cross-coupled tank; y1d, y3d: dcblock(r_at2), dcblock(r_at4) one sample\n// late (the `~`), so that d1.read(4453) after d1's write is y1d@4452.\n// outputs: d1.read(4453), d3.read(3163), r_at2, r_at4\ntank(diffused_in) = (loop ~ (_, _)) : !, !, _, _, _, _\nwith {\n    loop(y1d, y3d) = y1, y3, d1r, d3r, r_at2, r_at4\n    with {\n        d1r = y1d @ 4452;           // = d2 written this frame\n        d3r = y3d @ 3162;           // = d4 written this frame\n        s_d2 = g.rd_linear(4217, 4217, 1, d1r, 4217 + lfo1);\n        s_d4 = g.rd_linear(4845, 4845, 1, d3r, 4845 + lfo2);\n        h_rev_lp1 = lp1(damp, s_d2);\n        h_rev_lp2 = lp1(damp, s_d4);\n        fbL = diffused_in + h_rev_lp2 * dec;\n        r_at2 = fbL : ap(707, 0 - d_c) : ap(503, d_c);\n        y1 = g.dcblock(r_at2);\n        fbR = diffused_in + h_rev_lp1 * dec;\n        r_at4 = fbR : ap(769, 0 - d_c) : ap(613, d_c);\n        y3 = g.dcblock(r_at4);\n    };\n};\n\n// ---------------------------------------------------------------- mix\ndcout(x) = (x - x') : (+ ~ *(0.995));\n\ndrift(in1, in2) = out1, out2\nwith {\n    wet_del_L = delch(0, in1);\n    wet_del_R = delch(5, in2);\n    sig_del_L = wet_del_L * g.dbtoa(del_vol);\n    sig_del_R = wet_del_R * g.dbtoa(del_vol);\n    rev_in = ((in1 + in2) * 0.5) + (((wet_del_L + wet_del_R) * 0.5) * (del_to_rev * 0.01));\n    rv = tank(diffuser(rev_in));\n    d1r = rv : _, !, !, !;\n    d3r = rv : !, _, !, !;\n    r_at2 = rv : !, !, _, !;\n    r_at4 = rv : !, !, !, _;\n    sig_rev_L = ((d1r + r_at2) - r_at4) * g.dbtoa(rev_vol);\n    sig_rev_R = ((d3r + r_at4) - r_at2) * g.dbtoa(rev_vol);\n    fx_L = sig_del_L + sig_rev_L;\n    fx_R = sig_del_R + sig_rev_R;\n    mix_L = g.mix(in1, fx_L, mix * 0.01);\n    mix_R = g.mix(in2, fx_R, mix * 0.01);\n    out1 = dcout(ma.tanh(mix_L * g.dbtoa(gainout)));\n    out2 = dcout(ma.tanh(mix_R * g.dbtoa(gainout)));\n};\n\nprocess = drift;\ndet = drift;\n",
                    "sourcecode_size": 17315,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_aether_drift"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        24.0,
                        224.0,
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
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        24.0,
                        253.0,
                        39.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "click~"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        224.0,
                        339.0,
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
                    "id": "obj-30",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        344.0,
                        448.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "gainout (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        448.0,
                        62.802261531353,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -60.0,
                    "maximum": 12.0,
                    "bgcolor": [
                        0.24705882352941178,
                        0.42745098039215684,
                        0.3215686274509804,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        472.0,
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
                    "id": "obj-32",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        599.197738468647,
                        472.0,
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
                    "id": "obj-33",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        344.0,
                        292.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "rev_damp (%)"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        292.0,
                        62.802261531353,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.011764705882353,
                        0.192156862745098,
                        0.32156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        316.0,
                        120,
                        22
                    ],
                    "text": "prepend rev_damp",
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
                        599.197738468647,
                        316.0,
                        90,
                        22
                    ],
                    "text": "set 40.0",
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
                        344.0,
                        343.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "rev_size (%)"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        343.0,
                        62.802261531353,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 99.0,
                    "bgcolor": [
                        0.011764705882353,
                        0.192156862745098,
                        0.32156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        367.0,
                        120,
                        22
                    ],
                    "text": "prepend rev_size",
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
                        599.197738468647,
                        367.0,
                        90,
                        22
                    ],
                    "text": "set 85.0",
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
                        344.0,
                        16.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        16.0,
                        62.802261531353,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.24705882352941178,
                        0.42745098039215684,
                        0.3215686274509804,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        40.0,
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
                    "id": "obj-41",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        599.197738468647,
                        40.0,
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
                    "id": "obj-42",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        344.0,
                        317.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "rev_mod (%)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        317.0,
                        62.802261531353,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.011764705882353,
                        0.192156862745098,
                        0.32156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        341.0,
                        120,
                        22
                    ],
                    "text": "prepend rev_mod",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        599.197738468647,
                        341.0,
                        90,
                        22
                    ],
                    "text": "set 40.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        344.0,
                        268.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "rev_diff (%)"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        268.0,
                        62.802261531353,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.011764705882353,
                        0.192156862745098,
                        0.32156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        292.0,
                        120,
                        22
                    ],
                    "text": "prepend rev_diff",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        599.197738468647,
                        292.0,
                        90,
                        22
                    ],
                    "text": "set 85.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        344.0,
                        242.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "rev_vol (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        242.0,
                        62.802261531353,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -60.0,
                    "maximum": 6.0,
                    "bgcolor": [
                        0.011764705882353,
                        0.192156862745098,
                        0.32156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        266.0,
                        120,
                        22
                    ],
                    "text": "prepend rev_vol",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        599.197738468647,
                        266.0,
                        90,
                        22
                    ],
                    "text": "set -6.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        344.0,
                        137.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "del_fb (%)"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        137.0,
                        62.802261531353,
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
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        161.0,
                        120,
                        22
                    ],
                    "text": "prepend del_fb",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        599.197738468647,
                        161.0,
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
                    "id": "obj-54",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        344.0,
                        112.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "del_damp (%)"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        112.0,
                        62.802261531353,
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
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        474.197738468647,
                        136.0,
                        120,
                        22
                    ],
                    "text": "prepend del_damp",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        599.197738468647,
                        136.0,
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
                    "id": "obj-57",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        344.0,
                        87.0,
                        129.80487796664238,
                        22.0
                    ],
                    "text": "del_time (%)"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        473.8048779666424,
                        87.0,
                        63.19512203335762,
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
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        473.8048779666424,
                        111.0,
                        120,
                        22
                    ],
                    "text": "prepend del_time",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        598.8048779666424,
                        111.0,
                        90,
                        22
                    ],
                    "text": "set 40.0",
                    "outlettype": [
                        ""
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
                        344.0,
                        62.0,
                        129.80487796664238,
                        22.0
                    ],
                    "text": "del_vol (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        473.8048779666424,
                        62.0,
                        63.19512203335762,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -60.0,
                    "maximum": 6.0
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        473.8048779666424,
                        86.0,
                        120,
                        22
                    ],
                    "text": "prepend del_vol",
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
                        598.8048779666424,
                        86.0,
                        90,
                        22
                    ],
                    "text": "set -6.0",
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
                        344.0,
                        187.0,
                        130.197738468647,
                        22.0
                    ],
                    "text": "del_to_rev (%)"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        474.197738468647,
                        187.0,
                        62.802261531353,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.42745098039215684,
                        0.24705882352941178,
                        0.24705882352941178,
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
                        474.197738468647,
                        211.0,
                        120,
                        22
                    ],
                    "text": "prepend del_to_rev",
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
                        599.197738468647,
                        211.0,
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
                    "id": "obj-66",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        24.0,
                        261.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen aether-drift replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/aether-drift.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/aether-drift.maxpat.",
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
                        "obj-10",
                        0
                    ],
                    "destination": [
                        "obj-4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-12",
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
                        "obj-12",
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
                        2
                    ],
                    "destination": [
                        "obj-12",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-4",
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
                        "obj-5",
                        0
                    ],
                    "destination": [
                        "obj-6",
                        1
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
                        "obj-6",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        1
                    ],
                    "destination": [
                        "obj-12",
                        1
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        0
                    ],
                    "destination": [
                        "obj-12",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        0
                    ],
                    "destination": [
                        "obj-27",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        1
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
                        "obj-7",
                        0
                    ],
                    "destination": [
                        "obj-5",
                        0
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
                        "obj-13",
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
                        "obj-6",
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
                        "obj-11",
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
                        "obj-6",
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
                        "obj-14",
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
                        "obj-6",
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
                        "obj-17",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-19",
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
                        "obj-40",
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
                        "obj-29",
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
                        "obj-19",
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
                        "obj-43",
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
                        "obj-6",
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
                        "obj-46",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-46",
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
                        "obj-29",
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
                        "obj-49",
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
                        "obj-6",
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
                        "obj-52",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-52",
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
                        "obj-29",
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
                        "obj-55",
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
                        "obj-6",
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
                        "obj-58",
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
                        "obj-6",
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
                        "obj-25",
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
                        "obj-6",
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
                        "obj-26",
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
                        "obj-6",
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
                        "obj-3",
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
            "obj-12": [
                "live.gain~[1]",
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