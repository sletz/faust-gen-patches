MODEL = dict(name="curvature-shaper", export="curvature_shaper", inputs=2, sites=[], input="ramp",
    settings=[
        dict(name="default"),
        dict(name="s-curve", set=dict(shape=0.7, steepness=6)),
        dict(name="inverse", set=dict(shape=-0.6, steepness=2.5)),
        dict(name="unclamped", set=dict(clamp_in=0, shape=0.3, steepness=10),
             at=[(48000, "shape", -1), (72000, "steepness", 0.5)]),
        dict(name="wide-ab", set=dict(a=-250, b=730, shape=0.4),
             at=[(60000, "a", 900), (90000, "b", -1000)]),
    ])
