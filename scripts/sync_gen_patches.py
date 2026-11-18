#!/usr/bin/env python3
"""What changed in GEN-patches since ref/gendsp was taken from it, and the update.

    scripts/sync_gen_patches.py                 report (nothing written)
    scripts/sync_gen_patches.py --diff MODEL    the code diff of one gendsp, comments left out
    scripts/sync_gen_patches.py --apply         copy the new and changed gendsp into ref/gendsp,
                                                remove the deleted ones, record the commit

GEN_PATCHES is the GEN-patches checkout (default ../../GEN-patches). The
commit ref/gendsp was taken from is in ref/GEN-patches.commit. The report:

  - every gendsp new upstream, removed upstream, changed in its code (GenExpr
    of every codebox with the comments left out, the other boxes' text, the
    patch cords), or changed only in its comments (the header, the @comment of
    an inlet: no export or port to redo);
  - the demo patchers that hold a gen~ of a model without a port;
  - what the repository holds for a gendsp that is no longer there: ports
    (dsp/), model files (scripts/models/), exports (ref/export/).

After --apply: `make export` (Max, on request), `make ref`, then
scripts/new_port.py for the new models, the ports of the changed ones, and the
removal of the orphans the report lists (AGENTS.md, "Porting a new or changed
patch").
"""
import argparse, difflib, glob, json, os, re, shutil, subprocess, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GEN_PATCHES = os.environ.get("GEN_PATCHES", os.path.join(ROOT, "..", "..", "GEN-patches"))
REF = os.path.join(ROOT, "ref", "gendsp")
COMMIT = os.path.join(ROOT, "ref", "GEN-patches.commit")


def strip_comments(code):
    code = re.sub(r"/\*.*?\*/", "", code, flags=re.S)
    code = re.sub(r"//[^\n]*", "", code)
    return [ln.rstrip() for ln in code.splitlines() if ln.strip()]


def signature(path):
    """(code lines, comment-free), (everything) of a gendsp: what an export depends on"""
    d = json.load(open(path))
    code, full = [], []

    def walk(p, depth):
        ids = {}
        for i, b in enumerate(p.get("boxes", [])):
            bb = b["box"]
            ids[bb.get("id")] = i
            if "code" in bb:
                code.append(f"### codebox {i}")
                code.extend(strip_comments(bb["code"]))
                full.append(bb["code"])
            elif "text" in bb:
                code.append("### box " + re.sub(r'\s*@comment\s+("[^"]*"|\S.*)$', "", bb["text"]).strip())
                full.append(bb["text"])
            if "patcher" in bb:
                walk(bb["patcher"], depth + 1)
        for ln in p.get("lines", []):
            pl = ln["patchline"]
            code.append(f"### cord {ids.get(pl['source'][0])}:{pl['source'][1]} -> "
                        f"{ids.get(pl['destination'][0])}:{pl['destination'][1]}")
    walk(d["patcher"], 0)
    return code, full


def head(repo):
    r = subprocess.run(["git", "-C", repo, "log", "-1", "--format=%h %cs %s"], capture_output=True, text=True)
    return r.stdout.strip() if r.returncode == 0 else "?"


def names(folder):
    return {os.path.splitext(os.path.basename(p))[0] for p in glob.glob(os.path.join(folder, "*.gendsp"))}


def report():
    up, ref = names(os.path.join(GEN_PATCHES, "gendsp")), names(REF)
    taken = open(COMMIT).read().strip() if os.path.exists(COMMIT) else "unknown (no ref/GEN-patches.commit)"
    print(f"ref/gendsp taken from GEN-patches {taken}; GEN-patches is at {head(GEN_PATCHES)}")
    new, gone = sorted(up - ref), sorted(ref - up)
    changed, comments = [], []
    for n in sorted(up & ref):
        a, fa = signature(os.path.join(REF, n + ".gendsp"))
        b, fb = signature(os.path.join(GEN_PATCHES, "gendsp", n + ".gendsp"))
        if a != b:
            nd = sum(1 for ln in difflib.unified_diff(a, b, lineterm="", n=0) if ln[:1] in "+-" and ln[:3] not in ("+++", "---"))
            changed.append((n, nd))
        elif fa != fb:
            comments.append(n)
    print(f"\nnew upstream ({len(new)}): " + (", ".join(new) or "-"))
    print(f"removed upstream ({len(gone)}): " + (", ".join(gone) or "-"))
    print(f"code changed ({len(changed)}): " + (", ".join(f"{n} ({k} lines)" for n, k in changed) or "-"))
    print(f"comments only ({len(comments)}): " + (", ".join(comments) or "-"))
    # demo patchers holding a gen~ of a model without a port
    ports = {os.path.splitext(os.path.basename(p))[0] for p in glob.glob(os.path.join(ROOT, "dsp", "*.dsp"))}
    missing = {}
    for mp in sorted(glob.glob(os.path.join(GEN_PATCHES, "*.maxpat"))):
        txt = open(mp, encoding="utf-8", errors="replace").read()
        for m in set(re.findall(r'"text"\s*:\s*"(?:mc\.)?gen~ [^"]*@gen ([\w.-]+)', txt)):
            if m not in ports:
                missing.setdefault(m, []).append(os.path.basename(mp))
    if missing:
        print("\ndemo patchers with a gen~ of a model without a port:")
        for m, ps in sorted(missing.items()):
            print(f"  {m}: {', '.join(ps)}")
    # what the repository holds for gendsp that are gone (upstream and here)
    orphans = []
    for p in sorted(glob.glob(os.path.join(ROOT, "dsp", "*.dsp"))):
        n = os.path.splitext(os.path.basename(p))[0]
        if n not in up:
            orphans.append(os.path.relpath(p, ROOT))
    for p in sorted(glob.glob(os.path.join(ROOT, "scripts", "models", "*.py"))):
        if os.path.splitext(os.path.basename(p))[0] not in up:
            orphans.append(os.path.relpath(p, ROOT))
    up_exports = {n.replace("-", "_") for n in up}
    for p in sorted(glob.glob(os.path.join(ROOT, "ref", "export", "*.cpp"))):
        if os.path.splitext(os.path.basename(p))[0] not in up_exports:
            orphans.append(os.path.relpath(p, ROOT) + " (and .h)")
    if orphans:
        print("\nno longer a gendsp upstream: " + ", ".join(orphans))
    return new, gone, changed, comments


def diff(model):
    a, _ = signature(os.path.join(REF, model + ".gendsp"))
    b, _ = signature(os.path.join(GEN_PATCHES, "gendsp", model + ".gendsp"))
    for ln in difflib.unified_diff(a, b, f"ref/gendsp/{model}.gendsp", f"GEN-patches/gendsp/{model}.gendsp", lineterm=""):
        print(ln)


def apply():
    new, gone, changed, comments = report()
    for n in new + [c for c, _ in changed] + comments:
        shutil.copy2(os.path.join(GEN_PATCHES, "gendsp", n + ".gendsp"), os.path.join(REF, n + ".gendsp"))
    for n in gone:
        os.remove(os.path.join(REF, n + ".gendsp"))
    with open(COMMIT, "w") as f:
        f.write(head(GEN_PATCHES).split()[0] + "\n")
    print(f"\nref/gendsp updated: {len(new)} new, {len(changed) + len(comments)} replaced, {len(gone)} removed; "
          f"ref/GEN-patches.commit = {head(GEN_PATCHES).split()[0]}.\n"
          "Next: make export (Max), make ref, scripts/new_port.py for the new models, the ports of the changed "
          "ones, the orphans above removed.")


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--diff", metavar="MODEL")
    ap.add_argument("--apply", action="store_true")
    a = ap.parse_args()
    if not os.path.isdir(os.path.join(GEN_PATCHES, "gendsp")):
        sys.exit(f"no GEN-patches checkout at {GEN_PATCHES} (GEN_PATCHES=...)")
    if a.diff:
        diff(a.diff)
    elif a.apply:
        apply()
    else:
        report()


if __name__ == "__main__":
    main()
