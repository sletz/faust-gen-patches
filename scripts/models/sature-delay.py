MODEL = dict(name="sature-delay", export="sature_delay", inputs=2, sites=[1, 1], input="music",
    frames=144000,
    settings=[
        dict(name="default"),
        dict(name="digital-crush", set=dict(time=120, fb=0.9, crush=0.6, tilt=-0.5, freq=400, diff=0.7,
                                            mix_bal=1)),
        dict(name="battery", set=dict(mode=1, crush=0.8, time=80, fb=1.1, tilt=0.6, freq=3000, diff=0.3,
                                      pingpong=1, mix_bal=0.8)),
        dict(name="modes-sweep", set=dict(time=40, fb=1.2, crush=0.5, diff=1, pingpong=0.5),
             at=[(30000, "mode", 1), (60000, "time", 700), (90000, "mode", 0), (110000, "crush", 1), (125000, "time", 1)]),
    ])
