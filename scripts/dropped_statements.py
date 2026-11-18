#!/usr/bin/env python3
"""Statements of a GenExpr that its gen~ export may have dropped.

    scripts/dropped_statements.py              every model
    scripts/dropped_statements.py rings ufo    some models

For every variable the GenExpr assigns (`x = ...`, `x += ...`, `x *= ...`, in
every codebox, comments left out), counts its assignments in the GenExpr and in
the exported C++ (as `x`, `x_N` for an inlined function's local, `m_x_N` for a
History or a Param), and lists the variables the export assigns fewer times
than the GenExpr, or never. gen~'s code generation dropped rings'
`if (cur_stiff < 0) cur_stiff *= 0.93; else cur_stiff *= 0.98;`: such a loss
shows here as `cur_stiff: GenExpr 3, export 1`.

A heuristic: gen also folds constants (`beta = 8.0 / 3.0` disappears into
its uses), merges the branches of an `if` that assign the same expression,
and gives a function's locals other names, so the list is a list of places to
read in the export, not of bugs. The ports document what they confirm (the
header of dsp/<model>.dsp, README §8).
"""
import argparse, json, os, re, sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "scripts"))
from models import MODELS  # noqa: E402

KEYWORDS = {"if", "else", "for", "while", "return", "Param", "History", "Delay", "Data", "Buffer"}


def genexpr(gendsp):
    out = []

    def walk(p):
        for b in p.get("boxes", []):
            bb = b["box"]
            if "code" in bb:
                out.append(bb["code"])
            if "patcher" in bb:
                walk(bb["patcher"])
    walk(json.load(open(gendsp))["patcher"])
    code = "\n".join(out)
    code = re.sub(r"/\*.*?\*/", "", code, flags=re.S)
    return re.sub(r"//[^\n]*", "", code)


PURE = {"PI", "TWOPI", "HALFPI", "SQRT2", "E", "LN2", "LN10", "dbtoa", "atodb", "mtof", "ftom", "sqrt", "pow",
        "exp", "log", "sin", "cos", "tan", "atan", "abs", "min", "max", "floor", "ceil", "e"}


def constant(rhs):
    """an expression of numbers, gen's constants and pure functions (folded by gen)"""
    return all(w in PURE for w in re.findall(r"[A-Za-z_]\w*", rhs))


def gen_assignments(code):
    """{name: count} of the assignments of a GenExpr; declarations, and variables
    given only a constant (which gen folds into their uses), aside"""
    c, const = Counter(), set()
    for stmt in re.split(r"[;{}\n]", code):
        s = stmt.strip()
        if not s or s.split()[0] in ("Param", "History", "Delay", "Data", "Buffer"):
            continue
        # x, y = a, b  /  x op= e  /  x = e   (not ==, <=, >=, !=)
        m = re.match(r"^(?:if\s*\(.*\)\s*|else\s+)?([\w\s,]+?)\s*([-+*/]?=)(?!=)(.*)$", s)
        if not m:
            continue
        names = [n.strip() for n in m.group(1).split(",")]
        for name in names:
            if re.fullmatch(r"[A-Za-z_]\w*", name) and name not in KEYWORDS:
                c[name] += 1
                if m.group(2) == "=" and len(names) == 1 and constant(m.group(3)):
                    const.add(name)
    return Counter({n: k for n, k in c.items() if not (n in const and k == 1)})


def export_assignments(cpp, name):
    """assignments of a GenExpr variable in the exported C++ (perform() and the rest)"""
    n = re.escape(name)
    base = re.escape(re.sub(r"_\d+$", "", name))
    # x, x_N (an inlined function's local), tmp_x_N (gen's name for a reassignment), m_x_N (a
    # History; a History named x_1 becomes m_x_N)
    pat = rf"(?<![\w.>])(?:{n}|{n}_\d+|tmp_{n}_\d+|m_{n}_\d+|m_{base}_\d+)\s*=(?!=)"
    return len(re.findall(pat, cpp))


def check(m):
    exp = m["export"]
    code = genexpr(os.path.join(ROOT, "ref", "gendsp", m["name"] + ".gendsp"))
    cpp = open(os.path.join(ROOT, "ref", "export", exp + ".cpp")).read()
    # everything but reset(), which assigns every History and Param once more
    i = cpp.find("inline void reset(")
    j = cpp.find("inline int perform(", i)
    perf = cpp[:i] + cpp[j:] if 0 <= i < j else cpp
    rows = []
    for name, k in sorted(gen_assignments(code).items()):
        e = export_assignments(perf, name)
        if e < k:
            rows.append((name, k, e))
    return rows


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("models", nargs="*")
    a = ap.parse_args()
    by = {m["name"]: m for m in MODELS}
    total = 0
    for nm in a.models or list(by):
        rows = check(by[nm])
        total += len(rows)
        if rows:
            print(f"{nm}: " + ", ".join(f"{n} (GenExpr {k}, export {e})" for n, k, e in rows))
    print(f"{total} variable(s) assigned fewer times in the export than in the GenExpr: to read in the export")


if __name__ == "__main__":
    main()
