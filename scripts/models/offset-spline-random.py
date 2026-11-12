import numpy as np

def _ext(n, sr):
    """in1: the music signal's first channel scaled, in2: a 7 Hz ramp 0..1 with
    a slow wobble added (jumps of ~1 at the wraps, the external clock)."""
    t = np.arange(n) / sr
    x = np.zeros((n, 2))
    x[:, 0] = 0.4 * np.sin(2 * np.pi * 220 * t) * (t < 1.0)
    x[:, 1] = (t * 7.0) % 1.0 + 0.05 * np.sin(2 * np.pi * 0.3 * t)
    return x

# frequency is left at its default 20 Hz: the export clamps it to [0, 1].
MODEL = dict(name="offset-spline-random", export="offset_spline_random", inputs=2, sites=[1, 1],
    input="music",
    settings=[
        dict(name="default"),
        dict(name="stepped", set=dict(mode=0, range=100, amp=1)),
        dict(name="external", set=dict(trigmode=1, range=80, amp=0.7), input=_ext),
        dict(name="changes", set=dict(range=10),
             at=[(30000, "range", 100), (50000, "mode", 0), (70000, "mode", 1), (80000, "amp", 1)]),
    ])
