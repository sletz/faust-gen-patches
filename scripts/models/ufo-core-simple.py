import numpy as np

# in1: frequency (Hz), in2: + exp1, in3: + expc, in4: + oneshot,
# in5: + shotnumbers, in6: trigger. No noise. The export clamps the params to
# [0, 1]; the inlets reach the rest of their ranges.

IDX = dict(exp1=1, expc=2, oneshot=3, shotnumbers=4)


def _trigs(n, at, width=8):
    t = np.zeros(n)
    for a in at:
        t[a:a + width] = 1.0
    return t


def drive(f=3.7, trig_at=(), **inl):
    def make(n, sr):
        x = np.zeros((n, 6))
        x[:, 0] = f(n, sr) if callable(f) else f
        for k, v in inl.items():
            x[:, IDX[k]] = v(n, sr) if callable(v) else v
        x[:, 5] = _trigs(n, trig_at)
        return x
    return make


def slow_sine(lo, hi, hz=0.7):
    return lambda n, sr: lo + (hi - lo) * 0.5 * (1 + np.sin(2 * np.pi * hz * np.arange(n) / sr))


def fsteps(n, sr):
    f = np.full(n, 2.3)
    f[n // 4:] = 9.1
    f[n // 2:] = 0.00005  # below the clip
    f[3 * n // 4:] = 5000.0  # above the clip
    return f


TRIGS = [3000, 30000, 33000, 60000, 61000, 62000, 80000]

MODEL = dict(name="ufo-core-simple", export="ufo_core_simple", inputs=6, sites=[], input=drive(),
    settings=[
        dict(name="default"),
        dict(name="params", set=dict(exp1=0.4, expc=0.8)),
        dict(name="exp-inlets", input=drive(5.1, exp1=2.5, expc=1)),  # exp1 3.5, expc 2: output up to 3
        dict(name="fsteps-resync", input=drive(fsteps, TRIGS)),
        dict(name="oneshot", set=dict(oneshot=1), input=drive(6.1, TRIGS)),
        dict(name="oneshot-inlets", input=drive(4.3, TRIGS, oneshot=1, shotnumbers=2.5, exp1=-0.5)),
        dict(name="oneshot-negshots", input=drive(4.3, TRIGS, oneshot=1, shotnumbers=-3)),
        dict(name="modulated", input=drive(slow_sine(0, 40, 0.3), TRIGS, exp1=slow_sine(-0.9, 5, 1.3),
                                           expc=slow_sine(-1, 2, 0.8), oneshot=slow_sine(-0.3, 1.3, 0.5),
                                           shotnumbers=slow_sine(0, 4, 0.9))),
    ])
