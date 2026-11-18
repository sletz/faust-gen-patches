#!/usr/bin/env python3
"""Every Faust port against its gen~ export, sample by sample.

For each model of scripts/models.py and each of its settings, the same input
and the same noise streams go to

  - build/ref/<export>   the gen~ export of the patch (ref/export, Max 9.2.1),
                         noise() call sites served from the streams
                         (scripts/patch_export.py, ref/gen_ref.cpp);
  - faustprobe -pn det   the `det` definition of dsp/<model>.dsp: the port with
                         its noises taken as extra inputs;

and the outputs are compared: the largest difference on each output, in dB of
that output's peak in the reference. A check passes when every output is
within the model's tolerance (-180 dB unless the model says why not).

    scripts/test_gen.py                    every model, results/results.md
    scripts/test_gen.py bernoulli-gate     some models (no results file)
    scripts/test_gen.py --quick            shorter renders
"""
import argparse, json, os, platform, struct, subprocess, sys, time
import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "scripts"))
from models import MODELS, DEFAULT_TOL_DB  # noqa: E402

FAUST_RS = os.environ.get("FAUST_RS", os.path.join(ROOT, "..", "faust-rs"))
FAUSTPROBE = os.environ.get("FAUSTPROBE", os.path.join(FAUST_RS, "target", "release", "faustprobe"))
BUILD = os.path.join(ROOT, "build", "test")
SR = 48000


def wav64(path, x, sr=SR):
    x = np.ascontiguousarray(np.atleast_2d(x.T).T if x.ndim == 1 else x, dtype="<f8")
    n, ch = x.shape
    data = x.tobytes()
    fmt = struct.pack("<HHIIHH", 3, ch, sr, sr * ch * 8, ch * 8, 64)
    hdr = (b"RIFF" + struct.pack("<I", 4 + 8 + len(fmt) + 8 + len(data)) + b"WAVE"
           + b"fmt " + struct.pack("<I", len(fmt)) + fmt + b"data" + struct.pack("<I", len(data)))
    with open(path, "wb") as f:
        f.write(hdr + data)


# ------------------------------------------------------------------ inputs

def sig_music(n, ch, seed=1):
    """A test signal for effects: a saw chord with an envelope, noise bursts,
    clicks, and silence at the end so that tails are compared too."""
    t = np.arange(n) / SR
    rng = np.random.default_rng(seed)
    out = np.zeros((n, ch))
    for c in range(ch):
        x = np.zeros(n)
        for f in (110.0 * (1 + 0.003 * c), 164.81, 220.0 * (1 - 0.002 * c)):
            x += 2 * ((t * f) % 1.0) - 1
        x *= 0.25 * np.exp(-3 * (t % 0.5)) * (t < 0.6 * n / SR)
        burst = (t % 0.25 < 0.02) * rng.uniform(-0.5, 0.5, n)
        x += burst * (t < 0.6 * n / SR)
        x[(np.arange(n) % 9600) == 4800 + 7 * c] += 0.9
        out[:, c] = x
    return out


def make_input(kind, n, ch):
    if ch == 0:
        return None
    if kind == "music":
        return sig_music(n, ch)
    if kind == "zero":
        return np.zeros((n, ch))
    if kind.startswith("sine:"):
        f = float(kind[5:])
        t = np.arange(n) / SR
        return np.stack([np.sin(2 * np.pi * f * t + 0.3 * c) for c in range(ch)], axis=1)
    if kind.startswith("dc:"):
        return np.full((n, ch), float(kind[3:]))
    if kind == "ramp":  # in1: a 2 Hz ramp 0..1 beyond the edges, in2: a slow bipolar CV
        t = np.arange(n) / SR
        r = ((t * 2.0) % 1.0) * 1.2 - 0.1
        cv = 0.8 * np.sin(2 * np.pi * 0.7 * t)
        return np.stack([r, cv][:ch], axis=1)
    if kind == "white":
        return np.random.default_rng(7).uniform(-0.5, 0.5, (n, ch))
    raise ValueError(kind)


# ------------------------------------------------------------------ renders

def render_ref(m, setting, n, inp, noise):
    """The export's render; for an mc.gen~ patch (`mc`), one render per channel
    (mc_channel 1..N, mc_channelcount N), its outputs side by side."""
    if m.get("mc"):
        N, k = m["mc"], m.get("mc_inputs", 0)
        outs, cmd = [], None
        for c in range(1, N + 1):
            sub = inp[:, (c - 1) * k:c * k] if k and inp is not None else inp
            st = dict(setting, name=f"{setting['name']}.ch{c}",
                      set={**setting.get("set", {}), "mc_channel": c, "mc_channelcount": N})
            o, cmd = _render_ref(m, st, n, sub, noise)
            outs.append(o)
        return np.concatenate(outs, axis=1), cmd
    return _render_ref(m, setting, n, inp, noise)


def _render_ref(m, setting, n, inp, noise):
    exe = os.path.join(ROOT, "build", "ref", m["export"])
    tag = f"{m['name']}-{setting['name']}"
    out = os.path.join(BUILD, tag + ".ref.f64")
    cmd = [exe, "--sr", str(SR), "--vs", "64", "-n", str(n), "--out", out]
    cmd += m.get("ref_args", [])  # extra gen_ref options of a model (e.g. --buffer NAME=FILE)
    if inp is not None:
        p = os.path.join(BUILD, tag + ".in.f64")
        np.ascontiguousarray(inp, dtype="<f8").tofile(p)
        cmd += ["--in", p]
    if noise is not None:
        p = os.path.join(BUILD, tag + ".noise.f64")
        np.ascontiguousarray(noise, dtype="<f8").tofile(p)
        cmd += ["--noise", p, "--sites", ",".join(str(c) for c in m["sites"])]
    for k, v in setting.get("set", {}).items():
        cmd += ["--set", f"{k}={v}"]
    for fr, k, v in setting.get("at", []):
        cmd += ["--at", str(fr), f"{k}={v}"]
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode:
        raise RuntimeError(f"gen_ref failed: {' '.join(cmd)}\n{r.stderr}")
    return np.fromfile(out, dtype="<f8").reshape(n, -1), cmd


def render_faust(m, setting, n, inp, noise, defn="det"):
    tag = f"{m['name']}-{setting['name']}"
    out = os.path.join(BUILD, tag + ".faust.npy")
    dsp = os.path.join(ROOT, "dsp", m["name"] + ".dsp")
    cmd = [FAUSTPROBE, "--double", "-I", os.path.join(ROOT, "dsp"), "--sr", str(SR), "--block", "64",
           "-n", str(n), "--quiet", "--out", out]
    if defn:
        cmd += ["-pn", defn]
    cmd.append(dsp)
    cols = [c for c in (inp, noise) if c is not None]
    if cols:
        p = os.path.join(BUILD, tag + ".in.wav")
        wav64(p, np.concatenate(cols, axis=1))
        cmd += ["--in", "file:" + p]
    else:
        cmd += ["--in", "zero"]
    for k, v in {**m.get("faust_set", {}), **setting.get("set", {})}.items():
        cmd += ["--set", f"{m.get('faust_names', {}).get(k, k)}={v}"]
    for fr, k, v in setting.get("at", []):
        cmd += ["--at", str(fr), f"{m.get('faust_names', {}).get(k, k)}={v}"]
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode:
        raise RuntimeError(f"faustprobe failed: {' '.join(cmd)}\n{r.stderr}")
    return np.load(out), cmd


def db(x):
    return 20 * np.log10(x) if x > 0 else -np.inf


def compare(ref, fau, skip=0, window=None):
    rows = []
    a, b = ref[skip:window], fau[skip:window]
    for c in range(ref.shape[1]):
        peak = float(np.max(np.abs(a[:, c])))
        d = np.abs(a[:, c] - b[:, c])
        err = float(np.max(d)) if len(d) else 0.0
        if not np.all(np.isfinite(b[:, c])):
            err = np.inf
        at = int(np.argmax(d)) + skip if len(d) else 0
        rel = db(err / peak) if peak > 0 else (db(err) if err > 0 else -np.inf)
        rows.append(dict(out=c, peak=peak, err=err, rel_db=rel, at=at))
    return rows


def process_io(m):
    """inputs and outputs of the `process` of dsp/<model>.dsp, by the C++ Faust
    compiler (`det` is what is compared; `process` is what a host runs)."""
    import tempfile
    dsp = os.path.join(ROOT, "dsp", m["name"] + ".dsp")
    with tempfile.TemporaryDirectory() as tmp:
        src = os.path.join(tmp, "p.dsp")
        with open(src, "w") as f:
            f.write(f'm = library("{dsp}");\nprocess = m.process;\n')
        r = subprocess.run([os.environ.get("FAUST", "faust"), "-I", os.path.join(ROOT, "dsp"), "-json",
                            "-o", os.path.join(tmp, "p.cpp"), src], capture_output=True, text=True)
        if r.returncode:
            raise RuntimeError(f"faust failed on {dsp}:\n{r.stderr}")
        j = json.load(open(src + ".json"))
    return j["inputs"], j["outputs"]


def run_model(m, quick):
    n = m.get("frames_quick" if quick else "frames", 24000 if quick else 96000)
    if quick:
        n = min(n, 24000)
    results = []
    nin, nout = process_io(m)
    exp_out = int(subprocess.run([os.path.join(ROOT, "build", "ref", m["export"]), "--list"],
                                 capture_output=True, text=True).stdout.split("outputs=")[1].split()[0])
    exp_out *= m.get("mc", 1)
    if nin != m["inputs"] or nout != exp_out:
        raise RuntimeError(f"{m['name']}: process has {nin} inputs / {nout} outputs, gen~ {m['inputs']} / {exp_out}")
    rng = np.random.default_rng(12345)
    nnoise = sum(m.get("sites", []))
    for setting in m["settings"]:
        kind = setting.get("input", m.get("input", "music"))
        inp = kind(n, SR) if callable(kind) else make_input(kind, n, m["inputs"])
        noise = rng.uniform(-1, 1, (n, nnoise)) if nnoise else None
        ref, rcmd = render_ref(m, setting, n, inp, noise)
        fau, fcmd = render_faust(m, setting, n, inp, noise)
        if fau.shape != ref.shape:
            raise RuntimeError(f"{m['name']}: shapes differ, gen {ref.shape} faust {fau.shape}")
        window = setting.get("window", m.get("window"))
        rows = compare(ref, fau, setting.get("skip", 0), window)
        tol = setting.get("tol_db", m.get("tol_db", DEFAULT_TOL_DB))
        worst = max(r["rel_db"] for r in rows)
        ok = worst <= tol
        results.append(dict(model=m["name"], setting=setting["name"], frames=n, tol_db=tol,
                            worst_db=worst, ok=bool(ok), outputs=rows,
                            ref_cmd=" ".join(os.path.relpath(x, ROOT) if x.startswith(ROOT) else x for x in rcmd)))
        print(f"{'ok  ' if ok else 'FAIL'} {m['name']:22s} {setting['name']:18s} worst {worst:8.1f} dB"
              f" (tol {tol}) " + " ".join(f"{r['rel_db']:.0f}" for r in rows), flush=True)
    return results


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("models", nargs="*")
    ap.add_argument("--quick", action="store_true")
    a = ap.parse_args()
    os.makedirs(BUILD, exist_ok=True)
    names = a.models or [m["name"] for m in MODELS]
    by = {m["name"]: m for m in MODELS}
    allres, fails = [], 0
    for nm in names:
        if nm not in by:
            sys.exit(f"unknown model {nm}; known: {', '.join(by)}")
        try:
            res = run_model(by[nm], a.quick)
        except RuntimeError as e:
            print(f"FAIL {nm}: {e}", flush=True)
            fails += 1
            allres.append(dict(model=nm, setting="-", ok=False, error=str(e)))
            continue
        fails += sum(not r["ok"] for r in res)
        allres += res
    if not a.models:
        write_results(allres, a.quick)
    print(f"{len(allres) - fails} passed, {fails} failed")
    sys.exit(1 if fails else 0)


def write_results(res, quick):
    os.makedirs(os.path.join(ROOT, "results"), exist_ok=True)
    with open(os.path.join(ROOT, "results", "results.json"), "w") as f:
        json.dump(res, f, indent=1)
    try:
        fr = subprocess.run(["git", "-C", FAUST_RS, "log", "-1", "--format=%h %cs"], capture_output=True, text=True).stdout.strip()
    except OSError:
        fr = "?"
    L = ["# Faust ports against the gen~ exports", "",
         f"Written by `scripts/test_gen.py{' --quick' if quick else ''}` on {time.strftime('%Y-%m-%d')}, "
         f"{platform.machine()} {platform.system()} {platform.release()}; faust-rs {fr}; gen~ export of Max 9.2.1. "
         f"{SR} Hz, blocks of 64, double precision on both sides, the same input and noise streams.", "",
         "Error: the largest |gen - faust| over the window, in dB of the peak of that output in gen's render; "
         "worst output first, then every output.", "",
         "| model | setting | frames | worst (dB) | tolerance | outputs (dB) | |", "|---|---|---|---|---|---|---|"]
    for r in res:
        if "error" in r:
            L.append(f"| {r['model']} | - | - | - | - | error | FAIL |")
            continue
        outs = " ".join("−∞" if o["rel_db"] == -np.inf else f"{o['rel_db']:.0f}" for o in r["outputs"])
        w = "−∞" if r["worst_db"] == -np.inf else f"{r['worst_db']:.1f}"
        L.append(f"| {r['model']} | {r['setting']} | {r['frames']} | {w} | {r['tol_db']} | {outs} | {'ok' if r['ok'] else 'FAIL'} |")
    notes = [(m["name"], m["note"]) for m in MODELS if m.get("note")]
    if notes:
        L += ["", "## Notes", ""] + [f"- **{n}**: {t}" for n, t in notes]
    with open(os.path.join(ROOT, "results", "results.md"), "w") as f:
        f.write("\n".join(L) + "\n")


if __name__ == "__main__":
    main()
