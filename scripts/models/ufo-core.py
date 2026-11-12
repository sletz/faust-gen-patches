import numpy as np

# in1: frequency (Hz), in2..in11: added to lfosel, exp1, expc, exp2, oneshot,
# shotnumbers, gain, offset, invert, unipolar, in12: trigger. The export
# clamps the params to [0, 1]; the inlets reach the rest of their ranges
# (every waveform, exponents above 1, several shots, gain, offset in %).

IDX = dict(lfosel=1, exp1=2, expc=3, exp2=4, oneshot=5, shotnumbers=6, gain=7, offset=8,
           invert=9, unipolar=10)


def _trigs(n, at, width=8):
    t = np.zeros(n)
    for a in at:
        t[a:a + width] = 1.0
    return t


def drive(f=3.7, trig_at=(), **inl):
    """Constant frequency f (or a callable of (n, sr)), triggers at trig_at,
    inlets name=value (a number, or a callable of (n, sr))."""
    def make(n, sr):
        x = np.zeros((n, 12))
        x[:, 0] = f(n, sr) if callable(f) else f
        for k, v in inl.items():
            x[:, IDX[k]] = v(n, sr) if callable(v) else v
        x[:, 11] = _trigs(n, trig_at)
        return x
    return make


def fsteps(n, sr):
    f = np.full(n, 2.3)
    f[n // 4:] = 9.1
    f[n // 2:] = 31.0
    f[3 * n // 4:] = 0.7
    return f


def fmod(n, sr):
    t = np.arange(n) / sr
    return 9 + 6 * np.sin(2 * np.pi * 0.6 * t)


def fsync(n, sr):
    """Frequency steps on the very frames where the S&H takes a new value
    (the phase crossing 0.5 under both frequencies): rampsmooth's
    `delta(insig) == 0 && delta(rampup) == 0 && ...` short-circuits there, so
    delta(rampup) keeps a stale history and the ramp restarts on the next
    frame too. A port that updates every delta history departs here."""
    targets = [3.1, 5.2, 8.3, 4.1, 12.7, 6.9, 17.3, 2.2, 23.9, 9.4, 30.5, 1.7]
    f = np.empty(n)
    acc, prev, cur, ti = 0.0, 0.0, targets[0], 1
    for i in range(n):
        a = acc + cur / sr
        w = a - int(a)
        if prev <= 0.5 < w and ti < len(targets):
            a2 = acc + targets[ti] / sr
            w2 = a2 - int(a2)
            if prev <= 0.5 < w2:
                cur, a, w = targets[ti], a2, w2
                ti += 1
        f[i] = cur
        acc, prev = a, w
    return f


def wave_steps(n, sr):
    # lfosel inlet stepping through every waveform (and below/above the range)
    return np.repeat(np.array([0, 1, 2, 3, 4, 5, -1, 6, 2.5, 4.99]), n // 10 + 1)[:n]


def slow_sine(lo, hi, hz=0.7):
    return lambda n, sr: lo + (hi - lo) * 0.5 * (1 + np.sin(2 * np.pi * hz * np.arange(n) / sr))


TRIGS = [3000, 30000, 33000, 60000, 61000, 62000, 80000]

MODEL = dict(name="ufo-core", export="ufo_core", inputs=12, sites=[1], input=drive(),
    settings=[
        dict(name="default"),
        dict(name="triangle", input=drive(lfosel=1)),
        dict(name="saw", input=drive(lfosel=2)),
        dict(name="square", input=drive(lfosel=3)),
        dict(name="random", input=drive(13.1, lfosel=4)),
        dict(name="smooth", input=drive(13.1, lfosel=5)),
        dict(name="smooth-fsteps", input=drive(fsteps, lfosel=5)),
        dict(name="smooth-fmod", input=drive(fmod, lfosel=5)),
        dict(name="smooth-fsync", input=drive(fsync, lfosel=5)),
        dict(name="smooth-resync", input=drive(11.3, TRIGS, lfosel=5)),
        dict(name="smooth-param", set=dict(lfosel=1), input=drive(17.0, lfosel=4)),
        dict(name="wave-steps", input=drive(7.9, lfosel=wave_steps)),
        dict(name="curves", input=drive(exp1=1.5, exp2=2.0)),
        dict(name="expc2", set=dict(exp1=0.5), input=drive(lfosel=2, expc=1, exp2=0.6)),
        dict(name="curves-mod", input=drive(5.3, lfosel=1, exp1=slow_sine(-0.8, 4), exp2=slow_sine(-0.5, 3, 1.1),
                                           expc=slow_sine(0, 2, 0.3))),
        dict(name="inv-unip", set=dict(invert=1, unipolar=1), input=drive(lfosel=2)),
        dict(name="inv-unip-inlets", input=drive(lfosel=3, invert=1, unipolar=1)),
        dict(name="gain-offset", input=drive(lfosel=1, gain=1.5, offset=30)),
        dict(name="offset-neg", set=dict(gain=0.5), input=drive(lfosel=5, offset=-60)),
        dict(name="oneshot", input=drive(6.1, TRIGS, oneshot=1, shotnumbers=2)),
        dict(name="oneshot-param", set=dict(oneshot=1, shotnumbers=0.5), input=drive(4.3, TRIGS, lfosel=4)),
        dict(name="oneshot-smooth", input=drive(9.7, TRIGS, lfosel=5, oneshot=1, shotnumbers=3.5)),
        dict(name="oneshot-negshots", set=dict(oneshot=1), input=drive(4.3, TRIGS, shotnumbers=-2.5, lfosel=2)),
        dict(name="audio-rate", set=dict(exp1=0.8),
             input=drive(slow_sine(0, 300, 0.3), TRIGS, lfosel=slow_sine(-0.5, 6.5, 2.1),
                         gain=slow_sine(-1, 2, 3.3), offset=slow_sine(-50, 50, 1.7),
                         invert=slow_sine(-0.2, 1.2, 0.9), unipolar=slow_sine(-0.2, 1.2, 0.4),
                         oneshot=slow_sine(-0.2, 1.2, 0.25), shotnumbers=slow_sine(0, 8, 0.5))),
    ])
