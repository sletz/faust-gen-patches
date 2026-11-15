#!/usr/bin/env python3
"""web/svg/<model>.json.gz: the block diagrams of a program, for the web page.

faust-rs --svg draws a program as a directory of SVG files: process.svg, and one
file per sub-diagram it folds away, linked from the box that stands for it (a
sub-diagram links back to its parent from its background). The 25 programs make
7174 files, 66 MB (delays-delays alone: 3978 files); unfolded (--fold 0) a single
program is a file of more than 1 GB. Each directory is packed here into one
gzipped JSON object, {file name: SVG text}, which the page's diagram viewer
(web/diagram.js) loads when a card's diagram is opened, and whose links it follows.

The pack is refused when process.svg is missing, when a link names a file that is
not there, or when a file cannot be reached from process.svg. The gzip header
carries no name and no date: the same diagrams give the same bytes.

    python3 scripts/web_svg.py dsp/<model>.dsp web/svg/<model>.json.gz

FAUSTRS (or FAUST_RS, a checkout with a release faust-rs) names the compiler.
"""
import gzip
import json
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
FAUST_RS = Path(os.environ.get("FAUST_RS", ROOT.parent / "faust-rs"))
FAUSTRS = os.environ.get("FAUSTRS", str(FAUST_RS / "target" / "release" / "faust-rs"))
if os.sep in FAUSTRS:
    FAUSTRS = os.path.abspath(FAUSTRS)   # it runs in a temporary directory
LINK = re.compile(r'xlink:href="([^"]+)"')
XML_DECL = re.compile(r"^<\?xml[^>]*\?>\s*")


def diagrams(dsp: Path) -> dict:
    """{file name: SVG text} of the program's diagram, the XML declarations removed."""
    with tempfile.TemporaryDirectory() as tmp:
        # the compiler writes <name>-svg/ into its working directory
        cmd = [FAUSTRS, "--svg", "--scaled-svg", "-double", "-I", str(dsp.parent.resolve()),
               str(dsp.resolve()), "-o", os.devnull]
        run = subprocess.run(cmd, cwd=tmp, capture_output=True, text=True)
        out = Path(tmp) / f"{dsp.stem}-svg"
        if run.returncode or not out.is_dir():
            sys.exit(f"{dsp}: {' '.join(cmd)} failed\n{run.stdout}{run.stderr}")
        return {f.name: XML_DECL.sub("", f.read_text(encoding="utf-8")) for f in sorted(out.glob("*.svg"))}


def check(dsp: Path, files: dict) -> None:
    if "process.svg" not in files:
        sys.exit(f"{dsp}: no process.svg among the {len(files)} diagrams")
    seen, todo = {"process.svg"}, ["process.svg"]
    while todo:
        name = todo.pop()
        for target in LINK.findall(files[name]):
            if target not in files:
                sys.exit(f"{dsp}: {name} links to {target}, which was not written")
            if target not in seen:
                seen.add(target)
                todo.append(target)
    if len(seen) != len(files):
        lost = sorted(set(files) - seen)
        sys.exit(f"{dsp}: {len(lost)} diagrams cannot be reached from process.svg ({', '.join(lost[:5])}...)")


def main() -> None:
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    dsp, out = Path(sys.argv[1]), Path(sys.argv[2])
    files = diagrams(dsp)
    check(dsp, files)
    data = json.dumps(files, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode("utf-8")
    out.parent.mkdir(parents=True, exist_ok=True)
    with open(out, "wb") as f, gzip.GzipFile(filename="", mode="wb", fileobj=f, compresslevel=9, mtime=0) as z:
        z.write(data)
    print(f"{out}: {len(files)} diagrams, {len(data) / 1e6:.1f} MB, {out.stat().st_size / 1e3:.0f} kB packed")


if __name__ == "__main__":
    main()
