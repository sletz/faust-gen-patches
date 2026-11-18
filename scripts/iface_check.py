#!/usr/bin/env python3
"""Every port's interface against its gen~ export.

For each model of scripts/models/, the controls of dsp/<model>.dsp's
`process` (faust -json) against the Params of the export (build/ref/<export>
--list):

  - every Param of the export (Buffers, Data and an mc.gen~ patch's
    mc_channel / mc_channelcount aside) has a control of the same name (or
    the name the model maps it to, `faust_names`), with gen~'s default, min
    and max; a model lists in `slider_ranges` {param: why} the Params whose
    slider deliberately has another range than the export's (a Param the
    export bounds to [1, 1] because the gendsp gives it a minimum only);
  - every control of the program is a Param of the export;
  - the inputs and outputs are gen~'s (times N for an mc.gen~ patch);
  - and, as a warning, the Params that no setting of the suite moves (`set`
    or `at`): the suite does not exercise them (those of `slider_ranges`
    aside, which the export does not let move).

    scripts/iface_check.py                 every model (exit 1 on a mismatch)
    scripts/iface_check.py rings ufo       some models
"""
import argparse, json, os, subprocess, sys, tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "scripts"))
from models import MODELS  # noqa: E402

FAUST = os.environ.get("FAUST", "faust")
MC_PARAMS = ("mc_channel", "mc_channelcount")


def gen_iface(m):
    """inputs, outputs, {param: (default, min, max)} (min/max None without them)"""
    exe = os.path.join(ROOT, "build", "ref", m["export"])
    if not os.path.exists(exe):
        raise RuntimeError(f"{exe} missing: make ref (or make {os.path.relpath(exe, ROOT)})")
    lines = subprocess.run([exe, "--list"], capture_output=True, text=True, check=True).stdout.splitlines()
    head = dict(kv.split("=") for kv in lines[0].lstrip("# ").split())
    params = {}
    for ln in lines[1:]:
        if ln.startswith("#"):
            continue
        name, d, lo, hi = ln.split()
        params[name] = (float(d), None if lo == "-" else float(lo), None if hi == "-" else float(hi))
    return int(head["inputs"]), int(head["outputs"]), params


def faust_iface(m):
    """inputs, outputs, {label: (init, min, max)} of the program's process"""
    dsp = os.path.join(ROOT, "dsp", m["name"] + ".dsp")
    with tempfile.TemporaryDirectory(prefix="iface-") as tmp:
        src = os.path.join(tmp, "p.dsp")
        with open(src, "w") as f:
            f.write(f'm = library("{dsp}");\nprocess = m.process;\n')
        r = subprocess.run([FAUST, "-I", os.path.join(ROOT, "dsp"), "-json", "-o", os.path.join(tmp, "p.cpp"), src],
                           capture_output=True, text=True)
        if r.returncode:
            raise RuntimeError(f"faust failed on {dsp}:\n{r.stderr}")
        j = json.load(open(src + ".json"))
    ctrls = {}

    def walk(items):
        for it in items:
            if "items" in it:
                walk(it["items"])
            elif it["type"] in ("hslider", "vslider", "nentry", "checkbox", "button"):
                lo, hi = (0.0, 1.0) if it["type"] in ("checkbox", "button") else (float(it["min"]), float(it["max"]))
                if it["label"] in ctrls:
                    raise RuntimeError(f"{m['name']}: two controls labelled {it['label']}")
                ctrls[it["label"]] = (float(it.get("init", 0)), lo, hi)
    walk(j["ui"])
    return j["inputs"], j["outputs"], ctrls


def close(a, b):
    return abs(a - b) <= 1e-6 * max(1.0, abs(a), abs(b))


def moved(m):
    out = set()
    for s in m["settings"]:
        out |= set(s.get("set", {}))
        out |= {k for _, k, _ in s.get("at", [])}
    return out


def check(m):
    """(errors, warnings) of one model"""
    errs, warns = [], []
    gin, gout, gp = gen_iface(m)
    fin, fout, fc = faust_iface(m)
    n = m.get("mc", 1)
    exp_in = m["inputs"] if m.get("mc") else gin
    if fin != exp_in or fout != gout * n:
        errs.append(f"process has {fin} inputs / {fout} outputs, gen~ {exp_in} / {gout * n}")
    names = m.get("faust_names", {})
    ranges = m.get("slider_ranges", {})
    seen = set()
    for p, (d, lo, hi) in sorted(gp.items()):
        if m.get("mc") and p in MC_PARAMS:
            continue
        lab = names.get(p, p)
        if lab not in fc:
            errs.append(f"Param {p} has no control" + (f" '{lab}'" if lab != p else ""))
            continue
        seen.add(lab)
        fi, flo, fhi = fc[lab]
        if not close(d, fi):
            errs.append(f"{lab}: default {fi:g}, gen~ {d:g}")
        if lo is None or hi is None:
            errs.append(f"{lab}: the export gives no range")
        elif not (close(lo, flo) and close(hi, fhi)) and p not in ranges:
            errs.append(f"{lab}: range {flo:g}..{fhi:g}, gen~ {lo:g}..{hi:g}")
    for lab in sorted(set(fc) - seen):
        errs.append(f"control '{lab}' is not a Param of the export")
    for p in sorted(set(ranges) - set(gp)):
        errs.append(f"slider_ranges names {p}, not a Param of the export")
    mv = moved(m)
    idle = sorted(p for p in gp if p not in mv and p not in ranges and not (m.get("mc") and p in MC_PARAMS))
    if idle:
        warns.append("no setting moves " + ", ".join(idle))
    return errs, warns


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("models", nargs="*")
    a = ap.parse_args()
    by = {m["name"]: m for m in MODELS}
    names = a.models or list(by)
    bad = 0
    for nm in names:
        try:
            errs, warns = check(by[nm])
        except Exception as e:  # noqa: BLE001
            errs, warns = [str(e)], []
        bad += bool(errs)
        print(f"{'FAIL' if errs else 'ok  '} {nm}", flush=True)
        for e in errs:
            print(f"       {e}")
        for w in warns:
            print(f"       warning: {w}")
    print(f"{len(names) - bad} ok, {bad} with mismatches")
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
