MODEL = dict(name="erbeverb-clone", export="erbeverb_clone", inputs=2, sites=[], input="music",
    frames=144000,
    settings=[
        dict(name="default"),
        dict(name="big-infinite", set=dict(size=100, decay=110, absorb=5, tilt=0.8, depth=20, speed=7,
                                           predelay=100, mix_rev=100)),
        dict(name="small-dark", set=dict(size=3, decay=95, absorb=80, tilt=-0.9, predelay=0, depth=0),
             at=[(40000, "size", 80), (90000, "size", 0.5)]),
    ])
