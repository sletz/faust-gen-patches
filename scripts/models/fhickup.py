import numpy as np


def sig_music(n, ch):
    from test_gen import sig_music as music  # the suite's test signal (imported late: test_gen imports models)
    return music(n, ch)

# in1, in2: the music test signal; in3: drive CV, in4: hickmix CV (both in %).


def drive(cv3=0.0, cv4=0.0):
    """Music on in1, in2; slow sine CVs of amplitude cv3 (drive) and cv4
    (hickmix), crossing the clamps when large."""
    def make(n, sr):
        t = np.arange(n) / sr
        a = sig_music(n, 2)
        c3 = cv3 * np.sin(2 * np.pi * 0.9 * t)
        c4 = cv4 * np.sin(2 * np.pi * 0.4 * t + 1.0)
        return np.concatenate([a, c3[:, None], c4[:, None]], axis=1)
    return make


MODEL = dict(name="fhickup", export="fhickup", inputs=4, sites=[1, 1], input=drive(),
    settings=[
        dict(name="default"),
        dict(name="hard-ring", set=dict(drive=100, ringmod=100, hickfreq=1000, hickclick=0.5, hickmix=100,
                                        filter_morph=0, freq=8000, env_to_filt=100)),
        dict(name="telephone-wah", set=dict(drive=40, freq=50, env_to_filt=100, hickfreq=0.1, hickclick=100,
                                            mix=60), input=drive(30, 50)),
        dict(name="hp-env-down", set=dict(filter_morph=100, freq=3000, env_to_filt=-100, hickfreq=37,
                                          hickclick=3, ringmod=50, stereo_spread=0, drive=0, hickmix=0),
             input=drive(60, 120)),
        dict(name="sweep", set=dict(hickfreq=13, hickclick=1.2, filter_morph=10), input=drive(20, 40),
             at=[(15000, "freq", 400), (30000, "filter_morph", 75), (45000, "hickfreq", 300),
                 (60000, "drive", 85), (70000, "ringmod", 30), (80000, "env_to_filt", -40), (88000, "mix", 0)]),
    ])
