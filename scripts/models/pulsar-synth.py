import numpy as np


def _play(n, sr):
    """in1: one-sample sync pulses every 7001 frames and a 300-frame held gate
    in the middle (a redraw at every sample); in2: a slow +-300 Hz formant
    modulation."""
    t = np.arange(n) / sr
    in1 = np.zeros(n)
    in1[3000::7001] = 1.0
    in1[n // 2:n // 2 + 300] = 0.8
    in2 = 300 * np.sin(2 * np.pi * 0.37 * t)
    return np.stack([in1, in2], axis=1)


MODEL = dict(name="pulsar-synth", export="pulsar_synth", inputs=2, sites=[1], input=_play,
    settings=[
        dict(name="default"),
        dict(name="masked-tri-gauss", set=dict(f0=110, masking=0.5, wave_shape=1, win_type=2, duty_ratio=0.6, pan_spread=1)),
        dict(name="chirp-exp", set=dict(f0=40, wave_shape=2, win_type=3, formant_f=1200, duty_ratio=0.15),
             at=[(48000, "f0", 333)]),
        dict(name="harm-rect", set=dict(f0=7, wave_shape=3, win_type=0, formant_f=3000, duty_ratio=1, masking=0.2),
             at=[(30000, "wave_shape", 1.5), (60000, "win_type", 2.5)]),
    ])
