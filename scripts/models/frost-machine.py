MODEL = dict(name="frost-machine", export="frost_machine", inputs=2, sites=[], input="music",
    frames=144000,
    settings=[
        dict(name="default"),
        dict(name="huge-fuzz", set=dict(p_size=1, p_decay_pct=100, p_mod_ms=20, p_mod_hz=5, p_fuzz_db=60,
                                        p_fuzz_hz=8000, p_damp_hz=16000, p_mix_pct=100, p_gain_wet_db=-12)),
        dict(name="small-clean-pump", set=dict(p_size=0, p_decay_pct=50, p_mod_ms=0, p_fuzz_db=0, p_fuzz_hz=100,
                                               p_damp_hz=100, p_pump_db=-60, p_release_ms=10, p_gain_wet_db=24)),
        dict(name="sweeps", set=dict(p_mix_pct=100, p_pump_db=0),
             at=[(30000, "p_size", 0.1), (60000, "p_size", 0.9), (80000, "p_mod_hz", 3.3),
                 (100000, "p_decay_pct", 20), (120000, "p_release_ms", 300)]),
    ])
