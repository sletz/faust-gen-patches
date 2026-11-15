// The wasm programs of the web page (web/dsp/<name>.wasm, faust-rs -lang wasm -double)
// under node, through the page's own loader (web/faust-wasm-dsp.js) and its own drive
// (web/drive.js: the inputs, the listening, the output stage), as the AudioWorklet
// runs them: blocks of 128 frames, the default controls and inputs of every model.
//
//   node scripts/web_check.mjs [--sr 48000] [--seconds 1] [model ...]
//
// One line per model: the instantiation time, every output finite or not, the
// peak of each program output, the RMS and peak of the two speaker channels
// (after the listening and the output stage, master gain 0 dB), the speed against
// real time. Fails (exit 1) on a non-finite output, a silent speaker pair
// (peak below 1e-3), or a peak above 0 dBFS at the speakers.
//
// Then the block diagrams of the page (web/svg/<name>.json.gz, scripts/web_svg.py), as
// its viewer (web/diagram.js) reads them: every pack inflates to a JSON object with
// process.svg, every file is an <svg> with a viewBox, every link names a file of the
// pack. Fails on any of these.
import { readFileSync } from "node:fs";
import { gunzipSync } from "node:zlib";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { FaustWasmDsp } from "../web/faust-wasm-dsp.js";
import { MODELS, QUANTUM, Drive, Listener, masterStage } from "../web/drive.js";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const args = process.argv.slice(2);
let sr = 48000, seconds = 1;
const only = [];
for (let i = 0; i < args.length; i += 1) {
  if (args[i] === "--sr") sr = Number(args[++i]);
  else if (args[i] === "--seconds") seconds = Number(args[++i]);
  else only.push(args[i]);
}
const db = (x) => (x > 0 ? (20 * Math.log10(x)).toFixed(1) : "-inf").padStart(6);
let failures = 0;

for (const [id, spec] of Object.entries(MODELS)) {
  if (only.length && !only.includes(id) && !only.includes(spec.dsp)) continue;
  const base = join(root, "web", "dsp", spec.dsp);
  let line = id.padEnd(22);
  try {
    const compiled = {
      module: new WebAssembly.Module(readFileSync(base + ".wasm")),
      json: JSON.parse(readFileSync(base + ".json", "utf8")),
    };
    const t0 = performance.now();
    const dsp = new FaustWasmDsp(compiled, sr, QUANTUM);
    const tInit = performance.now() - t0;
    if (dsp.inputs !== spec.inputs.length || dsp.outputs !== spec.outputs.length) {
      throw new Error(`the program has ${dsp.inputs} in / ${dsp.outputs} out, web/drive.js says ${spec.inputs.length} / ${spec.outputs.length}`);
    }
    const drive = new Drive(spec, sr);
    const listener = new Listener(spec, sr);
    const total = Math.round(seconds * sr);
    const outs = [new Float64Array(QUANTUM), new Float64Array(QUANTUM)];
    const rawPeak = new Float64Array(dsp.outputs);
    const spk = [0, 0], sq = [0, 0];
    let nonFinite = 0, busy = 0;
    for (let p = 0; p < total; p += QUANTUM) {
      const n = Math.min(QUANTUM, total - p);
      const t1 = performance.now();
      drive.fill(dsp, n, null);
      dsp.compute(n);
      busy += performance.now() - t1;
      for (let k = 0; k < dsp.outputs; k += 1) {
        const o = dsp.output(k);
        for (let i = 0; i < n; i += 1) {
          const v = o[i];
          if (!Number.isFinite(v)) nonFinite += 1;
          else if (Math.abs(v) > rawPeak[k]) rawPeak[k] = Math.abs(v);
        }
      }
      listener.process(dsp, n, outs);
      for (let c = 0; c < 2; c += 1) {
        spk[c] = Math.max(spk[c], masterStage(outs[c], n, 1));
        for (let i = 0; i < n; i += 1) sq[c] += outs[c][i] * outs[c][i];
      }
    }
    const rms = sq.map((s) => Math.sqrt(s / total));
    const peaks = Array.from(rawPeak).map((v) => v.toPrecision(3));
    const silent = Math.max(spk[0], spk[1]) < 1e-3;
    const over = Math.max(spk[0], spk[1]) >= 1;
    const ok = !nonFinite && !silent && !over;
    if (!ok) failures += 1;
    line += `${ok ? "ok  " : "FAIL"} init ${tInit.toFixed(1).padStart(5)} ms  ${nonFinite ? `${nonFinite} non-finite` : "finite"}`
      + `  speakers rms ${db(rms[0])} ${db(rms[1])} dBFS, peak ${db(spk[0])} ${db(spk[1])}`
      + `  ${(seconds / (busy / 1000)).toFixed(0).padStart(5)}x RT  out peaks [${peaks.length > 6 ? peaks.slice(0, 6).join(" ") + " ..." : peaks.join(" ")}]`
      + (silent ? "  SILENT" : "") + (over ? "  OVER 0 dBFS" : "");
  } catch (e) {
    failures += 1;
    line += `FAIL ${e.message}`;
  }
  console.log(line);
}
console.log(`${failures ? `${failures} failure(s)` : "every model renders finite, non-silent output"} (${seconds} s at ${sr} Hz, node ${process.version})`);

let diagrams = 0, links = 0, packs = 0, svgFailures = 0;
for (const [id, spec] of Object.entries(MODELS)) {
  if (only.length && !only.includes(id) && !only.includes(spec.dsp)) continue;
  try {
    const files = JSON.parse(gunzipSync(readFileSync(join(root, "web", "svg", spec.dsp + ".json.gz"))).toString("utf8"));
    if (!("process.svg" in files)) throw new Error("no process.svg");
    for (const [name, text] of Object.entries(files)) {
      if (!/^<svg [^>]*viewBox="[-\d. ]+"/.test(text)) throw new Error(`${name} does not start with an <svg> that has a viewBox`);
      for (const [, target] of text.matchAll(/xlink:href="([^"]+)"/g)) {
        if (!(target in files)) throw new Error(`${name} links to ${target}, which is not in the pack`);
        links += 1;
      }
      diagrams += 1;
    }
    packs += 1;
  } catch (e) {
    svgFailures += 1;
    console.log(`${id.padEnd(22)}FAIL diagrams: ${e.message}`);
  }
}
console.log(`${svgFailures ? `${svgFailures} diagram pack(s) fail` : "every diagram pack is complete"} (${packs} packs, ${diagrams} diagrams, ${links} links)`);
process.exit(failures || svgFailures ? 1 : 0);
