MODEL = dict(name="cswitch-tremolo", export="cswitch_tremolo", inputs=2, sites=[1, 1, 1], input="music",
    settings=[
        dict(name="default"),
        dict(name="jitter-fast", set=dict(rate=73, time_rand=1, pwm=0.3, slope=0.5, q=30,
                                          min_freq=80, max_freq=12000)),
        dict(name="slow-wide", set=dict(rate=2.5, time_rand=0.6, pwm=0.85, slope=40, depth=0.7,
                                        rand_pan=0.5, filter_depth=0.4, q=0.7),
             at=[(40000, "rate", 400), (70000, "slope", 0)]),
        dict(name="reset", set=dict(rate=37, time_rand=0.3),
             at=[(30000, "reset", 1), (30500, "reset", 0), (60000, "reset", 1), (60001, "reset", 0)]),
    ])
