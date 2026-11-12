# Faust ports of GEN-patches (Max Bruckert's gen~ library), checked against the gen~ exports.
#
#   make help        this text
#   make ref         build/ref/<model>: the gen~ export of every patch (ref/export, Max 9.2.1),
#                    its noise() made deterministic (scripts/patch_export.py), in ref/gen_ref.cpp
#   make test        every port against its export, sample by sample: results/results.md
#   make quick       the same on shorter renders
#   make check       every program of dsp/ compiles (faustprobe, and the C++ Faust compiler)
#   make export      ask Max to export the C++ of every gendsp again (opens Max)
#   make clean       remove build/
#
# FAUST_RS points to a faust-rs checkout with a release faustprobe
# (cargo build --release -p cranelift-ffi --bin faustprobe).

FAUST_RS ?= ../faust-rs
FAUSTPROBE ?= $(FAUST_RS)/target/release/faustprobe
FAUST ?= faust
CXX ?= c++
CXXFLAGS = -std=c++17 -O2 -ffp-contract=off
export FAUST_RS FAUSTPROBE

EXPORTS = $(basename $(notdir $(wildcard ref/export/*.cpp)))
REFS = $(addprefix build/ref/,$(EXPORTS))
GENLIB_OBJ = build/ref/genlib.o build/ref/json.o build/ref/json_builder.o

.PHONY: help ref test quick check export clean
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

build/ref/%: build/ref/%.cpp ref/gen_ref.cpp $(GENLIB_OBJ)
	$(CXX) $(CXXFLAGS) -Iref/export -Iref/export/gen_dsp -DGEN_MODEL=$* -DGEN_SRC='"../$<"' ref/gen_ref.cpp $(GENLIB_OBJ) -o $@

test: ref
	python3 scripts/test_gen.py

quick: ref
	python3 scripts/test_gen.py --quick

check:
	@for f in dsp/*.dsp; do printf "%-36s faustprobe " $$f; $(FAUSTPROBE) --double -I dsp -n 1 --in zero --quiet $$f >/dev/null && echo ok || echo FAIL; done
	@for f in dsp/*.dsp; do printf "%-36s faust      " $$f; $(FAUST) -double -I dsp $$f -o /dev/null && echo ok || echo FAIL; done

export:
	python3 scripts/export_gen.py

clean:
	rm -rf build
