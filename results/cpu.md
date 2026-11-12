# CPU cost: gen~ exports against the Faust ports

Written by `scripts/bench_cpu.py` on 2026-11-12: Apple M5, Darwin 25.6.0, Now drawing from 'AC Power'; load average 2.5 at the start, 2.9 at the end. Apple clang version 21.0.0 (clang-2100.4.1.1), `-std=c++17 -O3 -ffp-contract=off`; FAUST Version 2.92.5; faust-rs 8c6bab82 2026-11-11.

Real-time factors (seconds of audio per second of compute; higher is cheaper), 5 s of audio at 48 kHz in blocks of 64, every input fed uniform noise, controls at their defaults, the compute call alone timed, best of 3 runs taken in turn. The last column is the speed of the Faust C++ over the gen~ export's (above 1: the Faust program is cheaper).

| model | gen~ export | Faust (faust C++) | Faust (faust-rs C++) | Faust (faustprobe JIT) | faust / gen~ |
|---|---|---|---|---|---|
| aether-drift | 427.6x | 376.8x | 376.9x | 201.0x | 0.88 |
| aether-particle | 388.4x | 237.0x | 219.6x | 98.5x | 0.61 |
| bernoulli-gate | 2433.8x | 13268.3x | 13155.1x | 2280.0x | 5.45 |
| cswitch-tremolo | 1048.3x | 1119.7x | 1195.9x | 548.0x | 1.07 |
| curvature-shaper | 1981.0x | 2006.8x | 2339.2x | 1096.0x | 1.01 |
| delays-delays | 24.5x | 24.2x | 23.8x | 11.7x | 0.99 |
| erbeverb-clone | 390.6x | 353.4x | 370.4x | 197.0x | 0.90 |
| frost-machine | 720.9x | 899.9x | 917.0x | 363.0x | 1.25 |
| householder-fdn-16 | 201.4x | 212.4x | 203.7x | 107.0x | 1.05 |
| hp_butterworth | 1870.5x | 3102.2x | 3021.7x | 2088.0x | 1.66 |
| lorenz-rossler-chaos | 1069.7x | 649.5x | 739.7x | 282.0x | 0.61 |
| lp_butterworth | 1799.8x | 2958.2x | 3009.6x | 2062.0x | 1.64 |
| offset-spline-random | 1022.6x | 1833.6x | 2170.0x | 598.0x | 1.79 |
| poisson-cloud | 1947.9x | 1846.8x | 1965.4x | 941.0x | 0.95 |
| precision-svf-48db | 370.8x | 398.4x | 399.6x | 205.0x | 1.07 |
| pulsar-synth | 2550.5x | 1685.5x | 1822.2x | 385.0x | 0.66 |
| sature-delay | 446.4x | 467.9x | 444.6x | 172.0x | 1.05 |
| tape-hysteresis | 620.4x | 662.8x | 717.4x | 597.0x | 1.07 |
| ufo-core-simple | 1451.5x | 1555.8x | 1717.6x | 1150.0x | 1.07 |
| ufo-core | 510.8x | 762.7x | 889.3x | 388.0x | 1.49 |
| ufo | 660.0x | 766.2x | 774.5x | 467.0x | 1.16 |
| volt-drama | 409.5x | 333.1x | 335.1x | 193.0x | 0.81 |
| volt-syphon | 468.0x | 461.6x | 464.5x | 356.0x | 0.99 |
| waveguide-string | 291.4x | 256.6x | 263.2x | 174.0x | 0.88 |
| zdf-diode-ladder | 410.7x | 388.4x | 394.7x | 270.0x | 0.95 |

Geometric mean of the speed ratios: faust C++ / gen~ 1.10, faust-rs C++ / gen~ 1.14.
