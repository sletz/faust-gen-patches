# Faust ports of GEN-patches (Max Bruckert's gen~ library), checked against the gen~ exports.
#
#   make help        this text
#   make ref         build/ref/<model>: the gen~ export of every patch (ref/export, Max 9.2.1),
#                    its noise() made deterministic (scripts/patch_export.py), in ref/gen_ref.cpp
#   make test        every port against its export, sample by sample: results/results.md
#   make quick       the same on shorter renders
#   make check       every program of dsp/ compiles (faustprobe, and the C++ Faust compiler)
#   make iface-check every port's controls (name, default, range), inputs and outputs against its
#                    export, and the Params no setting of the suite moves (scripts/iface_check.py)
#   make max         max/<model>.maxpat: the demo patchers of GEN-patches with the Faust ports in
#                    faustgen~ instead of gen~ (max/convert_patches.py, py2max; PY2MAX, GEN_PATCHES)
#   make max-check   the sources embedded in those patchers against dsp/, sample for sample
#   make cost        CPU cost of every model, gen~ export against Faust: results/cpu.md (a few minutes,
#                    on an idle machine)
#   make web         the web page: every program of dsp/ compiled to wasm by faust-rs (-double)
#                    into web/dsp, its block diagrams (faust-rs --svg, one packed file per
#                    program: scripts/web_svg.py) into web/svg, and web/models-data.js (the
#                    catalogue of GEN-patches' docs, GEN_PATCHES); make -B web after a faust-rs
#                    change
#   make web-check   every wasm program under node with the page's default inputs: finite, not
#                    silent; every packed diagram: process.svg there, every link resolved
#   make web-serve [WEB_PORT=8766]
#                    serve the repository; open http://127.0.0.1:WEB_PORT/web/
#   make export      ask Max to export the C++ of every gendsp again (opens Max)
#   make clean       remove build/
#
# FAUST_RS points to a faust-rs checkout with a release faustprobe
# (cargo build --release -p cranelift-ffi --bin faustprobe), and for the web page a release
# faust-rs (cargo build --release -p compiler --bin faust-rs).

FAUST_RS ?= ../faust-rs
FAUSTPROBE ?= $(FAUST_RS)/target/release/faustprobe
FAUSTRS ?= $(FAUST_RS)/target/release/faust-rs
WEB_PORT ?= 8766
FAUST ?= faust
CXX ?= c++
CXXFLAGS = -std=c++17 -O2 -ffp-contract=off
export FAUST_RS FAUSTPROBE FAUSTRS

EXPORTS = $(basename $(notdir $(wildcard ref/export/*.cpp)))
REFS = $(addprefix build/ref/,$(EXPORTS))
GENLIB_OBJ = build/ref/genlib.o build/ref/json.o build/ref/json_builder.o
WEB_WASM = $(patsubst dsp/%.dsp,web/dsp/%.wasm,$(wildcard dsp/*.dsp))
WEB_SVG = $(patsubst dsp/%.dsp,web/svg/%.json.gz,$(wildcard dsp/*.dsp))

.PHONY: help ref test quick check iface-check max max-check cost web web-check web-serve export clean
.DEFAULT_GOAL := help

help:
	@awk 'NR > 1 && !/^#/ { exit } { sub(/^# ?/, ""); print }' $(firstword $(MAKEFILE_LIST))

ref: $(REFS)

build/ref/genlib.o: ref/export/gen_dsp/genlib.cpp
	@mkdir -p build/ref
	$(CXX) $(CXXFLAGS) -Iref/export/gen_dsp -c $< -o $@
build/ref/json.o: ref/export/gen_dsp/json.c
	@mkdir -p build/ref
	$(CC) -O2 -c $< -o $@
build/ref/json_builder.o: ref/export/gen_dsp/json_builder.c
	@mkdir -p build/ref
	$(CC) -O2 -c $< -o $@

build/ref/%.cpp: ref/export/%.cpp scripts/patch_export.py
	@mkdir -p build/ref
	python3 scripts/patch_export.py $< $@

build/ref/%: build/ref/%.cpp ref/gen_ref.cpp ref/gen_ref_buffer.h $(GENLIB_OBJ)
	$(CXX) $(CXXFLAGS) -Iref -Iref/export -Iref/export/gen_dsp -DGEN_MODEL=$* -DGEN_SRC='"../$<"' ref/gen_ref.cpp $(GENLIB_OBJ) -o $@

test: ref
	python3 scripts/test_gen.py

quick: ref
	python3 scripts/test_gen.py --quick

iface-check: ref
	python3 scripts/iface_check.py

check:
	@for f in dsp/*.dsp; do printf "%-36s faustprobe " $$f; $(FAUSTPROBE) --double -I dsp -n 1 --in zero --quiet $$f >/dev/null && echo ok || echo FAIL; done
	@for f in dsp/*.dsp; do printf "%-36s faust      " $$f; $(FAUST) -double -I dsp $$f -o /dev/null && echo ok || echo FAIL; done

max:
	python3 max/convert_patches.py

max-check:
	python3 max/convert_patches.py --check

cost: ref
	python3 scripts/bench_cpu.py

web: $(WEB_WASM) $(WEB_SVG) web/models-data.js

# the JSON (inputs, outputs, controls) is written next to the module
web/dsp/%.wasm: dsp/%.dsp $(wildcard dsp/*.lib)
	@mkdir -p web/dsp
	$(FAUSTRS) -lang wasm -double -I dsp $< -o $@

# the block diagrams: the SVG files of faust-rs --svg, packed into one file per program
web/svg/%.json.gz: dsp/%.dsp $(wildcard dsp/*.lib) scripts/web_svg.py
	python3 scripts/web_svg.py $< $@

web/models-data.js: scripts/web_models.py results/results.json
	python3 scripts/web_models.py

web-check: web
	node scripts/web_check.mjs

web-serve:
	@echo "http://127.0.0.1:$(WEB_PORT)/web/"
	python3 -m http.server $(WEB_PORT) --bind 127.0.0.1

export:
	python3 scripts/export_gen.py

clean:
	rm -rf build
