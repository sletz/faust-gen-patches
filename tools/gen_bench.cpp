// CPU cost of a gen~ export as Max exported it (ref/export, noise() untouched).
//
//   c++ -O3 -ffp-contract=off -DGEN_MODEL=ufo -DGEN_SRC='"ufo.cpp"' tools/gen_bench.cpp ...
//   gen_bench <seconds> [sr] [block] [NAME=FILE ...]
//
// GEN_SRC is the export passed through `scripts/patch_export.py --buffers-only`,
// which declares the buffers the export reads without declaring (delays-delays'
// buf_taps), filled from NAME=FILE as gen_ref --buffer does; nothing else changes.
//
// Every input gets the same uniform noise in [-0.5, 0.5) as tools/bench_arch.cpp
// (a 32-bit LCG, filled before the timed call), parameters at their defaults;
// only perform() is timed.
#include "genlib.h"
#include "genlib_exportfunctions.h"
#include "genlib_ops.h"
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstdint>
#include <vector>
#include <cstring>
#include "gen_ref_buffer.h"
#include GEN_SRC
namespace M = GEN_MODEL;

int main(int argc, char** argv) {
    double sec = argc > 1 ? atof(argv[1]) : 10.0;
    double sr = argc > 2 ? atof(argv[2]) : 48000.0;
    int bs = argc > 3 ? atoi(argv[3]) : 64;
    for (int a = 4; a < argc; a++) {
        const char* eq = strchr(argv[a], '=');
        auto it = eq ? gen_ref_buffers().find(std::string(argv[a], eq - argv[a])) : gen_ref_buffers().end();
        if (it == gen_ref_buffers().end()) { fprintf(stderr, "gen_bench: no buffer for %s\n", argv[a]); return 1; }
        it->second->load(eq + 1);
    }
    CommonState* st = (CommonState*)M::create(sr, bs);
    int nin = M::num_inputs(), nout = M::num_outputs();
    std::vector<std::vector<t_sample>> ib(nin, std::vector<t_sample>(bs)), ob(nout, std::vector<t_sample>(bs));
    std::vector<t_sample*> ip(nin), op(nout);
    for (int c = 0; c < nin; c++) ip[c] = ib[c].data();
    for (int c = 0; c < nout; c++) op[c] = ob[c].data();
    long n = long(sec * sr), done = 0; double dt = 0, sink = 0; uint32_t s = 12345u;
    while (done < n) {
        int k = int(std::min<long>(bs, n - done));
        for (int c = 0; c < nin; c++)
            for (int i = 0; i < k; i++) { s = s * 1664525u + 1013904223u; ib[c][i] = double(s) * (1.0 / 4294967296.0) - 0.5; }
        auto t0 = std::chrono::steady_clock::now();
        M::perform(st, ip.data(), nin, op.data(), nout, k);
        dt += std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
        for (int c = 0; c < nout; c++) for (int i = 0; i < k; i++) sink += ob[c][i];
        done += k;
    }
    if (sink == 12345.678) printf(" ");
    printf("%.3f s at %g Hz in %.5f s: %.2fx real time\n", sec, sr, dt, sec / dt);
    return 0;
}
