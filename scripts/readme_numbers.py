#!/usr/bin/env python3
"""The figures of README.md and README.fr.md, from what the repository measured.

The prose of the READMEs is written by hand; the figures in it are not to be
copied by hand. This script computes them from

  - results/results.json (make test): the number of settings, of passes and of
    bit-exact settings, the range of the errors, each model's worst error;
  - results/cpu.json (make cost): the geometric means and the range of the
    speed ratios of the single-instance models;
  - web/svg/*.json.gz (make web): the packs, diagrams, links and their sizes;
  - max/*.maxpat (make max): the number of patchers;

finds them in both READMEs at the places that state them (the table of §1,
the opening, §3, §4, §5, §6), and reports every one that differs.

    scripts/readme_numbers.py            report; exit 1 if a figure is stale
    scripts/readme_numbers.py --write    rewrite the stale figures

A worst error is written as the dB value rounded toward zero (−191.5 dB is
"−191"): the error is below it. A place the script expects and does not find
is reported too (the prose around a figure was rewritten: update the pattern
here).
"""
import argparse, glob, gzip, json, math, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MC = {"adm_panner", "fdn_multireverb", "spatial-dbap"}


def facts():
    res = [r for r in json.load(open(os.path.join(ROOT, "results", "results.json"))) if "error" not in r]
    worst = {}
    for r in res:
        worst[r["model"]] = max(worst.get(r["model"], -math.inf), r["worst_db"])
    finite = [r["worst_db"] for r in res if r["worst_db"] > -math.inf]
    f = dict(settings=len(res), passed=sum(r["ok"] for r in res),
             bitexact=sum(r["worst_db"] == -math.inf for r in res),
             worst=max(finite), best=min(finite), model_worst=worst)
    cpu = [r for r in json.load(open(os.path.join(ROOT, "results", "cpu.json"))) if r["model"] not in MC]
    gm = lambda k: math.exp(sum(math.log(r[k] / r["gen~"]) for r in cpu) / len(cpu))
    ratios = [r["faust"] / r["gen~"] for r in cpu]
    f.update(cpu_n=len(cpu), cpu_gm=gm("faust"), cpu_gmr=gm("faust-rs"), cpu_min=min(ratios), cpu_max=max(ratios))
    packs, diagrams, links, size = 0, 0, 0, 0
    files = sorted(glob.glob(os.path.join(ROOT, "web", "svg", "*.json.gz")))
    for p in files:
        d = json.loads(gzip.open(p).read())
        svgs = d.get("files", d)
        packs += 1
        diagrams += len(svgs)
        size += sum(len(t) for t in svgs.values())
        links += sum(len(re.findall(r'xlink:href="([^"]+)"', t)) for t in svgs.values())
    f.update(packs=packs, diagrams=diagrams, links=links, svg_mb=size / 1e6,
             packed_mb=sum(os.path.getsize(p) for p in files) / 1e6,
             patchers=len(glob.glob(os.path.join(ROOT, "max", "*.maxpat"))))
    return f


def db(v):
    """−N, N = |v| rounded toward zero"""
    return f"−{int(math.floor(-v))}"


def dec(v, nd, fr):
    s = f"{v:.{nd}f}"
    return s.replace(".", ",") if fr else s


def rules(f, fr):
    """(pattern, replacement-from-match) of the places that state a figure"""
    def row(m):
        models = [x for x in (m[2], m[3]) if x]
        w = max(f["model_worst"].get(x, -math.inf) for x in models)
        if any(x not in f["model_worst"] for x in models):
            return m[0]
        cell = ("identique au bit" if fr else "bit-exact") if w == -math.inf else db(w)
        return m[1] + cell + m[5]
    table = (r"(?m)^(\| \[([\w-]+)\]\(dsp/[\w-]+\.dsp\)(?:, \[([\w-]+)\]\(dsp/[\w-]+\.dsp\))? \|.*\| )"
             r"(bit-exact|identique au bit|−\d+)( \|)$", row)
    S, B, P = f["settings"], f["bitexact"], f["passed"]
    if not fr:
        return [table,
            (r"\d+ settings, \d+ of them bit-exact, the others within −\d+ to −\d+ dB of the peak",
             lambda m: f"{S} settings, {B} of them bit-exact, the others within {db(f['worst'])} to {db(f['best'])} dB of the peak"),
            (r"\d+ of the \d+ settings are bit-exact", lambda m: f"{B} of the {S} settings are bit-exact"),
            (r"to −\d+ dB of the peak or better, at every setting", lambda m: f"to {db(f['worst'])} dB of the peak or better, at every setting"),
            (r"\(written by `make test` with the versions and the machine\): \d+ settings, \d+ pass\.",
             lambda m: f"(written by `make test` with the versions and the machine): {S} settings, {P} pass."),
            (r"\*\*Bit-exact \(\d+ settings\)\*\*", lambda m: f"**Bit-exact ({B} settings)**"),
            (r"runs on average [\d.]+ times as fast as the C\+\+ Max exports \(\d+ single-instance models\)",
             lambda m: f"runs on average {dec(f['cpu_gm'], 2, 0)} times as fast as the C++ Max exports ({f['cpu_n']} single-instance models)"),
            (r"over the \d+ single-instance models, geometric mean of the speed ratios [\d.]+ \(faust C\+\+ over gen~\) "
             r"and [\d.]+ \(faust-rs C\+\+\), ranging from [\d.]+ to [\d.]+\.",
             lambda m: f"over the {f['cpu_n']} single-instance models, geometric mean of the speed ratios "
                       f"{dec(f['cpu_gm'], 2, 0)} (faust C++ over gen~) and {dec(f['cpu_gmr'], 2, 0)} (faust-rs C++), "
                       f"ranging from {dec(f['cpu_min'], 2, 0)} to {dec(f['cpu_max'], 1, 0)}."),
            (r"holds the \d+ demo patchers", lambda m: f"holds the {f['patchers']} demo patchers"),
            (r"\d+ files and \d+ MB for the \d+ programs",
             lambda m: f"{f['diagrams']} files and {round(f['svg_mb'])} MB for the {f['packs']} programs"),
            (r"\([\d.]+ MB for the \d+\)", lambda m: f"({dec(f['packed_mb'], 1, 0)} MB for the {f['packs']})"),
            (r"\d+ packs, \d+ diagrams, each an SVG with a viewBox, \d+ links",
             lambda m: f"{f['packs']} packs, {f['diagrams']} diagrams, each an SVG with a viewBox, {f['links']} links"),
        ]
    return [table,
        (r"\d+ réglages, dont \d+ identiques au bit près, les autres entre −\d+ et −\d+ dB du pic",
         lambda m: f"{S} réglages, dont {B} identiques au bit près, les autres entre {db(f['worst'])} et {db(f['best'])} dB du pic"),
        (r"\d+ des \d+ réglages sont identiques au bit près", lambda m: f"{B} des {S} réglages sont identiques au bit près"),
        (r"à −\d+ dB du pic ou mieux, sur tous les réglages", lambda m: f"à {db(f['worst'])} dB du pic ou mieux, sur tous les réglages"),
        (r"\(écrit par `make test`, avec les versions et la machine\) : \d+ réglages, \d+ passent\.",
         lambda m: f"(écrit par `make test`, avec les versions et la machine) : {S} réglages, {P} passent."),
        (r"\*\*Identiques au bit \(\d+ réglages\)\*\*", lambda m: f"**Identiques au bit ({B} réglages)**"),
        (r"tourne en moyenne [\d,]+ fois plus vite que le C\+\+ exporté par Max \(\d+ modèles à une instance\)",
         lambda m: f"tourne en moyenne {dec(f['cpu_gm'], 2, 1)} fois plus vite que le C++ exporté par Max ({f['cpu_n']} modèles à une instance)"),
        (r"sur les \d+ modèles à une instance, moyenne géométrique des rapports de vitesse [\d,]+ \(C\+\+ Faust sur gen~\) "
         r"et [\d,]+ \(C\+\+ faust-rs\), de [\d,]+ à [\d,]+\.",
         lambda m: f"sur les {f['cpu_n']} modèles à une instance, moyenne géométrique des rapports de vitesse "
                   f"{dec(f['cpu_gm'], 2, 1)} (C++ Faust sur gen~) et {dec(f['cpu_gmr'], 2, 1)} (C++ faust-rs), "
                   f"de {dec(f['cpu_min'], 2, 1)} à {dec(f['cpu_max'], 1, 1)}."),
        (r"contient les \d+ patchers de démonstration", lambda m: f"contient les {f['patchers']} patchers de démonstration"),
        (r"\d+ fichiers et \d+ Mo pour les \d+ programmes",
         lambda m: f"{f['diagrams']} fichiers et {round(f['svg_mb'])} Mo pour les {f['packs']} programmes"),
        (r"\([\d,]+ Mo pour les \d+\)", lambda m: f"({dec(f['packed_mb'], 1, 1)} Mo pour les {f['packs']})"),
        (r"\d+ paquets, \d+ diagrammes, chacun un SVG avec un viewBox, \d+ liens",
         lambda m: f"{f['packs']} paquets, {f['diagrams']} diagrammes, chacun un SVG avec un viewBox, {f['links']} liens"),
    ]


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--write", action="store_true")
    a = ap.parse_args()
    f = facts()
    stale = missing = 0
    for name, fr in (("README.md", False), ("README.fr.md", True)):
        path = os.path.join(ROOT, name)
        text = open(path, encoding="utf-8").read()
        new = text
        for pat, fn in rules(f, fr):
            found = list(re.finditer(pat, new))
            if not found:
                print(f"{name}: no place matches {pat[:70]}...")
                missing += 1
                continue
            for m in found:
                rep = fn(m)
                if rep != m[0]:
                    i = next(k for k in range(min(len(rep), len(m[0])) + 1)
                             if k == min(len(rep), len(m[0])) or rep[k] != m[0][k])
                    i = max(0, i - 40)
                    print(f"{name}: …{m[0][i:i + 80]}\n{'':{len(name) + 2}}-> …{rep[i:i + 80]}")
                    stale += 1
            new = re.sub(pat, fn, new)
        if a.write and new != text:
            open(path, "w", encoding="utf-8").write(new)
    verb = "rewritten" if a.write else "stale"
    print(f"{stale} figure(s) {verb}" + (f", {missing} place(s) not found" if missing else ""))
    sys.exit(1 if missing or (stale and not a.write) else 0)


if __name__ == "__main__":
    main()
