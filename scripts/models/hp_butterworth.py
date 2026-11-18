MODEL = dict(name="hp_butterworth", export="hp_butterworth", inputs=1, sites=[],
    settings=[
        dict(name="default"),
        dict(name="glide", set=dict(freq=400), at=[(30000, "freq", 30), (60000, "freq", 1000)]),
        dict(name="high-slow", set=dict(freq=6000, smooth=400), at=[(40000, "freq", 19000), (80000, "smooth", 3)]),
    ])
