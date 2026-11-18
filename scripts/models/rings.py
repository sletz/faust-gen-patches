import numpy as np


def _play(n, sr):
    """in1, in2: a quiet saw chord with clicks over the first 40 %, then
    silence (the strums ring alone); in3: strum triggers (one-sample pulses,
    a held gate, a pulse below the 0.1 threshold, a retrigger during the
    2 ms hammer pulse)"""
    t = np.arange(n) / sr
    a = np.zeros((n, 2))
    for c in range(2):
        x = np.zeros(n)
        for f in (130.81 * (1 + 0.003 * c), 196.0, 261.63 * (1 - 0.002 * c)):
            x += 2 * ((t * f) % 1.0) - 1
        x *= 0.1 * np.exp(-4 * (t % 0.35))
        x[(np.arange(n) % 9000) == 4500 + 13 * c] += 0.8
        x[int(0.4 * n):] = 0.0
        a[:, c] = x
    trig = np.zeros(n)
    for f in (0.42, 0.55, 0.81):
        i = int(f * n)
        trig[i] = 1.0
    i = int(0.62 * n)
    trig[i:i + 2000] = 0.7          # held gate: one strum
    trig[int(0.7 * n)] = 0.08       # below the threshold
    i = int(0.9 * n)
    trig[i] = 1.0
    trig[i + 40] = 1.0              # retrigger during the hammer pulse
    return np.stack([a[:, 0], a[:, 1], trig], axis=1)


MODEL = dict(name="rings", export="rings", inputs=3, sites=[1], input=_play,
    settings=[
        dict(name="default"),
        dict(name="bar-bright", set=dict(structure=0.6, brightness=1, damping=0.3, position=0.5, drive=100, gain=6,
                                         stereo_spread=100),
             at=[(30000, "strum", 1), (30500, "strum", 0)]),
        dict(name="gong-long", set=dict(structure=0.95, damping=0.95, pitch=30, stereo_spread=0, internal_exciter=100,
                                        brightness=0.8),
             at=[(20000, "strum", 1), (20001, "strum", 0), (60000, "structure", 1)]),
        dict(name="sub-dark", set=dict(structure=0.1, brightness=0, pitch=100, mix=50, gain=-24, position=0.9,
                                       damping=0, drive=0),
             at=[(30000, "structure", 0.27), (45000, "pitch", 12), (60000, "structure", 0), (80000, "mix", 0)]),
        dict(name="high-ringing", set=dict(pitch=108, damping=1, structure=0.85, internal_exciter=0, position=0,
                                           gain=12),
             at=[(40000, "structure", 0.3), (55000, "internal_exciter", 50), (70000, "structure", 0.9)]),
    ])
