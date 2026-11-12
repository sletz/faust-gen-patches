#!/usr/bin/env python3
"""web/models-data.js: the catalogue of the web page.

The 21 model entries are GEN-patches' own (`modelsData` in docs/index.html, written
by its generate_html_docs.py; GEN_PATCHES, by default ../../GEN-patches), unchanged
but for two fields added: `dsp` (the program of dsp/) and `worst_db` (the worst
error of the port against the gen~ export over the settings of the suite, from
results/results.json; -Infinity when bit-exact). The four utilities, which the
catalogue does not describe, are written here from the headers of their programs.

    python3 scripts/web_models.py [--out web/models-data.js]
"""
import argparse
import json
import math
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
GEN_PATCHES = Path(os.environ.get("GEN_PATCHES", ROOT.parent.parent / "GEN-patches"))

# card id -> program, where they differ
DSP = {"ufo-multilfo": "ufo"}

UTILITIES = [
    dict(id="ufo-core", name="UFO Core", dsp="ufo-core",
         title="The UFO LFO flattened for RNBO, every parameter with a signal inlet",
         badge="LFO / RNBO core", dsp_paradigm="ufo.gendsp without its nested gen; inlets 2..11 added to the parameters",
         description="The UFO multi-waveform LFO in one flat gen, as RNBO needs it: each parameter can also be "
                     "modulated at audio rate through its own inlet (in + param). With those inlets at zero it "
                     "renders exactly what UFO renders.",
         inlets=["in1: frequency in Hz (0.0001..1000)", "in2..in11: + lfosel, exp1, expc, exp2, oneshot, "
                 "shotnumbers, gain, offset, invert, unipolar", "in12: trigger (reset / one-shot restart)"],
         outlets=["out1: the LFO (bipolar or unipolar)"],
         parameters=[dict(name="lfosel", range="0 – 5", desc="cos, triangle, saw, square, random, random smooth"),
                     dict(name="exp1 / exp2 / expc", range="0.1 – 20, 0 – 4", desc="phase and output exponents, cycles per period"),
                     dict(name="oneshot / shotnumbers", range="0/1, 0 – 128", desc="free running, or a given number of cycles"),
                     dict(name="gain / offset", range="0 – 10, ±100 %", desc="output scaling and offset"),
                     dict(name="invert / unipolar", range="0/1", desc="output polarity")]),
    dict(id="ufo-core-simple", name="UFO Core Simple", dsp="ufo-core-simple",
         title="The phase core of the UFO LFO",
         badge="Phase generator", dsp_paradigm="f/SR accumulator, one-shot clip, wrap, × expc, ^ exp1, × 2 − 1",
         description="The phase generator of UFO alone: an accumulator reset by a rising trigger, free running or "
                     "limited to a number of cycles, multiplied by expc and raised to exp1. Not wrapped after the "
                     "power: with expc > 1 the output exceeds 1.",
         inlets=["in1: frequency in Hz (0.0001..1000)", "in2..in5: + exp1, expc, oneshot, shotnumbers",
                 "in6: trigger (reset / one-shot restart)"],
         outlets=["out1: the shaped phase, −1..1"],
         parameters=[dict(name="exp1 / expc", range="0.1 – 20, 0 – 4", desc="phase exponent, cycles per period"),
                     dict(name="oneshot / shotnumbers", range="0/1, 0 – 128", desc="free running, or a given number of cycles")]),
    dict(id="lp_butterworth", name="Butterworth Low-Pass", dsp="lp_butterworth",
         title="24 dB/oct Butterworth low-pass, two RBJ biquads",
         badge="Utility filter", dsp_paradigm="2 cascaded RBJ biquads, cutoff glided by a one-pole",
         description="A 4th-order Butterworth low-pass whose cutoff glides to freq with a one-pole of smooth ms; "
                     "the biquad coefficients follow the glide at every sample.",
         inlets=["in1: audio"], outlets=["out1: low-passed audio"],
         parameters=[dict(name="freq", range="10 – 1000 Hz", desc="cutoff"),
                     dict(name="smooth", range="0 – 1000 ms", desc="glide time of the cutoff")]),
    dict(id="hp_butterworth", name="Butterworth High-Pass", dsp="hp_butterworth",
         title="24 dB/oct Butterworth high-pass, two RBJ biquads",
         badge="Utility filter", dsp_paradigm="2 cascaded RBJ biquads, cutoff glided by a one-pole",
         description="A 4th-order Butterworth high-pass whose cutoff glides to freq with a one-pole of smooth ms; "
                     "the biquad coefficients follow the glide at every sample.",
         inlets=["in1: audio"], outlets=["out1: high-passed audio"],
         parameters=[dict(name="freq", range="10 – 1000 Hz", desc="cutoff"),
                     dict(name="smooth", range="0 – 1000 ms", desc="glide time of the cutoff")]),
]


def models_data(html):
    s = html.read_text(encoding="utf-8")
    key = "const modelsData = "
    i = s.index(key) + len(key)
    j = s.index("];", i) + 1
    return json.loads(s[i:j])


def main():
    a = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    a.add_argument("--out", default=str(ROOT / "web" / "models-data.js"))
    args = a.parse_args()
    html = GEN_PATCHES / "docs" / "index.html"
    models = models_data(html)
    results = json.loads((ROOT / "results" / "results.json").read_text())
    worst = {}
    for r in results:
        worst[r["model"]] = max(worst.get(r["model"], -math.inf), r["worst_db"])
    for m in models:
        m["dsp"] = DSP.get(m["id"], m["id"])
    for u in UTILITIES:
        u.update(category="utilities", category_label="Utilities", gendsp=f"gendsp/{u['dsp']}.gendsp",
                 maxpat=None, block_diagram=None)
        for p in u["parameters"]:
            p.setdefault("default", "")
    models += UTILITIES
    for m in models:
        w = worst.get(m["dsp"])
        m["worst_db"] = None if w is None else (round(w, 1) if math.isfinite(w) else "bit-exact")
    suite = dict(settings=len(results), passed=sum(r["ok"] for r in results),
                 bitexact=sum(1 for r in results if r["worst_db"] == -math.inf),
                 worst=round(max(r["worst_db"] for r in results), 1))
    body = json.dumps(models, ensure_ascii=False, indent=1)
    out = Path(args.out)
    out.write_text(
        "// The catalogue of the web page, generated by scripts/web_models.py: do not edit.\n"
        "// The model entries are GEN-patches' own (modelsData of docs/index.html, by Max Bruckert,\n"
        "// MIT), with `dsp` (the Faust program) and `worst_db` (the worst error of the port against\n"
        "// the gen~ export, results/results.json) added; the utilities are described from dsp/.\n"
        f"export const MODELS_DATA = {body};\n"
        f"export const SUITE = {json.dumps(suite)};\n", encoding="utf-8")
    print(f"{out.relative_to(ROOT)}: {len(models)} models, suite {suite}")


if __name__ == "__main__":
    main()
