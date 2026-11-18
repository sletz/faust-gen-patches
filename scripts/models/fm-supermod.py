import numpy as np


def _audio(n, sr, ch):
    """a saw chord under a decaying envelope, noise bursts and clicks, silent
    over the last 30 % (where mode 1 falls back to the plain carriers)"""
    t = np.arange(n) / sr
    rng = np.random.default_rng(7 + ch)
    x = np.zeros(n)
    for f in (110.0 * (1 + 0.004 * ch), 164.81, 246.94 * (1 - 0.003 * ch)):
        x += 2 * ((t * f) % 1.0) - 1
    x *= 0.25 * np.exp(-2.5 * (t % 0.4))
    x += (t % 0.3 < 0.015) * rng.uniform(-0.4, 0.4, n)
    x[(np.arange(n) % 12000) == 6000 + 11 * ch] += 0.9
    x[int(0.7 * n):] = 0.0
    return x


def _play(n, sr):
    """in1, in2: audio L, R; in3: a slow +-6 fm_index CV; in4: a slow
    +-0.6 feedback CV"""
    t = np.arange(n) / sr
    in3 = 6.0 * np.sin(2 * np.pi * 0.7 * t)
    in4 = 0.6 * np.sin(2 * np.pi * 0.31 * t + 1.0)
    return np.stack([_audio(n, sr, 0), _audio(n, sr, 1), in3, in4], axis=1)


def _synth(n, sr):
    """no audio: in1 = in2 = 0 (pure synthesis), CVs on in3 and in4"""
    x = _play(n, sr)
    x[:, :2] = 0.0
    return x


def _notes(n, sr):
    """use_note_in: in1 a sequence of MIDI notes (out of [0, 128] too, for the
    clamp), in2 a ratio CV of +-20 (+-1 on the ratio), in3/in4 as _play"""
    x = _play(n, sr)
    notes = np.array([36, 48, 60.5, 72, 96, -12, 140, 57])
    x[:, 0] = notes[(np.arange(n) * len(notes)) // n]
    x[:, 1] = 20.0 * np.sin(2 * np.pi * 0.5 * np.arange(n) / sr)
    return x


MODEL = dict(name="fm-supermod", export="fm_supermod", inputs=4, sites=[], input=_play,
    settings=[
        dict(name="default"),
        dict(name="synth-risset", input=_synth,
             set=dict(quantize=2, ratio=0.6, fm_index=8, feedback=1.2, filter_lp=1, stereo_spread=100),
             at=[(12000, "ratio", 1.2), (24000, "ratio", 1.7), (36000, "ratio", 2.6), (48000, "ratio", 3.5),
                 (60000, "ratio", 4.2), (72000, "ratio", 9.3), (84000, "quantize", 1)]),
        dict(name="time-fm", set=dict(mode=2, fm_index=40, ratio=3.3, feedback=0.7, stereo_spread=100, mix=70, freq=900),
             at=[(30000, "quantize", 1), (60000, "filter_lp", 1), (75000, "fm_index", 0)]),
        dict(name="adaptive-fb", set=dict(mode=3, fm_index=50, feedback=2, freq=4000, ratio=0.01, stereo_spread=0),
             at=[(40000, "freq", 20), (70000, "mode", 0), (85000, "mode", 1)]),
        dict(name="notes", input=_notes, set=dict(use_note_in=1, mix=60, quantize=1, ratio=2.2, freq=10000),
             at=[(50000, "mode", 2), (75000, "mode", 3)]),
    ])
