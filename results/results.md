# Faust ports against the gen~ exports

Written by `scripts/test_gen.py` on 2026-11-18, arm64 Darwin 25.6.0; faust-rs 8f1b5d71 2026-11-16; gen~ export of Max 9.2.1. 48000 Hz, blocks of 64, double precision on both sides, the same input and noise streams.

Error: the largest |gen - faust| over the window, in dB of the peak of that output in gen's render; worst output first, then every output.

| model | setting | frames | worst (dB) | tolerance | outputs (dB) | |
|---|---|---|---|---|---|---|
| adm_panner | default | 96000 | -312.3 | -180 | -316 -316 -313 -312 -315 -349 -318 -368 | ok |
| adm_panner | circ-narrow | 96000 | -305.0 | -180 | -311 -311 -310 -314 -307 -311 -309 -305 | ok |
| adm_panner | linear | 96000 | -310.6 | -180 | -313 -311 -313 -312 -312 -311 -315 -311 | ok |
| adm_panner | switch | 96000 | -310.4 | -180 | -323 -322 -317 -310 -317 -319 -318 -317 | ok |
| aether-drift | default | 144000 | -294.9 | -180 | -296 -295 | ok |
| aether-drift | short-dense | 144000 | -214.3 | -180 | -214 -215 | ok |
| aether-drift | time-sweep | 144000 | -216.9 | -180 | -217 -218 | ok |
| aether-drift | hot | 144000 | -275.6 | -180 | -277 -276 | ok |
| aether-particle | default | 192000 | -244.3 | -180 | -248 -244 | ok |
| aether-particle | dense-near | 192000 | -257.1 | -180 | -259 -257 | ok |
| aether-particle | regen-bright | 192000 | -227.0 | -180 | -227 -228 | ok |
| aether-particle | freeze-clear | 192000 | -245.3 | -180 | -251 -245 | ok |
| bernoulli-gate | default | 96000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| bernoulli-gate | p0.8 | 96000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| bernoulli-gate | internal-37Hz | 96000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| cswitch-tremolo | default | 96000 | -275.4 | -180 | -279 -275 −∞ −∞ | ok |
| cswitch-tremolo | jitter-fast | 96000 | -268.4 | -180 | -268 -270 −∞ −∞ | ok |
| cswitch-tremolo | slow-wide | 96000 | -297.9 | -180 | -298 -300 −∞ −∞ | ok |
| cswitch-tremolo | reset | 96000 | -270.3 | -180 | -270 -271 −∞ −∞ | ok |
| curvature-shaper | default | 96000 | -319.1 | -180 | -319 -319 | ok |
| curvature-shaper | s-curve | 96000 | -319.1 | -180 | -319 -319 | ok |
| curvature-shaper | inverse | 96000 | -319.1 | -180 | -319 -319 | ok |
| curvature-shaper | unclamped | 96000 | -319.1 | -180 | -319 -319 | ok |
| curvature-shaper | wide-ab | 96000 | -318.9 | -180 | -319 -319 | ok |
| delays-delays | default | 264000 | -214.1 | -180 | -304 -214 −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ | ok |
| delays-delays | filters-fb | 264000 | -216.4 | -180 | -298 -216 −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ | ok |
| delays-delays | mc-spread | 264000 | -209.1 | -180 | -270 -224 -238 -237 -235 -236 -209 -221 -256 -269 -277 -275 -290 -278 -277 -268 −∞ −∞ −∞ −∞ | ok |
| delays-delays | clear | 264000 | -191.5 | -180 | -231 -235 -231 -215 -228 -228 -226 -229 -226 -225 -227 -204 -192 -192 -207 -220 −∞ −∞ −∞ −∞ | ok |
| driller | default | 192000 | -332.9 | -180 | −∞ -333 −∞ | ok |
| driller | fast-drill | 192000 | -308.2 | -180 | −∞ -308 −∞ | ok |
| driller | degrade | 192000 | -321.5 | -180 | −∞ -321 −∞ | ok |
| driller | locked-insert | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| driller | cv | 192000 | -314.9 | -180 | −∞ -315 −∞ | ok |
| driller | modes | 192000 | -327.7 | -180 | −∞ -328 −∞ | ok |
| erbeverb-clone | default | 144000 | -244.1 | -180 | -244 -244 | ok |
| erbeverb-clone | big-infinite | 144000 | -239.2 | -180 | -239 -242 | ok |
| erbeverb-clone | small-dark | 144000 | -281.8 | -180 | -282 -288 | ok |
| fdn_multireverb | default | 144000 | -248.6 | -180 | -249 -249 -251 -250 -252 -250 -251 -250 | ok |
| fdn_multireverb | big-wet | 144000 | -240.0 | -180 | -240 -243 -241 -243 -246 -244 -246 -243 | ok |
| fdn_multireverb | small-dark | 144000 | -235.5 | -180 | -241 -236 -240 -235 -243 -237 -241 -236 | ok |
| fdn_multireverb | sweeps | 144000 | -234.7 | -180 | -236 -236 -235 -237 -236 -238 -238 -239 | ok |
| fhickup | default | 96000 | −∞ | -180 | −∞ −∞ | ok |
| fhickup | hard-ring | 96000 | -291.3 | -180 | -301 -291 | ok |
| fhickup | telephone-wah | 96000 | -318.9 | -180 | -319 -319 | ok |
| fhickup | hp-env-down | 96000 | -310.6 | -180 | -311 -317 | ok |
| fhickup | sweep | 96000 | -366.9 | -180 | -370 -367 | ok |
| filterbank-8 | default | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| filterbank-8 | ring-shift | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| filterbank-8 | band-levels | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| filterbank-8 | drive-dry | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| filterbank-8 | broad-hot | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| fm-supermod | default | 96000 | −∞ | -180 | −∞ −∞ | ok |
| fm-supermod | synth-risset | 96000 | −∞ | -180 | −∞ −∞ | ok |
| fm-supermod | time-fm | 96000 | −∞ | -180 | −∞ −∞ | ok |
| fm-supermod | adaptive-fb | 96000 | −∞ | -180 | −∞ −∞ | ok |
| fm-supermod | notes | 96000 | −∞ | -180 | −∞ −∞ | ok |
| frost-machine | default | 144000 | -261.6 | -180 | -268 -262 | ok |
| frost-machine | huge-fuzz | 144000 | -228.7 | -180 | -233 -229 | ok |
| frost-machine | small-clean-pump | 144000 | -306.9 | -180 | -310 -307 | ok |
| frost-machine | sweeps | 144000 | -216.8 | -180 | -218 -217 | ok |
| grainer | default | 144000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| grainer | short-grains | 144000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| grainer | long-grains | 144000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| grainer | cv | 144000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| grainer | retrigger | 144000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| householder-fdn-16 | default | 144000 | -265.1 | -180 | -266 -265 | ok |
| householder-fdn-16 | big-long | 144000 | -246.0 | -180 | -246 -246 | ok |
| householder-fdn-16 | small-dark | 144000 | -305.1 | -180 | -305 -308 | ok |
| householder-fdn-16 | size-sweep | 144000 | -260.3 | -180 | -260 -268 | ok |
| hp_butterworth | default | 96000 | -253.6 | -180 | -254 | ok |
| hp_butterworth | glide | 96000 | -249.2 | -180 | -249 | ok |
| hp_butterworth | high-slow | 96000 | -266.2 | -180 | -266 | ok |
| lorenz-rossler-chaos | default | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | lorenz | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | rossler | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | lorenz-cv-inject | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | rossler-cv | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | lorenz-fast | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lorenz-rossler-chaos | switch | 192000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| lp_butterworth | default | 96000 | -247.3 | -180 | -247 | ok |
| lp_butterworth | glide | 96000 | -265.8 | -180 | -266 | ok |
| lp_butterworth | high-slow | 96000 | -273.6 | -180 | -274 | ok |
| modeldrive | default | 96000 | −∞ | -180 | −∞ −∞ | ok |
| modeldrive | fold-quant | 96000 | −∞ | -180 | −∞ −∞ | ok |
| modeldrive | wrap-nocomp | 96000 | −∞ | -180 | −∞ −∞ | ok |
| modeldrive | tone-gain | 96000 | −∞ | -180 | −∞ −∞ | ok |
| modeldrive | no-drive | 96000 | −∞ | -180 | −∞ −∞ | ok |
| multiband-drive | default | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ −∞ | ok |
| multiband-drive | morph | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ −∞ | ok |
| multiband-drive | crossovers | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ −∞ | ok |
| multiband-drive | levels | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ −∞ | ok |
| multiband-drive | quantizer | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ −∞ | ok |
| offset-spline-random | default | 96000 | -290.0 | -180 | -304 −∞ -290 −∞ | ok |
| offset-spline-random | stepped | 96000 | -288.9 | -180 | −∞ −∞ -289 −∞ | ok |
| offset-spline-random | external | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| offset-spline-random | changes | 96000 | -288.7 | -180 | -290 −∞ -289 −∞ | ok |
| offset-spline-random | fast-slow | 96000 | -287.8 | -180 | -295 −∞ -288 −∞ | ok |
| poisson-cloud | default | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| poisson-cloud | poisson | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| poisson-cloud | few | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| poisson-cloud | loop-dense | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| poisson-cloud | loop-change | 192000 | −∞ | -180 | −∞ −∞ −∞ | ok |
| precision-svf-48db | default | 96000 | -285.9 | -180 | -286 -286 | ok |
| precision-svf-48db | hp-sweep | 96000 | -288.2 | -180 | -288 -289 | ok |
| precision-svf-48db | morph-drive | 96000 | -280.3 | -180 | -282 -280 | ok |
| precision-svf-48db | fast-high | 96000 | -282.2 | -180 | -285 -282 | ok |
| pulsar-synth | default | 96000 | -261.5 | -180 | -264 -262 | ok |
| pulsar-synth | masked-tri-gauss | 96000 | -268.8 | -180 | -269 -270 | ok |
| pulsar-synth | chirp-exp | 96000 | -256.3 | -180 | -256 -257 | ok |
| pulsar-synth | harm-rect | 96000 | -239.4 | -180 | -239 -239 | ok |
| rings | default | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| rings | bar-bright | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| rings | gong-long | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| rings | sub-dark | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| rings | high-ringing | 96000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| sature-delay | default | 144000 | -251.4 | -180 | -251 -252 | ok |
| sature-delay | digital-crush | 144000 | -236.8 | -180 | -239 -237 | ok |
| sature-delay | battery | 144000 | -209.9 | -180 | -210 -212 | ok |
| sature-delay | modes-sweep | 144000 | -217.3 | -180 | -217 -217 | ok |
| skipper | default | 400000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| skipper | fast-reverse-ds | 400000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| skipper | manual-kill | 400000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| skipper | freeze-long | 400000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| skipper | mode-switch | 400000 | −∞ | -180 | −∞ −∞ −∞ −∞ | ok |
| spatial-dbap | default | 48000 | -307.9 | -180 | -316 -311 -310 -314 -311 -312 -309 -311 -312 -312 -315 -314 -313 -312 -312 -315 -313 -312 -313 -313 -314 -313 -312 -308 -311 -312 -312 -318 -318 -312 -312 -310 | ok |
| spatial-dbap | focus-damp | 48000 | -280.5 | -180 | -306 -305 -293 -301 -300 -304 -301 -303 -298 -300 -301 -297 -306 -307 -307 -309 -314 -316 -316 -319 -314 -293 -281 -290 -293 -294 -296 -296 -290 -298 -298 -305 | ok |
| spatial-dbap | six | 48000 | -309.1 | -180 | -311 -313 -313 -313 -309 -309 −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ −∞ | ok |
| spatial-dbap | changes | 48000 | -308.8 | -180 | -316 -312 -314 -317 -317 -311 -311 -314 -312 -312 -315 -314 -313 -311 -310 -310 -311 -319 -316 -315 -315 -314 -313 -312 -311 -315 -314 -312 -312 -309 -313 -313 | ok |
| tape-hysteresis | default | 96000 | -289.4 | -180 | -290 -289 | ok |
| tape-hysteresis | hot-biased | 96000 | -276.5 | -180 | -276 -285 | ok |
| tape-hysteresis | soft-mix | 96000 | -294.9 | -180 | -295 -295 | ok |
| ufo | default | 96000 | −∞ | -180 | −∞ | ok |
| ufo | triangle | 96000 | −∞ | -180 | −∞ | ok |
| ufo | saw | 96000 | −∞ | -180 | −∞ | ok |
| ufo | square | 96000 | −∞ | -180 | −∞ | ok |
| ufo | random | 96000 | −∞ | -180 | −∞ | ok |
| ufo | smooth | 96000 | −∞ | -180 | −∞ | ok |
| ufo | cos-steps | 96000 | −∞ | -180 | −∞ | ok |
| ufo | smooth-fsteps | 96000 | −∞ | -180 | −∞ | ok |
| ufo | smooth-fmod | 96000 | −∞ | -180 | −∞ | ok |
| ufo | smooth-fsync | 96000 | −∞ | -180 | −∞ | ok |
| ufo | smooth-resync | 96000 | −∞ | -180 | −∞ | ok |
| ufo | curves | 96000 | −∞ | -180 | −∞ | ok |
| ufo | curves-up | 96000 | −∞ | -180 | −∞ | ok |
| ufo | expc8 | 96000 | −∞ | -180 | −∞ | ok |
| ufo | inv-unip | 96000 | −∞ | -180 | −∞ | ok |
| ufo | gain-offset | 96000 | −∞ | -180 | −∞ | ok |
| ufo | offset-neg | 96000 | −∞ | -180 | −∞ | ok |
| ufo | gain-max | 96000 | −∞ | -180 | −∞ | ok |
| ufo | oneshot | 96000 | −∞ | -180 | −∞ | ok |
| ufo | oneshot-half | 96000 | −∞ | -180 | −∞ | ok |
| ufo | oneshot-zero | 96000 | −∞ | -180 | −∞ | ok |
| ufo | oneshot-smooth | 96000 | −∞ | -180 | −∞ | ok |
| ufo | resync-free | 96000 | −∞ | -180 | −∞ | ok |
| ufo | switch | 96000 | −∞ | -180 | −∞ | ok |
| volt-drama | default | 144000 | -239.1 | -180 | -242 -239 | ok |
| volt-drama | drone | 144000 | -249.6 | -180 | -250 -250 | ok |
| volt-drama | time-sweep | 144000 | -286.1 | -180 | -289 -286 | ok |
| volt-drama | clean | 144000 | -293.4 | -180 | -295 -293 | ok |
| volt-syphon | default | 96000 | -290.0 | -180 | -290 -290 | ok |
| volt-syphon | follow-selfmod | 96000 | −∞ | -180 | −∞ −∞ | ok |
| volt-syphon | gate-sag | 96000 | -261.6 | -180 | -262 -262 | ok |
| volt-syphon | raw | 96000 | -290.4 | -180 | -290 -291 | ok |
| waveguide-string | default | 96000 | -298.1 | -180 | -298 -301 | ok |
| waveguide-string | wide-stiff | 96000 | -307.7 | -180 | -309 -308 | ok |
| waveguide-string | low-long-trig | 96000 | -328.5 | -180 | -328 -328 | ok |
| waveguide-string | high-noise | 96000 | -299.3 | -180 | -299 -304 | ok |
| zdf-diode-ladder | default | 96000 | −∞ | -180 | −∞ −∞ | ok |
| zdf-diode-ladder | envmod-accent | 96000 | -246.5 | -180 | -259 -247 | ok |
| zdf-diode-ladder | neg-env-sweep | 96000 | -306.9 | -180 | -307 -313 | ok |
| zdf-diode-ladder | self-osc | 96000 | -256.8 | -180 | -257 -260 | ok |

## Notes

- **adm_panner**: mc.gen~: the export rendered once per channel (mc_channel 1..8, mc_channelcount 8).
- **delays-delays**: buf_taps (undeclared by the export) is the content the maxpat loads, computed by scripts/delays_delays_buffer.py from tap_manager.js and pattr ma_sphere, given to gen_ref by --buffer. Residual ~1e-11 (-190 dB) on the right line: the 2^21-sample ring quantizes genlib's interpolation fraction to 2^-31, and Faust reassociates the spread term of the delay by an ulp.
- **fdn_multireverb**: mc.gen~: the export rendered once per channel (mc_channel 1..8, mc_channelcount 8), each on its own input. The export names the Param mix_rev (its name="mix" attribute, which gen~ in Max shows, is dropped).
- **spatial-dbap**: mc.gen~: the export rendered once per channel (mc_channel 1..32, mc_channelcount 32); no spk_pos buffer, so the fallback ring.
