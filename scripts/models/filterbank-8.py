MODEL = dict(name="filterbank-8", export="filterbank_8", inputs=2, sites=[], input="music",
    settings=[
        dict(name="default"),
        dict(name="ring-shift", set=dict(q_global=50, freq_shift=-24, soft_clip=100, stereo_spread=100),
             at=[(30000, "freq_shift", 24), (60000, "q_global", 0.5), (75000, "freq_shift", 7.3)]),
        dict(name="band-levels", set=dict(gain_1=12, gain_2=-48, gain_3=-39.9, gain_4=-6, gain_5=12,
                                          gain_6=-40, gain_7=3, gain_8=-24, gain=12, mix=60, q_global=12),
             at=[(48000, "gain_8", 12), (48000, "gain_2", 0)]),
        dict(name="drive-dry", set=dict(drive=100, soft_clip=0, stereo_spread=0, gain=-24, mix=30, q_global=25),
             at=[(40000, "drive", 0), (70000, "mix", 0)]),
        dict(name="broad-hot", set=dict(q_global=0.5, drive=60, soft_clip=80, stereo_spread=25, freq_shift=11.5, gain=6)),
    ])
