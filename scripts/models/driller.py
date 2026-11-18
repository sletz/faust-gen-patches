import numpy as np


def sig_music(n, ch):
    from test_gen import sig_music as music  # the suite's test signal (imported late: test_gen imports models)
    return music(n, ch)

# in1, in2: the music test signal; in3: main delay CV (ms), in4: probability CV (%).


def drive(cv3=0.0, cv4=0.0):
    """Music on in1, in2; in3 a staircase of cv3 ms steps (-1, 0, 1, 2 x cv3
    every quarter), in4 a slow sine of amplitude cv4 %."""
    def make(n, sr):
        t = np.arange(n) / sr
        a = sig_music(n, 2)
        c3 = cv3 * (np.floor(4 * np.arange(n) / n) - 1)
        c4 = cv4 * np.sin(2 * np.pi * 0.23 * t)
        return np.concatenate([a, c3[:, None], c4[:, None]], axis=1)
    return make


MODEL = dict(name="driller", export="driller", inputs=4, sites=[1, 1, 1, 1, 1], input=drive(),
    frames=192000,
    settings=[
        dict(name="default"),
        dict(name="fast-drill", set=dict(maindelay=120, probability=100, mute_prob=20, div2=3, div3=5.5,
                                         div4=16, div5=24, div6=32, vol2=1.3, vol6=3, pan_spread=100,
                                         stereo_spread=100, roll_filter=100, feedback=100)),
        dict(name="degrade", set=dict(maindelay=250, degrade=100, degrade_prob=70, probability=90, mix=70,
                                      roll_filter=0, feedback=0, vol1=0.4, div2=1)),
        dict(name="locked-insert", set=dict(maindelay=37, probability=0, mode=1, vol1=2.5, mix=50,
                                            degrade=60, degrade_prob=100, stereo_spread=0),
             input=drive(15, 0)),
        dict(name="cv", set=dict(maindelay=400, probability=40, mute_prob=60, pan_spread=20, feedback=30),
             input=drive(250, 70)),
        dict(name="modes", set=dict(maindelay=300, probability=85, degrade=40, degrade_prob=50),
             at=[(30000, "mode", 1), (60000, "mode", 2), (100000, "maindelay", 4000), (120000, "mode", 0),
                 (140000, "mode", 2), (150000, "maindelay", 10), (170000, "mode", 1), (180000, "vol1", 0)]),
    ])
