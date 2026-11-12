MODEL = dict(name="aether-particle", export="aether_particle", inputs=2, sites=[1, 1, 1, 2, 2], input="music",
    frames=192000,
    settings=[
        dict(name="default"),
        dict(name="dense-near", set=dict(g_pos=1, g_std_pos=30, g_density=40, g_std_density=80, g_size=60,
                                         g_std_size=40, g_crush=80, g_skew=50, g_pitch=-1.5, g_window=0.1,
                                         g_mix=100, r_tilt=-0.6)),
        dict(name="regen-bright", set=dict(g_pos=2, g_density=25, g_regen=100, g_pitch=2.37, g_window=0.85,
                                           r_decay=110, r_tilt=0.7, r_depth=20, r_speed=10, r_absorb=5,
                                           r_mix=80, gainout=6),
             at=[(60000, "r_size", 100), (120000, "r_size", 3)]),
        dict(name="freeze-clear", set=dict(g_pos=3, g_density=20, g_prob=60, g_size=400),
             at=[(50000, "freeze", 1), (90000, "freeze", 0), (130000, "clear", 1), (150000, "clear", 0)]),
    ])
