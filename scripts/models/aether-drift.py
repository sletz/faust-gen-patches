MODEL = dict(name="aether-drift", export="aether_drift", inputs=2, sites=[], input="music",
    frames=144000,
    settings=[
        dict(name="default"),
        dict(name="short-dense", set=dict(del_time=7, del_fb=90, del_damp=70, rev_size=99, rev_diff=100,
                                          rev_damp=10, rev_mod=100, mix=100, gainout=6)),
        dict(name="time-sweep", set=dict(del_time=80, del_to_rev=100, rev_mod=0, rev_diff=0),
             at=[(30000, "del_time", 3), (70000, "del_time", 55)]),
        dict(name="hot", set=dict(gainout=12, del_vol=6, rev_vol=6, del_fb=100, del_damp=0, rev_size=0)),
    ])
