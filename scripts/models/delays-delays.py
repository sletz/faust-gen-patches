import os

# buf_taps, the buffer~ the patch fills at load (scripts/delays_delays_buffer.py)
_BUF = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "ref", "buffers",
                    "delays_delays.buf_taps.txt")

# All Params of delays-delays are declared without min/max: the export clamps
# them to [0, 1] (gen~ in Max does not), so the settings stay within [0, 1]:
# f_mix, feedback and res (0..100 in Max) reach 1 % at most, f_direction 0 or 1,
# f_start/f_end keep their defaults (16000, 800).
MODEL = dict(name="delays-delays", export="delays_delays", inputs=2, sites=[], input="music",
    ref_args=["--buffer", "buf_taps=" + os.path.normpath(_BUF)],
    note="buf_taps (undeclared by the export) is the content the maxpat loads, computed by "
         "scripts/delays_delays_buffer.py from tap_manager.js and pattr ma_sphere, given to gen_ref by --buffer; "
         "every Param lacks min/max, so the export clamps them to [0, 1] and the settings stay there. "
         "Residual ~1e-11 (-190 dB) on the right line: the 2^21-sample ring quantizes genlib's "
         "interpolation fraction to 2^-31, and Faust reassociates the spread term of the delay by an ulp.",
    frames=264000,   # 5.5 s: the last tap is at 5000 ms
    settings=[
        dict(name="default"),
        dict(name="filters-fb", set=dict(f_mix=1, res=1, feedback=1, f_direction=1, gain=1, mix=1,
                                         ducking=1, smooth_time=0),
             at=[(100000, "f_type", 1), (180000, "f_direction", 0)]),
        dict(name="mc-spread", set=dict(mc_mode=1, spread=1, offset=0.3, f_type=0.6, f_mix=1, mix=0.8),
             at=[(120000, "offset", 0.9), (150000, "mc_mode", 0.4)]),
        dict(name="clear", set=dict(mc_mode=1, feedback=1, gain=1),
             at=[(60000, "clear", 1), (66000, "clear", 0), (200000, "spread", 0.5)]),
    ])
