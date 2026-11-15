// The catalogue page: GEN-patches' cards (models-data.js), its search and category
// filters, the Params and Signal Flow drawers, and a Play drawer per card that runs the
// model's Faust port (web/dsp/<name>.wasm) in an AudioWorklet (gen-processor.js), fed
// and heard as web/drive.js says. One model plays at a time; starting another stops it.
// The Diagram button of a card opens the block diagram of its port (web/diagram.js).
//
// The Play drawer is built from the program's JSON: its controls (sliders, menus,
// toggles; double-click resets to the default), its inputs and outputs. Debug handle
// for the checks: window.genPlay.

import { MODELS_DATA, SUITE } from "./models-data.js";
import { MODELS, SOURCES, LISTEN_MODES, genDefaults } from "./drive.js";
import { uiItems, controlKey } from "./faust-wasm-dsp.js";
import { openDiagram } from "./diagram.js";

const DSP_DIR = "dsp/";
const ORIGINAL = "https://github.com/mxbrckrt/GEN-patches";
const SCOPE_POINTS = 240;
const WINDOWS = [[0.02, "20 ms"], [0.05, "50 ms"], [0.1, "100 ms"], [1, "1 s"], [4, "4 s"]];

const $ = (id) => document.getElementById(id);
const h = (tag, attrs = {}, ...children) => {
  const e = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs)) {
    if (k === "class") e.className = v;
    else if (k.startsWith("on")) e.addEventListener(k.slice(2), v);
    else if (v !== undefined && v !== null && v !== false) e.setAttribute(k, v === true ? "" : v);
  }
  for (const c of children.flat()) if (c !== null && c !== undefined) e.append(c);
  return e;
};
const esc = (s) => String(s).replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" })[c]);
const dbStr = (g) => (g > 0 ? `${(20 * Math.log10(g)).toFixed(1)}` : "-inf");

// ------------------------------------------------------------------ programs

const programs = new Map();   // dsp name -> Promise<{json, module}>
function loadJson(name) {
  return fetch(DSP_DIR + name + ".json").then((r) => {
    if (!r.ok) throw new Error(`${DSP_DIR}${name}.json: ${r.status} (run make web)`);
    return r.json();
  });
}
const jsons = new Map();
function json(name) {
  if (!jsons.has(name)) jsons.set(name, loadJson(name));
  return jsons.get(name);
}
function program(name) {
  if (!programs.has(name)) {
    programs.set(name, Promise.all([
      json(name),
      fetch(DSP_DIR + name + ".wasm").then(async (r) => {
        if (!r.ok) throw new Error(`${DSP_DIR}${name}.wasm: ${r.status} (run make web)`);
        return WebAssembly.compile(await r.arrayBuffer());
      }),
    ]).then(([j, module]) => ({ json: j, module })));
  }
  return programs.get(name);
}

/** The controls of a program's JSON: {key, label, type, init, min, max, step, unit, menu, log}. */
function controlsOf(j) {
  const out = [];
  for (const it of uiItems(j.ui)) {
    if (!it.address || it.type.endsWith("bargraph")) continue;
    const meta = Object.assign({}, ...(it.meta || []));
    const c = {
      key: controlKey(it.address), label: it.label, type: it.type, unit: meta.unit || "",
      init: Number(it.init ?? 0), min: Number(it.min ?? 0), max: Number(it.max ?? 1), step: Number(it.step ?? 0.01),
    };
    const m = /menu\{(.*)\}/.exec(meta.style || "");
    if (m) c.menu = [...m[1].matchAll(/'([^']*)'\s*:\s*([-\d.eE]+)/g)].map(([, l, v]) => [l, Number(v)]);
    c.toggle = !c.menu && it.type !== "button" && c.min === 0 && c.max === 1 && c.step === 1;
    c.log = c.min > 0 && ((["Hz", "kHz", "ms", "s"].includes(c.unit) && c.max / c.min >= 50) || c.max / c.min >= 1000);
    out.push(c);
  }
  return out;
}

// ------------------------------------------------------------------ the catalogue

const cards = new Map();      // id -> {m, spec, el, state, play}
let currentCategory = "all";
let searchQuery = "";

function metrics() {
  const models = MODELS_DATA.filter((m) => m.category !== "utilities").length;
  const items = [
    [`${models} + ${MODELS_DATA.length - models}`, "Models + utilities"],
    [`${SUITE.passed}/${SUITE.settings}`, `Settings within ${SUITE.worst} dB of gen~`],
    [String(SUITE.bitexact), "Bit-exact settings"],
    ["Float64", "WebAssembly, AudioWorklet"],
    ["A → Z", "Alphabetical Sorting"],
  ];
  $("metrics").append(...items.map(([v, l]) => h("div", { class: "metric-unit" },
    h("span", { class: "metric-val" }, v), h("span", { class: "metric-lbl" }, l))));
}

function paramNames(p) {
  return p.name.split("/").map((s) => s.replace(/\(.*?\)/g, "").trim()).filter(Boolean);
}

function buildCard(m) {
  const spec = MODELS[m.id];
  const card = h("div", { class: "spec-card", id: `card-${m.id}` });
  const ins = spec.inputs.map((i) => i.label);
  const insShown = ins.length > 6 ? [...ins.slice(0, 1), `in2..in${ins.length - 1}: ${ins[1].replace(/^in\d+: /, "").replace(/\+ \w+ /, "+ the parameters ")}`, ins[ins.length - 1]] : ins;
  const outs = spec.outputs.map((o) => o.label);
  const outsShown = outs.length > 6 ? [`out1..out16: audio (stereo on 1-2, or 16 channels)`, ...outs.slice(16)] : outs;
  const paramsRows = m.parameters.map((p) => `
      <tr data-names="${esc(paramNames(p).join(" "))}">
        <td class="p-name">${esc(p.name)}</td>
        <td class="p-range">${esc(p.range)}</td>
        <td>${esc(p.desc)}</td>
      </tr>`).join("");
  const fidelity = m.worst_db === "bit-exact" ? "<b>bit-exact</b> against the gen~ export"
    : m.worst_db !== null ? `worst error against the gen~ export <b>${m.worst_db} dB</b>` : "";
  card.innerHTML = `
    <div>
      <div class="spec-header">
        <div>
          <div class="model-name">${esc(m.name)}</div>
          <div class="model-subtitle">${esc(m.title)}</div>
        </div>
        <span class="class-badge">${esc(m.badge)}</span>
      </div>
      <div class="paradigm-box">${esc(m.dsp_paradigm)}</div>
      <p class="model-abstract">${esc(m.description)}</p>
      <div class="io-matrix">
        <div>
          <div class="io-section-title">Inlets (Faust port)</div>
          ${insShown.map((i) => `<div class="io-node">&bull; ${esc(i)}</div>`).join("")}
        </div>
        <div>
          <div class="io-section-title">Outlets (Faust port)</div>
          ${outsShown.map((o) => `<div class="io-node">&bull; ${esc(o)}</div>`).join("")}
        </div>
      </div>
      <div class="nav-drawers">
        ${m.parameters.length ? `<button class="btn-drawer" data-drawer="params"><span>Params (${m.parameters.length})</span><span class="btn-drawer-icon">&darr;</span></button>` : ""}
        ${m.block_diagram ? `<button class="btn-drawer" data-drawer="diagram"><span>Signal Flow</span><span class="btn-drawer-icon">&darr;</span></button>` : ""}
        <button class="btn-drawer svg-btn" data-diagram title="The block diagram of the Faust port (faust-rs --svg)"><span>Diagram</span><span class="btn-drawer-icon">&#8599;</span></button>
        <button class="btn-drawer play-drawer-btn" data-drawer="play"><span>Play</span><span class="btn-drawer-icon">&#9654;</span></button>
      </div>
      ${m.parameters.length ? `
      <div class="drawer-panel" data-panel="params">
        <table class="param-table">
          <thead><tr><th>Param</th><th>Domain</th><th>Role</th></tr></thead>
          <tbody>${paramsRows}</tbody>
        </table>
        <div class="param-note"></div>
      </div>` : ""}
      ${m.block_diagram ? `<div class="drawer-panel" data-panel="diagram"><pre class="diagram-view">${esc(m.block_diagram)}</pre></div>` : ""}
      <div class="drawer-panel" data-panel="play"></div>
    </div>
    <div class="card-bottom">
      <span class="fidelity">${fidelity}</span>
      <a href="../dsp/${m.dsp}.dsp" class="ref-link" title="The Faust program">.dsp</a>
      <a href="../ref/gendsp/${m.dsp}.gendsp" class="ref-link" title="The original gendsp (unchanged copy)">.gendsp</a>
      ${m.maxpat ? `<a href="../max/${m.dsp}.maxpat" class="ref-link" title="The demo patcher with the Faust port in faustgen~">.maxpat</a>` : ""}
      <a href="${ORIGINAL}/blob/main/gendsp/${m.dsp}.gendsp" class="ref-link" title="The original in GEN-patches">original &#8599;</a>
    </div>`;
  const entry = { m, spec, el: card, state: null, play: null };
  card.querySelectorAll(".btn-drawer[data-drawer]").forEach((b) => b.addEventListener("click", () => toggleDrawer(entry, b.dataset.drawer)));
  card.querySelector("[data-diagram]").addEventListener("click", () => openDiagram(m.dsp, m.name));
  cards.set(m.id, entry);
  return card;
}

function toggleDrawer(entry, target) {
  const card = entry.el;
  const panel = card.querySelector(`[data-panel="${target}"]`);
  const open = panel.classList.contains("open");
  card.querySelectorAll(".drawer-panel").forEach((p) => p.classList.remove("open"));
  card.querySelectorAll(".btn-drawer[data-drawer]").forEach((b) => {
    b.classList.remove("active");
    b.querySelector(".btn-drawer-icon").innerHTML = b.dataset.drawer === "play" ? "&#9654;" : "&darr;";
  });
  if (open) return;
  panel.classList.add("open");
  const btn = card.querySelector(`[data-drawer="${target}"]`);
  btn.classList.add("active");
  btn.querySelector(".btn-drawer-icon").innerHTML = "&uarr;";
  if (target === "play" && !entry.play) buildPlay(entry, panel);
}

// The Params drawer documents the gendsp's header; the names the program does not have are flagged.
async function flagParams(entry) {
  const panel = entry.el.querySelector('[data-panel="params"]');
  if (!panel) return;
  let j;
  try { j = await json(entry.m.dsp); } catch (e) { return; }
  const keys = new Set(controlsOf(j).map((c) => c.key));
  const documented = new Set();
  panel.querySelectorAll("tbody tr").forEach((tr) => {
    const names = tr.dataset.names.split(" ").filter(Boolean);
    names.forEach((n) => documented.add(n));
    const missing = names.filter((n) => !keys.has(n));
    if (missing.length) {
      tr.querySelector(".p-name").insertAdjacentHTML("beforeend",
        `<span class="p-flag" title="${esc(missing.join(", "))}: not a control of the Faust program (nor of the gen~ code)">${missing.length === names.length ? "not in the code" : `${esc(missing.join(", "))} not in the code`}</span>`);
    }
  });
  const extra = [...keys].filter((k) => !documented.has(k));
  const note = panel.querySelector(".param-note");
  note.innerHTML = `From the gendsp's header comment.${extra.length ? ` The program also has <code>${extra.map(esc).join("</code>, <code>")}</code>.` : ""} The Play drawer shows the program's own controls.`;
}

function renderFilter() {
  const q = searchQuery.toLowerCase();
  let shown = 0, shownUtil = 0;
  for (const { m, el } of cards.values()) {
    const text = (m.name + " " + m.title + " " + m.description + " " + m.dsp_paradigm + " " + m.id + " "
      + m.parameters.map((p) => p.name).join(" ")).toLowerCase();
    const util = m.category === "utilities";
    const cat = currentCategory === "all" || m.category === currentCategory;
    const visible = cat && text.includes(q);
    el.style.display = visible ? "" : "none";
    if (visible) { if (util) shownUtil += 1; else shown += 1; }
  }
  $("utilitiesTitle").style.display = shownUtil ? "" : "none";
  $("utilitiesGrid").style.display = shownUtil ? "" : "none";
  $("modelsGrid").style.display = shown || !shownUtil ? "" : "none";
  const parts = [];
  if (shown || !shownUtil) parts.push(`${shown} model${shown === 1 ? "" : "s"}`);
  if (shownUtil) parts.push(`${shownUtil} utilit${shownUtil === 1 ? "y" : "ies"}`);
  $("resultsCount").textContent = shown + shownUtil
    ? `Displaying ${parts.join(" and ")} (sorted A → Z)` : "No matching models found.";
}

// ------------------------------------------------------------------ controls

function fmt(v, c) {
  if (c.menu) return (c.menu.find(([, x]) => x === v) || [String(v)])[0];
  const dec = Math.max(0, Math.min(4, Math.ceil(-Math.log10(c.step || 0.01))));
  let s;
  if (c.log && Math.abs(v) < 1) s = Number(v.toPrecision(3)).toString();
  else s = v.toFixed(c.log && Math.abs(v) >= 100 ? 0 : dec);
  return c.unit ? `${s} ${c.unit}` : s;
}

/**
 * A control row: name, widget, value. c = {label, min, max, init, step, unit, menu, toggle,
 * log, button}; onChange(value). Double-click on the name or the slider resets to init.
 * Returns {row, set(value)}.
 */
function controlRow(c, onChange, nameClass = "") {
  const name = h("span", { class: `ctl-name ${nameClass}`, title: `${c.title || c.label} (double-click: reset to ${fmt(c.init, c)})` }, c.label);
  const val = h("span", { class: "ctl-val" });
  let widget, set;
  if (c.menu) {
    widget = h("select", {}, c.menu.map(([l, v]) => h("option", { value: v }, l)));
    widget.addEventListener("change", () => { const v = Number(widget.value); val.textContent = ""; onChange(v); });
    set = (v) => { widget.value = String(v); };
  } else if (c.toggle) {
    widget = h("div", { class: "ctl-inline" }, h("button", { class: "ctl-btn", type: "button" }, "off"));
    const b = widget.firstChild;
    let cur = c.init;
    b.addEventListener("click", () => { cur = cur ? 0 : 1; set(cur); onChange(cur); });
    set = (v) => { cur = v; b.textContent = v ? "on" : "off"; b.classList.toggle("on", !!v); };
  } else if (c.type === "button") {
    widget = h("div", { class: "ctl-inline" }, h("button", { class: "ctl-btn fire", type: "button" }, "press"));
    const b = widget.firstChild;
    b.addEventListener("pointerdown", () => onChange(1));
    b.addEventListener("pointerup", () => onChange(0));
    b.addEventListener("pointerleave", () => onChange(0));
    set = () => {};
  } else {
    const N = 1000;
    const toPos = (v) => (c.log ? Math.log(v / c.min) / Math.log(c.max / c.min) : (v - c.min) / (c.max - c.min)) * N;
    const fromPos = (p) => {
      const u = p / N;
      let v = c.log ? c.min * (c.max / c.min) ** u : c.min + u * (c.max - c.min);
      if (!c.log && c.step) v = Math.round(v / c.step) * c.step;
      return Math.min(c.max, Math.max(c.min, Number(v.toPrecision(10))));
    };
    widget = h("input", { type: "range", min: 0, max: N, step: c.log || !c.step ? 1 : Math.max(1e-6, (c.step / (c.max - c.min)) * N) });
    widget.addEventListener("input", () => { const v = fromPos(Number(widget.value)); val.textContent = fmt(v, c); onChange(v); });
    set = (v) => { widget.value = String(toPos(v)); val.textContent = fmt(v, c); };
  }
  const reset = () => { set(c.init); onChange(c.init); };
  name.addEventListener("dblclick", reset);
  if (widget.tagName === "INPUT") widget.addEventListener("dblclick", reset);
  set(c.init);
  return { row: h("div", { class: "ctl" }, name, widget, val), set };
}

// ------------------------------------------------------------------ the Play drawer

function defaultState(spec) {
  return {
    controls: new Map(),
    drive: { source: spec.source || "loop", level: 0, gens: spec.inputs.map((i) => genDefaults(i)) },
    listen: { pair: [...spec.pair], mode: "auto" },
    scope: spec.scope,
    file: null,
  };
}

async function buildPlay(entry, panel) {
  const { m, spec } = entry;
  entry.state ||= defaultState(spec);
  const st = entry.state;
  const btn = h("button", { class: "play-btn", type: "button" }, "▶ Start");
  const status = h("span", { class: "play-status" }, "stopped");
  const ui = { btn, status, ctl: new Map() };
  entry.play = ui;
  panel.append(h("div", { class: "play" },
    h("div", { class: "play-bar" }, btn, status),
    h("p", { class: "play-note" }, spec.note)));
  const root = panel.firstChild;
  btn.addEventListener("click", () => (player.id === m.id ? stop() : start(m.id)));

  // inputs
  const insSec = h("div", { class: "play-sec" }, h("div", { class: "io-section-title" }, "Inputs"));
  root.append(insSec);
  const audioIns = spec.inputs.map((inp, i) => [inp, i]).filter(([inp]) => inp.kind === "audio");
  if (audioIns.length) {
    const names = audioIns.map(([, i]) => `in${i + 1}`).join(", ");
    const sel = h("select", {}, SOURCES.map(([v, l]) => h("option", { value: v }, l)));
    sel.value = st.drive.source;
    const file = h("input", { type: "file", accept: "audio/*", style: "display:none" });
    const fileName = h("span", { class: "gen-dim" });
    const fileBtn = h("button", { class: "ctl-btn", type: "button", style: st.drive.source === "file" ? "" : "display:none" }, "choose file");
    fileBtn.addEventListener("click", () => file.click());
    file.addEventListener("change", () => {
      st.file = file.files[0] || null;
      fileName.textContent = st.file ? st.file.name : "";
      if (player.id === m.id) setExternal(entry).catch((e) => showError(entry, e));
    });
    sel.addEventListener("change", () => {
      st.drive.source = sel.value;
      fileBtn.style.display = sel.value === "file" ? "" : "none";
      if (sel.value === "file" && !st.file) file.click();
      send(m.id, { type: "source", value: sel.value });
      if (player.id === m.id) setExternal(entry).catch((e) => showError(entry, e));
    });
    const labels = audioIns.map(([inp]) => inp.label).join(" · ");
    insSec.append(h("div", { class: "gen-label" }, labels),
      h("div", { class: "ctl" }, h("span", { class: "ctl-name gen" }, `${names} ←`), h("div", { class: "ctl-inline" }, sel, fileBtn, file), fileName));
    insSec.append(controlRow({ label: "source level", min: -24, max: 12, init: st.drive.level, step: 0.5, unit: "dB" },
      (v) => { st.drive.level = v; send(m.id, { type: "level", value: v }); }, "gen").row);
  }
  const zeros = [];
  spec.inputs.forEach((inp, i) => {
    const g = st.drive.gens[i];
    const setGen = (key) => (v) => { g[key] = v; send(m.id, { type: "gen", index: i, key, value: v }); };
    if (inp.kind === "zero") { zeros.push(inp.label); return; }
    if (inp.kind === "audio") return;
    insSec.append(h("div", { class: "gen-label" }, inp.label));
    if (inp.kind === "ramp" || inp.kind === "clock") {
      const fire = h("button", { class: "ctl-btn fire", type: "button" }, inp.button);
      fire.addEventListener("click", () => send(m.id, { type: "fire", index: i }));
      const extra = [fire];
      if (inp.kind === "clock") {
        const auto = h("button", { class: "ctl-btn" + (g.auto ? " on" : ""), type: "button" }, "auto");
        auto.addEventListener("click", () => { const v = g.auto ? 0 : 1; auto.classList.toggle("on", !!v); setGen("auto")(v); });
        extra.unshift(auto);
        if (inp.randomize) {
          const rnd = h("button", { class: "ctl-btn" + (g.rand ? " on" : ""), type: "button", title: `at each pulse, ${inp.randomize.key} = random in ${inp.randomize.min}..${inp.randomize.max}` }, inp.randomize.label);
          rnd.addEventListener("click", () => { const v = g.rand ? 0 : 1; rnd.classList.toggle("on", !!v); setGen("rand")(v); });
          extra.push(rnd);
        }
      }
      insSec.append(h("div", { class: "ctl" }, h("span", { class: "ctl-name gen" }, inp.kind === "ramp" ? "0..1 ramp" : "pulses"), h("div", { class: "ctl-inline" }, extra), h("span")));
      insSec.append(controlRow({ label: "rate", min: inp.rateRange[0], max: inp.rateRange[1], init: g.rate, step: 0.01, unit: "Hz", log: !!inp.log }, setGen("rate"), "gen").row);
      if (inp.burstRange) {
        insSec.append(controlRow({ label: "noise burst", title: "0: a one-sample pulse", min: inp.burstRange[0], max: inp.burstRange[1], init: g.burst, step: 1, unit: "ms" }, setGen("burst"), "gen").row);
      }
    } else if (inp.kind === "cv") {
      insSec.append(controlRow({ label: "value", min: inp.range[0], max: inp.range[1], init: g.value, step: 0.001, unit: inp.unit || "", log: !!inp.log }, setGen("value"), "gen").row);
      if (inp.depthRange) {
        insSec.append(controlRow({ label: "LFO depth", min: inp.depthRange[0], max: inp.depthRange[1], init: g.depth, step: 0.001, unit: inp.unit || "" }, setGen("depth"), "gen").row);
        insSec.append(controlRow({ label: "LFO rate", min: inp.rateRange[0], max: inp.rateRange[1], init: g.rate, step: 0.01, unit: "Hz", log: true }, setGen("rate"), "gen").row);
      }
    }
  });
  if (zeros.length) insSec.append(h("div", { class: "gen-dim" }, zeros.length > 2 ? `${zeros[0].split(":")[0]}..${zeros[zeros.length - 1].split(":")[0]}: held at 0` : zeros.join(" · ")));

  // outputs
  const outSec = h("div", { class: "play-sec" }, h("div", { class: "io-section-title" }, "Outputs"));
  root.append(outSec);
  const outSel = (c) => {
    const s = h("select", {}, spec.outputs.map((o, k) => h("option", { value: k }, o.label)));
    s.value = String(st.listen.pair[c]);
    s.addEventListener("change", () => { st.listen.pair[c] = Number(s.value); send(m.id, { type: "pair", value: st.listen.pair }); updateLegend(); });
    return s;
  };
  const listen = h("select", {}, LISTEN_MODES.map(([v, l]) => h("option", { value: v }, l)));
  listen.value = st.listen.mode;
  listen.addEventListener("change", () => { st.listen.mode = listen.value; send(m.id, { type: "listen", value: listen.value }); updateLegend(); });
  const win = h("select", {}, WINDOWS.map(([v, l]) => h("option", { value: v }, l)));
  win.value = String(st.scope);
  win.addEventListener("change", () => { st.scope = Number(win.value); ui.scope = newScope(); send(m.id, { type: "scope", value: st.scope }); });
  const grid = h("div", { class: "out-grid" });
  if (spec.outputs.length > 1) grid.append(h("label", {}, "left ←"), outSel(0), h("label", {}, "right ←"), outSel(1));
  grid.append(h("label", {}, "listen as"), listen, h("label", {}, "scope"), win);
  outSec.append(grid);
  const canvas = h("canvas", { class: "scope", width: 600, height: 240 });
  const legend = h("div", { class: "scope-legend" });
  outSec.append(h("div", { class: "scope-wrap" }, canvas, legend));
  const meterRow = (n) => {
    const bar = h("div", { class: "meter" }, h("i"), h("b"));
    const txt = h("span", {}, "-inf dB");
    return { els: [h("span", {}, n), bar, txt], bar, txt, hold: 0 };
  };
  ui.meters = [meterRow("L"), meterRow("R")];
  outSec.append(h("div", { class: "meters" }, ui.meters.flatMap((r) => r.els)));
  const updateLegend = () => {
    const mode = (c) => (st.listen.mode === "auto" ? spec.outputs[st.listen.pair[c]].listen : st.listen.mode);
    const [l, r] = st.listen.pair.map((k) => spec.outputs[k]);
    const rng = (o) => (o.range && (o.range[0] !== -1 || o.range[1] !== 1) ? ` [${o.range.map((x) => (typeof x === "string" ? x : x)).join("..")}]` : "");
    legend.innerHTML = spec.outputs.length > 1
      ? `<span class="l">L: ${esc(l.label)}${esc(rng(l))} → ${mode(0)}</span><br><span class="r">R: ${esc(r.label)}${esc(rng(r))} → ${mode(1)}</span>`
      : `<span class="l">${esc(l.label)}${esc(rng(l))} → ${mode(0)}</span>`;
  };
  updateLegend();
  const newScope = () => ({ mode: st.scope <= 0.2 ? "frame" : "roll", l: new Float32Array(2 * SCOPE_POINTS).fill(NaN), r: new Float32Array(2 * SCOPE_POINTS).fill(NaN), dirty: true });
  ui.canvas = canvas;
  ui.scope = newScope();

  // controls of the program
  const ctlSec = h("div", { class: "play-sec" }, h("div", { class: "io-section-title" }, "Controls"));
  root.append(ctlSec);
  try {
    const j = await json(m.dsp);
    const cs = controlsOf(j);
    ctlSec.firstChild.textContent = `Controls (${cs.length}, from the program)`;
    for (const c of cs) {
      if (!st.controls.has(c.key)) st.controls.set(c.key, c.init);
      const r = controlRow({ ...c, init: c.init }, (v) => { st.controls.set(c.key, v); send(m.id, { type: "control", key: c.key, value: v }); });
      r.set(st.controls.get(c.key));
      ui.ctl.set(c.key, { ...r, c });
      ctlSec.append(r.row);
    }
    ui.json = j;
  } catch (e) {
    showError(entry, e);
  }
}

function showError(entry, e) {
  console.error(e);
  if (entry.play) {
    entry.play.status.textContent = `error: ${e.message}`;
    entry.play.status.classList.add("err");
  }
}

// ------------------------------------------------------------------ audio

// The worklet feeds the analyser and the output gain; the output gain feeds the speakers.
// ?mute in the URL (or genPlay.mute(true)) sets the output gain to 0: the checks read the
// analyser without a sound.
const player = {
  ctx: null, moduleReady: null, node: null, id: null, analyser: null, out: null, ext: null, stream: null, stats: null,
  gain: 0.5, muted: new URLSearchParams(location.search).has("mute"),
};

function send(id, msg) {
  if (player.id === id && player.node) player.node.port.postMessage(msg);
}

async function ensureContext() {
  if (!player.ctx) {
    player.ctx = new AudioContext({ latencyHint: "interactive" });
    player.moduleReady = player.ctx.audioWorklet.addModule("gen-processor.js");
    player.analyser = new AnalyserNode(player.ctx, { fftSize: 4096 });
    player.out = new GainNode(player.ctx, { gain: player.muted ? 0 : 1 });
    player.out.connect(player.ctx.destination);
  }
  await player.moduleReady;
  if (player.ctx.state !== "running") await player.ctx.resume();
  return player.ctx;
}

async function start(id) {
  const entry = cards.get(id);
  if (!entry.play) toggleDrawer(entry, "play");
  const ui = entry.play;
  if (player.id) await stop();
  ui.btn.disabled = true;
  ui.status.classList.remove("err");
  ui.status.textContent = "loading…";
  try {
    const ctx = await ensureContext();
    const prog = await program(entry.m.dsp);
    const st = entry.state;
    const node = new AudioWorkletNode(ctx, "gen-model", {
      numberOfInputs: 1, numberOfOutputs: 1, outputChannelCount: [2],
      channelCount: 2, channelCountMode: "explicit", channelInterpretation: "speakers",
      processorOptions: {
        id, program: prog, controls: Object.fromEntries(st.controls), drive: st.drive,
        listen: st.listen, gain: player.gain, scope: st.scope,
      },
    });
    player.node = node;
    player.id = id;
    player.stats = null;
    node.onprocessorerror = (e) => { showError(entry, new Error("the processor stopped (see the console)")); console.error(e); };
    node.port.onmessage = (e) => onMessage(entry, e.data);
    node.connect(player.out);
    node.connect(player.analyser);
    await setExternal(entry);
    ui.btn.textContent = "■ Stop";
    ui.btn.classList.add("on");
    ui.status.textContent = `starting at ${ctx.sampleRate} Hz…`;
    entry.el.classList.add("playing");
    entry.el.querySelector('[data-drawer="play"]').classList.add("is-playing");
    $("nowPlaying").innerHTML = `playing <b>${esc(entry.m.name)}</b>`;
    requestAnimationFrame(draw);
  } catch (e) {
    player.node = null;
    player.id = null;
    showError(entry, e);
  } finally {
    ui.btn.disabled = false;
  }
}

async function stop() {
  const entry = cards.get(player.id);
  if (player.node) {
    player.node.port.postMessage({ type: "dispose" });
    player.node.disconnect();
  }
  dropExternal();
  player.node = null;
  player.id = null;
  if (entry && entry.play) {
    entry.play.btn.textContent = "▶ Start";
    entry.play.btn.classList.remove("on");
    if (!entry.play.status.classList.contains("err")) entry.play.status.textContent = "stopped";
    entry.el.classList.remove("playing");
    entry.el.querySelector('[data-drawer="play"]').classList.remove("is-playing");
  }
  $("nowPlaying").textContent = "nothing playing";
}

function dropExternal() {
  if (player.ext) {
    try { player.ext.stop?.(); } catch (e) { /* already stopped */ }
    player.ext.disconnect();
    player.ext = null;
  }
  if (player.stream) {
    player.stream.getTracks().forEach((t) => t.stop());
    player.stream = null;
  }
}

// The audio file or the microphone, into the node's input, when the source asks for them.
async function setExternal(entry) {
  dropExternal();
  const kind = entry.state.drive.source;
  if (!player.node || !entry.spec.inputs.some((i) => i.kind === "audio")) return;
  const ctx = player.ctx;
  if (kind === "file" && entry.state.file) {
    const buf = await ctx.decodeAudioData(await entry.state.file.arrayBuffer());
    const src = new AudioBufferSourceNode(ctx, { buffer: buf, loop: true });
    src.connect(player.node);
    src.start();
    player.ext = src;
  } else if (kind === "mic") {
    const stream = await navigator.mediaDevices.getUserMedia({ audio: { echoCancellation: false, noiseSuppression: false, autoGainControl: false } });
    player.stream = stream;
    player.ext = new MediaStreamAudioSourceNode(ctx, { mediaStream: stream });
    player.ext.connect(player.node);
  }
}

function onMessage(entry, d) {
  const ui = entry.play;
  if (d.type === "ready") {
    player.timer = d.timer;
  } else if (d.type === "stats") {
    player.stats = d;
    const warn = d.resets ? ` · ${d.resets} reset${d.resets > 1 ? "s" : ""} (non-finite output)` : "";
    ui.status.textContent = `CPU ${player.timer === "Date.now" ? "≈ " : ""}${(100 * d.load).toFixed(1)} % · ${d.sr} Hz${warn}`;
    ui.status.title = "time spent in the worklet's process() over the audio time"
      + (player.timer === "Date.now" ? " (measured with Date.now, 1 ms steps: an estimate)" : "");
    d.peak.forEach((p, c) => {
      const r = ui.meters[c];
      const pos = (g) => Math.max(0, Math.min(1, (20 * Math.log10(Math.max(g, 1e-6)) + 60) / 60));
      r.hold = Math.max(p, r.hold * 0.85);
      r.bar.firstChild.style.width = `${(100 * pos(p)).toFixed(1)}%`;
      r.bar.lastChild.style.left = `calc(${(100 * pos(r.hold)).toFixed(1)}% - 2px)`;
      r.txt.textContent = `${dbStr(r.hold)} dBFS`;
    });
  } else if (d.type === "scope") {
    const s = ui.scope;
    if (d.mode === "frame") { s.l.set(d.l); s.r.set(d.r); }
    else {
      const n = d.l.length;
      s.l.copyWithin(0, n); s.l.set(d.l, s.l.length - n);
      s.r.copyWithin(0, n); s.r.set(d.r, s.r.length - n);
    }
    s.dirty = true;
  } else if (d.type === "controls") {
    for (const [k, v] of d.value) {
      entry.state.controls.set(k, v);
      ui.ctl.get(k)?.set(v);
    }
  }
}

function draw() {
  const entry = cards.get(player.id);
  if (!entry) return;
  const ui = entry.play, s = ui.scope, cv = ui.canvas;
  if (s.dirty && cv.offsetParent) {
    s.dirty = false;
    const g = cv.getContext("2d"), W = cv.width, H = cv.height;
    g.clearRect(0, 0, W, H);
    g.strokeStyle = "rgba(255,255,255,0.06)";
    g.lineWidth = 1;
    for (const y of [0.25, 0.5, 0.75]) { g.beginPath(); g.moveTo(0, y * H); g.lineTo(W, y * H); g.stroke(); }
    const y = (v) => H * (0.5 - 0.45 * Math.max(-1.1, Math.min(1.1, v)));
    const traces = entry.spec.outputs.length > 1 ? [[s.l, "#38bdf8"], [s.r, "rgba(245,158,11,0.85)"]] : [[s.l, "#38bdf8"]];
    for (const [buf, color] of traces) {
      // the min/max envelope of each bucket, filled, and its middle line
      g.fillStyle = color;
      g.strokeStyle = color;
      let i = 0;
      while (i < SCOPE_POINTS) {
        while (i < SCOPE_POINTS && !Number.isFinite(buf[2 * i])) i += 1;
        const i0 = i;
        while (i < SCOPE_POINTS && Number.isFinite(buf[2 * i])) i += 1;
        if (i - i0 < 1) continue;
        const X = (k) => (k / (SCOPE_POINTS - 1)) * W;
        g.globalAlpha = 0.45;
        g.beginPath();
        for (let k = i0; k < i; k += 1) g.lineTo(X(k), y(buf[2 * k + 1]) - 0.75);
        for (let k = i - 1; k >= i0; k -= 1) g.lineTo(X(k), y(buf[2 * k]) + 0.75);
        g.closePath();
        g.fill();
        g.globalAlpha = 1;
        g.lineWidth = 1.5;
        g.beginPath();
        for (let k = i0; k < i; k += 1) g.lineTo(X(k), y(0.5 * (buf[2 * k] + buf[2 * k + 1])));
        g.stroke();
      }
    }
  }
  requestAnimationFrame(draw);
}

// ------------------------------------------------------------------ wiring

function main() {
  metrics();
  const sorted = [...MODELS_DATA].sort((a, b) => a.name.localeCompare(b.name, undefined, { sensitivity: "base" }));
  for (const m of sorted) {
    if (!MODELS[m.id]) { console.warn(`no drive for ${m.id}`); continue; }
    (m.category === "utilities" ? $("utilitiesGrid") : $("modelsGrid")).append(buildCard(m));
  }
  renderFilter();
  for (const entry of cards.values()) flagParams(entry);
  $("searchInput").addEventListener("input", (e) => { searchQuery = e.target.value; renderFilter(); });
  const btns = document.querySelectorAll(".cat-btn");
  btns.forEach((b) => b.addEventListener("click", () => {
    btns.forEach((x) => x.classList.remove("active"));
    b.classList.add("active");
    currentCategory = b.dataset.category;
    renderFilter();
  }));
  const master = $("master");
  const setMaster = () => {
    const db = Number(master.value);
    player.gain = 10 ** (db / 20);
    $("masterVal").textContent = `${db.toFixed(1)} dB`;
    if (player.node) player.node.port.postMessage({ type: "gain", value: player.gain });
  };
  master.addEventListener("input", setMaster);
  master.addEventListener("dblclick", () => { master.value = "-6"; setMaster(); });
  setMaster();
  // ?diagram=<id>: open that card's block diagram
  const shown = cards.get(new URLSearchParams(location.search).get("diagram"));
  if (shown) {
    shown.el.scrollIntoView({ block: "start" });
    openDiagram(shown.m.dsp, shown.m.name);
  }
  // ?play=<id>: open that card's Play drawer and start it, if the browser lets audio
  // start without a click (otherwise the Start button is there)
  const deep = new URLSearchParams(location.search).get("play");
  const entry = deep && cards.get(deep);
  if (entry) {
    toggleDrawer(entry, "play");
    entry.el.scrollIntoView({ block: "start" });
    window.scrollBy(0, -170);
    const probe = new AudioContext();
    if (probe.state === "running") start(deep);
    else entry.play.status.textContent = "press Start (the browser starts audio on a click)";
    probe.close();
  }
}

main();

// For the checks: the player, the AnalyserNode after the worklet, start/stop by card id.
window.genPlay = {
  player, cards, start, stop,
  /** Mutes (or unmutes) the speakers; the analyser still reads the signal. */
  mute(on = true) {
    player.muted = on;
    if (player.out) player.out.gain.value = on ? 0 : 1;
  },
  /** Stops the model and closes the AudioContext; the next start makes a new one. */
  async close() {
    await stop();
    if (player.ctx) await player.ctx.close();
    player.ctx = null;
  },
  /** RMS and peak of the speaker signal over the analyser's window (4096 frames), and finite or not. */
  level() {
    if (!player.analyser) return null;
    const a = new Float32Array(player.analyser.fftSize);
    player.analyser.getFloatTimeDomainData(a);
    let sq = 0, pk = 0, finite = true;
    for (const v of a) { if (!Number.isFinite(v)) finite = false; else { sq += v * v; pk = Math.max(pk, Math.abs(v)); } }
    return { rms: Math.sqrt(sq / a.length), peak: pk, finite, stats: player.stats, id: player.id };
  },
};
