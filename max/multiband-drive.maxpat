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
            720.0,
            560.0
        ],
        "default_fontname": "Lato",
        "boxes": [
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        15.0,
                        260.0,
                        42.0
                    ],
                    "fontface": 1,
                    "fontname": "Lato",
                    "fontsize": 30.0,
                    "text": "Multiband Drive"
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
                        421.0,
                        38.0
                    ],
                    "fontname": "Lato",
                    "fontsize": 13.0,
                    "linecount": 2,
                    "text": "3-Band Linkwitz-Riley (LR4 24dB/oct) crossover distortion engine.\nIndependent morphing topologies, saturation mix & notch gain per band."
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
                        125.0,
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
                        155.0,
                        230.0,
                        85.0
                    ],
                    "clipheight": 84.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "drumLoop.aif",
                                "filename": "drumLoop.aif",
                                "filekind": "audiofile",
                                "id": "u673011316",
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
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 7,
                    "patching_rect": [
                        32.0,
                        275.0,
                        185.0,
                        23.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "varname": "faust_multiband_drive",
                    "sourcecode": "// multiband-drive: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/multiband-drive.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// MULTIBAND-DRIVE: 3-band crossover distortion\n// (gen~: gendsp/multiband-drive.gendsp)\n//\n// Each channel is split by two 4th-order crossovers (each side two cascaded\n// RBJ Butterworth biquads, Q = 1/sqrt(2), in direct form I): low = LP4(x) at\n// crossover1, rest = HP4(x) at crossover1, mid = LP4(rest) and high =\n// HP4(rest) at crossover2. Each band goes through a distortion that morphs\n// with equal-power weights between four models (tanh overdrive, wavefolder,\n// staircase quantizer, modulo wrap), all four computed at every sample, then\n// a dry/wet of the band with its distortion and the band level. The sum of\n// the three bands goes through a DC blocker (pole 0.995), a tanh(1.05 x)\n// soft clip, the makeup gain, and a linear dry/wet mix with the input.\n//\n// in1, in2: audio L, R\n// out1, out2: L, R (dry/wet)\n// out3, out4, out5: the low, mid and high bands, (L + R)/2, after their\n// distortion and level, before the master stage\n//\n// Parameters (gen~'s ranges and defaults): crossover1 (20..2000 Hz, 250),\n// crossover2 (200..18000 Hz, 3500); per band (low_, mid_, high_): band_gain\n// (-48..12 dB, 0), drive_mix (0..100 %, 50), model_choice (0..100 %; low 0,\n// mid 33.3, high 0); gain (-24..12 dB, 0), mix (0..100 %, 100).\n// The crossovers are kept 40 Hz apart: f1 = min(crossover1, crossover2 - 40)\n// in [20, 0.45 sr], f2 = max(crossover2, crossover1 + 40) in [40, 0.45 sr].\n//\n// Kept from gen~:\n// - model_choice maps to a morph position 0.03 * model_choice in [0, 3]; the\n//   gendsp says 0 % tanh, 33 % fold, 67 % quantizer, 100 % wrap, but at 100 %\n//   the position is exactly 3, its integer part 3 selects the quantizer/wrap\n//   pair with a fraction of 0: the output is the quantizer alone. The wrap is\n//   approached as model_choice goes to 100 and never reached;\n// - drive_mix is both the drive of the distortion (d_norm = drive_mix/100)\n//   and the dry/wet of the band with it;\n// - the quantizer (ceil(x) + floor(x + 0.5) - 0.5)/scale has an offset: on\n//   silence a band whose morph includes it outputs a constant (-0.5/scale *\n//   0.575, times the weights, the drive_mix and the level). The master DC\n//   blocker removes it from out1/out2, the band monitors out3..out5 keep it;\n// - a band level at or below -40 dB mutes the band (the header says -24 dB\n//   for the notch/erase);\n// - the low band is LP4(x) alone, without the allpass of the second\n//   crossover: low + mid + high is not allpass-flat around crossover2.\n// Order of operations is gen's (keep() holds it against the normalizer).\n\ndeclare name \"multiband-drive\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\ncrossover1 = hslider(\"crossover1 [unit:Hz]\", 250, 20, 2000, 0.1);\ncrossover2 = hslider(\"crossover2 [unit:Hz]\", 3500, 200, 18000, 0.1);\nlow_band_gain = hslider(\"low_band_gain [unit:dB]\", 0, -48, 12, 0.01);\nlow_drive_mix = hslider(\"low_drive_mix [unit:%]\", 50, 0, 100, 0.01);\nlow_model_choice = hslider(\"low_model_choice [unit:%]\", 0, 0, 100, 0.01);\nmid_band_gain = hslider(\"mid_band_gain [unit:dB]\", 0, -48, 12, 0.01);\nmid_drive_mix = hslider(\"mid_drive_mix [unit:%]\", 50, 0, 100, 0.01);\nmid_model_choice = hslider(\"mid_model_choice [unit:%]\", 33.3, 0, 100, 0.01);\nhigh_band_gain = hslider(\"high_band_gain [unit:dB]\", 0, -48, 12, 0.01);\nhigh_drive_mix = hslider(\"high_drive_mix [unit:%]\", 50, 0, 100, 0.01);\nhigh_model_choice = hslider(\"high_model_choice [unit:%]\", 0, 0, 100, 0.01);\ngain = hslider(\"gain [unit:dB]\", 0, -24, 12, 0.01);\nmix = hslider(\"mix [unit:%]\", 100, 0, 100, 0.01);\n\nTWOPI = 6.2831853071795862;\nHALFPI = 1.5707963267948966;\nK = g.keep;\n\n// the four distortion models, morphed (distort_sample of the gendsp)\ndistort(x_in, d_norm, m_pos) = out_s\nwith {\n    p3 = g.safepow(d_norm, 0.3);\n    p8 = g.safepow(d_norm, 0.8);\n    // 1: tanh overdrive\n    scale_d1 = 8 + (35.0 - 8.0) * p3;\n    m1 = K(ma.tanh((x_in * 2) * scale_d1) * 0.36);\n    // 2: wavefolder\n    lo_f = K(-0.7 + (-0.3 - (-0.7)) * p8);\n    hi_f = K(0.7 + (0.3 - 0.7) * p8);\n    scale_f = 1 + (6.0 - 1.0) * p3;\n    x_f = (x_in * 2) * scale_f;\n    span = max(0.001, hi_f - lo_f);\n    fold_raw = lo_f + abs(g.wrap(0, 2 * span, K(K(x_f - lo_f) - span)) - span);\n    clamp_f = g.clip(-1, 1, fold_raw);\n    fold_comp = K(K(g.safediv(0.7, max(0.1, hi_f))) * 1.9);\n    m2 = K(K(clamp_f * 0.45) * fold_comp);\n    // 3: quantizer\n    scale_q = 5 + (1.05 - 5.0) * p3;\n    x_q = K(x_in * 0.6) * scale_q;\n    q_sum = g.tdiv(K(ceil(x_q) + floor(x_q + 0.5)) - 0.5, scale_q);\n    m3 = K(K(q_sum * 0.25) * 2.3);\n    // 4: modulo wrap\n    scale_w = 1 + (6.0 - 1.0) * p3;\n    wrap_raw = g.wrap(-0.5, 0.5, K(x_in * 12) * scale_w);\n    m4 = K(K(wrap_raw * 0.8) * 0.95);\n    // equal-power morph\n    idx = floor(m_pos);\n    fr = m_pos - idx;\n    w0 = cos(fr * HALFPI);\n    w1 = sin(fr * HALFPI);\n    out_s = select2(idx < 1, select2(idx < 2, m3 * w0 + m4 * w1, m2 * w0 + m3 * w1), m1 * w0 + m2 * w1);\n};\n\n// crossover coefficients at f (shared by the LP and the HP)\nw_c(f) = g.divsr(K(TWOPI * f));\ncos_w(f) = cos(w_c(f));\nalpha(f) = sin(w_c(f)) * 0.70710678118;\na0(f) = 1 + alpha(f);\nb0_lp(f) = K(g.safediv(K((1 - cos_w(f)) * 0.5), a0(f)));\nb1_lp(f) = K(g.safediv(1 - cos_w(f), a0(f)));\na1(f) = K(g.safediv(-2 * cos_w(f), a0(f)));\na2(f) = K(g.safediv(1 - alpha(f), a0(f)));\nb0_hp(f) = K(g.safediv(K((1 + cos_w(f)) * 0.5), a0(f)));\nb1_hp(f) = K(g.safediv(0 - (1 + cos_w(f)), a0(f)));\n\n// direct form I biquad, gen's order: y = b0 x + b1 x1 + b2 x2 - a1 y1 - a2 y2\nbiquad(b0, b1, b2, a1v, a2v, x) = (\\(y1).(K(K(K(K(b0 * x) + b1 * x') + b2 * x'') - a1v * y1) - a2v * y1')) ~ _;\nlp(f) = biquad(b0_lp(f), b1_lp(f), b0_lp(f), a1(f), a2(f));\nhp(f) = biquad(b0_hp(f), b1_hp(f), b0_hp(f), a1(f), a2(f));\n\nf1 = g.clip(20, ma.SR * 0.45, min(crossover1, crossover2 - 40));\nf2 = g.clip(40, ma.SR * 0.45, max(crossover2, crossover1 + 40));\nlp4(f) = lp(f) : lp(f);\nhp4(f) = hp(f) : hp(f);\n\nbandgain(gdb) = select2(gdb <= -40, g.dbtoa(gdb), 0);\nm_pos(choice) = g.clip(0, 3, choice * 0.03);\nproc(x, dm, choice, gdb) = K(K(g.mix(x, distort(x, dm * 0.01, m_pos(choice)), dm * 0.01)) * bandgain(gdb));\n\ndcblk(s) = (\\(y).(K(s - s') + 0.995 * y)) ~ _;\n\nmbdrive(in1, in2) = out1, out2, out3, out4, out5\nwith {\n    low_L = in1 : lp4(f1);\n    rest_L = in1 : hp4(f1);\n    mid_L = rest_L : lp4(f2);\n    high_L = rest_L : hp4(f2);\n    low_R = in2 : lp4(f1);\n    rest_R = in2 : hp4(f1);\n    mid_R = rest_R : lp4(f2);\n    high_R = rest_R : hp4(f2);\n\n    proc_low_L = proc(low_L, low_drive_mix, low_model_choice, low_band_gain);\n    proc_low_R = proc(low_R, low_drive_mix, low_model_choice, low_band_gain);\n    proc_mid_L = proc(mid_L, mid_drive_mix, mid_model_choice, mid_band_gain);\n    proc_mid_R = proc(mid_R, mid_drive_mix, mid_model_choice, mid_band_gain);\n    proc_high_L = proc(high_L, high_drive_mix, high_model_choice, high_band_gain);\n    proc_high_R = proc(high_R, high_drive_mix, high_model_choice, high_band_gain);\n\n    sum_raw_L = K(proc_low_L + proc_mid_L) + proc_high_L;\n    sum_raw_R = K(proc_low_R + proc_mid_R) + proc_high_R;\n\n    make_up = g.dbtoa(gain);\n    lim_L = ma.tanh(dcblk(sum_raw_L) * 1.05) * make_up;\n    lim_R = ma.tanh(dcblk(sum_raw_R) * 1.05) * make_up;\n\n    eff_mix = g.clip(0, 1, mix * 0.01);\n    out1 = g.mix(in1, lim_L, eff_mix);\n    out2 = g.mix(in2, lim_R, eff_mix);\n    out3 = (proc_low_L + proc_low_R) * 0.5;\n    out4 = (proc_mid_L + proc_mid_R) * 0.5;\n    out5 = (proc_high_L + proc_high_R) * 0.5;\n};\n\nprocess = mbdrive;\n// no noise: det is the same program\ndet = mbdrive;\n",
                    "sourcecode_size": 20942,
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
                        320.0,
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
                    "id": "obj-6",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        480.0,
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
                        335.0,
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
                        370.0,
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
                                "obj-53",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-52",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-51",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-43",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-42",
                                "flonum",
                                "float",
                                37.0,
                                5,
                                "obj-41",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-33",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                2000.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                105.0,
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
                                "drumLoop.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "drumLoop.aif",
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
                                "u673011316",
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
                                "obj-53",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-52",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-51",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-43",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-42",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-41",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-33",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                4000.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                2000.0,
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
                                "drumLoop.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "drumLoop.aif",
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
                                "u673011316",
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
                                "obj-53",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-52",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-51",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-43",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-42",
                                "flonum",
                                "float",
                                36.0,
                                5,
                                "obj-41",
                                "flonum",
                                "float",
                                -3.0,
                                5,
                                "obj-33",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                6.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                4000.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                800.0,
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
                                "drumLoop.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "drumLoop.aif",
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
                                "u673011316",
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
                        195.0,
                        21.0
                    ],
                    "fontface": 1,
                    "fontname": "Lato",
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 Crossovers & Master \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        245.0,
                        195.0,
                        21.0
                    ],
                    "fontface": 1,
                    "fontname": "Lato",
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 Low Band (Sub/Bass) \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        495.0,
                        120.0,
                        195.0,
                        21.0
                    ],
                    "fontface": 1,
                    "fontname": "Lato",
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 Mid Band (Body/Voice) \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        495.0,
                        245.0,
                        195.0,
                        21.0
                    ],
                    "fontface": 1,
                    "fontname": "Lato",
                    "fontsize": 12.0,
                    "text": "\u2500\u2500 High Band (Presence/Air) \u2500\u2500"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        232.0,
                        305.0,
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
                    "id": "obj-106",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        145.0,
                        101.0,
                        23.0
                    ],
                    "text": "crossover1 (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        381.0,
                        145.0,
                        50.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 20.0,
                    "maximum": 2000.0
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        381.0,
                        170.0,
                        120,
                        22
                    ],
                    "text": "prepend crossover1",
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
                        506.0,
                        170.0,
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
                    "id": "obj-109",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        175.0,
                        101.0,
                        23.0
                    ],
                    "text": "crossover2 (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        381.0,
                        175.0,
                        50.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 200.0,
                    "maximum": 18000.0
                }
            },
            {
                "box": {
                    "id": "obj-110",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        381.0,
                        200.0,
                        120,
                        22
                    ],
                    "text": "prepend crossover2",
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
                        506.0,
                        200.0,
                        90,
                        22
                    ],
                    "text": "set 3500.0",
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
                        280.0,
                        205.0,
                        60.0,
                        23.0
                    ],
                    "text": "gain (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        340.0,
                        205.0,
                        89.5,
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
                    "id": "obj-113",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        340.0,
                        230.0,
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
                    "id": "obj-114",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        465.0,
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
                    "id": "obj-115",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        375.0,
                        65.0,
                        23.0
                    ],
                    "text": "mix (%)"
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
                        375.0,
                        50.0,
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
                    "id": "obj-116",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        345.0,
                        400.0,
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
                    "id": "obj-117",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        470.0,
                        400.0,
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
                    "id": "obj-118",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        270.0,
                        122.0,
                        23.0
                    ],
                    "text": "low_band_gain (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        402.0,
                        270.0,
                        73.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -48.0,
                    "maximum": 12.0
                }
            },
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        402.0,
                        295.0,
                        120,
                        22
                    ],
                    "text": "prepend low_band_gain",
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
                        527.0,
                        295.0,
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
                    "id": "obj-121",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        300.0,
                        122.0,
                        23.0
                    ],
                    "text": "low_drive_mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        402.0,
                        300.0,
                        73.0,
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
                    "id": "obj-122",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        402.0,
                        325.0,
                        120,
                        22
                    ],
                    "text": "prepend low_drive_mix",
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
                        527.0,
                        325.0,
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
                    "id": "obj-124",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        280.0,
                        330.0,
                        122.0,
                        23.0
                    ],
                    "text": "low_model_choice (%)"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        402.0,
                        330.0,
                        73.0,
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
                    "id": "obj-125",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        402.0,
                        355.0,
                        120,
                        22
                    ],
                    "text": "prepend low_model_choice",
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
                        527.0,
                        355.0,
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
                    "id": "obj-127",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        495.0,
                        145.0,
                        124.0,
                        23.0
                    ],
                    "text": "mid_band_gain (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        619.0,
                        145.0,
                        71.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -48.0,
                    "maximum": 12.0
                }
            },
            {
                "box": {
                    "id": "obj-128",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        619.0,
                        170.0,
                        120,
                        22
                    ],
                    "text": "prepend mid_band_gain",
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
                        744.0,
                        170.0,
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
                    "id": "obj-130",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        495.0,
                        175.0,
                        123.0,
                        23.0
                    ],
                    "text": "mid_drive_mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        618.0,
                        175.0,
                        72.0,
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
                    "id": "obj-131",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        618.0,
                        200.0,
                        120,
                        22
                    ],
                    "text": "prepend mid_drive_mix",
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
                        743.0,
                        200.0,
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
                    "id": "obj-133",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        495.0,
                        205.0,
                        124.0,
                        23.0
                    ],
                    "text": "mid_model_choice (%)"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        619.0,
                        205.0,
                        71.0,
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
                    "id": "obj-134",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        619.0,
                        230.0,
                        120,
                        22
                    ],
                    "text": "prepend mid_model_choice",
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
                        744.0,
                        230.0,
                        90,
                        22
                    ],
                    "text": "set 33.3",
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
                        495.0,
                        270.0,
                        124.0,
                        23.0
                    ],
                    "text": "high_band_gain (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        619.0,
                        270.0,
                        71.0,
                        23.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -48.0,
                    "maximum": 12.0
                }
            },
            {
                "box": {
                    "id": "obj-137",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        619.0,
                        295.0,
                        120,
                        22
                    ],
                    "text": "prepend high_band_gain",
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
                        744.0,
                        295.0,
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
                    "id": "obj-139",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        495.0,
                        300.0,
                        124.0,
                        23.0
                    ],
                    "text": "high_drive_mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        619.0,
                        300.0,
                        71.0,
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
                    "id": "obj-140",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        619.0,
                        325.0,
                        120,
                        22
                    ],
                    "text": "prepend high_drive_mix",
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
                        744.0,
                        325.0,
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
                        495.0,
                        330.0,
                        124.0,
                        23.0
                    ],
                    "text": "high_model_choice (%)"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        619.0,
                        330.0,
                        71.0,
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
                    "id": "obj-143",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        619.0,
                        355.0,
                        120,
                        22
                    ],
                    "text": "prepend high_model_choice",
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
                        744.0,
                        355.0,
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
                        32.0,
                        227.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen multiband-drive replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/multiband-drive.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/multiband-drive.maxpat.",
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
                        "obj-21",
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
                        "obj-1",
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
                        "obj-1",
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
                        "obj-1",
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
                        "obj-1",
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
                        "obj-24",
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
                        "obj-1",
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
                        "obj-1",
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
                        "obj-1",
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
                        "obj-33",
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
                        "obj-1",
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
                        "obj-41",
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
                        "obj-1",
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
                        "obj-42",
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
                        "obj-1",
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
                        "obj-43",
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
                        "obj-1",
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
                        "obj-51",
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
                        "obj-1",
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
                        "obj-52",
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
                        "obj-1",
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
                        "obj-53",
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