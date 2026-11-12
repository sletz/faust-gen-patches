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
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        129.0,
                        402.0,
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
                    "id": "obj-8",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        129.0,
                        434.0,
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
                                "obj-attrui",
                                "flonum",
                                "float",
                                0.25,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                8.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                0.2,
                                5,
                                "obj-4",
                                "number",
                                "int",
                                0.030000000000000006,
                                5,
                                "obj-6",
                                "number",
                                "float",
                                5041.0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                0.5
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-attrui",
                                "flonum",
                                "float",
                                0.4,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                83.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                8000.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                0.3750000000000001,
                                5,
                                "obj-4",
                                "number",
                                "int",
                                2.8000000000000003,
                                5,
                                "obj-6",
                                "number",
                                "float",
                                5041.0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                0.25000000000000006
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-attrui",
                                "flonum",
                                "float",
                                0.04,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                85.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                0.3750000000000001,
                                5,
                                "obj-4",
                                "number",
                                "int",
                                3.0,
                                5,
                                "obj-6",
                                "number",
                                "float",
                                5041.0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-attrui",
                                "flonum",
                                "float",
                                0.6,
                                5,
                                "obj-1",
                                "flonum",
                                "float",
                                250.0,
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                995.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                0.29,
                                5,
                                "obj-4",
                                "number",
                                "int",
                                2.0,
                                5,
                                "obj-6",
                                "number",
                                "float",
                                5041.0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                0.7000000000000002
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        194.0,
                        289.0,
                        50.0,
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
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        20.0,
                        207.0,
                        47.0
                    ],
                    "fontface": 0,
                    "fontsize": 36.0,
                    "text": "Pulsar synth"
                }
            },
            {
                "box": {
                    "id": "obj-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        48.0,
                        69.0,
                        171.0,
                        24.0
                    ],
                    "fontface": 0,
                    "fontsize": 16.0,
                    "text": "Not your regular pulsar"
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        39.0,
                        536.0,
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
                        39.0,
                        366.0,
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
                        39.0,
                        321.0,
                        140.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "sourcecode": "// pulsar-synth: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/pulsar-synth.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// PULSAR-SYNTH: continuous pulsar synthesis (Curtis Roads)\n// (gen~: gendsp/pulsar-synth.gendsp)\n//\n// A period phasor at f0; in each period, a pulsaret (a waveform of\n// `formant_f` Hz under a window) fills the first `duty_ratio` of the period,\n// silence the rest. At every new period (or while in1 > 0.5) a noise draw\n// decides whether the pulsar sounds (masking) and the pan alternates.\n//\n// in1: reset / sync trigger (> 0.5)    in2: formant frequency modulation (Hz)\n// out1, out2: pulsar audio L, R\n//\n// wave_shape: 0 sine, 1 triangle, 2 chirp, 3 harmonics; win_type: 0 rectangle,\n// 1 Hann, 2 Gaussian, 3 exponential decay. Both are compared to integers by\n// gen (`== 0`, `== 1`, `== 2`): a fractional value falls to the last branch.\n// in1 does not reset the phase (the patch's \"reset / sync\" only redraws the\n// mask and flips the pan, at every sample while it is above 0.5).\n\ndeclare name \"pulsar-synth\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nf0 = hslider(\"f0 [unit:Hz]\", 25, 0.1, 500, 0.01);\nformant_f = hslider(\"formant_f [unit:Hz]\", 650, 20, 8000, 0.01);\nduty_ratio = hslider(\"duty_ratio\", 0.3, 0.01, 1, 0.001);\nwave_shape = hslider(\"wave_shape [style:menu{'sine':0;'triangle':1;'chirp':2;'harmonics':3}]\", 0, 0, 3, 1);\nwin_type = hslider(\"win_type [style:menu{'rectangle':0;'hann':1;'gauss':2;'expdecay':3}]\", 1, 0, 3, 1);\nmasking = hslider(\"masking\", 0, 0, 1, 0.001);\npan_spread = hslider(\"pan_spread\", 0.5, 0, 1, 0.001);\n\nTWOPI = 6.2831853071795862;\n\n// nz: the noise of the trigger (gen's noise(), uniform in [-1, 1))\npulsar(nz, in1, in2) = sig * pan_L, sig * pan_R\nwith {\n    f0_step = g.safediv(g.clamp(0.05, 500, f0), ma.SR);\n    phase_f0 = (\\(h).(g.wrap(0, 1, h + f0_step))) ~ _;\n    new_cycle = (phase_f0' + f0_step) >= 1;\n    trig = new_cycle | (in1 > 0.5);\n    h_pulsar_active = (\\(a).(select2(trig, a, abs(nz) > masking))) ~ g.init(1);\n    h_pulse_count = (\\(c).(select2(trig, c, c + 1))) ~ _;\n\n    d_ratio = g.clamp(0.005, 0.999, duty_ratio);\n    in_pulsaret = phase_f0 < d_ratio;\n\n    p_norm = g.safediv(phase_f0, d_ratio);\n    xg = (p_norm - 0.5) * 5;\n    w = select2(win_type == 0,\n          select2(win_type == 1,\n            select2(win_type == 2, exp((0 - p_norm) * 4), exp((-0.5 * xg) * xg)),\n            0.5 * (1 - cos(p_norm * TWOPI))),\n          1);\n    eff_formant = g.clamp(20, 12000, formant_f + in2);\n    pulsar_cycles = eff_formant * g.safediv(d_ratio, max(f0, 0.1));\n    p_wave_phase = g.wrap(0, 1, p_norm * pulsar_cycles);\n    chirp_ph = p_wave_phase * (1 + p_norm * 2);\n    osc = select2(wave_shape == 0,\n            select2(wave_shape == 1,\n              select2(wave_shape == 2,\n                sin(p_wave_phase * TWOPI) * 0.7 + sin((p_wave_phase * 4) * 3.1415926535897931) * 0.3,\n                sin(g.wrap(0, 1, chirp_ph) * TWOPI)),\n              abs(p_wave_phase - 0.5) * 4 - 1),\n            sin(p_wave_phase * TWOPI));\n    sig = select2(in_pulsaret & h_pulsar_active, 0, osc * w);\n\n    pan_dir = select2(fmod(h_pulse_count, 2) != 0, -1, 1);\n    pan_pos = 0.5 + (pan_dir * pan_spread) * 0.45;\n    pan_L = cos(pan_pos * 1.5707963267948966);\n    pan_R = sin(pan_pos * 1.5707963267948966);\n};\n\nprocess = pulsar(g.noises(1, 0));\n// the port with its noise as an input, for scripts/test_gen.py: in1, in2, noise\ndet(in1, in2, nz) = pulsar(nz, in1, in2);\n",
                    "sourcecode_size": 15502,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_pulsar_synth"
                }
            },
            {
                "box": {
                    "id": "obj-sig2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        194.0,
                        321.0,
                        66.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "cycle~ 800"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        239.0,
                        351.0,
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
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        39.0,
                        109.0,
                        60.0,
                        22.0
                    ],
                    "text": "f0 (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        99.0,
                        109.0,
                        220.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.1,
                    "maximum": 500.0
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        99.0,
                        133.0,
                        120,
                        22
                    ],
                    "text": "prepend f0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        224.0,
                        133.0,
                        90,
                        22
                    ],
                    "text": "set 25.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        39.0,
                        133.0,
                        79.0,
                        22.0
                    ],
                    "text": "formant_f (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        118.0,
                        133.0,
                        201.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 20.0,
                    "maximum": 8000.0
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        118.0,
                        157.0,
                        120,
                        22
                    ],
                    "text": "prepend formant_f",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        243.0,
                        157.0,
                        90,
                        22
                    ],
                    "text": "set 650.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        39.0,
                        157.0,
                        86.0,
                        22.0
                    ],
                    "text": "duty_ratio"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        125.0,
                        157.0,
                        194.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.01,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        125.0,
                        181.0,
                        120,
                        22
                    ],
                    "text": "prepend duty_ratio",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        250.0,
                        181.0,
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
                    "id": "obj-19",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        39.0,
                        181.0,
                        86.0,
                        22.0
                    ],
                    "text": "wave_shape"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        125.0,
                        181.0,
                        194.0,
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
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        125.0,
                        205.0,
                        120,
                        22
                    ],
                    "text": "prepend wave_shape",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        250.0,
                        205.0,
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
                    "id": "obj-22",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        39.0,
                        229.0,
                        86.0,
                        22.0
                    ],
                    "text": "pan_spread"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        125.0,
                        229.0,
                        194.0,
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
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        125.0,
                        253.0,
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
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        250.0,
                        253.0,
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
                    "id": "obj-25",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        39.0,
                        205.0,
                        65.0,
                        22.0
                    ],
                    "text": "masking"
                }
            },
            {
                "box": {
                    "id": "obj-attrui",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        104.0,
                        205.0,
                        215.0,
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
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        104.0,
                        229.0,
                        120,
                        22
                    ],
                    "text": "prepend masking",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        229.0,
                        229.0,
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
                    "id": "obj-28",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        39.0,
                        273.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen pulsar-synth replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/pulsar-synth.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/pulsar-synth.maxpat.",
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
                        "obj-5",
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
                        "obj-6",
                        0
                    ],
                    "destination": [
                        "obj-sig2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-8",
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
                        "obj-sig2",
                        0
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
                        "obj-1",
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
                        "obj-11",
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
                        "obj-9",
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
                        "obj-12",
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
                        "obj-2",
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
                        "obj-14",
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
                        "obj-9",
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
                        "obj-15",
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
                        "obj-3",
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
                        "obj-17",
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
                        "obj-9",
                        0
                    ],
                    "destination": [
                        "obj-18",
                        0
                    ],
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
                        "obj-20",
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
                        "obj-gen",
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
                        "obj-21",
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
                        "obj-4",
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
                        "obj-23",
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
                        "obj-gen",
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
                        "obj-24",
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
                        "obj-7",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-attrui",
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
                        "obj-gen",
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
                        "obj-27",
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
                        "obj-attrui",
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