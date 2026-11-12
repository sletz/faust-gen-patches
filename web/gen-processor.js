// One model of the catalogue in an AudioWorklet: its faust-rs wasm program
// (dsp/<name>.dsp compiled with -double by `make web`), any number of inputs and
// outputs, fed and heard as web/drive.js says, and the page's controls applied to it.
//
// Per block of 128 frames: the drive fills the program's inputs (the source, the
// ramps, clocks and CVs), the program runs, every output is checked finite (a
// non-finite sample clears the program's state, as a host does), the listening puts
// two outputs on the speakers, the output stage applies the master gain and the
// soft clip. The scope and the meters read the two outputs heard, before the
// listening.
//
// Messages from the page (port.postMessage):
//   { type: "control", key, value }       a control of the program, by key ("rate")
//   { type: "source", value } / { type: "level", value }   the audio source, its level (dB)
//   { type: "gen", index, key, value }    a parameter of the generator of input `index`
//   { type: "fire", index }               its button: a pulse, or a restart of the ramp
//   { type: "pair", value: [l, r] }       the outputs heard on the left and right speakers
//   { type: "listen", value }             auto, direct, pitch, amp, clicks
//   { type: "gain", value }               the master gain (linear)
//   { type: "scope", value }              the scope window (s)
//   { type: "dispose" }                   the processor stops and drops its program
// Messages to the page:
//   { type: "ready", inputs, outputs, timer }
//   { type: "stats", load, dspLoad, peak: [l, r], raw: [l, r], resets, nonFinite, sr }   4 times a second
//   { type: "scope", mode: "roll" | "frame", l, r }    min/max pairs, 30 times a second at most
//   { type: "controls", value: [[key, value], ...] }   controls the drive set (random freq)

import { FaustWasmDsp } from "./faust-wasm-dsp.js";
import { MODELS, QUANTUM, Drive, Listener, masterStage, outputRange } from "./drive.js";

const STATS_SECONDS = 0.25;
// performance.now() where the AudioWorkletGlobalScope has it, else Date.now() (1 ms steps:
// the load is then an average over many blocks)
const TIMER = globalThis.performance && performance.now ? "performance.now" : "Date.now";
const now = TIMER === "performance.now" ? () => performance.now() : () => Date.now();
const SCOPE_POINTS = 240;
const SCOPE_PERIOD = 1 / 30;

class GenProcessor extends AudioWorkletProcessor {
  /**
   * @param {Object} options.processorOptions - { id, program: {module, json}, controls: {key: value},
   *   drive: {source, level, gens}, listen: {pair, mode}, gain, scope }
   */
  constructor(options) {
    super();
    const o = options.processorOptions;
    this.spec = MODELS[o.id];
    this.dsp = new FaustWasmDsp(o.program, sampleRate, QUANTUM);
    for (const [k, v] of Object.entries(o.controls || {})) this.dsp.set(k, v);
    this.drive = new Drive(this.spec, sampleRate, o.drive);
    this.listener = new Listener(this.spec, sampleRate, o.listen);
    this.gain = o.gain ?? 0.5;
    this.alive = true;
    this.busy = 0;
    this.busyDsp = 0;
    this.frames = 0;
    this.peak = [0, 0];
    this.raw = [0, 0];
    this.resets = 0;
    this.nonFinite = 0;
    this.setScope(o.scope ?? this.spec.scope);
    this.port.onmessage = (e) => this.message(e.data);
    this.port.postMessage({ type: "ready", inputs: this.dsp.inputs, outputs: this.dsp.outputs, timer: TIMER });
  }

  setScope(window) {
    const total = Math.max(SCOPE_POINTS, Math.round(window * sampleRate));
    this.scope = {
      window,
      mode: window <= 0.2 ? "frame" : "roll",
      bucket: Math.max(1, Math.round(total / SCOPE_POINTS)),
      l: new Float32Array(2 * SCOPE_POINTS), r: new Float32Array(2 * SCOPE_POINTS),
      n: 0, count: 0, armed: true, wait: 0, last: 0,
      mins: [Infinity, Infinity], maxs: [-Infinity, -Infinity],
      since: 0,
    };
  }

  message(m) {
    switch (m.type) {
      case "control": this.dsp.set(m.key, m.value); break;
      case "source": this.drive.setSource(m.value); break;
      case "level": this.drive.setLevel(m.value); break;
      case "gen": this.drive.setGen(m.index, m.key, m.value); break;
      case "fire": this.drive.fire(m.index); break;
      case "pair": this.listener.pair = [...m.value]; break;
      case "listen": this.listener.mode = m.value; break;
      case "gain": this.gain = m.value; break;
      case "scope": this.setScope(m.value); break;
      case "dispose": this.alive = false; this.dsp = null; break;
      default: break;
    }
  }

  process(inputs, outputs) {
    if (!this.alive) return false;
    const t0 = now();
    const out = outputs[0];
    const frames = out[0].length;
    const dsp = this.dsp;
    this.drive.fill(dsp, frames, inputs[0]);
    const tc = now();
    dsp.compute(frames);
    this.busyDsp += now() - tc;
    let bad = 0;
    for (let k = 0; k < dsp.outputs; k += 1) {
      const o = dsp.output(k);
      for (let i = 0; i < frames; i += 1) if (!Number.isFinite(o[i])) bad += 1;
    }
    if (bad) {
      this.nonFinite += bad;
      this.resets += 1;
      dsp.clear();
      for (let k = 0; k < dsp.outputs; k += 1) dsp.output(k).fill(0, 0, frames);
    }
    this.scopeBlock(frames);
    this.listener.process(dsp, frames, out);
    for (let c = 0; c < out.length && c < 2; c += 1) {
      this.peak[c] = Math.max(this.peak[c], masterStage(out[c], frames, this.gain));
    }
    const changes = this.drive.takeChanges();
    if (changes) this.port.postMessage({ type: "controls", value: changes });
    const t1 = now();
    this.busy += t1 - t0;
    this.frames += frames;
    if (this.frames >= STATS_SECONDS * sampleRate) {
      this.port.postMessage({
        type: "stats", load: this.busy / 1000 / (this.frames / sampleRate),
        dspLoad: this.busyDsp / 1000 / (this.frames / sampleRate), peak: this.peak, raw: this.raw,
        resets: this.resets, nonFinite: this.nonFinite, sr: sampleRate,
      });
      this.busy = 0;
      this.busyDsp = 0;
      this.frames = 0;
      this.peak = [0, 0];
      this.raw = [0, 0];
    }
    return true;
  }

  // The two outputs heard, scaled to -1..1 by their range, into min/max buckets: a
  // rolling strip for the long windows, frames that start on an upward zero crossing
  // of the left trace for the short ones.
  scopeBlock(frames) {
    const s = this.scope, dsp = this.dsp, pair = this.listener.pair;
    const xs = [0, 1].map((c) => dsp.output(Math.min(pair[c], dsp.outputs - 1)));
    const sc = [0, 1].map((c) => {
      const k = Math.min(pair[c], dsp.outputs - 1);
      const [lo, hi] = outputRange(this.spec, k, dsp);
      return [lo, hi];
    });
    for (let i = 0; i < frames; i += 1) {
      for (let c = 0; c < 2; c += 1) {
        const a = Math.abs(xs[c][i]);
        if (a > this.raw[c]) this.raw[c] = a;
      }
      if (s.mode === "frame" && s.armed) {
        const v = xs[0][i], mid = 0.5 * (sc[0][0] + sc[0][1]);
        s.wait += 1;
        const crossed = v > mid && s.last <= mid;
        s.last = v;
        if (!crossed && s.wait < 2 * s.bucket * SCOPE_POINTS) continue;
        s.armed = false;
        s.n = 0;
        s.count = 0;
      } else if (s.mode === "frame" && s.n >= SCOPE_POINTS) {
        continue;
      }
      for (let c = 0; c < 2; c += 1) {
        const [lo, hi] = sc[c];
        const y = (2 * (xs[c][i] - lo)) / (hi - lo) - 1;
        if (y < s.mins[c]) s.mins[c] = y;
        if (y > s.maxs[c]) s.maxs[c] = y;
      }
      s.count += 1;
      if (s.count >= s.bucket) {
        const j = 2 * (s.n % SCOPE_POINTS);
        s.l[j] = s.mins[0]; s.l[j + 1] = s.maxs[0];
        s.r[j] = s.mins[1]; s.r[j + 1] = s.maxs[1];
        s.mins = [Infinity, Infinity];
        s.maxs = [-Infinity, -Infinity];
        s.count = 0;
        s.n += 1;
        if (s.mode === "roll") s.pending = (s.pending || 0) + 1;
      }
    }
    s.since += frames;
    if (s.since < SCOPE_PERIOD * sampleRate) return;
    if (s.mode === "frame" && !s.armed && s.n >= SCOPE_POINTS) {
      this.port.postMessage({ type: "scope", mode: "frame", l: s.l.slice(), r: s.r.slice() });
      s.armed = true;
      s.wait = 0;
      s.since = 0;
    } else if (s.mode === "roll" && s.pending) {
      // the last `pending` points, oldest first
      const n = Math.min(s.pending, SCOPE_POINTS);
      const l = new Float32Array(2 * n), r = new Float32Array(2 * n);
      for (let q = 0; q < n; q += 1) {
        const j = 2 * ((s.n - n + q) % SCOPE_POINTS);
        l[2 * q] = s.l[j]; l[2 * q + 1] = s.l[j + 1];
        r[2 * q] = s.r[j]; r[2 * q + 1] = s.r[j + 1];
      }
      this.port.postMessage({ type: "scope", mode: "roll", l, r });
      s.pending = 0;
      s.since = 0;
    }
  }
}

registerProcessor("gen-model", GenProcessor);
