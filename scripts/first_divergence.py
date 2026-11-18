#!/usr/bin/env python3
"""Where a port first departs from its gen~ export, and what the export computed there.

    scripts/first_divergence.py <model> <setting> [--eps-db DB] [--frames N] [--show K]

Renders the setting as scripts/test_gen.py does (same input, same noise
streams, same parameters and schedule), finds the first frame where an output
of the port differs from the export's (exactly, or by more than --eps-db below
that output's peak), and prints the two outputs around it, with the
difference in ulps. Then it renders the export again, instrumented: every
local variable the exported C++ defines and every state it assigns, inside
perform(), is printed with its value for the frames of the block that ends at
the divergence (build/debug/<model>-<setting>.trace.txt), and the values at the
diverging frame are shown (--show K: the first K of them; all go to the file).

What it gives: the first value of gen's computation to compare with the port's,
in gen's order. To read a value of the port, give it a name at the top level
of the program and render it with faustprobe -pn NAME (or compare the outputs
of intermediate stages).
"""
import argparse, os, re, subprocess, sys
import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "scripts"))
import test_gen as T  # noqa: E402
from models import MODELS  # noqa: E402

DEBUG = os.path.join(ROOT, "build", "debug")
CXX = os.environ.get("CXX", "c++")
# as the Makefile builds the reference
CXXFLAGS = ["-std=c++17", "-O2", "-ffp-contract=off", "-fno-builtin"]
TYPES = r"(?:const\s+)?(?:t_sample|t_param|double|float|int|long|bool)"
LOCAL = re.compile(rf"^(\s*){TYPES}\s+(\w+)\s*=\s*[^;]*;\s*$")
ASSIGN = re.compile(r"^(\s*)(\w+)\s*=\s*[^=;][^;]*;\s*$")


def inputs_of(m, setting_name, n):
    """the input and noise test_gen gives this setting (its noise streams depend on
    the settings before it)"""
    rng = np.random.default_rng(12345)
    nnoise = sum(m.get("sites", []))
    for s in m["settings"]:
        kind = s.get("input", m.get("input", "music"))
        inp = kind(n, T.SR) if callable(kind) else T.make_input(kind, n, m["inputs"])
        noise = rng.uniform(-1, 1, (n, nnoise)) if nnoise else None
        if s["name"] == setting_name:
            return s, inp, noise
    sys.exit(f"{m['name']}: no setting {setting_name}; settings: {', '.join(s['name'] for s in m['settings'])}")


def ulps(a, b):
    ia, ib = np.array([a], dtype="<f8").view("<i8")[0], np.array([b], dtype="<f8").view("<i8")[0]
    if (ia < 0) != (ib < 0):
        return None
    return int(abs(int(ia) - int(ib)))


def instrument(src, dst):
    """the export with a trace after every local definition and assignment of perform()"""
    lines = open(src).read().splitlines()
    out = ["#include <cstdlib>",
           "static long __gen_trace_lo = -2, __gen_trace_hi = -2;",
           "static struct __GenTraceInit { __GenTraceInit() {",
           "    const char* e = getenv(\"GEN_TRACE\");   // lo,hi: the frames traced",
           "    if (e) sscanf(e, \"%ld,%ld\", &__gen_trace_lo, &__gen_trace_hi);",
           "} } __gen_trace_init;",
           "static inline void __gen_trace(const char* name, double v) {",
           "    if (__gen_frame >= __gen_trace_lo && __gen_frame <= __gen_trace_hi)",
           "        fprintf(stderr, \"%ld %s %.17g\\n\", __gen_frame, name, v);",
           "}"]
    in_perform, depth, n = False, 0, 0
    for ln in lines:
        out.append(ln)
        if re.match(r"\s*inline int perform\(", ln):
            in_perform, depth = True, 0
        if in_perform:
            m = LOCAL.match(ln) or ASSIGN.match(ln)
            if m and m.group(2) not in ("__n", "__in1"):
                out.append(f'{m.group(1)}__gen_trace("{m.group(2)}", (double)({m.group(2)}));')
                n += 1
            depth += ln.count("{") - ln.count("}")
            if depth <= 0 and "}" in ln and n:
                in_perform = False
    with open(dst, "w") as f:
        f.write("\n".join(out) + "\n")
    return n


def trace_binary(m):
    os.makedirs(DEBUG, exist_ok=True)
    exp = m["export"]
    patched = os.path.join(ROOT, "build", "ref", exp + ".cpp")
    subprocess.run(["python3", os.path.join(ROOT, "scripts", "patch_export.py"),
                    os.path.join(ROOT, "ref", "export", exp + ".cpp"), patched], check=True)
    src = os.path.join(DEBUG, exp + "_trace.cpp")
    k = instrument(patched, src)
    exe = os.path.join(DEBUG, exp + "_trace")
    gl = [os.path.join(ROOT, "build", "ref", o) for o in ("genlib.o", "json.o", "json_builder.o")]
    r = subprocess.run([CXX, *CXXFLAGS, "-I", os.path.join(ROOT, "ref"), "-I", os.path.join(ROOT, "ref", "export"),
                        "-I", os.path.join(ROOT, "ref", "export", "gen_dsp"), f"-DGEN_MODEL={exp}",
                        f'-DGEN_SRC="{src}"', "-include", "cstdio",
                        # __gen_trace needs __gen_frame: gen_ref.cpp defines it before including GEN_SRC
                        os.path.join(ROOT, "ref", "gen_ref.cpp"), *gl, "-o", exe], capture_output=True, text=True)
    if r.returncode:
        sys.exit(f"the instrumented export does not compile ({src}):\n{r.stderr[-3000:]}")
    return exe, k


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("model")
    ap.add_argument("setting")
    ap.add_argument("--eps-db", type=float, default=None,
                    help="a difference counts when above this many dB of the output's peak (default: any)")
    ap.add_argument("--frames", type=int, default=None)
    ap.add_argument("--show", type=int, default=60)
    a = ap.parse_args()
    by = {m["name"]: m for m in MODELS}
    if a.model not in by:
        sys.exit(f"unknown model {a.model}")
    m = by[a.model]
    n = a.frames or m.get("frames", 96000)
    os.makedirs(T.BUILD, exist_ok=True)
    setting, inp, noise = inputs_of(m, a.setting, n)
    ref, _ = T.render_ref(m, setting, n, inp, noise)
    fau, _ = T.render_faust(m, setting, n, inp, noise)
    d = np.abs(ref - fau)
    peak = np.max(np.abs(ref), axis=0)
    thr = np.zeros_like(peak) if a.eps_db is None else peak * 10 ** (a.eps_db / 20)
    bad = (d > thr) | ~np.isfinite(fau)
    if not bad.any():
        print(f"{a.model} {a.setting}: no divergence over {n} frames"
              + ("" if a.eps_db is None else f" above {a.eps_db} dB of the peaks"))
        return
    frame = int(np.argmax(bad.any(axis=1)))
    outs = [int(c) for c in np.nonzero(bad[frame])[0]]
    print(f"{a.model} {a.setting}: first divergence at frame {frame} (t = {frame / T.SR:.6f} s), "
          f"output(s) {', '.join(str(c + 1) for c in outs)}")
    c0 = outs[0]
    print(f"\n  frame        gen out{c0 + 1}                 faust out{c0 + 1}               diff       ulps")
    for f in range(max(0, frame - 3), min(n, frame + 4)):
        u = ulps(ref[f, c0], fau[f, c0])
        print(f"  {f:<8d} {ref[f, c0]: .17e} {fau[f, c0]: .17e} {fau[f, c0] - ref[f, c0]: .2e} "
              f"{'-' if u is None else u}")
    worst = T.compare(ref, fau)
    print("\n  worst over the render (dB of each output's peak): "
          + " ".join("-inf" if r["rel_db"] == -np.inf else f"{r['rel_db']:.0f}" for r in worst))

    # the export's values at the diverging frame
    exe, k = trace_binary(m)
    st, sub = setting, inp
    if m.get("mc"):
        N, kin = m["mc"], m.get("mc_inputs", 0)
        nout1 = ref.shape[1] // N
        ch = c0 // nout1 + 1
        st = dict(setting, name=f"{setting['name']}.ch{ch}",
                  set={**setting.get("set", {}), "mc_channel": ch, "mc_channelcount": N})
        sub = inp[:, (ch - 1) * kin:ch * kin] if kin else inp
        print(f"  (mc.gen~: the instance of channel {ch})")
    _, cmd = T._render_ref(m, st, frame + 1, None if sub is None else sub[:frame + 1],
                           None if noise is None else noise[:frame + 1])
    cmd = [exe] + cmd[1:]
    trace = os.path.join(DEBUG, f"{a.model}-{a.setting}.trace.txt")
    # the frames of the block that ends at the divergence (the block-level values
    # of perform() are computed at frame f0 - 1)
    env = dict(os.environ, GEN_TRACE=f"{max(-1, frame - 65)},{frame}")
    r = subprocess.run(cmd, capture_output=True, text=True, env=env)
    print(f"\n  the export's values ({k} traced statements): {os.path.relpath(trace, ROOT)}")
    lines = [ln for ln in r.stderr.splitlines() if re.match(r"^-?\d+ \w+ ", ln)]
    with open(trace, "w") as f:
        f.write("\n".join(lines) + "\n")
    at = [ln.split(" ", 1)[1] for ln in lines if ln.split(" ", 1)[0] == str(frame)]
    for ln in at[:a.show]:
        print("   ", ln)
    if len(at) > a.show:
        print(f"    ... {len(at) - a.show} more in the file")


if __name__ == "__main__":
    main()
