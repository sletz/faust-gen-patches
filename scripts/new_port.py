#!/usr/bin/env python3
"""The skeleton of a new port, from the gen~ export and the gendsp.

    scripts/new_port.py <model>            writes dsp/<model>.dsp and
                                           scripts/models/<model>.py
    scripts/new_port.py <model> --force    overwrites them
    scripts/new_port.py <model> --stdout   prints them instead

Needs ref/gendsp/<model>.gendsp, its export ref/export/<export>.cpp (make
export) and the reference built from it (make build/ref/<export>). What the
skeleton gets right, so that it need not be guessed:

  - the sliders: every Param of the export with gen~'s name, default, min and
    max (`gen_ref --list`); a Param the export bounds to [0, 1] (declared
    without a range) or to a single value (a minimum only) is flagged TODO;
  - the inputs and outputs in gen~'s order, with the gendsp's inlet and
    outlet comments;
  - the noise sites of the export in its file order, each with the line of
    the C++ that calls it, as the extra inputs of `det`, and `process` fed by
    g.noises; `sites` of the model file says one call per frame per site:
    a site in a loop or called twice per frame needs more (gen_ref says so);
  - an mc.gen~ patch (mc_channel, mc_channelcount among the Params): the N
    instances in one program, N a constant, and `mc` in the model file;
  - the header: the gendsp's title, the Params, the quirks to fill in.

The body of the port is the work: write it from the GenExpr, then read the
export for its order of operations (AGENTS.md).
"""
import argparse, json, os, re, subprocess, sys, tempfile, textwrap

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def codeboxes(gendsp):
    out = []

    def walk(p):
        for b in p.get("boxes", []):
            bb = b["box"]
            if "code" in bb:
                out.append(bb["code"])
            if "patcher" in bb:
                walk(bb["patcher"])
    walk(json.load(open(gendsp))["patcher"])
    return out


def io_comments(gendsp):
    """{('in'|'out', n): comment} of the top-level in/out boxes"""
    out = {}
    for b in json.load(open(gendsp))["patcher"]["boxes"]:
        t = b["box"].get("text", "") or ""
        m = re.match(r'(in|out) (\d+)\s*(?:@comment\s+"?([^"]*)"?)?', t)
        if m:
            out[(m[1], int(m[2]))] = (m[3] or "").strip()
    return out


def title(gendsp):
    for c in codeboxes(gendsp):
        m = re.search(r"@title\s+(.+)", c)
        if m:
            return m[1].strip()
    return ""


def gen_list(export):
    exe = os.path.join(ROOT, "build", "ref", export)
    if not os.path.exists(exe):
        sys.exit(f"{os.path.relpath(exe, ROOT)} missing: make {os.path.relpath(exe, ROOT)} (after make export)")
    lines = subprocess.run([exe, "--list"], capture_output=True, text=True, check=True).stdout.splitlines()
    head = dict(kv.split("=") for kv in lines[0].lstrip("# ").split())
    params = []
    for ln in lines[1:]:
        if ln.startswith("#"):
            continue
        name, d, lo, hi = ln.split()
        params.append((name, float(d), None if lo == "-" else float(lo), None if hi == "-" else float(hi)))
    return int(head["inputs"]), int(head["outputs"]), params


def noise_sites(export):
    """the C++ line of every noise() call site, in the export's file order"""
    with tempfile.TemporaryDirectory(prefix="newport-") as tmp:
        dst = os.path.join(tmp, "x.cpp")
        subprocess.run(["python3", os.path.join(ROOT, "scripts", "patch_export.py"),
                        os.path.join(ROOT, "ref", "export", export + ".cpp"), dst], check=True)
        lines = open(dst).read().splitlines()
    sites = {}
    for ln in lines:
        for k in re.findall(r"__gen_noise\((\d+)\)", ln):
            sites.setdefault(int(k), re.sub(r"\s+", " ", ln.strip()))
    return [sites[k] for k in sorted(sites)]


def num(v):
    return repr(int(v)) if float(v).is_integer() else repr(v)


def slider(name, d, lo, hi):
    todo = ""
    if lo is None or hi is None:
        lo, hi, todo = 0.0, 1.0, "  // TODO: no range in the export: gen~'s range from the gendsp or the demo patch"
    elif lo == hi:
        todo = (f"  // TODO: the export bounds it to [{num(lo)}, {num(hi)}] (a minimum only in the gendsp): "
                f"choose a slider range, declare it in the model's slider_ranges")
        hi = lo + 1
    switch = (lo, hi) == (0.0, 1.0) and d in (0.0, 1.0)
    step = 1 if switch else (0.001 if hi - lo <= 10 else 0.01)
    if not switch and not todo and float(lo).is_integer() and float(hi).is_integer() and 1 < hi - lo <= 8 \
            and float(d).is_integer():
        todo = "  // TODO: a menu (step 1)?"
    var = name if name not in ("mix", "clip", "init", "rad", "fad") else name + "_p"
    return f'{var} = hslider("{name}", {num(d)}, {num(lo)}, {num(hi)}, {step});{todo}', var


def skeleton(model):
    export = model.replace("-", "_")
    gendsp = os.path.join(ROOT, "ref", "gendsp", model + ".gendsp")
    if not os.path.exists(gendsp):
        sys.exit(f"{os.path.relpath(gendsp, ROOT)} missing (scripts/sync or a copy from GEN-patches)")
    nin, nout, params = gen_list(export)
    mc = any(p[0] in ("mc_channel", "mc_channelcount") for p in params)
    params = [p for p in params if p[0] not in ("mc_channel", "mc_channelcount")]
    sites = noise_sites(export)
    io = io_comments(gendsp)
    ttl = title(gendsp)
    m = re.match(re.escape(model.upper().replace("_", "-")) + r"\s*\((.*)\)$", ttl.upper().replace("_", "-"))
    if m:
        ttl = ttl[ttl.index("(") + 1:ttl.rindex(")")]
    ttl = ttl or "TODO"

    ins = [f"in{i}" for i in range(1, nin + 1)]
    nz = [f"n{k}" for k in range(len(sites))]
    io_lines = [f"// in{i}: {io.get(('in', i), '')}".rstrip() for i in range(1, nin + 1)]
    io_lines += [f"// out{i}: {io.get(('out', i), '')}".rstrip() for i in range(1, nout + 1)]
    par_doc = ", ".join(f"{n} ({num(lo)}..{num(hi)}, def {num(d)})" if lo is not None and hi is not None
                        else f"{n} (def {num(d)}, no range)" for n, d, lo, hi in params)
    sl = [slider(*p) for p in params]
    L = [f"// {model.upper()}: {ttl} (gen~: gendsp/{model}.gendsp)",
         "//",
         "// TODO: what it computes, in a few sentences (the signal flow of the GenExpr).",
         "//"]
    if mc:
        L += ["// In gen~ the patch runs in mc.gen~, one instance per channel (mc_channel",
              "// among mc_channelcount). This program is the N instances together, one",
              "// output per channel (N below; change it as @chans on mc.gen~).", "//"]
    L += io_lines + ["//"] + textwrap.wrap("Parameters: " + par_doc + ".", 76, initial_indent="// ",
                                            subsequent_indent="// ") + ["//",
                     "// Quirks kept from gen~: TODO (none, or each one: what the code does, what",
                     "// was meant)."]
    if sites:
        L += ["//", "// Noise sites (export order), the inputs after the signal inputs:"]
        L += [f"//   {k}: {s[:100]}" for k, s in enumerate(sites)]
    L += ["", f'declare name "{model}";', 'declare author "Max Bruckert (gen~), Faust port";',
          'declare license "MIT";', "", 'ma = library("maths.lib");', 'g = library("genops.lib");', ""]
    if mc:
        L += ["N = 8;   // the number of channels: mc.gen~'s @chans", ""]
    L += [s for s, _ in sl] + [""]
    fn = re.sub(r"\W", "_", model)
    outs = [f"out{i}" for i in range(1, nout + 1)]
    if mc:
        L += [f"// one instance: channel `ch` (mc_channel, 1-based) of `count` (mc_channelcount)",
              f"{fn}(ch, count, {', '.join(ins + nz)}) = {', '.join(outs)}",
              "with {"] + [f"    {o} = 0;   // TODO" for o in outs] + ["};", "",
              "// every instance takes all the inputs (each its own k inputs: par(c, N, f(c + 1, N)),",
              "// and mc_inputs=k, inputs=N*k in the model file)",
              f"det({', '.join(ins + nz)}) = par(c, N, {fn}(c + 1, N, {', '.join(ins + nz)}));",
              "process = det;" if not sites else
              f"process = ({', '.join(['_'] * nin)}, "
              + ", ".join(f"g.noises({len(sites)}, {k})" for k in range(len(sites))) + ") : det;"]
    else:
        L += [f"{fn}({', '.join(ins + nz)}) = {', '.join(outs)}", "with {"]
        L += [f"    {o} = 0;   // TODO" for o in outs] + ["};", ""]
        if sites:
            L += [f"// the port with its noises as inputs: {', '.join(ins)}, then noise site 0..{len(sites) - 1}",
                  f"det = {fn};",
                  f"process = ({', '.join(['_'] * nin)}, "
                  + ", ".join(f"g.noises({len(sites)}, {k})" for k in range(len(sites))) + ") : det;"]
        else:
            L += ["// no noise() in the patch: det is process", f"process = {fn};", "det = process;"]
    dsp = "\n".join(L) + "\n"

    M = [f"# The settings of {model}: TODO, 4 to 6 that move every Param over its gen~",
         "# range, with scheduled changes (`at`); scripts/iface_check.py lists the Params",
         "# no setting moves. See scripts/models.py for the keys.",
         f'MODEL = dict(name="{model}", export="{export}", inputs={nin}, '
         f"sites={[1] * len(sites)}, input=\"music\","]
    if mc:
        M += ["    mc=8,   # TODO: N of the program; with mc_inputs=k (each instance its own k inputs), inputs=N*k"]
    M += ["    settings=[", '        dict(name="default"),']
    names = [p[0] for p in params]
    if names:
        M += [f"        # TODO: {', '.join(names)}"]
    M += ["    ])"]
    return dsp, "\n".join(M) + "\n"


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("model")
    ap.add_argument("--force", action="store_true")
    ap.add_argument("--stdout", action="store_true")
    a = ap.parse_args()
    dsp, mod = skeleton(a.model)
    targets = [(os.path.join(ROOT, "dsp", a.model + ".dsp"), dsp),
               (os.path.join(ROOT, "scripts", "models", a.model + ".py"), mod)]
    if a.stdout:
        for p, t in targets:
            print(f"==> {os.path.relpath(p, ROOT)}\n{t}")
        return
    for p, _ in targets:
        if os.path.exists(p) and not a.force:
            sys.exit(f"{os.path.relpath(p, ROOT)} exists (--force to overwrite, --stdout to print)")
    for p, t in targets:
        with open(p, "w") as f:
            f.write(t)
        print(f"wrote {os.path.relpath(p, ROOT)}")


if __name__ == "__main__":
    main()
