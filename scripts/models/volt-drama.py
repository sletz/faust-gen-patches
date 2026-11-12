MODEL = dict(name="volt-drama", export="volt_drama", inputs=2, sites=[], input="music",
    frames=144000,
    settings=[
        dict(name="default"),
        dict(name="drone", set=dict(feedback=1, time=40, spread=50, drive=1, shape=0, cutoff=1500,
                                    uni_mix=100, uni_detune=100, uni_width=0, mix_global=100)),
        dict(name="time-sweep", set=dict(feedback=0.7, time=900, shape=1, drive=0.05, cutoff=300, gainout=12),
             at=[(30000, "time", 3), (60000, "time", 600), (90000, "feedback", 0.1)]),
        dict(name="clean", set=dict(drive=0, feedback=0, mix_global=100, uni_mix=0, gainout=-60, spread=0)),
    ])
