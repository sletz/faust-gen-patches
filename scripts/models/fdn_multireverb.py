import numpy as np


def _chans(n, sr):
    """8 inputs: the music signal's two channels alternately, the odd channels
    attenuated, so that every instance has its own input."""
    from test_gen import sig_music
    m = sig_music(n, 2)
    return np.stack([m[:, c % 2] * (1 - 0.1 * c) for c in range(8)], axis=1)


MODEL = dict(name="fdn_multireverb", export="fdn_multireverb", inputs=8, sites=[], input=_chans, mc=8,
    mc_inputs=1, frames=144000, faust_names=dict(mix_rev="mix"),
    note="mc.gen~: the export rendered once per channel (mc_channel 1..8, mc_channelcount 8), each on its own input. "
         "The export names the Param mix_rev (its name=\"mix\" attribute, which gen~ in Max shows, is dropped).",
    settings=[
        dict(name="default"),
        dict(name="big-wet", set=dict(size=100, decay=105, spread=100, absorb=0, tilt=0.6, mix_rev=100, depth=20, speed=7)),
        dict(name="small-dark", set=dict(size=0.5, decay=40, spread=0, absorb=90, tilt=-1, predelay=0, mix_rev=70)),
        dict(name="sweeps", set=dict(mix_rev=100, predelay=100),
             at=[(30000, "size", 20), (60000, "spread", 30), (90000, "decay", 110), (110000, "mix_rev", 0)]),
    ])
