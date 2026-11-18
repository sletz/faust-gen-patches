MODEL = dict(name="lorenz-rossler-chaos", export="lorenz_rossler_chaos", inputs=2, sites=[], input="zero",
    frames=192000,
    settings=[
        dict(name="default"),
        dict(name="lorenz", set=dict(system=0, speed=150, param_rho=28)),
        dict(name="rossler", set=dict(system=1, speed=600, param_rho=45)),
        dict(name="lorenz-cv-inject", set=dict(system=0, speed=300, drive=1.6, param_rho=40, inject=1), input="music"),
        dict(name="rossler-cv", set=dict(system=1, speed=200, inject=0.5), input="ramp"),
        # rho = 60, sigma = 20, the fastest step: the edge of the [-300, 300] box
        dict(name="lorenz-fast", set=dict(system=0, speed=1000, drive=2, param_rho=60)),
        dict(name="switch", set=dict(speed=500),
             at=[(40000, "system", 0), (80000, "param_rho", 12), (110000, "system", 1),
                 (140000, "drive", 0), (160000, "param_rho", 55)]),
    ])
