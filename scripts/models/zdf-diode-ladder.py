MODEL = dict(name="zdf-diode-ladder", export="zdf_diode_ladder", inputs=2, sites=[], input="music",
    settings=[
        dict(name="default"),
        dict(name="envmod-accent", set=dict(cutoff=400, resonance=1.1, env_mod=80, accent=70, drive=50)),
        dict(name="neg-env-sweep", set=dict(cutoff=8000, resonance=0.3, env_mod=-100, drive=0),
             at=[(30000, "cutoff", 150), (60000, "cutoff", 19000)]),
        dict(name="self-osc", set=dict(cutoff=900, resonance=1.2, accent=100, drive=100, env_mod=40)),
    ])
