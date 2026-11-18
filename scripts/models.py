"""The models checked by scripts/test_gen.py: one file per model in scripts/models/,
<name>.py defining MODEL = dict(...).

Each entry: `name` (dsp/<name>.dsp, whose `det` definition is the port with its
noises as extra inputs), `export` (the gen~ export, build/ref/<export>),
`inputs` (gen~ signal inputs), `sites` (per noise() call site of the export,
in file order, the number of calls per frame; the `det` inputs follow the
signal inputs in that order), `input` (the excitation: music, zero, white,
sine:HZ, dc:V, ramp), `settings` (each a `name`, `set` {param: value} given to
both sides with gen~'s parameter names, optional `at` [(frame, param, value)],
`input`, `tol_db`, `skip`, `window`), `frames`, `tol_db` and `note` (why a
tolerance is not the default, or what differs).

An mc.gen~ patch (`mc`: N) is ported as its N instances in one program: the
export is rendered once per channel, with mc_channel = 1..N and
mc_channelcount = N, and its outputs are compared with the program's, channel
by channel. `mc_inputs` (k > 0): each instance takes its own k inputs, the
program's inputs (c-1)*k..c*k-1; 0 (default): every instance takes all of
them, `inputs` being then the export's.

Parameters declared without min/max in the gendsp (`Param smooth(100);`) are
clamped to [0, 1] by the export's setparameter (gen~ inside Max does not clamp
them): the settings leave them at their defaults, which are not clamped.
"""

import glob, importlib.util, os

DEFAULT_TOL_DB = -180

def _load():
    out = []
    for p in sorted(glob.glob(os.path.join(os.path.dirname(os.path.abspath(__file__)), "models", "*.py"))):
        spec = importlib.util.spec_from_file_location("model_" + os.path.basename(p)[:-3].replace("-", "_"), p)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        out.append(mod.MODEL)
    return out

MODELS = _load()
