MODEL = dict(name="bernoulli-gate", export="bernoulli_gate", inputs=1, sites=[1], input="sine:7",
    settings=[
        dict(name="default"),
        dict(name="p0.8", set=dict(probability=0.8)),
        dict(name="internal-37Hz", set=dict(trigmode=1, frequency=37, probability=0.3)),
    ])
