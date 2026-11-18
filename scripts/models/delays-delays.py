import os

# buf_taps, the buffer~ the patch fills at load (scripts/delays_delays_buffer.py)
_BUF = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "ref", "buffers",
                    "delays_delays.buf_taps.txt")

MODEL = dict(name="delays-delays", export="delays_delays", inputs=2, sites=[], input="music",
    ref_args=["--buffer", "buf_taps=" + os.path.normpath(_BUF)],
    note="buf_taps (undeclared by the export) is the content the maxpat loads, computed by "
         "scripts/delays_delays_buffer.py from tap_manager.js and pattr ma_sphere, given to gen_ref by --buffer. "
         "Residual ~1e-11 (-190 dB) on the right line: the 2^21-sample ring quantizes genlib's "
         "interpolation fraction to 2^-31, and Faust reassociates the spread term of the delay by an ulp.",
    frames=264000,   # 5.5 s: the last tap is at 5000 ms
    settings=[
        dict(name="default"),
        dict(name="filters-fb", set=dict(f_mix=100, res=70, feedback=60, f_direction=1, gain=1.5, mix=1,
                                         ducking=1, smooth_time=0, f_start=12000, f_end=300),
             at=[(100000, "f_type", 1), (140000, "f_type", 1.7), (180000, "f_direction", 3)]),
        dict(name="mc-spread", set=dict(mc_mode=1, spread=60, offset=0.3, f_type=0.6, f_mix=80, mix=0.8,
                                        f_direction=2, res=40),
             at=[(120000, "offset", 0.9), (150000, "mc_mode", 0.4), (200000, "spread", -80)]),
        dict(name="clear", set=dict(mc_mode=1, feedback=90, gain=3, f_start=20000),
             at=[(60000, "clear", 1), (66000, "clear", 0), (200000, "spread", 50)]),
    ])
