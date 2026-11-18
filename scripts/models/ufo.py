import numpy as np

# in1: frequency (Hz), in2: trigger.


def _trigs(n, at, width=8):
    t = np.zeros(n)
    for a in at:
        t[a:a + width] = 1.0
    return t


def drive(f=3.7, trig_at=()):
    """Frequency f (a number, or a callable of (n, sr)), triggers at trig_at."""
    def make(n, sr):
        fr = f(n, sr) if callable(f) else np.full(n, float(f))
        return np.stack([fr, _trigs(n, trig_at)], axis=1)
    return make


def steps(n, sr):
    # frequency steps (each a new rampsmooth length), below and above the clip
    f = np.full(n, 2.3)
    f[n // 4:] = 9.1
    f[n // 2:] = 0.00005  # below the clip: 0.0001 Hz
    f[3 * n // 4:] = 2000.0  # above the clip: 1000 Hz
    return f


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


TRIGS = [3000, 30000, 33000, 60000, 61000, 62000, 80000]

MODEL = dict(name="ufo", export="ufo", inputs=2, sites=[1], input=drive(),
    settings=[
        dict(name="default"),
        dict(name="triangle", set=dict(lfosel=1)),
        dict(name="saw", set=dict(lfosel=2)),
        dict(name="square", set=dict(lfosel=3)),
        dict(name="random", set=dict(lfosel=4), input=drive(13.1)),
        dict(name="smooth", set=dict(lfosel=5), input=drive(13.1)),
        dict(name="cos-steps", input=drive(steps, [12000, 36000, 60000])),
        dict(name="smooth-fsteps", set=dict(lfosel=5), input=drive(fsteps)),
        dict(name="smooth-fmod", set=dict(lfosel=5), input=drive(fmod)),
        dict(name="smooth-fsync", set=dict(lfosel=5), input=drive(fsync)),
        dict(name="smooth-resync", set=dict(lfosel=5), input=drive(11.3, TRIGS)),
        dict(name="curves", set=dict(exp1=0.4, expc=0.7, exp2=0.3)),
        dict(name="curves-up", set=dict(lfosel=2, exp1=1.5, expc=2, exp2=6)),
        dict(name="expc8", set=dict(lfosel=1, exp1=0.05, expc=8, exp2=20)),
        dict(name="inv-unip", set=dict(lfosel=2, invert=1, unipolar=1, gain=0.6, offset=1)),
        dict(name="gain-offset", set=dict(lfosel=1, gain=1.5, offset=30)),
        dict(name="offset-neg", set=dict(lfosel=5, gain=0.5, offset=-60)),
        dict(name="gain-max", set=dict(lfosel=3, gain=10, offset=100)),
        dict(name="oneshot", set=dict(oneshot=1, shotnumbers=2), input=drive(6.1, TRIGS)),
        dict(name="oneshot-half", set=dict(oneshot=1, shotnumbers=0.5, lfosel=1, exp1=0.7),
             input=drive(4.3, TRIGS)),
        dict(name="oneshot-zero", set=dict(oneshot=1, shotnumbers=0), input=drive(4.3, TRIGS)),
        dict(name="oneshot-smooth", set=dict(lfosel=5, oneshot=1, shotnumbers=3.5), input=drive(9.7, TRIGS)),
        dict(name="resync-free", input=drive(1.3, TRIGS)),
        dict(name="switch", input=drive(5.3, TRIGS),
             at=[(15000, "lfosel", 4), (25000, "lfosel", 2.5), (35000, "exp1", 3),
                 (40000, "oneshot", 1), (45000, "shotnumbers", 6), (50000, "invert", 1),
                 (60000, "lfosel", 5), (70000, "unipolar", 1), (85000, "lfosel", 0.5)]),
    ])
