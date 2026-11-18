import numpy as np

def _triggers(n, sr):
    """in1: start pulses (one 1-sample pulse, then a 30-sample gate), in2: stop pulses."""
    x = np.zeros((n, 2))
    x[100, 0] = 1.0
    x[70000:70030, 0] = 0.5     # held start: the burst restarts at every sample of it
    x[150000, 0] = 1.0
    x[40000, 1] = 1.0           # stop in the middle of a burst
    x[150000, 1] = 1.0          # start and stop on the same frame: stop wins
    x[150001, 0] = 1.0
    return x

MODEL = dict(name="poisson-cloud", export="poisson_cloud", inputs=2, sites=[1, 1, 1], input=_triggers,
    frames=192000,
    settings=[
        dict(name="default"),
        dict(name="poisson", set=dict(interval=20, jitter=1, width=0.3, occurrences=200)),
        dict(name="few", set=dict(interval=40, jitter=0.3, occurrences=3),
             at=[(80000, "occurrences", 1), (140000, "occurrences", 1000)]),
        dict(name="loop-dense", set=dict(interval=1, jitter=0.8, width=0.9, loop=1)),
        dict(name="loop-change", set=dict(interval=60, jitter=0.5, loop=1),
             at=[(60000, "interval", 7), (100000, "loop", 0), (120000, "width", 0.05)]),
    ])
