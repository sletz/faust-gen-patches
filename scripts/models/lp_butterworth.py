MODEL = dict(name="lp_butterworth", export="lp_butterworth", inputs=1, sites=[],
    settings=[
        dict(name="default"),
        dict(name="glide", set=dict(freq=400), at=[(30000, "freq", 30), (60000, "freq", 1000)]),
    ])
