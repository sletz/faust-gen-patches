#!/usr/bin/env python3
"""CPU cost of every model: the gen~ export against the Faust port.

For each model of scripts/models/:

  - gen~:        ref/export/<model>.cpp as Max exported it (genlib's own noise),
                 in tools/gen_bench.cpp; for an mc.gen~ patch (`mc`: N), its N
                 instances (mc_channel 1..N), as the Faust port computes them;
  - faust:       dsp/<model>.dsp's `process` compiled by the C++ Faust compiler
                 (-double), in tools/bench_arch.cpp;
  - faust-rs:    the same by faust-rs -lang cpp -double;
  - faustprobe:  the same in faustprobe's Cranelift JIT (--time, its own timer).

The C++ programs are built by the same compiler with the same flags
(-O3 -ffp-contract=off), run single-threaded at 48 kHz in blocks of 64, every
input fed the same uniform noise, controls at their defaults, only the compute
call timed. The three C++ programs run in turn, ROUNDS times, and each keeps
its best time (timings of separate runs differ by 10 to 20 %).

    scripts/bench_cpu.py                  every model: results/cpu.md, cpu.json
    scripts/bench_cpu.py ufo frost-machine
    scripts/bench_cpu.py --seconds 2 --rounds 3
"""
import argparse, json, os, platform, re, subprocess, sys, time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "scripts"))
from models import MODELS  # noqa: E402

FAUST_RS = os.environ.get("FAUST_RS", os.path.join(ROOT, "..", "faust-rs"))
FAUSTPROBE = os.environ.get("FAUSTPROBE", os.path.join(FAUST_RS, "target", "release", "faustprobe"))
FAUSTRS = os.environ.get("FAUSTRS", os.path.join(FAUST_RS, "target", "release", "faust-rs"))
FAUST = os.environ.get("FAUST", "faust")
CXX = os.environ.get("CXX", "c++")
CXXFLAGS = ["-std=c++17", "-O3", "-ffp-contract=off"]
BUILD = os.path.join(ROOT, "build", "bench")
DSP = os.path.join(ROOT, "dsp")
GENLIB = [os.path.join(ROOT, "build", "ref", o) for o in ("genlib.o", "json.o", "json_builder.o")]


def run(cmd, **kw):
    r = subprocess.run(cmd, capture_output=True, text=True, **kw)
    if r.returncode:
        raise RuntimeError(f"failed: {' '.join(cmd)}\n{r.stdout[-2000:]}\n{r.stderr[-2000:]}")
    return r.stdout + r.stderr


def build(m):
    name, exp = m["name"], m["export"]
    gen = os.path.join(BUILD, f"gen_{exp}")
    src = os.path.join(BUILD, f"{exp}.cpp")
    run(["python3", os.path.join(ROOT, "scripts", "patch_export.py"), "--buffers-only",
         os.path.join(ROOT, "ref", "export", f"{exp}.cpp"), src])
    run([CXX, *CXXFLAGS, "-I", os.path.join(ROOT, "ref"), "-I", os.path.join(ROOT, "ref", "export"),
         "-I", os.path.join(ROOT, "ref", "export", "gen_dsp"),
         f"-DGEN_MODEL={exp}", f'-DGEN_SRC="{src}"', os.path.join(ROOT, "tools", "gen_bench.cpp"), *GENLIB, "-o", gen])
    arch = os.path.join(ROOT, "tools", "bench_arch.cpp")
    dsp = os.path.join(DSP, name + ".dsp")
    exes = {"gen~": gen}
    for tag, cmd in (("faust", [FAUST, "-double", "-I", DSP, "-a", arch, dsp]),
                     ("faust-rs", [FAUSTRS, "-lang", "cpp", "-double", "-I", DSP, "-a", arch, dsp])):
        exe = os.path.join(BUILD, f"{tag}_{exp}")
        run(cmd + ["-o", exe + ".cpp"])
        run([CXX, *CXXFLAGS, "-I/usr/local/include", exe + ".cpp", "-o", exe])
        exes[tag] = exe
    return exes


def rt(text):
    return float(re.search(r"([0-9.]+)x real time", text).group(1))


def bench(m, seconds, rounds):
    exes = build(m)
    # buffers of the export (delays-delays): the --buffer arguments of the reference
    ra = m.get("ref_args", [])
    bufs = [ra[i + 1] for i in range(len(ra) - 1) if ra[i] == "--buffer"]
    best = {k: 0.0 for k in exes}
    for _ in range(rounds):
        for k, exe in exes.items():
            extra = (bufs + ([f"--mc={m['mc']}"] if m.get("mc") else [])) if k == "gen~" else []
            best[k] = max(best[k], rt(run([exe, str(seconds), "48000", "64"] + extra)))
    n = int(seconds * 48000)
    jit = 0.0
    for _ in range(rounds):
        out = run([FAUSTPROBE, "--double", "-I", DSP, "--sr", "48000", "--block", "64", "-n", str(n),
                   "--in", "white:1", "--quiet", "--time", os.path.join(DSP, m["name"] + ".dsp")])
        jit = max(jit, rt(out))
    best["faustprobe"] = jit
    return best


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("models", nargs="*")
    ap.add_argument("--seconds", type=float, default=5.0)
    ap.add_argument("--rounds", type=int, default=3)
    a = ap.parse_args()
    os.makedirs(BUILD, exist_ok=True)
    run(["make", "-C", ROOT, *[os.path.relpath(g, ROOT) for g in GENLIB]])
    names = a.models or [m["name"] for m in MODELS]
    by = {m["name"]: m for m in MODELS}
    load0 = os.getloadavg()[0]
    rows = []
    for nm in names:
        b = bench(by[nm], a.seconds, a.rounds)
        rows.append(dict(model=nm, **b))
        print(f"{nm:24s} gen~ {b['gen~']:8.1f}x  faust {b['faust']:8.1f}x  faust-rs {b['faust-rs']:8.1f}x  "
              f"faustprobe {b['faustprobe']:8.1f}x   faust/gen~ {b['faust'] / b['gen~']:.2f}", flush=True)
    if not a.models:
        write(rows, a, load0)


def write(rows, a, load0):
    with open(os.path.join(ROOT, "results", "cpu.json"), "w") as f:
        json.dump(rows, f, indent=1)
    cxx = subprocess.run([CXX, "--version"], capture_output=True, text=True).stdout.splitlines()[0]
    fv = subprocess.run([FAUST, "--version"], capture_output=True, text=True).stdout.splitlines()[0]
    fr = subprocess.run(["git", "-C", FAUST_RS, "log", "-1", "--format=%h %cs"], capture_output=True, text=True).stdout.strip()
    power = subprocess.run(["pmset", "-g", "batt"], capture_output=True, text=True).stdout.splitlines()[0] if sys.platform == "darwin" else ""
    chip = subprocess.run(["sysctl", "-n", "machdep.cpu.brand_string"], capture_output=True, text=True).stdout.strip()
    L = ["# CPU cost: gen~ exports against the Faust ports", "",
         f"Written by `scripts/bench_cpu.py` on {time.strftime('%Y-%m-%d')}: {chip}, {platform.system()} {platform.release()}, "
         f"{power.strip()}; load average {load0:.1f} at the start, {os.getloadavg()[0]:.1f} at the end. "
         f"{cxx}, `{' '.join(CXXFLAGS)}`; {fv}; faust-rs {fr}.", "",
         f"Real-time factors (seconds of audio per second of compute; higher is cheaper), {a.seconds:g} s of audio at 48 kHz "
         f"in blocks of 64, every input fed uniform noise, controls at their defaults, the compute call alone timed, "
         f"best of {a.rounds} runs taken in turn. The last column is the speed of the Faust C++ over the gen~ export's "
         f"(above 1: the Faust program is cheaper). For the mc.gen~ patches (adm_panner, fdn_multireverb, "
         f"spatial-dbap) the gen~ column is the cost of the N instances that mc.gen~ @chans N runs, which "
         f"the Faust program computes in one.", "",
         "| model | gen~ export | Faust (faust C++) | Faust (faust-rs C++) | Faust (faustprobe JIT) | faust / gen~ |",
         "|---|---|---|---|---|---|"]
    for r in rows:
        L.append(f"| {r['model']} | {r['gen~']:.1f}x | {r['faust']:.1f}x | {r['faust-rs']:.1f}x | {r['faustprobe']:.1f}x | "
                 f"{r['faust'] / r['gen~']:.2f} |")
    import math
    gm = math.exp(sum(math.log(r["faust"] / r["gen~"]) for r in rows) / len(rows))
    gmr = math.exp(sum(math.log(r["faust-rs"] / r["gen~"]) for r in rows) / len(rows))
    L += ["", f"Geometric mean of the speed ratios: faust C++ / gen~ {gm:.2f}, faust-rs C++ / gen~ {gmr:.2f}."]
    with open(os.path.join(ROOT, "results", "cpu.md"), "w") as f:
        f.write("\n".join(L) + "\n")


if __name__ == "__main__":
    main()
