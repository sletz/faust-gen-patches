# AGENTS.md

Guidance for AI coding agents working in this repository.

## What this is

The 35 `gen~` patches of Max Bruckert's GEN-patches (Max/MSP, commit `5d0a432`) ported to Faust, one program per `.gendsp`, each checked sample by sample against the C++ that Max 9.2.1 itself exports from the original patch. The reference is gen~, not a reading of the patch: a port is right when it renders what the export renders, quirks included. The README ([README.md](README.md), [README.fr.md](README.fr.md)) is the full account; this file is what you need to change things without breaking that claim.

## Layout

- `dsp/` — the ports. Each `<model>.dsp` defines two things:
  - `det`: the port with its noises as **extra inputs**, after the signal inputs, one per `noise()` call of the export, in the export's file order (a site called twice per frame takes two). The test renders `det`.
  - `process = (signal inputs, g.noises(K, k)...) : det;` — the playable program, fed by independent Faust noise generators.
  - `genops.lib` is genlib in Faust (`wrap`, `fold`, `phasor`, `cycle`, `dcblock`, `sah`, `slide`, `safediv`, `divsr`, `tdiv`, `keep`, the `Delay` readers that reproduce genlib's ring arithmetic, `noises`…). `butterworth.lib` is shared by the two Butterworth filters.
  - The three mc.gen~ patches (adm_panner, fdn_multireverb, spatial-dbap: one gen~ instance per channel, `mc_channel`/`mc_channelcount`) are ported as their N instances in one program, N a constant at the top of the program; their model files say `mc=N` (and `mc_inputs`), and the test renders the export once per channel.
- `ref/` — the reference: `gendsp/` (the original patches, unchanged, GEN-patches commit `a0f2311`), `export/` (the C++ Max exported, with genlib in `gen_dsp/`), `gen_ref.cpp` (the offline renderer of an export: parameters, scheduled changes, noise streams, external buffers), `buffers/` (delays-delays' tap table).
- `scripts/` — `test_gen.py` (the comparison), `models.py` and `models/<model>.py` (one `MODEL = dict(...)` per model: export name, inputs, noise sites, excitation, settings, tolerance; `models.py`'s docstring documents every key), `patch_export.py` (makes an export deterministic), `export_gen.py` (drives Max), `bench_cpu.py`, `web_*.py`, `web_check.mjs`.
- `max/` — the GEN-patches demo patchers with `faustgen~` in place of `gen~`, written by `max/convert_patches.py` (py2max). A `mc.gen~` becomes `mc.faustgen~` running a program with one input/output per channel. The model to follow when changing the converter is the Faust distribution's `architecture/max-msp/max2faustgen.py` (`/Users/letz/faust/architecture/max-msp`, which also holds its py2max checkout): `faustgen~`/`mc.faustgen~` boxes that keep the id, geometry and cords, and py2max's two saving behaviours switched off (filling in `numinlets`/`numoutlets` on boxes saved without them, rewriting the `outlettype` of subpatcher boxes), so that boxes the conversion does not touch are written back as they were read.
- `web/` — the catalogue page, every model in WebAssembly. `web/dsp/` (wasm + JSON) and `web/svg/` (packed block diagrams) are **generated and committed**: GitHub Pages (`.github/workflows/pages.yml`) compiles nothing.
- `results/` — `results.md`/`results.json` (written by `make test`), `cpu.md`/`cpu.json` (by `make cost`), screenshots.
- `tools/` — the CPU-cost harnesses. `build/` — gitignored build output (references, test renders, logs).

## External requirements

- A faust-rs checkout next to this one (`FAUST_RS=...` otherwise) with a release `faustprobe` (`cargo build --release -p cranelift-ffi --bin faustprobe`), and a release `faust-rs` (`cargo build --release -p compiler --bin faust-rs`) for the web page. The test renders the ports with faustprobe in double precision.
- The C++ Faust compiler (`faust`) for `make check`; python3 with numpy; a C++17 compiler; node for `make web-check`.
- Max 9 only for `make export` (it opens Max); py2max and the GEN-patches checkout (`PY2MAX`, `GEN_PATCHES`) only for `make max`.

## Build and check

```sh
make test       # every port against its export: results/results.md (~40 s)
make quick      # same, shorter renders: the inner loop while porting
python3 scripts/test_gen.py sature-delay ufo   # some models only
make check      # every program compiles: faustprobe and the C++ Faust compiler
make max-check  # the sources embedded in max/*.maxpat against dsp/, sample for sample
make web        # web/dsp, web/svg, web/models-data.js (make -B web after a faust-rs change)
make web-check  # every wasm program under node with the page's inputs; every diagram pack
make cost       # CPU cost (minutes, idle machine): results/cpu.md
```

After touching a port or a `.lib` in `dsp/`: `make test` (or the model's own run), `make check`, then `make max` + `make max-check` and `make web` + `make web-check`, and commit the regenerated `max/`, `web/dsp/`, `web/svg/` with the port, or the patchers and the published page fall out of step with `dsp/`. `make test` rewrites `results/`; commit it when the numbers change, and update the README tables (both languages) if a worst error or the bit-exact count moves.

## Invariants

- **The tolerance is −180 dB of each output's peak**, for every setting (`DEFAULT_TOL_DB` in `scripts/models.py`). Every port is at −191 dB or better. Do not loosen it to make a port pass: a 6e-7 error in an interpolation coefficient already reaches −148 dB. A per-model `tol_db` needs a `note` saying why.
- **Reproduce the export, including its bugs.** Quirks of the patches (§8 of the README) stay in the port and are documented in the program's header comment, never fixed silently. A port that "corrects" a patch is wrong by this repository's definition.
- **Each program keeps gen~'s interface**: parameter names as slider labels, gen~'s defaults, the inputs and outputs in gen~'s order. Ranges are gen~'s, except where the gendsp declares none and the export clamps to [0, 1]: there the sliders take the demo patch's range, and the test stays within [0, 1].
- **Each program opens with a header comment**: what it computes, its inputs/outputs and parameters, and the quirks kept from gen~. Keep it in step with the code.
- **Order of operations matters to the last bit.** The Faust normalizer rewrites `x / ma.SR` as a product, factors `a*x + b*x`, folds constants. Where that breaks agreement, use `g.divsr(x)` (a true division by the sample rate), `g.tdiv(n, d)` (a true division by a positive `d` that changes with the controls only) and `g.keep(x)` (an identity the normalizer does not see through), as lorenz-rossler-chaos, zdf-diode-ladder and most of the newer ports do. The `Delay` readers and interpolators of genops.lib already hold their intermediates with `keep`: use them rather than a local copy.
- **Faust traps seen while porting**: `-(x)` is the partial application `_ - x`, not a negation; a call with one argument too few is silently a partial application; `no.noise` used twice is the same noise (take independent streams with `g.noises(K, k)`); gen~'s `if` becomes `select2` on every value it updates; a `History` read after its write in the frame gives the new value; a C `&&` short-circuits.
- **Every program must also** compile with the C++ Faust compiler, stay finite in single precision, and give the same samples at any block size (faustprobe `--check block=1,7 --check reset`).
- **Do not edit `ref/gendsp/` or `ref/export/`**: they are the originals. Determinism is added by `scripts/patch_export.py` into `build/ref/`, never by hand in the exports. Re-exporting (`make export`) needs Max and changes the reference itself: only on request.
- The exported C++ in `ref/export/` is Cycling '74's (their export license or GPLv3); the Faust programs and scripts are MIT. Do not copy exported code into `dsp/`.

## Documentation and commits

- The README exists in English and French (`README.md`, `README.fr.md`); change both together.
- Commit only when asked; nothing is pushed unless asked (a push to `main` that touches `web/`, `dsp/`, `max/`, `ref/gendsp/` or `results/` republishes the page).
- Commit messages: a one-line summary (`web: ...` for the page), a body that says what changed and what was measured, and, when the change depends on a faust-rs fix, the faust-rs commit it needs.

## Related repositories

- [faust-rs](https://github.com/grame-cncm/faust-rs) (`../faust-rs`): faustprobe and the wasm compiler. A Faust-side bug found here (normalizer, diagrams, wasm) is fixed there, and the regenerated outputs here say which faust-rs commit they need.
- GEN-patches (`../GEN-patches`): the original library and its demo patchers, source of `ref/gendsp/`, `max/` and the web catalogue's data.
