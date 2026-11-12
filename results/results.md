# Faust ports against the gen~ exports

Written by `scripts/test_gen.py` on 2026-11-12, arm64 Darwin 25.6.0; faust-rs 8c6bab82 2026-11-11; gen~ export of Max 9.2.1. 48000 Hz, blocks of 64, double precision on both sides, the same input and noise streams.

Error: the largest |gen - faust| over the window, in dB of the peak of that output in gen's render; worst output first, then every output.

| model | setting | frames | worst (dB) | tolerance | outputs (dB) | |
|---|---|---|---|---|---|---|
| aether-drift | default | 144000 | -224.5 | -180 | -225 -225 | ok |
| aether-drift | short-dense | 144000 | -213.6 | -180 | -214 -215 | ok |
| aether-drift | time-sweep | 144000 | -216.9 | -180 | -217 -218 | ok |
| aether-drift | hot | 144000 | -207.3 | -180 | -209 -207 | ok |
| aether-particle | default | 192000 | -244.3 | -180 | -248 -244 | ok |
| aether-particle | dense-near | 192000 | -257.2 | -180 | -258 -257 | ok |
| aether-particle | regen-bright | 192000 | -226.8 | -180 | -227 -228 | ok |
| aether-particle | freeze-clear | 192000 | -246.7 | -180 | -247 -247 | ok |
| bernoulli-gate | default | 96000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| bernoulli-gate | p0.8 | 96000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| bernoulli-gate | internal-37Hz | 96000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| cswitch-tremolo | default | 96000 | -267.5 | -180 | -270 -268 −∞ −∞ | ok |
| cswitch-tremolo | jitter-fast | 96000 | -265.5 | -180 | -270 -265 −∞ −∞ | ok |
| cswitch-tremolo | slow-wide | 96000 | -279.4 | -180 | -279 -279 −∞ −∞ | ok |
| cswitch-tremolo | reset | 96000 | -260.5 | -180 | -261 -268 −∞ −∞ | ok |
| curvature-shaper | default | 96000 | -319.1 | -180 | -319 -319 | ok |
| curvature-shaper | s-curve | 96000 | -319.1 | -180 | -319 -319 | ok |
| curvature-shaper | inverse | 96000 | -319.1 | -180 | -319 -319 | ok |
| curvature-shaper | unclamped | 96000 | -319.1 | -180 | -319 -319 | ok |
| delays-delays | default | 264000 | -214.1 | -180 | -304 -214 −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ | ok |
| delays-delays | filters-fb | 264000 | -208.7 | -180 | -304 -209 −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ | ok |
| delays-delays | mc-spread | 264000 | -199.9 | -180 | -222 -224 -269 -271 -271 -270 -270 -269 -206 -203 -201 -200 -201 -200 -203 -238 −∞ −∞ −∞ −∞ | ok |
| delays-delays | clear | 264000 | -191.4 | -180 | -284 -225 -205 -201 -209 -266 -203 -201 -201 -239 -241 -210 -194 -191 -205 -232 −∞ −∞ −∞ −∞ | ok |
| erbeverb-clone | default | 144000 | -244.1 | -180 | -244 -244 | ok |
| erbeverb-clone | big-infinite | 144000 | -238.3 | -180 | -238 -240 | ok |
| erbeverb-clone | small-dark | 144000 | -254.2 | -180 | -254 -255 | ok |
| frost-machine | default | 144000 | -262.2 | -180 | -267 -262 | ok |
| frost-machine | huge-fuzz | 144000 | -222.6 | -180 | -225 -223 | ok |
| frost-machine | small-clean-pump | 144000 | -306.9 | -180 | -310 -307 | ok |
| frost-machine | sweeps | 144000 | -214.4 | -180 | -217 -214 | ok |
| householder-fdn-16 | default | 144000 | -254.2 | -180 | -255 -254 | ok |
| householder-fdn-16 | big-long | 144000 | -243.1 | -180 | -245 -243 | ok |
| householder-fdn-16 | small-dark | 144000 | -248.5 | -180 | -250 -248 | ok |
| householder-fdn-16 | size-sweep | 144000 | -241.6 | -180 | -247 -242 | ok |
| hp_butterworth | default | 96000 | -253.6 | -180 | -254 | ok |
| hp_butterworth | glide | 96000 | -249.2 | -180 | -249 | ok |
| lorenz-rossler-chaos | default | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | rossler | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | lorenz-cv-inject | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | rossler-cv | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | lorenz-blowup | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | switch | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lp_butterworth | default | 96000 | -247.3 | -180 | -247 | ok |
| lp_butterworth | glide | 96000 | -265.8 | -180 | -266 | ok |
| offset-spline-random | default | 96000 | -290.2 | -180 | -303 −∞ -290 −∞ | ok |
| offset-spline-random | stepped | 96000 | -290.8 | -180 | −∞ −∞ -291 −∞ | ok |
| offset-spline-random | external | 96000 | -307.8 | -180 | -309 −∞ -308 −∞ | ok |
| offset-spline-random | changes | 96000 | -289.8 | -180 | -290 −∞ -290 −∞ | ok |
| poisson-cloud | default | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| poisson-cloud | poisson | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| poisson-cloud | loop-dense | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| poisson-cloud | loop-change | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| precision-svf-48db | default | 96000 | -285.9 | -180 | -286 -286 | ok |
| precision-svf-48db | hp-sweep | 96000 | -288.2 | -180 | -288 -289 | ok |
| precision-svf-48db | morph-drive | 96000 | -280.3 | -180 | -282 -280 | ok |
| precision-svf-48db | fast-high | 96000 | -282.2 | -180 | -285 -282 | ok |
| pulsar-synth | default | 96000 | -244.0 | -180 | -244 -244 | ok |
| pulsar-synth | masked-tri-gauss | 96000 | -251.6 | -180 | -252 -252 | ok |
| pulsar-synth | chirp-exp | 96000 | -238.7 | -180 | -239 -239 | ok |
| pulsar-synth | harm-rect | 96000 | -239.4 | -180 | -239 -239 | ok |
| sature-delay | default | 144000 | -290.6 | -180 | -291 -295 | ok |
| sature-delay | digital-crush | 144000 | -282.8 | -180 | -283 -283 | ok |
| sature-delay | battery | 144000 | -221.4 | -180 | -221 -223 | ok |
| sature-delay | modes-sweep | 144000 | -234.3 | -180 | -234 -236 | ok |
| tape-hysteresis | default | 96000 | -289.4 | -180 | -290 -289 | ok |
| tape-hysteresis | hot-biased | 96000 | -276.5 | -180 | -276 -285 | ok |
| tape-hysteresis | soft-mix | 96000 | -294.9 | -180 | -295 -295 | ok |
| ufo-core-simple | default | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core-simple | params | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core-simple | exp-inlets | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core-simple | fsteps-resync | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core-simple | oneshot | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core-simple | oneshot-inlets | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core-simple | oneshot-negshots | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core-simple | modulated | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | default | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | triangle | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | saw | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | square | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | random | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | smooth | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | smooth-fsteps | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | smooth-fmod | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | smooth-fsync | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | smooth-resync | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | smooth-param | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | wave-steps | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | curves | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | expc2 | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | curves-mod | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | inv-unip | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | inv-unip-inlets | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | gain-offset | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | offset-neg | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | oneshot | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | oneshot-param | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | oneshot-smooth | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | oneshot-negshots | 96000 | −∞ | -180 | −∞ | ok |
| ufo-core | audio-rate | 96000 | −∞ | -180 | −∞ | ok |
| ufo | default | 96000 | −∞ | -180 | −∞ | ok |
| ufo | triangle | 96000 | −∞ | -180 | −∞ | ok |
| ufo | cos-steps | 96000 | −∞ | -180 | −∞ | ok |
| ufo | tri-fm | 96000 | −∞ | -180 | −∞ | ok |
| ufo | curves | 96000 | −∞ | -180 | −∞ | ok |
| ufo | tri-curves | 96000 | −∞ | -180 | −∞ | ok |
| ufo | inv-unip | 96000 | −∞ | -180 | −∞ | ok |
| ufo | unipolar | 96000 | −∞ | -180 | −∞ | ok |
| ufo | gain-offset | 96000 | −∞ | -180 | −∞ | ok |
| ufo | oneshot | 96000 | −∞ | -180 | −∞ | ok |
| ufo | oneshot-half | 96000 | −∞ | -180 | −∞ | ok |
| ufo | oneshot-zero | 96000 | −∞ | -180 | −∞ | ok |
| ufo | resync-free | 96000 | −∞ | -180 | −∞ | ok |
| ufo | switch | 96000 | −∞ | -180 | −∞ | ok |
| volt-drama | default | 144000 | -238.9 | -180 | -242 -239 | ok |
| volt-drama | drone | 144000 | -237.3 | -180 | -237 -238 | ok |
| volt-drama | time-sweep | 144000 | -285.1 | -180 | -289 -285 | ok |
| volt-drama | clean | 144000 | -293.4 | -180 | -295 -293 | ok |
| volt-syphon | default | 96000 | -290.0 | -180 | -290 -290 | ok |
| volt-syphon | follow-selfmod | 96000 | −∞ | -180 | −∞ −∞ | ok |
| volt-syphon | gate-sag | 96000 | -261.6 | -180 | -262 -262 | ok |
| volt-syphon | raw | 96000 | -290.4 | -180 | -290 -291 | ok |
| waveguide-string | default | 96000 | -298.1 | -180 | -298 -300 | ok |
| waveguide-string | wide-stiff | 96000 | -307.3 | -180 | -307 -308 | ok |
| waveguide-string | low-long-trig | 96000 | -273.1 | -180 | -273 -273 | ok |
| waveguide-string | high-noise | 96000 | -299.3 | -180 | -299 -302 | ok |
| zdf-diode-ladder | default | 96000 | −∞ | -180 | −∞ −∞ | ok |
| zdf-diode-ladder | envmod-accent | 96000 | -246.5 | -180 | -259 -247 | ok |
| zdf-diode-ladder | neg-env-sweep | 96000 | -306.9 | -180 | -307 -313 | ok |
| zdf-diode-ladder | self-osc | 96000 | -256.8 | -180 | -257 -260 | ok |

## Notes

- **delays-delays**: buf_taps (undeclared by the export) is the content the maxpat loads, computed by scripts/delays_delays_buffer.py from tap_manager.js and pattr ma_sphere, given to gen_ref by --buffer; every Param lacks min/max, so the export clamps them to [0, 1] and the settings stay there. Residual ~1e-11 (-190 dB) on the right line: the 2^21-sample ring quantizes genlib's interpolation fraction to 2^-31, and Faust reassociates the spread term of the delay by an ulp.
