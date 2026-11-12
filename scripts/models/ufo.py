import numpy as np

# in1: frequency (Hz), in2: trigger. The export clamps every param to [0, 1]
# (none has min/max in the gendsp), so lfosel reaches only cos (0) and
# triangle (1) here: the other waveforms, the S&H and rampsmooth, are covered
# through ufo-core's lfosel inlet (same ufo.lib code).


def _trigs(n, at, width=8):
    t = np.zeros(n)
    for a in at:
        t[a:a + width] = 1.0
    return t


def const(hz, trig_at=()):
    return lambda n, sr: np.stack([np.full(n, hz), _trigs(n, trig_at)], axis=1)


def steps(n, sr):
    # frequency steps (each a new rampsmooth length), resync triggers
    f = np.full(n, 2.3)
    f[n // 4:] = 9.1
    f[n // 2:] = 0.00005  # below the clip: 0.0001 Hz
    f[3 * n // 4:] = 2000.0  # above the clip: 1000 Hz
    return np.stack([f, _trigs(n, [n // 8, 3 * n // 8, 5 * n // 8])], axis=1)


def fm(n, sr):
    # frequency moving at every sample
    t = np.arange(n) / sr
    return np.stack([5 + 4 * np.sin(2 * np.pi * 0.6 * t), np.zeros(n)], axis=1)


TRIGS = [3000, 30000, 33000, 60000, 61000, 62000, 80000]

MODEL = dict(name="ufo", export="ufo", inputs=2, sites=[1], input=const(3.7),
    settings=[
        dict(name="default"),
        dict(name="triangle", set=dict(lfosel=1)),
        dict(name="cos-steps", input=steps),
        dict(name="tri-fm", set=dict(lfosel=1), input=fm),
        dict(name="curves", set=dict(exp1=0.4, expc=0.7, exp2=0.3)),
        dict(name="tri-curves", set=dict(lfosel=1, exp1=0.6, exp2=0.5, expc=0.9)),
        dict(name="inv-unip", set=dict(invert=1, unipolar=1, gain=0.6, offset=1)),
        dict(name="unipolar", set=dict(unipolar=1, exp2=0.2)),
        dict(name="gain-offset", set=dict(gain=0.35, offset=0.8, lfosel=1)),
        dict(name="oneshot", set=dict(oneshot=1), input=const(6.1, TRIGS)),
        dict(name="oneshot-half", set=dict(oneshot=1, shotnumbers=0.5, lfosel=1, exp1=0.7),
             input=const(4.3, TRIGS)),
        dict(name="oneshot-zero", set=dict(oneshot=1, shotnumbers=0), input=const(4.3, TRIGS)),
        dict(name="resync-free", input=const(1.3, TRIGS)),
        dict(name="switch", input=const(5.3, TRIGS),
             at=[(20000, "lfosel", 1), (40000, "oneshot", 1), (50000, "invert", 1),
                 (70000, "unipolar", 1), (85000, "lfosel", 0.5)]),
    ])
