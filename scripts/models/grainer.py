import numpy as np

# in1, in2: percussive hits; in3: threshold CV, in4: probability CV (both in %).


def hits(cv3=0.0, cv4=0.0):
    """Decaying saw-and-noise hits at irregular intervals (30..250 ms) and
    random levels, a 0.3 s held tone in the middle (the envelope stays over
    the threshold), silence at the end; slow sine CVs of amplitude cv3
    (thresh) and cv4 (proba)."""
    def make(n, sr):
        rng = np.random.default_rng(5)
        t = np.arange(n) / sr
        x = np.zeros((n, 2))
        pos = 200
        while pos < 0.85 * n:
            amp = rng.uniform(0.05, 0.9)
            dec = rng.uniform(0.003, 0.04)
            ln = min(n - pos, int(0.15 * sr))
            tt = np.arange(ln) / sr
            env = amp * np.exp(-tt / dec)
            saw = 2 * ((tt * rng.uniform(80, 900)) % 1.0) - 1
            for c in range(2):
                x[pos:pos + ln, c] += env * (0.6 * saw + 0.4 * rng.uniform(-1, 1, ln)) * (1 - 0.3 * c)
            pos += int(rng.uniform(0.03, 0.25) * sr)
        m = n // 2
        x[m:m + int(0.3 * sr), :] += 0.5 * np.sin(2 * np.pi * 220 * t[:int(0.3 * sr)])[:, None]
        c3 = cv3 * np.sin(2 * np.pi * 0.7 * t)
        c4 = cv4 * np.sin(2 * np.pi * 0.31 * t + 0.5)
        return np.concatenate([x, c3[:, None], c4[:, None]], axis=1)
    return make


MODEL = dict(name="grainer", export="grainer", inputs=4, sites=[1], input=hits(),
    frames=144000,
    settings=[
        dict(name="default"),
        dict(name="short-grains", set=dict(grain=6, fade=0.5, antibis=0, slide_attack=0, slide_decay=0,
                                           gain=10, thresh=30, proba=60)),
        dict(name="long-grains", set=dict(grain=1500, fade=20, antibis=700, slide_attack=300,
                                          slide_decay=150, gain=3, thresh=10, mix=50),
             at=[(100000, "slide_attack", 500), (110000, "slide_decay", 5000), (120000, "gain", 1)]),
        dict(name="cv", set=dict(proba=50, antibis=40, grain=120, fade=3.7, gain=4, slide_decay=8),
             input=hits(30, 70)),
        dict(name="retrigger", set=dict(grain=800, antibis=30, fade=10, slide_decay=10, thresh=20),
             at=[(30000, "grain", 60), (50000, "fade", 0.5), (65000, "thresh", 80), (100000, "antibis", 10000),
                 (125000, "mix", 0)]),
    ])
