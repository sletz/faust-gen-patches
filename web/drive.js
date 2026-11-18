// How every model of the page is driven and listened to: the signals fed to its
// inputs, how its outputs reach the two loudspeakers, and the output stage.
// Shared by the AudioWorklet (gen-processor.js), the page (app.js) and the node
// check (scripts/web_check.mjs), so that the check renders what the page plays.
//
// Inputs, one generator per input of the program:
//   audio  a channel of the model's source: the built-in test loop, pink or white
//          noise, a sine, silence, or the node's input (an audio file, the microphone)
//   ramp   a 0..1 ramp at `rate` Hz (a phasor); its button restarts it, which is a
//          downward jump like a wrap
//   clock  one-sample pulses of `amp`, every 1/rate s when `auto` is on, and on the button
//   cv     value + depth * sin(2 pi rate t): a frequency, a CV, a modulation
//   zero   0
// Outputs: each has a range (for the scope and the listening modes) and a default
// way to be heard:
//   direct  the signal itself (audio outputs)
//   pitch   the frequency of a test tone, 110 Hz to 1760 Hz across the range
//   amp     the amplitude of a 330 Hz test tone, 0 to 1 across the range
//   clicks  a short blip at every upward crossing of the middle of the range
// The output stage multiplies by the master gain and soft-clips: |y| < 1 always.

export const QUANTUM = 128;

// ------------------------------------------------------------------ helpers

/** A xorshift32 generator: uniform in [-1, 1), reproducible from its seed. */
class Rng {
  constructor(seed) { this.s = seed >>> 0 || 1; }
  next() {
    let x = this.s;
    x ^= x << 13; x ^= x >>> 17; x ^= x << 5;
    this.s = x >>> 0;
    return this.s / 2147483648 - 1;
  }
}

/** The polyBLEP correction of a saw at phase p (0..1), increment dt. */
function blep(p, dt) {
  if (p < dt) { const t = p / dt; return t + t - t * t - 1; }
  if (p > 1 - dt) { const t = (p - 1) / dt; return t * t + t + t + 1; }
  return 0;
}

const dbToGain = (db) => 10 ** (db / 20);
const clamp01 = (x) => (x < 0 ? 0 : x > 1 ? 1 : x);

// ------------------------------------------------------------------ the source

export const SOURCES = [
  ["loop", "test loop"],
  ["pink", "pink noise"],
  ["white", "white noise"],
  ["sine", "sine 220 Hz"],
  ["file", "audio file"],
  ["mic", "microphone"],
  ["silence", "silence"],
];

/**
 * The audio source of a model: stereo, synthesised here, or read from the node's input
 * ("file" and "mic": the page connects the file player or the microphone to it).
 *
 * The test loop lasts 4 s: for 2.4 s a saw chord re-attacked every half second
 * (110, 164.81, 220 Hz, slightly detuned between the channels, its root moving through
 * five steps), 20 ms noise bursts every 250 ms and clicks every 200 ms; then 1.6 s of
 * silence, in which the tails of the reverbs and delays are heard.
 */
export class Source {
  constructor(sr, kind = "loop", levelDb = 0) {
    this.sr = sr;
    this.kind = kind;
    this.gain = dbToGain(levelDb);
    this.n = 0;
    this.rng = new Rng(12345);
    this.pink = [new Float64Array(3), new Float64Array(3)];
    this.saw = [new Float64Array(3), new Float64Array(3)];
    this.sine = 0;
    this.L = new Float64Array(QUANTUM);
    this.R = new Float64Array(QUANTUM);
  }

  set(kind) { this.kind = kind; }
  setLevel(db) { this.gain = dbToGain(db); }

  fill(frames, ext) {
    const { L, R, sr, gain } = this;
    const k = this.kind;
    if (k === "file" || k === "mic") {
      const a = ext && ext[0], b = ext && (ext[1] || ext[0]);
      for (let i = 0; i < frames; i += 1) {
        L[i] = a ? a[i] * gain : 0;
        R[i] = b ? b[i] * gain : 0;
      }
      return;
    }
    if (k === "silence") { L.fill(0, 0, frames); R.fill(0, 0, frames); return; }
    for (let i = 0; i < frames; i += 1, this.n += 1) {
      let l = 0, r = 0;
      if (k === "loop") [l, r] = this.loop(this.n);
      else if (k === "white") { l = 0.3 * this.rng.next(); r = 0.3 * this.rng.next(); }
      else if (k === "pink") { l = this.pinkStep(0); r = this.pinkStep(1); }
      else if (k === "sine") {
        this.sine += 220 / sr;
        if (this.sine >= 1) this.sine -= 1;
        l = r = 0.4 * Math.sin(2 * Math.PI * this.sine);
      }
      L[i] = l * gain;
      R[i] = r * gain;
    }
  }

  pinkStep(c) {
    // Paul Kellet's economy pink filter on white noise.
    const b = this.pink[c], w = this.rng.next();
    b[0] = 0.99765 * b[0] + w * 0.0990460;
    b[1] = 0.96300 * b[1] + w * 0.2965164;
    b[2] = 0.57000 * b[2] + w * 1.0526913;
    return 0.11 * (b[0] + b[1] + b[2] + w * 0.1848);
  }

  loop(n) {
    const sr = this.sr;
    const t = (n % Math.round(4 * sr)) / sr;
    if (t >= 2.4) {
      // keep the oscillators running, silent
      return [0, 0];
    }
    const step = Math.floor(t / 0.5);
    const root = [1, 1.18921, 0.890899, 1.33484, 1][step];
    const env = 0.25 * Math.exp(-3 * (t % 0.5));
    const burst = (t % 0.25) < 0.02 ? 0.5 * this.rng.next() : 0;
    const out = [0, 0];
    const clickPeriod = Math.round(0.2 * sr), clickAt = Math.round(0.1 * sr);
    for (let c = 0; c < 2; c += 1) {
      const fs = [110 * (1 + 0.003 * c), 164.81, 220 * (1 - 0.002 * c)];
      let x = 0;
      for (let v = 0; v < 3; v += 1) {
        const dt = (fs[v] * root) / sr;
        let p = this.saw[c][v] + dt;
        if (p >= 1) p -= 1;
        this.saw[c][v] = p;
        x += 2 * p - 1 - blep(p, dt);
      }
      x = x * env + burst;
      if (n % clickPeriod === clickAt + 7 * c) x += 0.9;
      out[c] = x;
    }
    return out;
  }
}

// ------------------------------------------------------------------ input generators

/** The default parameters of an input generator, from its spec. */
export function genDefaults(inp) {
  if (inp.kind === "ramp") return { rate: inp.rate };
  if (inp.kind === "clock") {
    return { rate: inp.rate, auto: inp.auto ? 1 : 0, amp: inp.amp ?? 1, burst: inp.burst ?? 0, rand: inp.rand ? 1 : 0 };
  }
  if (inp.kind === "cv") return { value: inp.value, depth: inp.depth ?? 0, rate: inp.rate ?? 1 };
  return {};
}

class Gen {
  constructor(inp, sr, params) {
    this.inp = inp;
    this.sr = sr;
    this.p = { ...genDefaults(inp), ...(params || {}) };
    this.phase = inp.kind === "ramp" ? 1e-9 : 0;
    this.count = 0;      // clock: samples since the last pulse
    this.fired = false;  // clock: a pulse requested by the button
    this.first = true;
    this.left = 0;       // clock: samples left in the noise burst
    this.env = 0;        // clock: the burst's envelope
    this.rng = new Rng(777);
    this.pink = new Float64Array(3);
    this.changes = null; // clock with `randomize`: controls set at the last pulses
  }
  set(key, value) { this.p[key] = value; }
  pinkStep() {
    const b = this.pink, w = this.rng.next();
    b[0] = 0.99765 * b[0] + w * 0.0990460;
    b[1] = 0.96300 * b[1] + w * 0.2965164;
    b[2] = 0.57000 * b[2] + w * 1.0526913;
    return 0.3 * (b[0] + b[1] + b[2] + w * 0.1848);
  }
  // a new random value of the control `randomize.key` (log-uniform in [min, max])
  randomize() {
    const { key, min, max } = this.inp.randomize;
    const u = 0.5 * (this.rng.next() + 1);
    const v = Math.round(min * (max / min) ** u * 100) / 100;
    this.dsp.set(key, v);
    (this.changes ||= []).push([key, v]);
  }
  fire() {
    if (this.inp.kind === "clock") this.fired = true;
    // a restart of the ramp: a downward jump (a trigger for the models that look for one)
    else if (this.inp.kind === "ramp") this.phase = 1e-9;
  }
  fill(buf, frames, src) {
    const { p, sr } = this;
    switch (this.inp.kind) {
      case "audio": {
        const s = this.inp.ch === 1 ? src.R : src.L;
        for (let i = 0; i < frames; i += 1) buf[i] = s[i];
        break;
      }
      case "ramp": {
        const inc = p.rate / sr;
        for (let i = 0; i < frames; i += 1) {
          buf[i] = this.phase;
          this.phase += inc;
          if (this.phase >= 1) this.phase -= 1;
        }
        break;
      }
      case "clock": {
        // a one-sample pulse of amp, or with `burst` > 0 a pink noise burst of amp,
        // `burst` ms long, then a 10 ms release (the demo patch of waveguide-string)
        const period = Math.max(1, Math.round(sr / Math.max(1e-3, p.rate)));
        const rel = Math.exp(-1 / (0.01 * sr));
        for (let i = 0; i < frames; i += 1) {
          let pulse = false;
          if (this.fired) { pulse = true; this.fired = false; this.count = 0; }
          else if (p.auto && (this.first || this.count >= period)) { pulse = true; this.count = 0; }
          this.first = false;
          this.count += 1;
          if (pulse) {
            this.left = Math.round((p.burst * sr) / 1000);
            this.env = 1;
            if (p.rand && this.inp.randomize && this.dsp) this.randomize();
          }
          if (p.burst > 0) {
            if (this.left > 0) this.left -= 1;
            else this.env *= rel;
            buf[i] = p.amp * this.env * this.pinkStep();
          } else {
            buf[i] = pulse ? p.amp : 0;
          }
        }
        break;
      }
      case "cv": {
        const w = (2 * Math.PI * p.rate) / sr;
        for (let i = 0; i < frames; i += 1) {
          buf[i] = p.value + (p.depth ? p.depth * Math.sin(this.phase) : 0);
          this.phase += w;
          if (this.phase > 2 * Math.PI) this.phase -= 2 * Math.PI;
        }
        break;
      }
      default:
        buf.fill(0, 0, frames);
    }
  }
}

/**
 * The inputs of one model: its source and one generator per program input.
 * `state` = { source, level, gens: [params per input] } (all optional).
 */
export class Drive {
  constructor(spec, sr, state = {}) {
    this.spec = spec;
    this.source = new Source(sr, state.source || spec.source || "loop", state.level ?? 0);
    this.gens = spec.inputs.map((inp, i) => new Gen(inp, sr, state.gens && state.gens[i]));
  }
  setSource(kind) { this.source.set(kind); }
  setLevel(db) { this.source.setLevel(db); }
  setGen(i, key, value) { this.gens[i]?.set(key, value); }
  /** The controls the generators set since the last call ([key, value] pairs), or null. */
  takeChanges() {
    let out = null;
    for (const g of this.gens) if (g.changes) { (out ||= []).push(...g.changes); g.changes = null; }
    return out;
  }
  fire(i) { this.gens[i]?.fire(); }
  /** Fills the input buffers of `dsp` (a FaustWasmDsp) for `frames` frames. */
  fill(dsp, frames, ext) {
    for (const g of this.gens) g.dsp = dsp;
    if (this.spec.inputs.some((inp) => inp.kind === "audio")) this.source.fill(frames, ext);
    for (let i = 0; i < dsp.inputs; i += 1) this.gens[i].fill(dsp.input(i), frames, this.source);
  }
}

// ------------------------------------------------------------------ listening

export const LISTEN_MODES = [
  ["auto", "auto"],
  ["direct", "direct"],
  ["pitch", "tone pitch"],
  ["amp", "tone amplitude"],
  ["clicks", "clicks"],
];

/** The range [lo, hi] of output k, a control key in `hi` read from the DSP. */
export function outputRange(spec, k, dsp) {
  const o = spec.outputs[k];
  let [lo, hi] = o.range || [-1, 1];
  if (typeof hi === "string") hi = (dsp && dsp.get(hi)) ?? 1;
  if (typeof lo === "string") lo = (dsp && dsp.get(lo)) ?? 0;
  if (hi === lo) hi = lo + 1;
  return [lo, hi];
}

/**
 * The two loudspeaker channels from the outputs of the program: output pair[c] on
 * channel c, heard as its default mode, or as `mode` when it is not "auto".
 */
export class Listener {
  constructor(spec, sr, state = {}) {
    this.spec = spec;
    this.sr = sr;
    this.pair = state.pair ? [...state.pair] : [...spec.pair];
    this.mode = state.mode || "auto";
    this.ch = [0, 1].map(() => ({ phase: 0, env: 0, last: 0, amp: 0 }));
    this.smooth = 1 - Math.exp(-1 / (0.002 * sr));
    this.decay = Math.exp(-1 / (0.015 * sr));
  }
  modeOf(c) {
    return this.mode === "auto" ? this.spec.outputs[this.pair[c]].listen : this.mode;
  }
  /** Writes channel c of the listening into `dst` (Float32Array or Float64Array). */
  process(dsp, frames, outs) {
    for (let c = 0; c < 2; c += 1) {
      const k = Math.min(this.pair[c], dsp.outputs - 1);
      const x = dsp.output(k), dst = outs[c];
      if (!dst) continue;
      const mode = this.modeOf(c);
      const st = this.ch[c];
      const [lo, hi] = outputRange(this.spec, k, dsp);
      const span = hi - lo;
      if (mode === "direct") {
        for (let i = 0; i < frames; i += 1) dst[i] = x[i];
      } else if (mode === "pitch") {
        for (let i = 0; i < frames; i += 1) {
          const u = clamp01((x[i] - lo) / span);
          st.phase += (110 * 2 ** (4 * u)) / this.sr;
          if (st.phase >= 1) st.phase -= 1;
          const a = 2 * Math.PI * st.phase;
          dst[i] = 0.3 * Math.sin(a) + 0.08 * Math.sin(2 * a) + 0.04 * Math.sin(3 * a);
        }
      } else if (mode === "amp") {
        for (let i = 0; i < frames; i += 1) {
          st.amp += this.smooth * (clamp01((x[i] - lo) / span) - st.amp);
          st.phase += 330 / this.sr;
          if (st.phase >= 1) st.phase -= 1;
          const a = 2 * Math.PI * st.phase;
          dst[i] = st.amp * (0.35 * Math.sin(a) + 0.08 * Math.sin(3 * a));
        }
      } else {
        // clicks: a 15 ms blip at each upward crossing of the middle of the range
        const mid = lo + 0.5 * span, f = c === 0 ? 1500 : 1100;
        for (let i = 0; i < frames; i += 1) {
          const v = x[i];
          if (v > mid && st.last <= mid) { st.env = 1; st.phase = 0; }
          st.last = v;
          st.phase += f / this.sr;
          if (st.phase >= 1) st.phase -= 1;
          dst[i] = 0.5 * st.env * Math.sin(2 * Math.PI * st.phase);
          st.env *= this.decay;
        }
      }
    }
  }
}

/**
 * The output stage: gain, then a soft clip that leaves |y| <= 0.8 untouched and
 * bends the rest towards 0.99 (tanh): never above -0.09 dBFS. Non-finite samples
 * become 0. Returns the peak written.
 */
export function masterStage(buf, frames, gain) {
  const T = 0.8, room = 0.99 - T;
  let peak = 0;
  for (let i = 0; i < frames; i += 1) {
    let v = buf[i] * gain;
    if (!Number.isFinite(v)) v = 0;
    const a = Math.abs(v);
    if (a > T) v = Math.sign(v) * (T + room * Math.tanh((a - T) / room));
    buf[i] = v;
    if (Math.abs(v) > peak) peak = Math.abs(v);
  }
  return peak;
}

// ------------------------------------------------------------------ the models

const A = (n, ch, what = ch ? "audio R" : "audio L") => ({ label: `in${n}: ${what}`, kind: "audio", ch });
const Z = (n, what) => ({ label: `in${n}: ${what}`, kind: "zero" });
const audioOut = (n, what) => ({ label: `out${n}: ${what}`, range: [-1, 1], listen: "direct", audio: true });
const cvOut = (n, what, range, listen = "pitch") => ({ label: `out${n}: ${what}`, range, listen });
const pulseOut = (n, what, range = [0, 1]) => ({ label: `out${n}: ${what}`, range, listen: "clicks", pulse: true });
const stereoFx = (note) => ({
  source: "loop", inputs: [A(1, 0), A(2, 1)], outputs: [audioOut(1, "audio L"), audioOut(2, "audio R")],
  pair: [0, 1], scope: 0.05, note,
});
const FX_NOTE = "The source plays through the effect; its two outputs go to the left and right speakers.";
const ufoFreq = (n) => ({ label: `in${n}: frequency (Hz)`, kind: "cv", value: 2, range: [0.05, 40], unit: "Hz", log: true,
  depth: 0, depthRange: [0, 10], rate: 0.2, rateRange: [0.01, 5] });
const ufoTrig = (n) => ({ label: `in${n}: trigger`, kind: "clock", button: "Trigger", rate: 0.5, rateRange: [0.05, 10], auto: false, amp: 1 });
const LFO_NOTE = "The LFO output is heard as the pitch of a test tone (110 Hz to 1760 Hz across -1..1); "
  + "choose 'tone amplitude' to hear it as a tremolo, 'direct' for the raw signal. The scope shows it over 4 s.";

/**
 * The models, by the id of the catalogue card. `dsp` is the program (dsp/<dsp>.dsp),
 * `inputs` one generator per program input, `outputs` one entry per program output,
 * `pair` the outputs heard on the left and right speakers, `scope` the scope's
 * default window (s), `note` what the Play drawer says is happening.
 */
export const MODELS = {
  "adm-panner": {
    dsp: "adm_panner", source: "loop",
    inputs: [A(1, 0, "audio"),
      { label: "in2: X (-1..1)", kind: "cv", value: 0, range: [-1, 1], depth: 0.9, depthRange: [0, 1], rate: 0.1, rateRange: [0.01, 5] },
      { label: "in3: Y (-1..1)", kind: "cv", value: 0, range: [-1, 1], depth: 0.5, depthRange: [0, 1], rate: 0.23, rateRange: [0.01, 5] }],
    outputs: Array.from({ length: 8 }, (_, i) => audioOut(i + 1, `loudspeaker ${i + 1}`)),
    pair: [0, 1], scope: 0.05,
    note: "The program is the mc.gen~ patch for 8 loudspeakers (8 outputs). Two slow LFOs move the source (X, Y); "
      + "loudspeakers 1 and 2 are on the speakers: choose another pair to follow it around the circle.",
  },
  "aether-drift": { dsp: "aether-drift", ...stereoFx(FX_NOTE) },
  "aether-particle": { dsp: "aether-particle", ...stereoFx(FX_NOTE + " The grains read the input recorded 2 s earlier (g_pos 10 % of a 20 s buffer).") },
  "bernoulli-gate": {
    dsp: "bernoulli-gate", source: "silence",
    inputs: [{ label: "in1: trigger / clock", kind: "ramp", button: "Trigger", rate: 4, rateRange: [0.1, 50], log: true }],
    outputs: [pulseOut(1, "pulse A"), pulseOut(2, "pulse B"), cvOut(3, "latched state (0 = A, 1 = B)", [0, 1], "amp")],
    pair: [0, 1], scope: 4,
    note: "A 0..1 ramp at 4 Hz drives in1: each wrap is a trigger (trigmode external; the patch uses a 5 Hz cycle~). "
      + "Pulse A clicks on the left, pulse B on the right; out3 is the latched outcome.",
  },
  "cswitch-tremolo": {
    dsp: "cswitch-tremolo", source: "pink",
    inputs: [A(1, 0), A(2, 1)],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R"), pulseOut(3, "grain start impulse"), cvOut(4, "trapezoidal envelope", [0, 1], "amp")],
    pair: [0, 1], scope: 1,
    note: "Pink noise goes through the chopper, as in the demo patch (mc.pink~). out3 and out4, the grain impulses and the envelope, can be chosen for the speakers.",
  },
  "curvature-shaper": {
    dsp: "curvature-shaper", source: "silence",
    inputs: [{ label: "in1: phase / ramp (0..1)", kind: "ramp", button: "Restart", rate: 1, rateRange: [0.05, 20], log: true },
      { label: "in2: shape modulation", kind: "cv", value: 0, range: [-1, 1], depth: 0, depthRange: [0, 1], rate: 0.2, rateRange: [0.01, 10] }],
    outputs: [cvOut(1, "mix(a, b, curve)", [0, 1]), cvOut(2, "curve (0..1)", [0, 1])],
    pair: [0, 1], scope: 4,
    note: "A 1 Hz ramp drives in1, as the patch's phasor~ 1. Both outputs are heard as the pitch of a test tone: "
      + "each second a sweep whose shape follows the curve (move shape). The scope's range is 0..1.",
  },
  "delays-delays": {
    dsp: "delays-delays", source: "loop",
    inputs: [A(1, 0), A(2, 1)],
    outputs: [
      ...Array.from({ length: 16 }, (_, i) => audioOut(i + 1, i < 2 ? (i ? "audio R / bus 2" : "audio L / bus 1") : `bus ${i + 1}`)),
      pulseOut(17, "input onset trigger"), pulseOut(18, "tap hit pulse"), cvOut(19, "index of the last tap hit", [0, 31]),
      cvOut(20, "its amplitude", [0, 1], "amp"),
    ],
    pair: [0, 1], scope: 0.05,
    note: FX_NOTE + " In mc_mode '16 channels' the taps are spread over out1..out16: choose the pair to hear.",
  },
  "driller": {
    dsp: "driller", source: "loop",
    inputs: [A(1, 0), A(2, 1), { label: "in3: main delay CV (ms, added)", kind: "cv", value: 0, range: [-500, 500], unit: "ms", depth: 0, depthRange: [0, 500], rate: 0.2, rateRange: [0.01, 10] }, { label: "in4: probability CV (%, added)", kind: "cv", value: 0, range: [-100, 100], unit: "%", depth: 0, depthRange: [0, 100], rate: 0.2, rateRange: [0.01, 10] }],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R"), cvOut(3, "current tap (0 rest, 1 main, 2..6 divisions)", [0, 6])],
    pair: [0, 1], scope: 0.05, note: FX_NOTE + " The CV inputs are held at 0: the sliders set the delay and the probability.",
  },
  "erbeverb-clone": { dsp: "erbeverb-clone", ...stereoFx(FX_NOTE) },
  "fdn-multireverb": {
    dsp: "fdn_multireverb", source: "loop",
    inputs: Array.from({ length: 8 }, (_, i) => A(i + 1, i % 2, `audio ${i % 2 ? "R" : "L"} (channel ${i + 1})`)),
    outputs: Array.from({ length: 8 }, (_, i) => audioOut(i + 1, `channel ${i + 1}`)),
    pair: [0, 1], scope: 0.05,
    note: "The program is the mc.gen~ patch for 8 channels, each its own reverb, decorrelated from the others. "
      + "The source's left channel feeds the odd channels, its right channel the even ones; channels 1 and 2 are on the speakers.",
  },
  "fhickup": {
    dsp: "fhickup", source: "loop",
    inputs: [A(1, 0), A(2, 1), { label: "in3: drive CV (added)", kind: "cv", value: 0, range: [-100, 100], depth: 0, depthRange: [0, 100], rate: 0.2, rateRange: [0.01, 10] }, { label: "in4: hickup depth CV (%, added)", kind: "cv", value: 0, range: [-100, 100], unit: "%", depth: 0, depthRange: [0, 100], rate: 0.2, rateRange: [0.01, 10] }],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R")],
    pair: [0, 1], scope: 0.05, note: FX_NOTE + " The CV inputs are held at 0.",
  },
  "filterbank-8": {
    dsp: "filterbank-8", source: "loop",
    inputs: [A(1, 0), A(2, 1)],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R"), audioOut(3, "bands 1-4"), audioOut(4, "bands 5-8")],
    pair: [0, 1], scope: 0.05, note: FX_NOTE + " out3 and out4, the low and high band sums, can be chosen for the speakers.",
  },
  "fm-supermod": {
    dsp: "fm-supermod", source: "loop",
    inputs: [A(1, 0, "audio L / MIDI note (use_note_in)"), A(2, 1, "audio R / ratio CV"),
      { label: "in3: fm_index CV (added)", kind: "cv", value: 0, range: [-100, 100], depth: 0, depthRange: [0, 100], rate: 0.2, rateRange: [0.01, 10] }, { label: "in4: feedback CV (added)", kind: "cv", value: 0, range: [-2, 2], depth: 0, depthRange: [0, 2], rate: 0.2, rateRange: [0.01, 10] }],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R")],
    pair: [0, 1], scope: 0.05,
    note: FX_NOTE + " in2 is both the right channel and the ratio CV, as in the patch; in3 and in4 are held at 0.",
  },
  "frost-machine": { dsp: "frost-machine", ...stereoFx(FX_NOTE) },
  "grainer": {
    dsp: "grainer", source: "loop",
    inputs: [A(1, 0), A(2, 1), { label: "in3: threshold CV (%, added)", kind: "cv", value: 0, range: [-100, 100], unit: "%", depth: 0, depthRange: [0, 100], rate: 0.2, rateRange: [0.01, 10] }, { label: "in4: probability CV (%, added)", kind: "cv", value: 0, range: [-100, 100], unit: "%", depth: 0, depthRange: [0, 100], rate: 0.2, rateRange: [0.01, 10] }],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R"), cvOut(3, "envelope", [0, 1], "amp"), pulseOut(4, "grain trigger")],
    pair: [0, 1], scope: 0.05, note: FX_NOTE + " The CV inputs are held at 0.",
  },
  "householder-fdn-16": { dsp: "householder-fdn-16", ...stereoFx(FX_NOTE) },
  "lorenz-rossler-chaos": {
    dsp: "lorenz-rossler-chaos", source: "loop",
    inputs: [A(1, 0, "audio injection on x"),
      { label: "in2: speed CV (+200 per unit)", kind: "cv", value: 0, range: [-1, 1], depth: 0, depthRange: [0, 1], rate: 0.1, rateRange: [0.01, 10] }],
    outputs: [audioOut(1, "x"), audioOut(2, "y"), audioOut(3, "z"), pulseOut(4, "zero-crossing trigger of x", [0, 1])],
    pair: [0, 1], scope: 0.1,
    note: "The attractor (Rössler by default, speed 2: a slow orbit) drives the speakers with x and y, as in the demo "
      + "patch; raise speed towards 150 to hear it at audio rate. The source reaches in1 only when inject is raised.",
  },
  "modeldrive": {
    dsp: "modeldrive", source: "loop",
    inputs: [A(1, 0), A(2, 1), { label: "in3: drive CV (1 adds 100 to drive)", kind: "cv", value: 0, range: [-1, 1], depth: 0, depthRange: [0, 1], rate: 0.2, rateRange: [0.01, 10] }],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R")],
    pair: [0, 1], scope: 0.05, note: FX_NOTE + " The drive CV is held at 0.",
  },
  "multiband-drive": {
    dsp: "multiband-drive", source: "loop",
    inputs: [A(1, 0), A(2, 1)],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R"), audioOut(3, "low band"), audioOut(4, "mid band"), audioOut(5, "high band")],
    pair: [0, 1], scope: 0.05, note: FX_NOTE + " out3..out5, the three bands, can be chosen for the speakers.",
  },
  "offset-spline-random": {
    dsp: "offset-spline-random", source: "sine",
    inputs: [A(1, 0, "audio / signal thru"),
      { label: "in2: external clock phase (trigmode on)", kind: "ramp", button: "Restart", rate: 7, rateRange: [0.1, 50], log: true }],
    outputs: [cvOut(1, "result: comb(in1) + amp * walk", [-1, 1], "direct"), pulseOut(2, "step trigger"),
      cvOut(3, "spline walk", [-1, 1]), cvOut(4, "stepped walk", [-1, 1])],
    pair: [2, 3], scope: 4,
    note: "The random walk steps at 20 Hz (internal phasor). The spline walk (left) and the stepped walk (right) are heard "
      + "as the pitch of a test tone; out1 is in1 (a 220 Hz sine) plus amp times the walk.",
  },
  "poisson-cloud": {
    dsp: "poisson-cloud", source: "silence",
    inputs: [{ label: "in1: start trigger", kind: "clock", button: "Start", rate: 0.2, rateRange: [0.02, 5], log: true, auto: true, amp: 1 },
      { label: "in2: stop trigger", kind: "clock", button: "Stop", rate: 0.1, rateRange: [0.02, 5], log: true, auto: false, amp: 1 }],
    outputs: [pulseOut(1, "pulse stream"), cvOut(2, "pulse counter (1..occurrences)", [0, "occurrences"]), cvOut(3, "activity (1 while running)", [0, 1], "amp")],
    pair: [0, 2], scope: 4,
    note: "A start trigger every 5 s launches a burst of 16 pulses, 250 ms apart. The pulses click on the left; "
      + "the activity flag opens a tone on the right while the burst runs.",
  },
  "precision-svf-48db": { dsp: "precision-svf-48db", ...stereoFx(FX_NOTE) },
  "pulsar-synth": {
    dsp: "pulsar-synth", source: "silence",
    inputs: [{ label: "in1: reset / sync trigger (> 0.5)", kind: "clock", button: "Sync", rate: 2, rateRange: [0.1, 50], log: true, auto: false, amp: 1 },
      { label: "in2: formant modulation (Hz)", kind: "cv", value: 0, range: [-1000, 1000], unit: "Hz", depth: 0, depthRange: [0, 1000], rate: 0.37, rateRange: [0.01, 20] }],
    outputs: [audioOut(1, "pulsar L"), audioOut(2, "pulsar R")],
    pair: [0, 1], scope: 0.1,
    note: "The pulsar train plays from its own clock (f0). A sync trigger on in1 (a rising edge through 0.5) resets "
      + "the phase and starts a new period.",
  },
  "rings": {
    dsp: "rings", source: "silence",
    inputs: [A(1, 0, "audio L (excitation)"), A(2, 1, "audio R (excitation)"),
      { label: "in3: strum trigger", kind: "clock", button: "Strum", rate: 1, rateRange: [0.1, 10], log: true, auto: true, amp: 1 }],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R"), audioOut(3, "filtered exciter"), cvOut(4, "strum envelope", [0, 1], "amp")],
    pair: [0, 1], scope: 0.05,
    note: "A strum every second excites the resonator (internal exciter); choose a source to excite it with audio too.",
  },
  "sature-delay": { dsp: "sature-delay", ...stereoFx(FX_NOTE) },
  "skipper": {
    dsp: "skipper", source: "loop",
    inputs: [A(1, 0), A(2, 1)],
    outputs: [audioOut(1, "audio L"), audioOut(2, "audio R"), cvOut(3, "loop length (ms)", [0, 6000]), cvOut(4, "speed", [-4, 4])],
    pair: [0, 1], scope: 0.05, note: FX_NOTE + " The first capture starts after half a second.",
  },
  "spatial-dbap": {
    dsp: "spatial-dbap", source: "loop",
    inputs: [A(1, 0, "audio (mono)"),
      { label: "in2: source X (-1..1)", kind: "cv", value: 0, range: [-1, 1], depth: 0.9, depthRange: [0, 1], rate: 0.1, rateRange: [0.01, 5] },
      { label: "in3: source Y (-1..1)", kind: "cv", value: 0, range: [-1, 1], depth: 0.6, depthRange: [0, 1], rate: 0.17, rateRange: [0.01, 5] },
      { label: "in4: source Z (-1..1)", kind: "cv", value: 0, range: [-1, 1], depth: 0, depthRange: [0, 1], rate: 0.05, rateRange: [0.01, 5] }],
    outputs: Array.from({ length: 32 }, (_, i) => audioOut(i + 1, `loudspeaker ${i + 1}`)),
    pair: [0, 1], scope: 0.05,
    note: "The program is the mc.gen~ patch for 32 loudspeakers (32 outputs), on the patch's fallback ring of radius 2 "
      + "(no CSV layout). Two slow LFOs move the source; loudspeakers 1 and 2 are on the speakers: choose another pair to follow it.",
  },
  "tape-hysteresis": { dsp: "tape-hysteresis", ...stereoFx(FX_NOTE) },
  "ufo-multilfo": {
    dsp: "ufo", source: "silence",
    inputs: [ufoFreq(1), ufoTrig(2)],
    outputs: [cvOut(1, "LFO", [-1, 1])],
    pair: [0, 0], scope: 4, note: LFO_NOTE,
  },
  "volt-drama": { dsp: "volt-drama", ...stereoFx(FX_NOTE) },
  "volt-syphon": { dsp: "volt-syphon", ...stereoFx(FX_NOTE) },
  "waveguide-string": {
    dsp: "waveguide-string", source: "silence",
    inputs: [{ label: "in1: strike / excitation", kind: "clock", button: "Pluck", rate: 2, rateRange: [0.1, 20], log: true, auto: true, amp: 0.8,
      burst: 40, burstRange: [0, 200], randomize: { key: "freq", min: 100, max: 2000, label: "random freq" }, rand: false },
      { label: "in2: pitch modulation (Hz)", kind: "cv", value: 0, range: [-50, 50], unit: "Hz", depth: 0, depthRange: [0, 20], rate: 5, rateRange: [0.1, 20] }],
    outputs: [audioOut(1, "string L"), audioOut(2, "string R")],
    pair: [0, 1], scope: 0.05,
    note: "A 40 ms pink noise burst every 500 ms strikes the string, as the demo patch's metro 500 and pink~ envelope "
      + "(burst 0: a one-sample pulse). 'random freq' draws freq at each strike, as the patch does (100..4000 Hz there; 100..2000 Hz here, the range of the program's freq).",
  },
  "zdf-diode-ladder": { dsp: "zdf-diode-ladder", ...stereoFx(FX_NOTE) },
  "lp-butterworth": {
    dsp: "lp_butterworth", source: "loop",
    inputs: [A(1, 0, "audio")], outputs: [audioOut(1, "audio")], pair: [0, 0], scope: 0.05,
    note: "The source's left channel through the low-pass, on both speakers. Raise freq to open it.",
  },
  "hp-butterworth": {
    dsp: "hp_butterworth", source: "loop",
    inputs: [A(1, 0, "audio")], outputs: [audioOut(1, "audio")], pair: [0, 0], scope: 0.05,
    note: "The source's left channel through the high-pass, on both speakers.",
  },
};
