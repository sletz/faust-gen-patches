// Renderer of a gen~ export, the reference of the Faust ports.
//
// Built once per model by the Makefile:
//   c++ -DGEN_MODEL=bernoulli_gate -DGEN_SRC='"build/ref/bernoulli_gate.cpp"' ref/gen_ref.cpp ...
// where build/ref/<model>.cpp is ref/export/<model>.cpp passed through
// scripts/patch_export.py (noise() call sites served from --noise).
//
//   gen_ref [--sr 48000] [--vs 64] [-n FRAMES] [--in FILE.f64] [--noise FILE.f64]
//           [--sites C0,C1,...] [--set NAME=VALUE]... [--at FRAME NAME=VALUE]...
//           [--buffer NAME=FILE.txt]... [--out FILE.f64] [--list]
//
// --in     raw float64, interleaved, one channel per gen~ input (missing: zeros)
// --noise  raw float64, interleaved; noise site k reads, on its c-th call
//          within a frame, channel base_k + c, where base_k is the sum of the
//          counts of the sites before it (--sites, default 1 per site). A site
//          called more often than its count is an error (exit 2).
// --at     a parameter change at an exact frame (the block is split there),
//          as faustprobe --at.
// --buffer the content of a Buffer the export reads without declaring it
//          (scripts/patch_export.py declares it as a GenRefBuffer): a text
//          file, one frame per line, its channels separated by spaces, `#`
//          lines ignored; stored as float32, as a Max buffer~. Without it the
//          buffer is genlib's unbound Buffer: dim 1, channels 1, a single 0.
// --out    raw float64, interleaved, one channel per gen~ output.
// --list   the parameters: name, default, min, max ("- -" without min/max);
//          the Buffer/Data names as "# buffer NAME" lines.
#include "genlib.h"
#include "genlib_exportfunctions.h"
#include "genlib_ops.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>
#include <map>
#include <algorithm>

static long __gen_frame = -1;
static std::vector<double> g_noise;
static int g_noise_ch = 0;
static std::vector<int> g_site_base, g_site_count, g_site_calls;
static long g_site_max_seen[256];

static inline void __gen_tick() {
    __gen_frame++;
    std::fill(g_site_calls.begin(), g_site_calls.end(), 0);
}
static inline t_sample __gen_noise(int k) {
    if (k >= (int)g_site_base.size()) { fprintf(stderr, "gen_ref: noise site %d not configured\n", k); exit(2); }
    int c = g_site_calls[k]++;
    if (c + 1 > g_site_max_seen[k]) g_site_max_seen[k] = c + 1;
    if (c >= g_site_count[k]) {
        fprintf(stderr, "gen_ref: noise site %d called %d times in frame %ld (--sites gives %d)\n",
                k, c + 1, __gen_frame, g_site_count[k]);
        exit(2);
    }
    int ch = g_site_base[k] + c;
    if (g_noise.empty()) return 0.;
    long nfr = (long)g_noise.size() / g_noise_ch;
    if (__gen_frame >= nfr) { fprintf(stderr, "gen_ref: noise file too short (%ld frames)\n", nfr); exit(2); }
    return g_noise[__gen_frame * g_noise_ch + ch];
}

#include "gen_ref_buffer.h"

#include GEN_SRC

namespace M = GEN_MODEL;

static std::vector<double> read_f64(const char* path) {
    FILE* f = fopen(path, "rb");
    if (!f) { perror(path); exit(1); }
    fseek(f, 0, SEEK_END); long sz = ftell(f); fseek(f, 0, SEEK_SET);
    std::vector<double> v(sz / 8);
    if (fread(v.data(), 8, v.size(), f) != v.size()) { perror(path); exit(1); }
    fclose(f);
    return v;
}

int main(int argc, char** argv) {
    double sr = 48000; long vs = 64, n = 48000;
    const char *in = 0, *noise = 0, *out = 0; bool list = false;
    std::string sites;
    std::vector<std::pair<std::string, double>> sets;
    std::vector<std::pair<long, std::pair<std::string, double>>> ats;
    std::vector<std::pair<std::string, std::string>> buffers;
    auto parse_set = [](const char* s) {
        const char* eq = strchr(s, '=');
        if (!eq) { fprintf(stderr, "gen_ref: NAME=VALUE expected, got %s\n", s); exit(1); }
        return std::make_pair(std::string(s, eq - s), atof(eq + 1));
    };
    for (int i = 1; i < argc; i++) {
        std::string a = argv[i];
        if (a == "--sr") sr = atof(argv[++i]);
        else if (a == "--vs") vs = atol(argv[++i]);
        else if (a == "-n") n = atol(argv[++i]);
        else if (a == "--in") in = argv[++i];
        else if (a == "--noise") noise = argv[++i];
        else if (a == "--sites") sites = argv[++i];
        else if (a == "--set") sets.push_back(parse_set(argv[++i]));
        else if (a == "--at") { long fr = atol(argv[++i]); ats.push_back({fr, parse_set(argv[++i])}); }
        else if (a == "--buffer") {
            const char* s = argv[++i]; const char* eq = strchr(s, '=');
            if (!eq) { fprintf(stderr, "gen_ref: --buffer NAME=FILE expected, got %s\n", s); return 1; }
            buffers.push_back({std::string(s, eq - s), std::string(eq + 1)});
        }
        else if (a == "--out") out = argv[++i];
        else if (a == "--list") list = true;
        else { fprintf(stderr, "gen_ref: unknown option %s\n", a.c_str()); return 1; }
    }
    for (auto& b : buffers) {
        auto it = gen_ref_buffers().find(b.first);
        if (it == gen_ref_buffers().end()) { fprintf(stderr, "gen_ref: the export reads no undeclared buffer %s\n", b.first.c_str()); return 1; }
        it->second->load(b.second.c_str());
    }
    CommonState* st = (CommonState*)M::create(sr, vs);
    int nin = M::num_inputs(), nout = M::num_outputs(), np = M::num_params();
    std::map<std::string, int> pidx;
    for (int p = 0; p < np; p++) pidx[M::getparametername(st, p)] = p;
    if (list) {
        printf("# inputs=%d outputs=%d noise_sites=%d\n", nin, nout, GEN_NOISE_SITES);
        for (int p = 0; p < np; p++) {
            t_param v; M::getparameter(st, p, &v);
            if (st->params[p].paramtype == GENLIB_PARAMTYPE_SYM)   // a Buffer/Data name, not a Param
                printf("# buffer %s\n", M::getparametername(st, p));
            else if (M::getparameterhasminmax(st, p))
                printf("%s %.17g %.17g %.17g\n", M::getparametername(st, p), (double)v,
                       (double)M::getparametermin(st, p), (double)M::getparametermax(st, p));
            else
                printf("%s %.17g - -\n", M::getparametername(st, p), (double)v);
        }
        return 0;
    }
    auto setp = [&](const std::string& name, double v) {
        auto it = pidx.find(name);
        if (it == pidx.end()) { fprintf(stderr, "gen_ref: no parameter %s\n", name.c_str()); exit(1); }
        M::setparameter(st, it->second, v, 0);
    };
    for (auto& s : sets) setp(s.first, s.second);

    int nsites = GEN_NOISE_SITES;
    g_site_count.assign(nsites, 1);
    if (!sites.empty()) {
        std::vector<int> c; size_t pos = 0;
        while (pos <= sites.size()) {
            size_t e = sites.find(',', pos); if (e == std::string::npos) e = sites.size();
            c.push_back(atoi(sites.substr(pos, e - pos).c_str())); pos = e + 1;
        }
        if ((int)c.size() != nsites) { fprintf(stderr, "gen_ref: --sites has %zu counts, the export has %d sites\n", c.size(), nsites); return 1; }
        g_site_count = c;
    }
    g_site_base.assign(nsites, 0); g_site_calls.assign(nsites, 0);
    int tot = 0;
    for (int k = 0; k < nsites; k++) { g_site_base[k] = tot; tot += g_site_count[k]; }
    if (noise) {
        g_noise = read_f64(noise); g_noise_ch = tot;
        if (tot == 0 || g_noise.size() % tot) { fprintf(stderr, "gen_ref: noise file does not hold %d channels\n", tot); return 1; }
    } else if (nsites > 0) {
        // no file: every site returns 0 (deterministic, but not a useful noise)
        g_noise_ch = std::max(tot, 1);
    }

    std::vector<double> inbuf;
    if (in) inbuf = read_f64(in);
    long in_frames = nin ? (long)inbuf.size() / nin : 0;
    std::vector<std::vector<t_sample>> ib(nin, std::vector<t_sample>(vs)), ob(nout, std::vector<t_sample>(vs));
    std::vector<t_sample*> ip(nin), op(nout);
    std::vector<double> outbuf((size_t)n * nout);
    std::sort(ats.begin(), ats.end(), [](auto& a, auto& b) { return a.first < b.first; });
    size_t next_at = 0;
    for (long f0 = 0; f0 < n;) {
        while (next_at < ats.size() && ats[next_at].first <= f0) { setp(ats[next_at].second.first, ats[next_at].second.second); next_at++; }
        long len = std::min(vs, n - f0);
        if (next_at < ats.size()) len = std::min(len, ats[next_at].first - f0);
        for (int c = 0; c < nin; c++) {
            for (long i = 0; i < len; i++) ib[c][i] = (f0 + i < in_frames) ? inbuf[(f0 + i) * nin + c] : 0.;
            ip[c] = ib[c].data();
        }
        for (int c = 0; c < nout; c++) op[c] = ob[c].data();
        __gen_frame = f0 - 1;
        int err = M::perform(st, ip.data(), nin, op.data(), nout, len);
        if (err) { fprintf(stderr, "gen_ref: perform error %d\n", err); return 1; }
        for (int c = 0; c < nout; c++)
            for (long i = 0; i < len; i++) outbuf[(f0 + i) * nout + c] = ob[c][i];
        f0 += len;
    }
    for (int k = 0; k < nsites; k++)
        if (g_site_max_seen[k] > 1) fprintf(stderr, "# noise site %d: up to %ld calls per frame\n", k, g_site_max_seen[k]);
    if (out) {
        FILE* f = fopen(out, "wb"); if (!f) { perror(out); return 1; }
        fwrite(outbuf.data(), 8, outbuf.size(), f); fclose(f);
    } else {
        for (long i = 0; i < std::min(n, 16L); i++) {
            printf("%ld", i);
            for (int c = 0; c < nout; c++) printf(",%.17g", outbuf[i * nout + c]);
            printf("\n");
        }
    }
    M::destroy(st);
    return 0;
}
