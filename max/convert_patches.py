#!/usr/bin/env python3
"""The demo patchers of GEN-patches, with the Faust ports in faustgen~ instead of gen~.

For every `<model>.maxpat` of GEN-patches (../GEN-patches, GEN_PATCHES
otherwise), loaded and saved with py2max (PY2MAX: its checkout, by default the
one of the GRAME studio project), writes max/<model>.maxpat where

  - the `gen~ @gen <model>` box becomes a `faustgen~` box holding the Faust
    port (dsp/<model>.dsp) as its source code, its local libraries
    (genops.lib, ufo.lib, butterworth.lib) embedded as environments, so the
    patch needs nothing but the faustgen package; same id, place, inlets and
    signal outlets, so every patch cord stays; compiled in double precision
    (sample_format 1), as gen~ computes;
  - `mc.gen~ @chans 2 @gen cswitch-tremolo` becomes `mc.faustgen~` running
    max/cswitch-tremolo-mc2.dsp (the two instances in one program) followed by
    `mc.separate~ 2 2 2 2`, which gives back the four MC outlets;
  - every `attrui` that drives gen~ (gen~ shows its params as attributes,
    faustgen~ does not) becomes a number box (same id, so the preset data and
    the cords into it stay valid) sending `<param> $1` through a hidden
    `prepend`, its label as a comment, its range and initial value from the
    Faust UI; the `preset` objects' data are converted from attrui to number;
  - every message sent to the DSP (`probability $1`, `s -to-gen-`...) is
    checked against the controls of the Faust program (label, shortname or
    path, what faustgen~ accepts): an unknown one is an error, except the
    `buf_taps` binding of delays-delays, whose buffer~ the Faust port holds as
    constants (its cord is removed and a comment says so).

    max/convert_patches.py                 every patch
    max/convert_patches.py ufo sature-delay
    max/convert_patches.py --check         compile the embedded sources with
                                           faustprobe and compare them with
                                           dsp/<model>.dsp, sample for sample
"""
import argparse, json, os, re, subprocess, sys, tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAXDIR = ROOT / "max"
DSP = ROOT / "dsp"
GEN_PATCHES = Path(os.environ.get("GEN_PATCHES", ROOT.parent.parent / "GEN-patches"))
PY2MAX = Path(os.environ.get("PY2MAX", "/Users/letz/Developpements/Recherche/Studio 2025/studio/faust/maxmsp/py2max"))
FAUST = os.environ.get("FAUST", "faust")
FAUST_RS = Path(os.environ.get("FAUST_RS", ROOT.parent / "faust-rs"))
FAUSTPROBE = os.environ.get("FAUSTPROBE", str(FAUST_RS / "target" / "release" / "faustprobe"))
FAUSTGEN_VERSION = "1.87"

sys.path.insert(0, str(PY2MAX))
from py2max import Patcher  # noqa: E402

# models whose gen~ is not a plain instance: the Faust program that replaces it
WRAPPERS = {"cswitch-tremolo": dict(dsp=MAXDIR / "cswitch-tremolo-mc2.dsp", separate=[2, 2, 2, 2])}
# messages to the DSP that the Faust program has no control for, and why
IGNORED = {("delays-delays", "buf_taps"):
           "buf_taps: the tap table is fixed in the Faust program (the demo's load state)"}


# ------------------------------------------------------------------ Faust source

def bundle(path: Path, stack=()) -> str:
    """The source of `path` with every library("X") that names a file next to
    it replaced by `environment { <X, bundled> }`; standard libraries stay."""
    path = path.resolve()
    if path in stack:
        raise ValueError(f"recursive library: {path}")

    def lib(m):
        child = (path.parent / m[1])
        if not child.is_file():
            return m[0]
        return "environment {\n" + bundle(child, stack + (path,)) + "\n}"

    text = re.sub(r'library\("([^"]+)"\)', lib, path.read_text())
    return "\n".join(line.rstrip() for line in text.splitlines())


def source_of(model: str) -> str:
    src = WRAPPERS[model]["dsp"] if model in WRAPPERS else DSP / f"{model}.dsp"
    rel = src.relative_to(ROOT)
    return (f"// {model}: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n"
            f"// generated from faust-gen-patches/{rel} by max/convert_patches.py;\n"
            f"// edit that file and regenerate. Its libraries are embedded as environments.\n"
            + bundle(src) + "\n")


def faust_ui(source: str):
    """inputs, outputs and the controls of a source, from `faust -json`."""
    with tempfile.TemporaryDirectory(prefix="fgp-json-") as tmp:
        dsp = Path(tmp) / "x.dsp"
        dsp.write_text(source)
        r = subprocess.run([FAUST, "-json", "-o", str(Path(tmp) / "x.cpp"), str(dsp)],
                           capture_output=True, text=True)
        if r.returncode:
            raise RuntimeError(f"faust -json failed:\n{r.stderr}")
        j = json.loads((Path(tmp) / "x.dsp.json").read_text())
    controls = []

    def walk(items):
        for it in items:
            if "items" in it:
                walk(it["items"])
            elif it["type"] in ("hslider", "vslider", "nentry", "button", "checkbox"):
                controls.append(dict(label=it["label"], shortname=it.get("shortname", it["label"]),
                                     address=it["address"], type=it["type"],
                                     init=float(it.get("init", 0)), min=float(it.get("min", 0)),
                                     max=float(it.get("max", 1)), step=float(it.get("step", 1)),
                                     meta=it.get("meta", [])))
    walk(j["ui"])
    return j["inputs"], j["outputs"], controls


def gen_params(model):
    """the Params of the gen~ export (ref/export), not its History variables"""
    src = (ROOT / "ref" / "export" / (model.replace("-", "_") + ".cpp")).read_text()
    return set(re.findall(r'pi->name = "([^"]+)"', src))


def find_control(controls, name):
    for c in controls:
        if name in (c["label"], c["shortname"], c["address"]):
            return c
    return None


# ------------------------------------------------------------------ patch editing

def ids_into(p, box_id):
    return [pl for pl in p._lines if pl.dst == box_id]


def selectors_into(p, box_id, seen=None):
    """(selector, source box) of every message or prepend reaching box_id, through
    `s NAME` / `r NAME` pairs too (one level of send/receive)."""
    out = []
    boxes = {b.id: b for b in p._boxes}
    sends = {}
    for b in p._boxes:
        t = getattr(b, "text", "") or ""
        m = re.match(r"(?:s|send) (\S+)$", t)
        if m:
            sends.setdefault(m[1], []).append(b)
    targets = [box_id]
    for pl in list(p._lines):  # pass-through objects into the DSP
        b = boxes.get(pl.src)
        if pl.dst == box_id and b is not None and (getattr(b, "text", "") or "") in ("thru", "t l", "trigger l"):
            targets.append(b.id)
    for b in p._boxes:  # receivers connected to the DSP
        t = getattr(b, "text", "") or ""
        m = re.match(r"(?:r|receive) (\S+)$", t)
        if m and any(pl.src == b.id and pl.dst == box_id for pl in p._lines):
            targets += [s.id for s in sends.get(m[1], [])]
    for tid in targets:
        for pl in ids_into(p, tid):
            src = boxes[pl.src]
            t = getattr(src, "text", "") or ""
            if src.maxclass == "message":
                for part in t.split(","):
                    w = part.strip().split()
                    if w and not re.match(r"^[-\d.$]", w[0]):
                        out.append((w[0], src, pl))
            elif t.startswith("prepend "):
                out.append((t.split()[1], src, pl))
    return out


def number_box(p, attrui, ctrl, faust_box, loadbang):
    """Replace an attrui by: a comment (its label), a number box (the attrui's id)
    and a hidden `prepend <name>` into the DSP; the initial value shown by a
    hidden `set` message at load."""
    x, y, w, h = attrui.patching_rect
    name = attrui.attr
    tw = float(getattr(attrui, "text_width", 0) or min(max(60.0, 7.0 * len(name) + 16), w - 50))
    integer = ctrl["step"] >= 1 and float(ctrl["min"]).is_integer() and float(ctrl["max"]).is_integer()
    incoming = [(pl.src, pl.source[1]) for pl in ids_into(p, attrui.id)]
    p.remove_box(attrui)
    unit = next((m["unit"] for m in ctrl["meta"] if "unit" in m), "")
    p.add_comment(name + (f" ({unit})" if unit else ""), patching_rect=[x, y, tw, h])
    kw = dict(patching_rect=[x + tw, y, max(50.0, w - tw), h], id=attrui.id,
              minimum=ctrl["min"], maximum=ctrl["max"])
    if hasattr(attrui, "bgcolor"):
        kw["bgcolor"] = attrui.bgcolor
    num = p.add_intbox(**kw) if integer else p.add_floatbox(**kw)
    num.numinlets, num.numoutlets = 1, 2
    num.outlettype = ["", "bang"] if integer else ["", "bang"]
    pre = p.add_textbox(f"prepend {name}", numinlets=1, numoutlets=1, outlettype=[""],
                        patching_rect=[x + tw, y + h + 2, 120, 22], hidden=1)
    p.add_line(num, pre)
    p.add_line(pre, faust_box)
    v = ctrl["init"]
    init = p.add_message(f"set {int(v) if integer else repr(v)}", patching_rect=[x + tw + 125, y + h + 2, 90, 22],
                         hidden=1)
    p.add_line(loadbang, init)
    p.add_line(init, num)
    for src, outlet in incoming:
        p.add_patchline(src, outlet, num.id, 0)
    return "number" if integer else "flonum"


def convert_presets(p, converted):
    """attrui entries of the preset objects' data -> number/flonum entries."""
    for b in p._boxes:
        if b.maxclass != "preset" or not getattr(b, "preset_data", None):
            continue
        data = json.loads(b.preset_data) if isinstance(b.preset_data, str) else b.preset_data
        for slot in data:
            d, out, i = slot["data"], [], 0
            while i < len(d):
                n = int(d[i])
                rec = d[i:i + n]
                if len(rec) >= 3 and rec[1] in converted and rec[2] == "attrui":
                    if rec[3] == "float" or rec[3] == "int" or rec[3] == "list":
                        out += [5, rec[1], converted[rec[1]], "float" if converted[rec[1]] == "flonum" else "int", rec[4]]
                else:
                    out += rec
                i += n
            slot["data"] = out
        b.preset_data = json.dumps(data) if isinstance(b.preset_data, str) else data


def convert(model: str, out_dir: Path) -> dict:
    src = GEN_PATCHES / f"{model}.maxpat"
    p = Patcher.from_file(src)
    lent = lend_rect(p)
    original_ids = {b.id for b in p._boxes}
    gens = [b for b in p._boxes if re.match(r"(mc\.)?gen~ .*@gen " + re.escape(model) + r"\b", getattr(b, "text", "") or "")]
    if len(gens) != 1:
        raise RuntimeError(f"{model}: {len(gens)} gen~ @gen {model} boxes")
    gen = gens[0]
    source = source_of(model)
    nin, nout, controls = faust_ui(source)
    report = dict(model=model, inputs=nin, outputs=nout, controls=len(controls), attrui=0, notes=[])

    # the faustgen~ box, in place of gen~
    mc = gen.text.startswith("mc.")
    common = dict(sourcecode=source, sourcecode_size=len(source.encode("utf-8")), sample_format=1,
                  version=FAUSTGEN_VERSION, varname=f"faust_{model.replace('-', '_')}")
    if mc:
        sep = WRAPPERS[model]["separate"]
        x, y, w, h = gen.patching_rect
        gen_outs = [(pl.source[1], pl.dst, pl.destination[1]) for pl in p._lines if pl.src == gen.id]
        for pl in [pl for pl in p._lines if pl.src == gen.id]:
            p.remove_line(pl)
        gen.__dict__["text"] = "mc.faustgen~"
        gen.numinlets, gen.numoutlets = 1, 3
        gen.outlettype = ["multichannelsignal", "", ""]
        gen.__dict__.update(common)
        sp = p.add_textbox("mc.separate~ " + " ".join(map(str, sep)), numinlets=1, numoutlets=len(sep),
                           outlettype=["multichannelsignal"] * len(sep), patching_rect=[x, y + 30, w, 22])
        p.add_line(gen, sp)
        for o, dst, inl in gen_outs:
            p.add_patchline(sp.id, o, dst, inl)
        report["notes"].append(f"mc.gen~ @chans 2 -> mc.faustgen~ ({nin} in, {nout} out) + mc.separate~")
    else:
        if nin != gen.numinlets and not (nin == 0 and gen.numinlets == 1):
            raise RuntimeError(f"{model}: gen~ has {gen.numinlets} inlets, the Faust program {nin} inputs")
        if nout != gen.numoutlets:
            raise RuntimeError(f"{model}: gen~ has {gen.numoutlets} outlets, the Faust program {nout} outputs")
        gen.__dict__["text"] = "faustgen~"
        gen.numinlets, gen.numoutlets = max(1, nin), nout + 2
        gen.outlettype = ["signal"] * nout + ["", ""]
        gen.__dict__.update(common)

    loadbang = p.add_textbox("loadbang", numinlets=1, numoutlets=1, outlettype=["bang"],
                             patching_rect=[gen.patching_rect[0] + 200, gen.patching_rect[1] + 30, 60, 22], hidden=1)

    # attrui -> number boxes
    converted = {}
    for pl in list(ids_into(p, gen.id)):
        b = p._objects.get(pl.src)
        if b is None or b.maxclass != "attrui":
            continue
        ctrl = find_control(controls, b.attr)
        if ctrl is None:
            if b.attr in gen_params(model):
                raise RuntimeError(f"{model}: attrui '{b.attr}' has no Faust control")
            # gen~ shows its History variables as attributes too: a state the
            # Faust program keeps to itself
            x, y, w, h = b.patching_rect
            p.remove_box(b)
            p.add_comment(f"gen~ History '{b.attr}': internal state in Faust, not settable",
                          patching_rect=[x, y, max(w, 300.0), h], textcolor=[0.6, 0.1, 0.1, 1.0])
            report["notes"].append(f"attrui on History '{b.attr}' removed")
            continue
        converted[b.id] = number_box(p, b, ctrl, gen, loadbang)
    convert_presets(p, converted)
    report["attrui"] = len(converted)

    # every other message to the DSP must name a control
    unknown = []
    for sel, srcbox, pl in selectors_into(p, gen.id):
        if find_control(controls, sel):
            continue
        if (model, sel) in IGNORED:
            p.remove_line(pl)
            x, y = srcbox.patching_rect[0], srcbox.patching_rect[1]
            p.add_comment(IGNORED[(model, sel)], patching_rect=[x, y + 24, 360, 20])
            report["notes"].append(IGNORED[(model, sel)])
            continue
        unknown.append(sel)
    if unknown:
        raise RuntimeError(f"{model}: messages without a Faust control: {sorted(set(unknown))}")

    # a header
    p.add_comment(f"Faust version: gen~ @gen {model} replaced by {gen.text} running the Faust port "
                  f"(faust-gen-patches/dsp/{model}.dsp), double-click it to see the code. "
                  f"Generated by max/convert_patches.py from GEN-patches/{model}.maxpat.",
                  patching_rect=[gen.patching_rect[0], max(0.0, gen.patching_rect[1] - 48), 560, 34],
                  textcolor=[0.6, 0.1, 0.1, 1.0])

    out = out_dir / f"{model}.maxpat"
    for b in list(p._boxes):  # attrui replaced keep their ids: they are new boxes
        if b.id in converted:
            original_ids.discard(b.id)
    save(p, out, lent, original_ids)
    return report


def lend_rect(p):
    """py2max's layout and lint read the patcher's `rect`, which Max 9 patchers
    (openrect) do not have: lend one, taken back by save()."""
    if hasattr(p, "rect"):
        return False
    r = getattr(p, "openrect", None)
    p.rect = list(r) if r and r[2] > 0 else [0.0, 0.0, 1200.0, 800.0]
    return True


def save(p, path: Path, lent: bool, original_ids):
    """py2max's render and to_dict, after checking the ports of every cord that
    touches a box this script made or changed against their declared counts
    (py2max's lint knows fixed port counts only, and `mc.pack~ 16`, `gate~ 2`
    or `mc.separate~ 2 2 2 2` have the counts of their arguments)."""
    p.render()
    for pl in p._lines:
        src, dst = p._objects.get(pl.src), p._objects.get(pl.dst)
        if src is None or dst is None:
            raise RuntimeError(f"{path.name}: cord to a missing box {pl.src} -> {pl.dst}")
        touched = pl.src not in original_ids or pl.dst not in original_ids or "faustgen" in (src.text or "") + (dst.text or "")
        if touched and not (0 <= pl.source[1] < src.numoutlets and 0 <= pl.destination[1] < dst.numinlets):
            raise RuntimeError(f"{path.name}: cord {pl.src}[{pl.source[1]}] -> {pl.dst}[{pl.destination[1]}] out of range")
    if lent:
        del p.rect
    path.write_text(json.dumps(p.to_dict(), indent=4))


def check(model: str) -> str:
    """The embedded source against dsp/<model>.dsp, sample for sample."""
    src = source_of(model)
    with tempfile.TemporaryDirectory(prefix="fgp-check-") as tmp:
        f = Path(tmp) / f"{model}.dsp"
        f.write_text(src)
        if model in WRAPPERS:
            cmd = [FAUSTPROBE, "--double", "-n", "4800", "--in", "white:3", "--quiet", str(f)]
            what = "compiles, finite"
        else:
            cmd = [FAUSTPROBE, "--double", "-I", str(DSP), "-n", "48000", "--in", "white:3", "--quiet",
                   "--compare", str(DSP / f"{model}.dsp"), str(f)]
            what = "identical to dsp/"
        r = subprocess.run(cmd, cwd=tmp, capture_output=True, text=True)
        cpp = subprocess.run([FAUST, "-double", str(f), "-o", "/dev/null"], cwd=tmp, capture_output=True, text=True)
    if r.returncode or cpp.returncode:
        return f"FAIL {model}: {r.stderr[-600:]}{cpp.stderr[-600:]}"
    return f"ok   {model:24s} {what}, faust C++ compiles"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("models", nargs="*")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--out", default=str(MAXDIR))
    a = ap.parse_args()
    models = a.models or sorted(f.stem for f in GEN_PATCHES.glob("*.maxpat"))
    fails = 0
    for m in models:
        try:
            if a.check:
                line = check(m)
                fails += line.startswith("FAIL")
                print(line, flush=True)
            else:
                r = convert(m, Path(a.out))
                print(f"ok   {m:24s} {r['inputs']} in, {r['outputs']} out, {r['controls']} controls, "
                      f"{r['attrui']} attrui replaced" + "".join(f"; {n}" for n in r["notes"]), flush=True)
        except Exception as e:  # noqa: BLE001 - report and go on with the others
            fails += 1
            print(f"FAIL {m}: {e}", flush=True)
    sys.exit(1 if fails else 0)


if __name__ == "__main__":
    main()
