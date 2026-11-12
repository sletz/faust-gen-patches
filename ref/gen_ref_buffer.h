// GenRefBuffer: a Buffer read by a gen~ export but not declared in it
// (scripts/patch_export.py declares it at namespace scope), shared by
// ref/gen_ref.cpp and tools/gen_bench.cpp. Include after genlib_ops.h.
#pragma once
#include <cstdio>
#include <cstdlib>
#include <map>
#include <string>
#include <vector>

// A Buffer read by the export but not declared in it (scripts/patch_export.py
// declares it at namespace scope): genlib's Buffer read semantics (float32
// data, dim, channels, read(i, ch)), the content given by --buffer.
struct GenRefBuffer;
static std::map<std::string, GenRefBuffer*>& gen_ref_buffers() {
    static std::map<std::string, GenRefBuffer*> m;
    return m;
}
struct GenRefBuffer : public DataInterface<float> {
    std::vector<float> store;
    explicit GenRefBuffer(const char* name) : store(1, 0.f) {
        dim = 1; channels = 1; mData = store.data();
        gen_ref_buffers()[name] = this;
    }
    void load(const char* path) {
        FILE* f = fopen(path, "r");
        if (!f) { perror(path); exit(1); }
        std::vector<float> v; long nch = -1, frames = 0;
        char line[65536];
        while (fgets(line, sizeof line, f)) {
            if (line[0] == '#') continue;
            long c = 0; char* p = line; char* e;
            for (;;) {
                double x = strtod(p, &e);
                if (e == p) break;
                v.push_back((float)x); c++; p = e;
            }
            if (c == 0) continue;
            if (nch >= 0 && c != nch) { fprintf(stderr, "GenRefBuffer: %s: frame %ld has %ld channels, not %ld\n", path, frames, c, nch); exit(1); }
            nch = c; frames++;
        }
        fclose(f);
        if (frames == 0) { fprintf(stderr, "GenRefBuffer: %s: no frame\n", path); exit(1); }
        store = v; dim = frames; channels = nch; mData = store.data();
    }
};

