MODEL = dict(name="volt-syphon", export="volt_syphon", inputs=2, sites=[1], input="music",
    settings=[
        dict(name="default"),
        dict(name="follow-selfmod", set=dict(autofollow=100, selfmod=40, freq_min=50, freq_max=3000,
                                             gate_gainin=8, compression=80, tone=0)),
        dict(name="gate-sag", set=dict(gate=20, sag=70, instability=100, tone=100, rise=30, fall=80,
                                       autofollow=50, freq_main_amp=0.8, gainout=12, mix=60),
             at=[(40000, "gate", 0), (70000, "gate", 45)]),
        dict(name="raw", set=dict(compression=0, freq_main=4000, freq_main_amp=1, gainout=-20, rise=2000,
                                  fall=2, instability=0)),
    ])
