MODEL = dict(name="householder-fdn-16", export="householder_fdn_16", inputs=2, sites=[], input="music",
    frames=144000,
    settings=[
        dict(name="default"),
        dict(name="big-long", set=dict(size=2.0, decay=30, damping=0.0, mod_amt=20, mod_rate=5, mix=100)),
        dict(name="small-dark", set=dict(size=0.1, decay=0.1, damping=1.0, mod_amt=0, mix=100)),
        dict(name="size-sweep", set=dict(decay=12, mix=100),
             at=[(30000, "size", 0.4), (60000, "size", 1.7), (90000, "damping", 0.9)]),
    ])
