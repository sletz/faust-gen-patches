// The block-diagram viewer of the catalogue page.
//
// faust-rs --svg draws a program as a set of SVG files: process.svg, and one file per
// sub-diagram folded away, linked from the box that stands for it. make web packs the
// set of every program into web/svg/<name>.json.gz, a gzipped JSON object
// {file name: SVG text} (scripts/web_svg.py). The viewer loads the pack of a program
// when its diagram is opened, shows process.svg, and follows the links itself: a click
// on a folded box opens its diagram, a click on the background goes back to the diagram
// it was opened from. The path from process is shown as a trail; each step is a button.
//
// openDiagram(name, title) opens the viewer on a program. Debug handle for the checks:
// window.genDiagram.

const SVG_DIR = "svg/";
const XLINK = "http://www.w3.org/1999/xlink";
const MAX_FIT = 3;        // px per diagram unit when the diagram is smaller than the stage
const ZOOM_STEP = 1.25;
const ZOOM_MAX = 16;

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

const packs = new Map();   // program name -> Promise<{file name: SVG text}>

async function fetchPack(name) {
  const url = `${SVG_DIR}${name}.json.gz`;
  const r = await fetch(url);
  if (!r.ok) throw new Error(`${url}: ${r.status} (run make web)`);
  const bytes = new Uint8Array(await r.arrayBuffer());
  // a server that declares the gzip encoding has the browser inflate it already
  if (bytes[0] !== 0x1f || bytes[1] !== 0x8b) return JSON.parse(new TextDecoder().decode(bytes));
  if (typeof DecompressionStream === "undefined") throw new Error("this browser has no DecompressionStream to unpack the diagrams");
  return new Response(new Blob([bytes]).stream().pipeThrough(new DecompressionStream("gzip"))).json();
}

function pack(name) {
  if (!packs.has(name)) {
    const p = fetchPack(name);
    p.catch(() => packs.delete(name));   // a failed load is tried again at the next opening
    packs.set(name, p);
  }
  return packs.get(name);
}

/** "clamp-00002b3c.svg" -> "clamp": the name faust-rs gave the diagram, without its key. */
const labelOf = (file) => file.replace(/\.svg$/, "").replace(/-[0-9a-f]{8}$/, "");
const hrefOf = (a) => a.getAttributeNS(XLINK, "href") || a.getAttribute("href") || "";

const view = {
  dialog: null, stage: null, trailEl: null, status: null, zoomVal: null, title: null, source: null,
  name: null, files: null, trail: [], svg: null, size: [1, 1], fit: 1, zoom: 1, token: 0,
};

function build() {
  const btn = (label, title, fn, cls = "") => h("button", { class: `dgm-btn ${cls}`, type: "button", title, onclick: fn }, label);
  view.title = h("span", { class: "dgm-title" });
  view.trailEl = h("nav", { class: "dgm-trail", "aria-label": "Path from process" });
  view.zoomVal = h("span", { class: "dgm-zoom" }, "fit");
  view.status = h("span", { class: "dgm-status" });
  view.source = h("a", { class: "ref-link", title: "The Faust program" }, ".dsp");
  view.stage = h("div", { class: "dgm-stage", tabindex: "0" });
  view.dialog = h("dialog", { class: "dgm" },
    h("div", { class: "dgm-head" },
      view.title,
      h("div", { class: "dgm-tools" },
        btn("←", "Back to the diagram this one was opened from (Backspace)", back, "dgm-back"),
        btn("−", "Zoom out", () => zoomBy(1 / ZOOM_STEP)),
        view.zoomVal,
        btn("+", "Zoom in", () => zoomBy(ZOOM_STEP)),
        btn("fit", "Fit the diagram to the window", () => setZoom(1)),
        btn("✕", "Close (Esc)", () => view.dialog.close(), "dgm-close"))),
    view.trailEl,
    view.stage,
    h("div", { class: "dgm-foot" },
      h("span", {}, "Dark blue boxes are folded diagrams: click one to open it, click the background to go back. Ctrl + wheel or pinch zooms, drag pans."),
      view.status, view.source));
  document.body.append(view.dialog);

  // links: a folded box opens its diagram; the background link of a sub-diagram goes back
  let dragged = false;
  view.stage.addEventListener("click", (e) => {
    const a = e.target.closest && e.target.closest("a");
    if (!a || !view.stage.contains(a)) return;
    e.preventDefault();
    if (dragged) return;
    if (a.classList.contains("dgm-up")) back();
    else open(hrefOf(a));
  });
  // drag pans the zoomed diagram; a drag is not a click
  let drag = null;
  view.stage.addEventListener("pointerdown", (e) => {
    if (e.button !== 0) return;
    dragged = false;
    drag = { x: e.clientX, y: e.clientY, left: view.stage.scrollLeft, top: view.stage.scrollTop };
  });
  view.stage.addEventListener("pointermove", (e) => {
    if (!drag) return;
    const dx = e.clientX - drag.x, dy = e.clientY - drag.y;
    if (!dragged && Math.hypot(dx, dy) < 5) return;
    if (!dragged) { dragged = true; view.stage.setPointerCapture(e.pointerId); view.stage.classList.add("dragging"); }
    view.stage.scrollLeft = drag.left - dx;
    view.stage.scrollTop = drag.top - dy;
  });
  const drop = () => { drag = null; view.stage.classList.remove("dragging"); };
  view.stage.addEventListener("pointerup", drop);
  view.stage.addEventListener("pointercancel", drop);
  // ctrl + wheel (and the trackpad pinch, which browsers send as such) zooms about the pointer
  view.stage.addEventListener("wheel", (e) => {
    if (!e.ctrlKey && !e.metaKey) return;
    e.preventDefault();
    const box = view.stage.getBoundingClientRect();
    zoomBy(Math.exp(-e.deltaY * 0.01), [e.clientX - box.left, e.clientY - box.top]);
  }, { passive: false });
  view.dialog.addEventListener("keydown", (e) => {
    if (e.key === "Backspace") { e.preventDefault(); back(); }
    else if (e.key === "+" || e.key === "=") zoomBy(ZOOM_STEP);
    else if (e.key === "-") zoomBy(1 / ZOOM_STEP);
    else if (e.key === "0") setZoom(1);
  });
  // a click on the backdrop closes
  view.dialog.addEventListener("click", (e) => { if (e.target === view.dialog) view.dialog.close(); });
  view.dialog.addEventListener("close", () => { view.token += 1; document.documentElement.classList.remove("dgm-open"); });
  window.addEventListener("resize", () => { if (view.dialog.open) layout(); });
}

/** Opens the viewer on the block diagram of web/svg/<name>.json.gz. */
export async function openDiagram(name, title) {
  if (!view.dialog) build();
  const token = ++view.token;
  view.name = name;
  view.files = null;
  view.trail = [];
  view.svg = null;
  view.title.textContent = `${title} · Faust block diagram`;
  view.source.href = `../dsp/${name}.dsp`;
  view.source.textContent = `${name}.dsp`;
  view.stage.replaceChildren(h("div", { class: "dgm-msg" }, "loading the diagrams…"));
  view.trailEl.replaceChildren();
  view.status.textContent = "";
  if (!view.dialog.open) view.dialog.showModal();
  document.documentElement.classList.add("dgm-open");
  try {
    const files = await pack(name);
    if (token !== view.token) return;     // closed, or another program opened meanwhile
    view.files = files;
    view.status.textContent = `${Object.keys(files).length} diagrams`;
    open("process.svg");
  } catch (e) {
    if (token !== view.token) return;
    console.error(e);
    view.stage.replaceChildren(h("div", { class: "dgm-msg err" }, `error: ${e.message}`));
  }
}

/** Shows a diagram of the pack: a step of the trail (the trail is cut there), or a new step. */
function open(file) {
  if (!view.files || !(file in view.files)) return;
  const at = view.trail.indexOf(file);
  if (at >= 0) view.trail.length = at + 1;
  else view.trail.push(file);
  show();
}

function back() {
  if (view.trail.length < 2) return;
  view.trail.pop();
  show();
}

function show() {
  const file = view.trail[view.trail.length - 1];
  const doc = new DOMParser().parseFromString(view.files[file], "image/svg+xml");
  const svg = doc.documentElement;
  if (svg.nodeName !== "svg") {
    view.stage.replaceChildren(h("div", { class: "dgm-msg err" }, `error: ${file} is not an SVG document`));
    return;
  }
  const vb = (svg.getAttribute("viewBox") || "").split(/[\s,]+/).map(Number);
  view.size = vb.length === 4 && vb[2] > 0 && vb[3] > 0 ? [vb[2], vb[3]] : [100, 100];
  // the first element of a sub-diagram is the link of its background to its parent
  const first = svg.firstElementChild;
  if (first && first.nodeName === "a") first.classList.add("dgm-up");
  for (const a of svg.querySelectorAll("a:not(.dgm-up)")) {
    const t = document.createElementNS("http://www.w3.org/2000/svg", "title");
    t.textContent = `open ${labelOf(hrefOf(a))}`;
    a.prepend(t);
  }
  view.svg = document.importNode(svg, true);
  view.stage.replaceChildren(view.svg);
  view.trailEl.replaceChildren(...view.trail.flatMap((f, i) => {
    const last = i === view.trail.length - 1;
    const step = h("button", { class: "dgm-step" + (last ? " current" : ""), type: "button", disabled: last, onclick: () => open(f) }, labelOf(f));
    return i ? [h("span", { class: "dgm-sep" }, "›"), step] : [step];
  }));
  view.trailEl.scrollLeft = view.trailEl.scrollWidth;
  view.dialog.querySelector(".dgm-back").disabled = view.trail.length < 2;
  view.zoom = 1;
  layout();
  view.stage.scrollTo(0, 0);
}

// The diagram at zoom 1 fits the stage (up to MAX_FIT px per unit); zoom multiplies that.
function layout() {
  if (!view.svg) return;
  const [w, hgt] = view.size;
  const cs = getComputedStyle(view.stage);
  const W = view.stage.clientWidth - parseFloat(cs.paddingLeft) - parseFloat(cs.paddingRight);
  const H = view.stage.clientHeight - parseFloat(cs.paddingTop) - parseFloat(cs.paddingBottom);
  view.fit = Math.max(0.05, Math.min(W / w, H / hgt, MAX_FIT));
  const s = view.fit * view.zoom;
  view.svg.setAttribute("width", (w * s).toFixed(1));
  view.svg.setAttribute("height", (hgt * s).toFixed(1));
  view.zoomVal.textContent = view.zoom === 1 ? "fit" : `${Math.round(100 * view.zoom)} %`;
}

function setZoom(z, about) {
  if (!view.svg) return;
  const stage = view.stage;
  const [ax, ay] = about || [stage.clientWidth / 2, stage.clientHeight / 2];
  const box = view.svg.getBoundingClientRect(), sbox = stage.getBoundingClientRect();
  // the point of the diagram under `about`, as a fraction of its size
  const fx = (sbox.left + ax - box.left) / box.width, fy = (sbox.top + ay - box.top) / box.height;
  view.zoom = Math.min(ZOOM_MAX, Math.max(1, z));
  if (Math.abs(view.zoom - 1) < 0.02) view.zoom = 1;
  layout();
  const nbox = view.svg.getBoundingClientRect();
  stage.scrollLeft += nbox.left + fx * nbox.width - (sbox.left + ax);
  stage.scrollTop += nbox.top + fy * nbox.height - (sbox.top + ay);
}

function zoomBy(f, about) {
  setZoom(view.zoom * f, about);
}

// For the checks: the state of the viewer, and its moves by file name.
window.genDiagram = {
  view, pack, open: openDiagram, go: open, back, setZoom,
  /** The file names the shown diagram links to (the folded boxes), without the link back. */
  links() {
    return view.svg ? [...new Set([...view.svg.querySelectorAll("a:not(.dgm-up)")].map(hrefOf))] : [];
  },
};
