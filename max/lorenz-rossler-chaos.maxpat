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
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        392.0,
                        393.0,
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
                    "id": "obj-16",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        392.0,
                        430.0,
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
                                "attrui",
                                "attr",
                                "x",
                                5,
                                "obj-8",
                                "attrui",
                                "float",
                                0.1,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-12",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-14",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.5000000000000001
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        244.0,
                        352.0,
                        136.0,
                        118.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        89.0,
                        352.0,
                        136.0,
                        118.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        3.0,
                        197.0,
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
                    "id": "obj-3",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        322.0,
                        289.0,
                        59.0,
                        57.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        244.0,
                        289.0,
                        59.0,
                        57.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        166.0,
                        289.0,
                        59.0,
                        57.0
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
                        3.0,
                        7.0,
                        583.0,
                        47.0
                    ],
                    "fontface": 0,
                    "fontsize": 36.0,
                    "text": "Lorenz & R\u00f6ssler Strange Attractors"
                }
            },
            {
                "box": {
                    "id": "obj-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        25.0,
                        72.0,
                        161.0,
                        24.0
                    ],
                    "fontface": 0,
                    "fontsize": 16.0,
                    "text": "Chaotic Audio Engine"
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        459.0,
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
                        30.0,
                        289.0,
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
                    "id": "obj-gen",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 6,
                    "patching_rect": [
                        30.0,
                        238.0,
                        310.0,
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
                    "sourcecode": "// lorenz-rossler-chaos: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/lorenz-rossler-chaos.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// LORENZ-ROSSLER-CHAOS: Lorenz and R\u00f6ssler strange attractors integrated by RK4\n// (gen~: gendsp/lorenz-rossler-chaos.gendsp)\n//\n// One RK4 step per sample of the Lorenz system (sigma = 10*max(drive, 0.05),\n// rho = param_rho, beta = 8/3) or of the R\u00f6ssler system (a = b = 0.2,\n// c = param_rho mapped 10..60 -> 4..9), dt = min(1.2*speed'/sr, 0.024) with\n// speed' = clamp(speed + 200*in2, 0.01, 1000). in1*inject*0.2 perturbs the x\n// fed to the derivatives (not the integrated x). The state restarts at\n// (0.1, 0.1, 0.1) when a coordinate leaves [-100, 100].\n//\n// in1: audio injection on x    in2: speed CV (+200 per unit)\n// out1, out2, out3: x, y, z scaled to [-1, 1] (clamped)\n// out4: trigger on the upward zero crossing of out1\n//\n// Parameters: system (0..1, def 0: < 0.5 Lorenz, else R\u00f6ssler),\n// speed (0.01..1000, def 150), drive (0..2, def 1: Lorenz sigma),\n// param_rho (10..60, def 28), inject (0..1, def 0).\n//\n// gen~ behaviour kept: in Lorenz mode with param_rho above about 51-55 (drive\n// 1), the first excursion from (0.1, 0.1, 0.1) leaves [-100, 100], so the\n// state restarts there forever: a periodic burst (every 75 samples at speed 150 and rho 60,\n// 104 at rho 55) instead of the attractor.\n\ndeclare name \"lorenz-rossler-chaos\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nsystem = hslider(\"system\", 0, 0, 1, 1);\nspeed = hslider(\"speed\", 150, 0.01, 1000, 0.01);\ndrive = hslider(\"drive\", 1, 0, 2, 0.001);\nparam_rho = hslider(\"param_rho\", 28, 10, 60, 0.01);\ninject = hslider(\"inject\", 0, 0, 1, 0.001);\n\n// Faust's normalizer reorders this arithmetic (it distributes sigma over\n// (py - px), merges dt*1/6 with the parameters, factors the RK4 sums), and a\n// chaotic system turns each ulp of difference into a different trajectory\n// within a few thousand samples. Every operation goes through K, an identity\n// the normalizer does not see through (for finite x, which the reset to 0.1\n// above |100| ensures), so that the program computes gen's expressions in\n// gen's order.\nK = g.keep;\nadd(a, b) = K(a + b);\nsub(a, b) = K(a - b);\nmul(a, b) = K(a * b);\n// x / SR as a true division (the normalizer turns /SR into *(1/SR))\ndivsr = g.divsr;\n\nlorenz_dx(px, py, pz, sigm) = mul(sigm, sub(py, px));\nlorenz_dy(px, py, pz, r_val) = sub(mul(px, sub(r_val, pz)), py);\nlorenz_dz(px, py, pz, bet) = sub(mul(px, py), mul(bet, pz));\n\nrossler_dx(px, py, pz) = sub(K(0 - py), pz);\nrossler_dy(px, py, pz, a_val) = add(px, mul(a_val, py));\nrossler_dz(px, py, pz, b_val, c_val) = add(b_val, mul(pz, sub(px, c_val)));\n\n// one RK4 step of the derivative triple (fx, fy, fz) from (x_in, y, z),\n// x itself (not x_in) integrated; the export writes dt/6 as dt*0.16666666666666666\n_rk4(fx, fy, fz, dt, x, x_in, y, z) = xn, yn, zn\nwith {\n    k1x = fx(x_in, y, z); k1y = fy(x_in, y, z); k1z = fz(x_in, y, z);\n    h = mul(0.5, dt);\n    a2x = add(x_in, mul(h, k1x)); a2y = add(y, mul(h, k1y)); a2z = add(z, mul(h, k1z));\n    k2x = fx(a2x, a2y, a2z); k2y = fy(a2x, a2y, a2z); k2z = fz(a2x, a2y, a2z);\n    a3x = add(x_in, mul(h, k2x)); a3y = add(y, mul(h, k2y)); a3z = add(z, mul(h, k2z));\n    k3x = fx(a3x, a3y, a3z); k3y = fy(a3x, a3y, a3z); k3z = fz(a3x, a3y, a3z);\n    a4x = add(x_in, mul(dt, k3x)); a4y = add(y, mul(dt, k3y)); a4z = add(z, mul(dt, k3z));\n    k4x = fx(a4x, a4y, a4z); k4y = fy(a4x, a4y, a4z); k4z = fz(a4x, a4y, a4z);\n    d6 = mul(dt, 0.16666666666666666);\n    rksum(k1, k2, k3, k4) = add(add(add(k1, mul(2, k2)), mul(2, k3)), k4);\n    xn = add(x, mul(d6, rksum(k1x, k2x, k3x, k4x)));\n    yn = add(y, mul(d6, rksum(k1y, k2y, k3y, k4y)));\n    zn = add(z, mul(d6, rksum(k1z, k2z, k3z, k4z)));\n};\n\nchaos(in1, in2) = norm_x, norm_y, norm_z, trig_pulse\nwith {\n    lor = system < 0.5;\n    eff_speed = g.clamp(0.01, 1000, add(speed, mul(in2, 200)));\n    dt = min(mul(divsr(eff_speed), 1.2), 0.024);\n\n    sig_param = mul(10, max(drive, 0.05));\n    rho_param = param_rho;\n    beta_param = 2.6666666666666665;\n    // scale(param_rho, 10, 60, 4, 9): ((rho - 10) * 0.02)^1 * 5 + 4\n    c_param = add(mul(mul(sub(param_rho, 10), 0.02), 5), 4);\n\n    step(x, y, z) = xr, yr, zr\n    with {\n        x_in = add(x, mul(mul(in1, inject), 0.2));\n        // the derivatives as functions of (px, py, pz), parameters bound\n        lx = _rk4(\\(px, py, pz).(lorenz_dx(px, py, pz, sig_param)),\n                  \\(px, py, pz).(lorenz_dy(px, py, pz, rho_param)),\n                  \\(px, py, pz).(lorenz_dz(px, py, pz, beta_param)),\n                  dt, x, x_in, y, z);\n        rx = _rk4(rossler_dx,\n                  \\(px, py, pz).(rossler_dy(px, py, pz, 0.2)),\n                  \\(px, py, pz).(rossler_dz(px, py, pz, 0.2, c_param)),\n                  dt, x, x_in, y, z);\n        xs = select2(lor, (rx : _, !, !), (lx : _, !, !));\n        ys = select2(lor, (rx : !, _, !), (lx : !, _, !));\n        zs = select2(lor, (rx : !, !, _), (lx : !, !, _));\n        blow = (abs(xs) > 100) | (abs(ys) > 100) | (abs(zs) > 100);\n        xr = select2(blow, xs, 0.1);\n        yr = select2(blow, ys, 0.1);\n        zr = select2(blow, zs, 0.1);\n    };\n    // History x(0.1), y(0.1), z(0.1)\n    st = step ~ (g.init(0.1), g.init(0.1), g.init(0.1));\n    xo = st : _, !, !;\n    yo = st : !, _, !;\n    zo = st : !, !, _;\n\n    norm_x = g.clamp(-1, 1, select2(lor, xo * 0.08, xo * 0.05));\n    norm_y = g.clamp(-1, 1, select2(lor, yo * 0.08, yo * 0.04));\n    norm_z = g.clamp(-1, 1, select2(lor, (zo - 5.0) * 0.15, (zo - 25.0) * 0.04));\n    trig_pulse = (norm_x > 0) & (norm_x' <= 0);\n};\n\nprocess = chaos;\ndet = process;\n",
                    "sourcecode_size": 17700,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_lorenz_rossler_chaos"
                }
            },
            {
                "box": {
                    "id": "obj-scopeL",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        88.0,
                        289.0,
                        59.0,
                        57.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        230.0,
                        268.0,
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
                    "id": "obj-19",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        171.0,
                        60.0,
                        22.0
                    ],
                    "text": "speed"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        90.0,
                        171.0,
                        90.0,
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
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        90.0,
                        195.0,
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
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        215.0,
                        195.0,
                        90,
                        22
                    ],
                    "text": "set 150.0",
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
                        195.0,
                        171.0,
                        60.0,
                        22.0
                    ],
                    "text": "inject"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        255.0,
                        171.0,
                        90.0,
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
                        255.0,
                        195.0,
                        120,
                        22
                    ],
                    "text": "prepend inject",
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
                        380.0,
                        195.0,
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
                    "id": "obj-25",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        198.0,
                        60.0,
                        22.0
                    ],
                    "text": "system"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        90.0,
                        198.0,
                        90.0,
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
                        90.0,
                        222.0,
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
                    "id": "obj-27",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        215.0,
                        222.0,
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
                    "id": "obj-28",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        195.0,
                        145.0,
                        79.0,
                        22.0
                    ],
                    "text": "param_rho"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        274.0,
                        145.0,
                        71.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 10.0,
                    "maximum": 60.0
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        274.0,
                        169.0,
                        120,
                        22
                    ],
                    "text": "prepend param_rho",
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
                        399.0,
                        169.0,
                        90,
                        22
                    ],
                    "text": "set 28.0",
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
                        30.0,
                        145.0,
                        300.0,
                        22.0
                    ],
                    "text": "gen~ History 'x': internal state in Faust, not settable",
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
                    "id": "obj-32",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        190.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen lorenz-rossler-chaos replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/lorenz-rossler-chaos.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/lorenz-rossler-chaos.maxpat.",
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
                        "obj-16",
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
                        "obj-17",
                        0
                    ],
                    "destination": [
                        "obj-16",
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
                        "obj-1",
                        0
                    ],
                    "hidden": 1,
                    "order": 2
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        2
                    ],
                    "destination": [
                        "obj-2",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        3
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
                        "obj-gen",
                        1
                    ],
                    "destination": [
                        "obj-4",
                        1
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        0
                    ],
                    "destination": [
                        "obj-4",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        2
                    ],
                    "destination": [
                        "obj-5",
                        1
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        1
                    ],
                    "destination": [
                        "obj-5",
                        0
                    ],
                    "hidden": 1,
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
                        "obj-gain",
                        0
                    ],
                    "order": 2
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        0
                    ],
                    "destination": [
                        "obj-scopeL",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-10",
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
                        "obj-18",
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
                        "obj-18",
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
                        "obj-11",
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
                        "obj-18",
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
                        "obj-12",
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
                        "obj-gen",
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