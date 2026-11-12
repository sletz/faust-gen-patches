MODEL = dict(name="tape-hysteresis", export="tape_hysteresis", inputs=2, sites=[], input="music",
    settings=[
        dict(name="default"),
        dict(name="hot-biased", set=dict(drive=100, bias=80, coercivity=0.05, remanence=1, speed_khz=6, gainout=-6)),
        dict(name="soft-mix", set=dict(drive=10, bias=20, coercivity=0.9, remanence=0, speed_khz=20, mix_pct=50, gainout=12),
             at=[(40000, "drive", 70), (70000, "bias", 50)]),
    ])
