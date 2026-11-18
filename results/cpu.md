# CPU cost: gen~ exports against the Faust ports

Written by `scripts/bench_cpu.py` on 2026-11-18: Apple M5, Darwin 25.6.0, Now drawing from 'AC Power'; load average 2.0 at the start, 1.9 at the end. Apple clang version 21.0.0 (clang-2100.4.1.1), `-std=c++17 -O3 -ffp-contract=off`; FAUST Version 2.94.0; faust-rs 8f1b5d71 2026-11-16.

Real-time factors (seconds of audio per second of compute; higher is cheaper), 5 s of audio at 48 kHz in blocks of 64, every input fed uniform noise, controls at their defaults, the compute call alone timed, best of 3 runs taken in turn. The last column is the speed of the Faust C++ over the gen~ export's (above 1: the Faust program is cheaper). For the mc.gen~ patches (adm_panner, fdn_multireverb, spatial-dbap) the gen~ column is the cost of the N instances that mc.gen~ @chans N runs, which the Faust program computes in one.

| model | gen~ export | Faust (faust C++) | Faust (faust-rs C++) | Faust (faustprobe JIT) | faust / gen~ |
|---|---|---|---|---|---|
| adm_panner | 163.9x | 582.4x | 583.2x | 179.0x | 3.55 |
| aether-drift | 412.0x | 340.6x | 344.4x | 183.0x | 0.83 |
| aether-particle | 367.4x | 221.2x | 202.1x | 88.5x | 0.60 |
| bernoulli-gate | 2311.8x | 13252.7x | 13127.8x | 2272.0x | 5.73 |
| cswitch-tremolo | 966.4x | 1091.0x | 1223.0x | 516.0x | 1.13 |
| curvature-shaper | 1885.8x | 1941.1x | 2218.0x | 1058.0x | 1.03 |
| delays-delays | 24.3x | 22.8x | 23.7x | 11.2x | 0.94 |
| driller | 457.7x | 279.7x | 340.3x | 124.0x | 0.61 |
| erbeverb-clone | 331.5x | 338.6x | 350.9x | 175.0x | 1.02 |
| fdn_multireverb | 42.7x | 35.5x | 36.7x | 26.0x | 0.83 |
| fhickup | 316.2x | 322.7x | 324.2x | 185.0x | 1.02 |
| filterbank-8 | 176.8x | 148.2x | 172.0x | 121.0x | 0.84 |
| fm-supermod | 308.7x | 272.9x | 341.4x | 104.0x | 0.88 |
| frost-machine | 721.1x | 863.9x | 838.0x | 359.0x | 1.20 |
| grainer | 1465.7x | 2152.0x | 2253.1x | 864.0x | 1.47 |
| householder-fdn-16 | 169.1x | 136.8x | 135.7x | 68.4x | 0.81 |
| hp_butterworth | 1691.0x | 3180.4x | 3227.9x | 2027.0x | 1.88 |
| lorenz-rossler-chaos | 1144.0x | 643.0x | 781.7x | 256.0x | 0.56 |
| lp_butterworth | 1908.0x | 3157.4x | 3047.1x | 2056.0x | 1.65 |
| modeldrive | 384.0x | 362.9x | 372.5x | 280.0x | 0.94 |
| multiband-drive | 127.9x | 153.0x | 177.2x | 111.0x | 1.20 |
| offset-spline-random | 1064.6x | 1298.5x | 1773.4x | 328.0x | 1.22 |
| poisson-cloud | 2050.1x | 1837.3x | 2005.4x | 904.0x | 0.90 |
| precision-svf-48db | 363.1x | 383.9x | 390.4x | 199.0x | 1.06 |
| pulsar-synth | 2423.1x | 1760.2x | 1784.6x | 603.0x | 0.73 |
| rings | 96.3x | 283.2x | 311.6x | 105.0x | 2.94 |
| sature-delay | 455.8x | 391.7x | 411.7x | 149.0x | 0.86 |
| skipper | 1077.7x | 749.3x | 818.3x | 309.0x | 0.70 |
| spatial-dbap | 2.2x | 113.6x | 117.5x | 49.3x | 51.18 |
| tape-hysteresis | 636.1x | 673.2x | 717.0x | 597.0x | 1.06 |
| ufo | 690.0x | 771.8x | 838.1x | 487.0x | 1.12 |
| volt-drama | 398.3x | 302.5x | 314.2x | 170.0x | 0.76 |
| volt-syphon | 459.0x | 439.6x | 444.9x | 349.0x | 0.96 |
| waveguide-string | 282.6x | 226.4x | 253.2x | 154.0x | 0.80 |
| zdf-diode-ladder | 402.1x | 380.3x | 385.6x | 259.0x | 0.95 |

Geometric mean of the speed ratios: faust C++ / gen~ 1.20, faust-rs C++ / gen~ 1.28.
