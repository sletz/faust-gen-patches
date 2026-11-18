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
            134.0,
            174.0,
            520.0,
            640.0
        ],
        "default_fontname": "Lato",
        "boxes": [
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        32.0,
                        183.0,
                        232.0754716981132,
                        83.28301886792464
                    ],
                    "clipheight": 40.64150943396232,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u210012308",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            },
                            {
                                "absolutepath": "tabla-solo.wav",
                                "filename": "tabla-solo.wav",
                                "filekind": "audiofile",
                                "id": "u496005161",
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
                    "id": "obj-17",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        32.0,
                        142.0,
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
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        15.0,
                        185.0,
                        45.0
                    ],
                    "fontface": 1,
                    "fontname": "Lato",
                    "fontsize": 32.0,
                    "text": "Model Drive"
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
                        60.0,
                        410.0,
                        38.0
                    ],
                    "fontname": "Lato",
                    "fontsize": 13.0,
                    "linecount": 2,
                    "text": "Morphing multi-model distortion engine with loudness normalization\n(Tanh Overdrive -> Wavefolder -> Quantizer Bitcrush -> Modulo Wrap)"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 4,
                    "patching_rect": [
                        50.0,
                        342.0,
                        165.0,
                        23.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "varname": "faust_modeldrive",
                    "sourcecode": "// modeldrive: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/modeldrive.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// MODELDRIVE: morphing four-model distortion\n// (gen~: gendsp/modeldrive.gendsp)\n//\n// Each channel goes through four distortions computed at every sample, tanh\n// overdrive, wavefolder, staircase quantizer (followed by a DC blocker, pole\n// 0.995) and modulo wrap, morphed with equal-power weights (cos, sin of the\n// fraction) between neighbours by `model`; then a one-pole low-pass (`tone`,\n// coefficient w/(1 + w), w = 2 pi tone/sr, in [0.001, 0.999]), a tanh(1.1 x)\n// soft clip, the makeup gain, and a linear dry/wet mix with the input.\n// `level_comp` switches the per-model loudness weights (on: 0.36, fold\n// 0.45 * 1.33/max(0.1, hi_f), 0.575, 0.76; off: 0.15, 0.45, 0.25, 1.024). The\n// drive, from `drive` plus 100 in3, is clamped to [0, 1].\n//\n// in1, in2: audio L, R      in3: drive CV (in3 = 1 adds 100 to drive)\n// out1, out2: L, R (dry/wet)\n//\n// Parameters (gen~'s ranges and defaults): drive (0..100 %, 30), model\n// (0..100 %, 0), tone (100..18000 Hz, 12000), level_comp (0..1, 1; on above\n// 0.5), gain (-24..12 dB, 0), mix (0..100 %, 100).\n//\n// Kept from gen~:\n// - model maps to a morph position 0.03 * model in [0, 3]; at 100 % the\n//   position is exactly 3, whose integer part selects the quantizer/wrap pair\n//   with a fraction of 0: the output is the quantizer alone, not the wrap the\n//   header announces for 100 %. The wrap is approached as model goes to 100\n//   and never reached;\n// - the gendsp's header names it pisound-drive.gendsp.\n// Order of operations is gen's (keep() holds it against the normalizer).\n\ndeclare name \"modeldrive\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\ndrive = hslider(\"drive [unit:%]\", 30, 0, 100, 0.01);\nmodel = hslider(\"model [unit:%]\", 0, 0, 100, 0.01);\ntone = hslider(\"tone [unit:Hz]\", 12000, 100, 18000, 0.1);\nlevel_comp = hslider(\"level_comp\", 1, 0, 1, 0.01);\ngain = hslider(\"gain [unit:dB]\", 0, -24, 12, 0.01);\nmix = hslider(\"mix [unit:%]\", 100, 0, 100, 0.01);\n\nTWOPI = 6.2831853071795862;\nHALFPI = 1.5707963267948966;\nK = g.keep;\n\nmdrive(in1, in2, in3) = out1, out2\nwith {\n    eff_drive = g.clip(0, 1, K(drive + in3 * 100) * 0.01);\n    comp_active = level_comp > 0.5;\n\n    pos = g.clip(0, 3, model * 0.03);\n    idx = floor(pos);\n    fr = pos - idx;\n    w0 = cos(fr * HALFPI);\n    w1 = sin(fr * HALFPI);\n\n    p3 = g.safepow(eff_drive, 0.3);\n    p8 = g.safepow(eff_drive, 0.8);\n    scale_d1 = 8 + (35.0 - 8.0) * p3;\n    lo_f = K(-0.7 + (-0.3 - (-0.7)) * p8);\n    hi_f = K(0.7 + (0.3 - 0.7) * p8);\n    span = max(0.001, hi_f - lo_f);\n    scale_f = 1 + (6.0 - 1.0) * p3;\n    fold_comp = select2(comp_active, 1, K(K(g.safediv(0.7, max(0.1, hi_f))) * 1.9));\n    scale_q = 5 + (1.05 - 5.0) * p3;\n    scale_w = 1 + (6.0 - 1.0) * p3;\n\n    // one channel: the four models, morphed\n    dist(x) = select2(idx < 1, select2(idx < 2, m3 * w0 + m4 * w1, m2 * w0 + m3 * w1), m1 * w0 + m2 * w1)\n    with {\n        m1 = K(ma.tanh((x * 2) * scale_d1) * select2(comp_active, 0.15, 0.36));\n        x_f = (x * 2) * scale_f;\n        fold = lo_f + abs(g.wrap(0, 2 * span, K(K(x_f - lo_f) - span)) - span);\n        m2 = K(K(g.clip(-1, 1, fold) * 0.45) * fold_comp);\n        x_q = K(x * 0.6) * scale_q;\n        q = g.safediv(K(ceil(x_q) + floor(x_q + 0.5)) - 0.5, scale_q);\n        dc = (\\(y).(K(q - q') + 0.995 * y)) ~ _;\n        m3 = K(K(dc * 0.25) * select2(comp_active, 1.0, 2.3));\n        wr = g.wrap(-0.5, 0.5, K(x * 12) * scale_w);\n        m4 = K(K(wr * 0.8) * select2(comp_active, 1.28, 0.95));\n    };\n\n    tone_fc = g.clip(100, 18000, tone);\n    tone_omega = K(tone_fc * g.divsr(TWOPI));\n    tone_coeff = g.clip(0.001, 0.999, g.safediv(tone_omega, 1 + tone_omega));\n    lp(x) = (\\(h).(g.fixdenorm(h + tone_coeff * (x - h)))) ~ _;\n\n    make_up = g.dbtoa(gain);\n    lim_L = ma.tanh(lp(dist(in1)) * 1.1) * make_up;\n    lim_R = ma.tanh(lp(dist(in2)) * 1.1) * make_up;\n\n    eff_mix = g.clip(0, 1, mix * 0.01);\n    out1 = g.mix(in1, lim_L, eff_mix);\n    out2 = g.mix(in2, lim_R, eff_mix);\n};\n\nprocess = mdrive;\n// no noise: det is the same program\ndet = mdrive;\n",
                    "sourcecode_size": 17484,
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
                        50.0,
                        385.0,
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
                        50.0,
                        548.0,
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
                        120.0,
                        403.0,
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
                        120.0,
                        441.0,
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
                                "obj-12",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
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
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u496005161",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
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
                                "obj-12",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                0.8000000000000002,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                2000.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                33.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
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
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u496005161",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
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
                                "obj-12",
                                "flonum",
                                "float",
                                75.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                9.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                0.4000000000000001,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                6000.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                65.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
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
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u496005161",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute"
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                75.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                6000.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                75.0,
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
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
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u496005161",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
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
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        250.0,
                        372.0,
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
                    "id": "obj-22",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        288.0,
                        86.0,
                        23.0
                    ],
                    "text": "level_comp"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        360.0,
                        288.0,
                        109.0,
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
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        360.0,
                        313.0,
                        120,
                        22
                    ],
                    "text": "prepend level_comp",
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
                        485.0,
                        313.0,
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
                    "id": "obj-25",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        323.0,
                        60.0,
                        23.0
                    ],
                    "text": "gain (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        334.0,
                        323.0,
                        135.0,
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
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        334.0,
                        348.0,
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
                    "id": "obj-27",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        459.0,
                        348.0,
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
                        274.0,
                        358.0,
                        60.0,
                        23.0
                    ],
                    "text": "mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        334.0,
                        358.0,
                        135.0,
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
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        334.0,
                        383.0,
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
                    "id": "obj-30",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        459.0,
                        383.0,
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
                    "id": "obj-31",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        183.0,
                        60.0,
                        23.0
                    ],
                    "text": "model (%)"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        334.0,
                        183.0,
                        135.0,
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
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        334.0,
                        208.0,
                        120,
                        22
                    ],
                    "text": "prepend model",
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
                        459.0,
                        208.0,
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
                    "id": "obj-34",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        218.0,
                        60.0,
                        23.0
                    ],
                    "text": "drive (%)"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        334.0,
                        218.0,
                        135.0,
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
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        334.0,
                        243.0,
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
                    "id": "obj-36",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        459.0,
                        243.0,
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
                        274.0,
                        253.0,
                        60.0,
                        23.0
                    ],
                    "text": "tone (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        334.0,
                        253.0,
                        135.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 100.0,
                    "maximum": 18000.0
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        334.0,
                        278.0,
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
                    "id": "obj-39",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        459.0,
                        278.0,
                        90,
                        22
                    ],
                    "text": "set 12000.0",
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
                        50.0,
                        294.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen modeldrive replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/modeldrive.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/modeldrive.maxpat.",
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
                        "obj-10",
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
                        "obj-1",
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
                        "obj-1",
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
                        "obj-21",
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
                        "obj-21",
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
                        "obj-7",
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
                        "obj-21",
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
                        "obj-21",
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
                        "obj-9",
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