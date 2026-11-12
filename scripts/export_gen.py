#!/usr/bin/env python3
"""Ask Max to export the C++ of every gendsp of ref/gendsp into ref/export.

Writes ref/gendsp/export_all.maxpat, a patcher holding one
`[gen~ @gen <name> @exportfolder ref/export/ @exportname <name_underscored>]`
per gendsp and a loadbang that sends them `exportcode` three seconds after
loading, opens it in Max (/Applications/Max.app by default, MAX_APP
otherwise), waits until every export has been rewritten, and asks Max to quit.
The export used by the repository was made by Max 9.2.1 on 2026-11-12.
"""
import glob, json, os, subprocess, sys, time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MAX_APP = os.environ.get("MAX_APP", "/Applications/Max.app")
GENDSP = os.path.join(ROOT, "ref", "gendsp")
EXPORT = os.path.join(ROOT, "ref", "export")


def patcher(names):
    boxes, lines = [], []

    def box(id, text, y, cls="newobj", ni=1, no=1):
        boxes.append({"box": {"id": id, "maxclass": cls, "numinlets": ni, "numoutlets": no,
                              "patching_rect": [20, y, 600, 22], "text": text}})

    box("lb", "loadbang", 20)
    box("del", "delay 3000", 60, ni=2)
    box("msg", "exportcode", 100, cls="message", ni=2)
    lines += [{"patchline": {"source": ["lb", 0], "destination": ["del", 0]}},
              {"patchline": {"source": ["del", 0], "destination": ["msg", 0]}}]
    for i, n in enumerate(names):
        box(f"g{i}", f'gen~ @gen {n} @exportfolder "{EXPORT}/" @exportname {n.replace("-", "_")}',
            160 + 30 * i, ni=2, no=2)
        lines.append({"patchline": {"source": ["msg", 0], "destination": [f"g{i}", 0]}})
    return {"patcher": {"fileversion": 1, "classnamespace": "box", "rect": [50, 50, 900, 1000],
                        "appversion": {"major": 9, "minor": 2, "revision": 1, "architecture": "x64", "modernui": 1},
                        "boxes": boxes, "lines": lines}}


def main():
    names = sorted(os.path.splitext(os.path.basename(p))[0] for p in glob.glob(os.path.join(GENDSP, "*.gendsp")))
    path = os.path.join(GENDSP, "export_all.maxpat")
    with open(path, "w") as f:
        json.dump(patcher(names), f, indent=1)
    os.makedirs(EXPORT, exist_ok=True)
    targets = [os.path.join(EXPORT, n.replace("-", "_") + ".cpp") for n in names]
    t0 = time.time()
    subprocess.run(["open", "-a", MAX_APP, path], check=True)
    while time.time() - t0 < 120:
        if all(os.path.exists(t) and os.path.getmtime(t) > t0 for t in targets):
            break
        time.sleep(1)
    else:
        missing = [t for t in targets if not (os.path.exists(t) and os.path.getmtime(t) > t0)]
        sys.exit(f"export_gen: not exported after 120 s: {', '.join(map(os.path.basename, missing))}")
    time.sleep(2)
    subprocess.run(["osascript", "-e", 'quit app "Max"'])
    print(f"exported {len(targets)} gendsp into {os.path.relpath(EXPORT, ROOT)}")


if __name__ == "__main__":
    main()
