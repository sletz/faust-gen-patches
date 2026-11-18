import numpy as np


def _move(n, sr):
    """in1: music (left channel), in2..in4: the source on a slow 3D Lissajous
    path, reaching beyond the ring of loudspeakers and through its centre."""
    from test_gen import sig_music
    t = np.arange(n) / sr
    x = np.zeros((n, 4))
    x[:, 0] = sig_music(n, 1)[:, 0]
    x[:, 1] = 1.2 * np.sin(2 * np.pi * 0.71 * t)
    x[:, 2] = np.cos(2 * np.pi * 0.53 * t)
    x[:, 3] = 0.8 * np.sin(2 * np.pi * 0.29 * t)
    return x


# No spk_pos buffer: gen_ref's unbound Buffer (one frame), the fallback ring.
MODEL = dict(name="spatial-dbap", export="spatial_dbap", inputs=4, sites=[], input=_move,
    slider_ranges=dict(smooth="declared with min=1 and no max: the export bounds it to [1, 1] (default 240 kept), "
                              "gen~ in Max does not; the slider goes to 4800, the suite leaves it at 240"),
    mc=32,
    frames=48000,
    note="mc.gen~: the export rendered once per channel (mc_channel 1..32, mc_channelcount 32); "
         "no spk_pos buffer, so the fallback ring.",
    settings=[
        dict(name="default"),
        dict(name="focus-damp", set=dict(focus=0.8, air_damp=1, rolloff=3, sharpness=2, blur=0.05, room_scale=1)),
        dict(name="six", set=dict(num_speakers=6, width=200, blur=2, room_scale=5)),
        dict(name="changes", set=dict(num_speakers=8.7),
             at=[(10000, "num_speakers", 1), (20000, "num_speakers", 0), (25000, "air_damp", 0.5),
                 (35000, "air_damp", 0), (40000, "focus", 0.3), (44000, "air_damp", 0.7)]),
    ])
