import numpy as np


def _play(n, sr):
    """in1, in2: the test signal for effects (saw chord, noise bursts, clicks,
    silent end); in3: a drive CV, a 0.5 Hz sine of +-0.6 (pushes the drive past
    both ends of its clamp)."""
    from test_gen import sig_music  # the suite's test signal (imported late: test_gen imports models)
    t = np.arange(n) / sr
    cv = 0.6 * np.sin(2 * np.pi * 0.5 * t)
    return np.concatenate([sig_music(n, 2), cv[:, None]], axis=1)


MODEL = dict(name="modeldrive", export="modeldrive", inputs=3, sites=[], input=_play,
    settings=[
        dict(name="default"),
        dict(name="fold-quant", set=dict(model=33.3, drive=80),
             at=[(30000, "model", 50), (60000, "model", 66.7)]),
        dict(name="wrap-nocomp", set=dict(model=99.9, level_comp=0, drive=100, tone=100),
             at=[(48000, "model", 100), (70000, "level_comp", 1)]),
        dict(name="tone-gain", set=dict(tone=18000, gain=12, mix=50, model=20),
             at=[(30000, "tone", 500), (60000, "gain", -24), (75000, "mix", 0)]),
        dict(name="no-drive", set=dict(drive=0, level_comp=0.5, model=85, gain=-6)),
    ])
