// Architecture file for the CPU cost of a Faust port (faust -double -a tools/bench_arch.cpp,
// or faust-rs -lang cpp -double -a tools/bench_arch.cpp).
//
//   faust_bench <seconds> [sr] [block]
//
// Same excitation and timing as tools/gen_bench.cpp: every input gets the same
// uniform noise in [-0.5, 0.5) (32-bit LCG), controls at their defaults, only
// compute() timed.
#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include "faust/dsp/dsp.h"
#include "faust/gui/MapUI.h"
#include "faust/gui/meta.h"

<<includeIntrinsic>>
<<includeclass>>

int main(int argc, char** argv) {
    double sec = argc > 1 ? atof(argv[1]) : 10.0;
    int sr = argc > 2 ? atoi(argv[2]) : 48000;
    int bs = argc > 3 ? atoi(argv[3]) : 64;
    // on the heap: the delay lines are sized for 192 kHz, beyond the stack
    mydsp& d = *new mydsp(); MapUI ui; d.buildUserInterface(&ui); d.init(sr);
    int nin = d.getNumInputs(), nout = d.getNumOutputs();
    std::vector<std::vector<FAUSTFLOAT>> ib(nin, std::vector<FAUSTFLOAT>(bs)), ob(nout, std::vector<FAUSTFLOAT>(bs));
    std::vector<FAUSTFLOAT*> ip(nin), op(nout);
    for (int c = 0; c < nin; c++) ip[c] = ib[c].data();
    for (int c = 0; c < nout; c++) op[c] = ob[c].data();
    long n = long(sec * sr), done = 0; double dt = 0, sink = 0; uint32_t s = 12345u;
    while (done < n) {
        int k = int(std::min<long>(bs, n - done));
        for (int c = 0; c < nin; c++)
            for (int i = 0; i < k; i++) { s = s * 1664525u + 1013904223u; ib[c][i] = double(s) * (1.0 / 4294967296.0) - 0.5; }
        auto t0 = std::chrono::steady_clock::now();
        d.compute(k, ip.data(), op.data());
        dt += std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
        for (int c = 0; c < nout; c++) for (int i = 0; i < k; i++) sink += ob[c][i];
        done += k;
    }
    if (sink == 12345.678) printf(" ");
    printf("%.3f s at %d Hz in %.5f s: %.2fx real time\n", sec, sr, dt, sec / dt);
    return 0;
}
