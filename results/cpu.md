# CPU cost: gen~ exports against the Faust ports

Written by `scripts/bench_cpu.py` on 2026-11-18: Apple M5, Darwin 25.6.0, Now drawing from 'AC Power'; load average 2.3 at the start, 3.3 at the end. Apple clang version 21.0.0 (clang-2100.4.1.1), `-std=c++17 -O3 -ffp-contract=off`; FAUST Version 2.94.0; faust-rs 8f1b5d71 2026-11-16.

Real-time factors (seconds of audio per second of compute; higher is cheaper), 5 s of audio at 48 kHz in blocks of 64, every input fed uniform noise, controls at their defaults, the compute call alone timed, best of 3 runs taken in turn. The last column is the speed of the Faust C++ over the gen~ export's (above 1: the Faust program is cheaper).

| model | gen~ export | Faust (faust C++) | Faust (faust-rs C++) | Faust (faustprobe JIT) | faust / gen~ |
|---|---|---|---|---|---|
| adm_panner | 830.5x | 585.8x | 594.5x | 184.0x | 0.71 |
| aether-drift | 421.1x | 366.2x | 366.7x | 198.0x | 0.87 |
| aether-particle | 387.8x | 235.2x | 216.7x | 99.3x | 0.61 |
| bernoulli-gate | 4587.6x | 21644.7x | 21403.9x | 2414.0x | 4.72 |
| cswitch-tremolo | 1264.6x | 1338.3x | 1438.5x | 525.0x | 1.06 |
| curvature-shaper | 3015.8x | 2839.2x | 3106.1x | 1092.0x | 0.94 |
| delays-delays | 24.5x | 23.7x | 24.5x | 11.7x | 0.97 |
| driller | 468.9x | 288.7x | 343.5x | 127.0x | 0.62 |
| erbeverb-clone | 388.9x | 352.6x | 362.3x | 193.0x | 0.91 |
| fdn_multireverb | 363.0x | 37.0x | 38.1x | 28.5x | 0.10 |
| fhickup | 326.9x | 324.3x | 324.1x | 185.0x | 0.99 |
| filterbank-8 | 179.5x | 150.1x | 172.6x | 121.0x | 0.84 |
| fm-supermod | 311.1x | 277.4x | 335.8x | 106.0x | 0.89 |
| frost-machine | 832.2x | 995.8x | 980.9x | 361.0x | 1.20 |
| grainer | 2240.5x | 2981.8x | 2942.5x | 913.0x | 1.33 |
| householder-fdn-16 | 169.6x | 142.2x | 139.1x | 73.5x | 0.84 |
| hp_butterworth | 3045.8x | 4739.4x | 4408.9x | 2077.0x | 1.56 |
| lorenz-rossler-chaos | 1426.0x | 749.1x | 888.9x | 257.0x | 0.53 |
| lp_butterworth | 3072.3x | 4667.1x | 4413.5x | 2043.0x | 1.52 |
| modeldrive | 374.8x | 346.0x | 358.9x | 280.0x | 0.92 |
| multiband-drive | 128.1x | 151.3x | 177.5x | 111.0x | 1.18 |
| offset-spline-random | 1428.8x | 2640.6x | 2748.2x | 571.0x | 1.85 |
| poisson-cloud | 3036.7x | 2605.6x | 2690.5x | 901.0x | 0.86 |
| precision-svf-48db | 364.5x | 376.7x | 389.4x | 197.0x | 1.03 |
| pulsar-synth | 3504.9x | 2400.2x | 2323.3x | 586.0x | 0.68 |
| rings | 95.9x | 283.0x | 309.5x | 103.0x | 2.95 |
| sature-delay | 454.0x | 389.1x | 408.4x | 148.0x | 0.86 |
| skipper | 1240.7x | 816.1x | 860.4x | 306.0x | 0.66 |
| spatial-dbap | 861.8x | 113.5x | 116.9x | 49.4x | 0.13 |
| tape-hysteresis | 715.1x | 732.4x | 725.1x | 573.0x | 1.02 |
| ufo | 805.2x | 832.4x | 879.1x | 476.0x | 1.03 |
| volt-drama | 397.5x | 300.6x | 310.6x | 169.0x | 0.76 |
| volt-syphon | 453.1x | 427.5x | 431.4x | 336.0x | 0.94 |
| waveguide-string | 277.2x | 226.1x | 245.5x | 150.0x | 0.82 |
| zdf-diode-ladder | 387.1x | 357.3x | 363.8x | 250.0x | 0.92 |

Geometric mean of the speed ratios: faust C++ / gen~ 0.89, faust-rs C++ / gen~ 0.93.
