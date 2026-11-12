import numpy as np


def _play(n, sr):
    """in1: strikes (one-sample 0.8 impulses at 0.05 s and 0.9 s, a 5 ms
    decaying noise strike at 1.4 s); in2: no pitch CV for the first second,
    then a 3 Hz, +-4 Hz vibrato."""
    t = np.arange(n) / sr
    in1 = np.zeros(n)
    for s in (0.05, 0.9):
        i = int(s * sr)
        if i < n:
            in1[i] = 0.8
    i0 = int(1.4 * sr)
    if i0 < n:
        m = min(n - i0, int(0.005 * sr))
        rng = np.random.default_rng(3)
        in1[i0:i0 + m] = 0.6 * np.exp(-np.arange(m) / (0.001 * sr)) * rng.uniform(-1, 1, m)
        in1[i0] = 0.7
    in2 = np.where(t >= 1.0, 4.0 * np.sin(2 * np.pi * 3 * (t - 1.0)), 0.0)
    return np.stack([in1, in2], axis=1)


MODEL = dict(name="waveguide-string", export="waveguide_string", inputs=2, sites=[1], input=_play,
    settings=[
        dict(name="default"),
        dict(name="wide-stiff", set=dict(freq=220, detune=60, stiffness=0.8, damping=0.7, nl_bridge=1, strike_res=1, pick_pos=0.5)),
        dict(name="low-long-trig", set=dict(freq=41, detune=0, decay_time=20, damping=0, stiffness=0, mix_pct=60),
             at=[(20000, "trig", 1), (20300, "trig", 0), (60000, "freq", 82.4)]),
        dict(name="high-noise", set=dict(freq=1900, detune=100, decay_time=0.5, strike_res=0, nl_bridge=0, pick_pos=0.9)),
    ])
