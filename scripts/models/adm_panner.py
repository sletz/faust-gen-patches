import numpy as np


def _move(n, sr):
    """in1: music (left channel), in2, in3: the source going round the circle
    twice and through its centre (X = r sin, Y = r cos, r 0..1.2)."""
    from test_gen import sig_music
    t = np.arange(n) / sr
    r = 0.6 + 0.6 * np.sin(2 * np.pi * 0.37 * t)
    a = 2 * np.pi * 1.1 * t
    x = np.zeros((n, 3))
    x[:, 0] = sig_music(n, 1)[:, 0]
    x[:, 1] = r * np.sin(a)
    x[:, 2] = r * np.cos(a)
    return x


# smooth is declared with min=1 and no max: the export bounds it to [1, 1],
# so it stays at its default 240.
MODEL = dict(name="adm_panner", export="adm_panner", inputs=3, sites=[], input=_move, mc=8,
    note="mc.gen~: the export rendered once per channel (mc_channel 1..8, mc_channelcount 8).",
    settings=[
        dict(name="default"),
        dict(name="circ-narrow", set=dict(width=20, sharpness=8, air_damp=1)),
        dict(name="linear", set=dict(mode=1, width=150, sharpness=1.5)),
        dict(name="switch", set=dict(width=200, sharpness=1, air_damp=0),
             at=[(30000, "mode", 1), (50000, "width", 1), (70000, "mode", 0), (80000, "air_damp", 0.3)]),
    ])
