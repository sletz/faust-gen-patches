MODEL = dict(name="precision-svf-48db", export="precision_svf_48db", inputs=2, sites=[], input="music",
    settings=[
        dict(name="default"),
        dict(name="hp-sweep", set=dict(mode=0, frequency=300, agc=1, smooth=20),
             at=[(30000, "frequency", 4000), (60000, "frequency", 60)]),
        dict(name="morph-drive", set=dict(mode=0.4, gain=12, drive=18, width=1, mix=0.7, frequency=2500),
             at=[(40000, "mode", 0.9), (70000, "width", 0.2)]),
        dict(name="fast-high", set=dict(smooth=0, frequency=19000, mix=0.3, gain=24),
             at=[(48000, "frequency", 25)]),
    ])
