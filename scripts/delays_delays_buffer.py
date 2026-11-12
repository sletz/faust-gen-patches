#!/usr/bin/env python3
"""The content of delays-delays' `buf_taps` buffer~, as the patch loads it.

delays-delays.gendsp reads `Buffer buf_taps` (channel 0: tap times in ms,
channel 1: tap amplitudes, 32 frames), which its export does not declare.
In GEN-patches/delays-delays.maxpat the buffer is `buffer~ ---buf_taps
@samps 32 @chans 2`, bound to gen~ by a loadbang (`prepend buf_taps`), and
filled by the v8ui `tap_manager.js` (function compute(), Buffer.poke of
channels 1 and 2) from its parameters, which `pattr ma_sphere` restores at
load (its saved `restore` list: maxDelay 5000, delIn 0, gravityIn -70,
gravityOut 34, jitter 0, mode 0 (simple), sphereX 0.328..., sphereY
0.397..., windowType 0 (Gauss), reverse 0). The UI rewrites the buffer at
run time (dragging the sphere, the dials); this is the content at load.
jitter 0 makes compute() deterministic (Math.random() is multiplied by 0).

A buffer~ holds float32: the values are rounded to float32 here, as poke does.

    scripts/delays_delays_buffer.py            writes ref/buffers/delays_delays.buf_taps.txt
    scripts/delays_delays_buffer.py --faust    prints the two Faust lists of dsp/delays-delays.dsp
"""
import math, os, struct, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "ref", "buffers", "delays_delays.buf_taps.txt")

# pattr ma_sphere "restore" (GEN-patches/delays-delays.maxpat, obj-8), first 10 of getvalueof()
maxDelay, delIn, gravityIn, gravityOut, jitterValue, appMode = 5000, 0, -70, 34, 0, 0
sphereX, sphereY = 0.32808398950131235, 0.39779005524861877
windowType, isReverse = 0, 0


def f32(x):
    return struct.unpack("<f", struct.pack("<f", x))[0]


def getExp(v):
    return 1.0 / (1.0 + (v / 50.0)) if v >= 0 else 1.0 + (abs(v) / 50.0)


def compute():
    expIn, expOut = getExp(gravityIn), getExp(gravityOut)
    splitIndex = math.floor(sphereX * 31)
    minT = maxDelay * delIn
    span = maxDelay - minT
    taps, amps = [], []
    for i in range(32):
        if appMode == 1:
            if i <= splitIndex:
                t = minT + math.pow(i / max(1, splitIndex), expIn) * (span * sphereX)
            else:
                t = minT + (span * sphereX) + (math.pow((i - splitIndex) / (31 - splitIndex), expOut) * (span * (1.0 - sphereX)))
        else:
            t = minT + math.pow(i / 31, expIn) * span
        if jitterValue <= 0.3:
            jR = (jitterValue / 0.3) * 0.05
        elif jitterValue <= 0.6:
            jR = 0.05 + ((jitterValue - 0.3) / 0.3) * 0.15
        else:
            jR = 0.2 + ((jitterValue - 0.6) / 0.4) * 0.4
        assert jR == 0, "jitter > 0 draws Math.random()"
        taps.append(max(0.1, t))
        dist = abs((i / 31) - sphereX)
        width = max(0.01, (1.0 - sphereY))
        w = int(windowType)
        if w == 0: win = math.exp(-math.pow(dist / (width * 0.6), 2))
        elif w == 1: win = math.cos(min(math.pi / 2, dist / width))
        elif w == 2: win = max(0, 1.0 - (dist / width))
        elif w == 3: win = min(1.0, max(0, 1.0 - (dist / width)) * 1.5)
        elif w == 4: win = math.exp(-dist * (5.0 / width))
        elif w == 5: win = 1.0 if dist < width * 0.5 else 0.0
        elif w == 6: win = i / 31
        elif w == 7: win = 1.0 - (i / 31)
        else: win = 1.0
        a = (win + (1.0 - win) * ((0.6 - sphereY) / 0.6)) if sphereY < 0.6 else math.pow(win, 1.0 + (sphereY - 0.6) * 5.0)
        if isReverse > 0:
            a = 1.0 - a
        if i > 29:
            a *= (31 - i) / 2
        amps.append(a)
    return [f32(x) for x in taps], [f32(x) for x in amps]


def main():
    taps, amps = compute()
    if "--faust" in sys.argv:
        print("buf_t = (" + ", ".join(repr(x) for x in taps) + ");")
        print("buf_a = (" + ", ".join(repr(x) for x in amps) + ");")
        return
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w") as f:
        f.write("# delays-delays buf_taps (scripts/delays_delays_buffer.py): 32 frames, ch0 time (ms), ch1 amplitude, float32\n")
        for t, a in zip(taps, amps):
            f.write(f"{t!r} {a!r}\n")
    print(OUT)


if __name__ == "__main__":
    main()
