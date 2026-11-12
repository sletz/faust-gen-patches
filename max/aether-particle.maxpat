{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "boxes": [
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        24.0,
                        141.0,
                        35.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "patching_rect": [
                        423.0,
                        300.0,
                        80.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "scale 0 2 0. 1"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "live.tab",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        423.0,
                        269.0,
                        141.76287972927094,
                        23.7724586725235
                    ],
                    "fontsize": 12.0,
                    "num_lines_patching": 1,
                    "num_lines_presentation": 0,
                    "outlettype": [
                        "",
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "cos",
                                "smooth",
                                "square"
                            ],
                            "parameter_longname": "live.tab",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.tab",
                            "parameter_type": 2,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "live.tab"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        415.0,
                        112.0,
                        24.0,
                        24.0
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        167.0,
                        400.0,
                        21.0,
                        108.0
                    ],
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        24.0,
                        179.0,
                        195.0,
                        58.0
                    ],
                    "clipheight": 57.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "drumLoop.aif",
                                "filename": "drumLoop.aif",
                                "filekind": "audiofile",
                                "id": "u228009932",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            }
                        ]
                    },
                    "mode": "basic",
                    "outlettype": [
                        "signal",
                        "signal",
                        "signal",
                        "",
                        "dictionary"
                    ],
                    "parameter_enable": 0,
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        36.0,
                        410.0,
                        47.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "clearall"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        9.0,
                        54.0,
                        331.0,
                        27.0
                    ],
                    "fontsize": 18.0,
                    "text": "granulator with a twist and a FDN reverb"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        9.0,
                        2.0,
                        237.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "aether particle"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        36.0,
                        434.0,
                        70.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        190.0,
                        549.0,
                        45.0,
                        45.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        36.0,
                        468.0,
                        100.0,
                        40.0
                    ],
                    "outlettype": [
                        "preset",
                        "int",
                        "preset",
                        "int",
                        ""
                    ],
                    "preset_data": [
                        {
                            "number": 1,
                            "data": [
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-13",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                99.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-20",
                                "flonum",
                                "float",
                                71.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-27",
                                "flonum",
                                "float",
                                0.5000000000000001,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-30",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-32",
                                "live.tab",
                                "float",
                                0.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                19.0,
                                5,
                                "obj-29",
                                "flonum",
                                "float",
                                81.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                87.0,
                                5,
                                "obj-35",
                                "flonum",
                                "float",
                                8.0,
                                5,
                                "obj-36",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-37",
                                "flonum",
                                "float",
                                0.1,
                                5,
                                "obj-38",
                                "flonum",
                                "float",
                                0.2
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                300.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-13",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-20",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-27",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-30",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-32",
                                "live.tab",
                                "float",
                                0.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                25.0,
                                5,
                                "obj-29",
                                "flonum",
                                "float",
                                51.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                94.0,
                                5,
                                "obj-35",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-36",
                                "flonum",
                                "float",
                                4.0,
                                5,
                                "obj-37",
                                "flonum",
                                "float",
                                0.30000000000000004,
                                5,
                                "obj-38",
                                "flonum",
                                "float",
                                0.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                300.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-13",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-20",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-27",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-30",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-32",
                                "live.tab",
                                "float",
                                2.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-29",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                94.0,
                                5,
                                "obj-35",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-36",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-37",
                                "flonum",
                                "float",
                                0.30000000000000004,
                                5,
                                "obj-38",
                                "flonum",
                                "float",
                                0.45
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-13",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-20",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-27",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-30",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-32",
                                "live.tab",
                                "float",
                                0.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-29",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                99.0,
                                5,
                                "obj-35",
                                "flonum",
                                "float",
                                18.0,
                                5,
                                "obj-36",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-37",
                                "flonum",
                                "float",
                                0.1,
                                5,
                                "obj-38",
                                "flonum",
                                "float",
                                -0.10000000000000002
                            ]
                        },
                        {
                            "number": 5,
                            "data": [
                                5,
                                "obj-2",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-13",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-23",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-22",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-20",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                5.0,
                                5,
                                "obj-24",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-27",
                                "flonum",
                                "float",
                                0.5,
                                5,
                                "obj-21",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-30",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-31",
                                "flonum",
                                "float",
                                15.0,
                                5,
                                "obj-32",
                                "live.tab",
                                "float",
                                1.0,
                                5,
                                "obj-25",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-29",
                                "flonum",
                                "float",
                                49.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                98.0,
                                5,
                                "obj-35",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-36",
                                "flonum",
                                "float",
                                3.0,
                                5,
                                "obj-37",
                                "flonum",
                                "float",
                                0.1,
                                5,
                                "obj-38",
                                "flonum",
                                "float",
                                0.2
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        144.0,
                        400.0,
                        21.0,
                        108.0
                    ],
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        190.0,
                        395.0,
                        48.0,
                        136.0
                    ],
                    "lastchannelcount": 0,
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        "float",
                        "list"
                    ],
                    "parameter_enable": 1,
                    "relative": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                -70.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "live.gain~",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "patching_rect": [
                        24.0,
                        316.0,
                        151.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "sourcecode": "// aether-particle: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/aether-particle.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// AETHER-PARTICLE: granular microsound cloud and 4x4 Hadamard FDN (gen~: gendsp/aether-particle.gendsp)\n//\n// The input (plus the grain cloud fed back through tanh, dcblocked) is\n// written into a 20 s ring buffer per channel. A clock of `g_density` Hz,\n// jittered by a Box-Muller Gaussian (`g_std_density` %), fires grains with\n// probability `g_prob`; each fire takes the first free of 4 voices, with a\n// Gaussian duration (`g_size` +- `g_std_size` ms), a read position `g_pos` %\n// behind the write head (+- `g_std_pos`), a right-channel skew (`g_skew`),\n// and, with probability `g_crush`, a sample-and-hold of 2..81 samples. Each\n// voice reads at speed `g_pitch` (no interpolation) under a window that\n// morphs from perc (0) through spline (0.5) to trapezoid (1) (`g_window`).\n// The cloud goes through a 10 ms predelay, two slid allpasses and a 4x4\n// Hadamard FDN (sizes `r_size`, sine-modulated by `r_speed`/`r_depth`,\n// feedback `r_decay` through tanh, damping `r_absorb`, dcblocked), a tilt\n// (`r_tilt`), then the dry/grain/reverb mixes (`g_mix`, `r_mix`), `gainout`,\n// a DC blocker and tanh.\n//\n// in1, in2: audio L, R     out1, out2: processed L, R\n//\n// Parameters: gainout (-60..12 dB), clear, freeze (0/1), g_mix, g_prob\n// (0..100 %), g_density (0.001..60 Hz), g_std_density, g_pos, g_std_pos\n// (0..100 %), g_size (2..2000 ms), g_std_size (0..1000 ms), g_pitch (-4..4),\n// g_window (0..1), g_crush, g_regen, g_skew (0..100 %), r_mix (0..100 %),\n// r_size (0.5..100 %), r_decay (0..110 %), r_absorb (0..100 %), r_tilt (-1..1),\n// r_speed (0.1..10 Hz), r_depth (0..20).\n//\n// gen~ quirks kept: `freeze` and `clear` both write zeros at the write head\n// (neither holds nor flushes the buffer at once: the buffer empties over 20 s);\n// get_window's guard `if (p < 0 || p >= 1) return 0` is absent from the\n// export (harmless: a voice only runs while tmr < dur).\n//\n// Noise sites (export order): 0 the g_prob trial, 1 the g_crush trial, 2 the\n// crush factor, 3 and 4 box_muller's u1 and u2, called twice per firing frame\n// (the density jitter, then the grain Gaussian).\n\ndeclare name \"aether-particle\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\nma = library(\"maths.lib\");\nsi = library(\"signals.lib\");\n\ngainout = hslider(\"gainout [unit:dB]\", 0, -60, 12, 0.01);\nclear = hslider(\"clear\", 0, 0, 1, 1);\nfreeze = hslider(\"freeze\", 0, 0, 1, 1);\ng_mix = hslider(\"g_mix [unit:%]\", 50, 0, 100, 0.01);\ng_prob = hslider(\"g_prob [unit:%]\", 100, 0, 100, 0.01);\ng_density = hslider(\"g_density [unit:Hz]\", 4, 0.001, 60, 0.001);\ng_std_density = hslider(\"g_std_density [unit:%]\", 20, 0, 100, 0.01);\ng_pos = hslider(\"g_pos [unit:%]\", 10, 0, 100, 0.01);\ng_std_pos = hslider(\"g_std_pos [unit:%]\", 5, 0, 100, 0.01);\ng_size = hslider(\"g_size [unit:ms]\", 200, 2, 2000, 0.01);\ng_std_size = hslider(\"g_std_size [unit:ms]\", 50, 0, 1000, 0.01);\ng_pitch = hslider(\"g_pitch\", 1, -4, 4, 0.001);\ng_window = hslider(\"g_window\", 0.5, 0, 1, 0.001);\ng_crush = hslider(\"g_crush [unit:%]\", 30, 0, 100, 0.01);\ng_regen = hslider(\"g_regen [unit:%]\", 40, 0, 100, 0.01);\ng_skew = hslider(\"g_skew [unit:%]\", 0, 0, 100, 0.01);\nr_mix = hslider(\"r_mix [unit:%]\", 40, 0, 100, 0.01);\nr_size = hslider(\"r_size [unit:%]\", 50, 0.5, 100, 0.01);\nr_decay = hslider(\"r_decay [unit:%]\", 60, 0, 110, 0.01);\nr_absorb = hslider(\"r_absorb [unit:%]\", 40, 0, 100, 0.01);\nr_tilt = hslider(\"r_tilt\", 0, -1, 1, 0.001);\nr_speed = hslider(\"r_speed [unit:Hz]\", 1, 0.1, 10, 0.001);\nr_depth = hslider(\"r_depth\", 2, 0, 20, 0.001);\n\n// the export's inlined clamp: (v <= lo) ? lo : ((v >= hi) ? hi : v)\ntclamp = g.clip;\n\n// ---------------------------------------------------------------- grains\nBUFMAX = 20 * 192000;           // compile-time bound of dim\ndim = int(ma.SR * 20);          // Data g_bufferL(samplerate * 20)\nhw = (+(1) : g.wrap(0, dim)) ~ _;   // h_g_write after its increment\nwn = hw';                           // the slot poked this frame\n\nbox_muller(na, nb) = sqrt((-2) * log(u1)) * cos(u2)\nwith {\n    u1 = tclamp(0.0001, 1, abs(na));\n    u2 = nb * 3.1415926535897931;\n};\n\nget_window(p, shape) = select2(shape < 0.5, g.mix(spline, trap, (shape - 0.5) * 2), g.mix(perc, spline, shape * 2))\nwith {\n    tri = 1 - abs((p * 2) - 1);\n    spline = (3 * g.safepow(tri, 2)) - (2 * g.safepow(tri, 3));\n    perc = g.safepow(tri, 4);\n    trap = tclamp(0, 1, tri * 3);\n};\n\n// one voice: from its states of the previous frame (d: fed back) and the\n// firing of this frame (set), its new states and what the audio part needs\nvoice(set, d, p_st, cr, skw, tmrd, durd, ptrd, crshd, skd, cntd) = environment {\n    tmr_p = g.init(999999, tmrd);\n    dur_p = g.init(100, durd);\n    ptr_p = ptrd;\n    crsh_p = g.init(1, crshd);\n    tmr0 = select2(set, tmr_p, 0);\n    dur = select2(set, dur_p, d);\n    ptr0 = select2(set, ptr_p, p_st);\n    crsh = select2(set, crsh_p, cr);\n    sk = select2(set, skd, skw);\n    cnt0 = select2(set, cntd, 0);\n    active = tmr0 < dur;\n    ptr = select2(active, ptr0, g.wrap(0, dim, ptr0 + g_pitch));\n    cnt1 = cnt0 + 1;\n    upd = active & (cnt1 >= crsh);\n    cnt = select2(active, cnt0, select2(upd, cnt1, 0));\n    tmr = select2(active, tmr0, tmr0 + 1);\n    w_env = get_window(g.safediv(tmr0, dur), g_window);\n    idxL = ptr;\n    idxR = g.wrap(0, dim, ptr - sk);\n};\n\n// the scheduler and the 4 voices: 26 states (clock, next, then tmr, dur,\n// ptr, crsh, sk, cnt per voice), outputs per voice: active, upd, idxL, idxR, w_env\nctrl(n0, n1, n2, n3a, n3b, n4a, n4b) = (body ~ si.bus(26)) : si.block(26), si.bus(20)\nwith {\n    body(clockd, nextd,\n         t1, du1, p1, c1, s1, k1, t2, du2, p2, c2, s2, k2,\n         t3, du3, p3, c3, s3, k3, t4, du4, p4, c4, s4, k4) =\n        clock, next,\n        V1.tmr, V1.dur, V1.ptr, V1.crsh, V1.sk, V1.cnt,\n        V2.tmr, V2.dur, V2.ptr, V2.crsh, V2.sk, V2.cnt,\n        V3.tmr, V3.dur, V3.ptr, V3.crsh, V3.sk, V3.cnt,\n        V4.tmr, V4.dur, V4.ptr, V4.crsh, V4.sk, V4.cnt,\n        V1.active, V1.upd, V1.idxL, V1.idxR, V1.w_env,\n        V2.active, V2.upd, V2.idxL, V2.idxR, V2.w_env,\n        V3.active, V3.upd, V3.idxL, V3.idxR, V3.w_env,\n        V4.active, V4.upd, V4.idxL, V4.idxR, V4.w_env\n    with {\n        next_p = g.init(1, nextd);\n        clock1 = clockd + 1;\n        fire = clock1 >= next_p;\n        clock = select2(fire, clock1, 0);\n        bp = g.safediv(ma.SR, select2(g_density < 0.001, g_density, 0.001));\n        jt = 1 + (box_muller(n3a, n4a) * (g_std_density * 0.01));\n        next = select2(fire, next_p, tclamp(40, int(ma.SR * 5), bp * jt));\n        trial = fire & (((n0 * 0.5) + 0.5) < (g_prob * 0.01));\n        free1 = g.init(999999, t1) >= g.init(100, du1);\n        free2 = g.init(999999, t2) >= g.init(100, du2);\n        free3 = g.init(999999, t3) >= g.init(100, du3);\n        free4 = g.init(999999, t4) >= g.init(100, du4);\n        v_idx = select2(free1, select2(free2, select2(free3, select2(free4, 0, 4), 3), 2), 1);\n        go = trial & (v_idx > 0);\n        gauss = box_muller(n3b, n4b);\n        maxa = g_size + (gauss * g_std_size);\n        d = select2(maxa < 1, maxa, 1) * (ma.SR * 0.001);\n        ms = dim;\n        v103 = ((g_pos * 0.01) * ms) + (((gauss * (g_std_pos * 0.01)) * ms) * 0.2);\n        off = tclamp(10, (ms - d) - 100, v103);\n        skw = (g.safepow(g_skew * 0.01, 3) * 1000) * (ma.SR * 0.001);\n        cr = select2(((n1 * 0.5) + 0.5) < (g_crush * 0.01), 1, floor(abs(n2) * 80) + 2);\n        p_st = g.wrap(0, ms, hw - off);\n        V1 = voice(go & (v_idx == 1), d, p_st, cr, skw, t1, du1, p1, c1, s1, k1);\n        V2 = voice(go & (v_idx == 2), d, p_st, cr, skw, t2, du2, p2, c2, s2, k2);\n        V3 = voice(go & (v_idx == 3), d, p_st, cr, skw, t3, du3, p3, c3, s3, k3);\n        V4 = voice(go & (v_idx == 4), d, p_st, cr, skw, t4, du4, p4, c4, s4, k4);\n    };\n};\n\n// peek(buf, idx) after this frame's poke: the slot j holds x@((wn - j) mod dim)\npeek(x, idx) = select2((j >= dim) | (j < 0), x @ max(0, min(BUFMAX, k)), 0)\nwith {\n    j = int(floor(idx));\n    kk = wn - j;\n    k = select2(kk < 0, kk, kk + dim);\n};\n\n// the audio part of a voice: sample-and-hold of the buffer, windowed\nvout(xL, xR, active, upd, idxL, idxR, w_env) = oL, oR\nwith {\n    sL = (\\(s).(select2(upd, s, peek(xL, idxL)))) ~ _;\n    sR = (\\(s).(select2(upd, s, peek(xR, idxR)))) ~ _;\n    oL = select2(active, 0, sL * w_env);\n    oR = select2(active, 0, sR * w_env);\n};\n\nis_clearing = clear > 0.5;\nfb_g = select2(is_clearing, g_regen * 0.01, 0);\ncond_in = (freeze > 0.5) | is_clearing;\n\n// grains(in1, in2, the 20 voice signals): wet_granL, wet_granR\ngrains(in1, in2, a1, u1, l1, r1, w1, a2, u2, l2, r2, w2, a3, u3, l3, r3, w3, a4, u4, l4, r4, w4) =\n    (loop ~ (_, _)) : !, !, _, _\nwith {\n    loop(fbLd, fbRd) = g.fixdenorm(wet_granL), g.fixdenorm(wet_granR), wet_granL, wet_granR\n    with {\n        in_effL = select2(cond_in, g.dcblock(in1 + ma.tanh(fbLd * fb_g)), 0);\n        in_effR = select2(cond_in, g.dcblock(in2 + ma.tanh(fbRd * fb_g)), 0);\n        o1 = vout(in_effL, in_effR, a1, u1, l1, r1, w1);\n        o2 = vout(in_effL, in_effR, a2, u2, l2, r2, w2);\n        o3 = vout(in_effL, in_effR, a3, u3, l3, r3, w3);\n        o4 = vout(in_effL, in_effR, a4, u4, l4, r4, w4);\n        wet_granL = ((((o1 : _, !) + (o2 : _, !)) + (o3 : _, !)) + (o4 : _, !)) * 0.5;\n        wet_granR = ((((o1 : !, _) + (o2 : !, _)) + (o3 : !, _)) + (o4 : !, _)) * 0.5;\n    };\n};\n\n// ---------------------------------------------------------------- reverb\nrs_size = (\\(s).(g.fixdenorm(s + (1.0 / 2000) * ((r_size * 0.01) - s)))) ~ _;\nrh_ph = (\\(p).(g.wrap(0, 1, p + g.safediv(r_speed, ma.SR)))) ~ _;\nrlfo = sin(rh_ph * 6.2831853071795862) * (r_depth * 5);\nrt1 = tclamp(10, 14000, (1531 * rs_size) + rlfo);\nrt2 = tclamp(10, 14000, (2237 * rs_size) - rlfo);\nrt3 = tclamp(10, 14000, (3163 * rs_size) + rlfo);\nrt4 = tclamp(10, 14000, (4453 * rs_size) - rlfo);\n\n// allpass on a Delay of 2000 read (linear) at D before and after its write\nrap(D, x) = g.rd_linear(2000, 2000, 0, v, D) + v * 0.6\nwith { v = (\\(vd).(x - g.rd_linear_fb(2000, 2000, vd, D) * 0.6)) ~ _; };\n\nlp1(a, x) = (\\(h).(g.mix(x, h, a))) ~ _;\n\nrfb = r_decay * 0.01;\nrdamp = r_absorb * 0.01;\n\n// the FDN: outputs rr1..rr4\nfdn(r_diff_in) = (loop ~ si.bus(4)) : si.block(4), si.bus(4)\nwith {\n    loop(w1d, w2d, w3d, w4d) = w(rh1), w(rh2), w(rh3), w(rh4), rr1, rr2, rr3, rr4\n    with {\n        rr1 = g.rd_linear_fb(15000, 15000, w1d, rt1);\n        rr2 = g.rd_linear_fb(15000, 15000, w2d, rt2);\n        rr3 = g.rd_linear_fb(15000, 15000, w3d, rt3);\n        rr4 = g.rd_linear_fb(15000, 15000, w4d, rt4);\n        rh1 = lp1(rdamp, (((rr1 + rr2) + rr3) + rr4) * 0.5);\n        rh2 = lp1(rdamp, (((rr1 - rr2) + rr3) - rr4) * 0.5);\n        rh3 = lp1(rdamp, (((rr1 + rr2) - rr3) - rr4) * 0.5);\n        rh4 = lp1(rdamp, (((rr1 - rr2) - rr3) + rr4) * 0.5);\n        w(rh) = g.fixdenorm(g.dcblock(r_diff_in + ma.tanh(rh * rfb)));\n    };\n};\n\ntilt(rraw) = select2(r_tilt < 0, g.mix(rraw, rraw - rt_lp, r_tilt), g.mix(rraw, rt_lp, abs(r_tilt)))\nwith { rt_lp = lp1(0.1, rraw); };\n\nreverb(r_in) = rresL, rresR\nwith {\n    r_pre = g.rd_linear(9600, 9600, 1, r_in, 10 * (ma.SR * 0.001));\n    r_diff_in = r_pre : rap(400 * rs_size) : rap(600 * rs_size);\n    rr = fdn(r_diff_in);\n    rr1 = rr : _, !, !, !;\n    rr2 = rr : !, _, !, !;\n    rr3 = rr : !, !, _, !;\n    rr4 = rr : !, !, !, _;\n    rresL = tilt((rr1 + rr3) * 0.5);\n    rresR = tilt((rr2 + rr4) * 0.5);\n};\n\n// ---------------------------------------------------------------- output\ndcout(x) = (x - x') : (+ ~ *(0.995));\n\nparticle(in1, in2, n0, n1, n2, n3a, n3b, n4a, n4b) = out1, out2\nwith {\n    wg = (in1, in2, ctrl(n0, n1, n2, n3a, n3b, n4a, n4b)) : grains;\n    wet_granL = wg : _, !;\n    wet_granR = wg : !, _;\n    rv = reverb((wet_granL + wet_granR) * 0.5);\n    rresL = rv : _, !;\n    rresR = rv : !, _;\n    finalL = g.mix(g.mix(in1, wet_granL, g_mix * 0.01), rresL, r_mix * 0.01) * g.dbtoa(gainout);\n    finalR = g.mix(g.mix(in2, wet_granR, g_mix * 0.01), rresR, r_mix * 0.01) * g.dbtoa(gainout);\n    out1 = ma.tanh(dcout(finalL));\n    out2 = ma.tanh(dcout(finalR));\n};\n\nprocess(in1, in2) = particle(in1, in2, g.noises(7, 0), g.noises(7, 1), g.noises(7, 2),\n                             g.noises(7, 3), g.noises(7, 4), g.noises(7, 5), g.noises(7, 6));\n// in1, in2, then noise site 0, 1, 2, site 3 (2 calls), site 4 (2 calls)\ndet = particle;\n",
                    "sourcecode_size": 24415,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_aether_particle"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        224.0,
                        346.0,
                        60,
                        22
                    ],
                    "text": "loadbang",
                    "outlettype": [
                        "bang"
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        141.0,
                        65.0,
                        22.0
                    ],
                    "text": "g_pitch"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        328.0,
                        141.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -4.0,
                    "maximum": 4.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        328.0,
                        165.0,
                        120,
                        22
                    ],
                    "text": "prepend g_pitch",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        453.0,
                        165.0,
                        90,
                        22
                    ],
                    "text": "set 1.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        415.0,
                        167.0,
                        86.0,
                        22.0
                    ],
                    "text": "g_std_size (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        501.0,
                        167.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1000.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        501.0,
                        191.0,
                        120,
                        22
                    ],
                    "text": "prepend g_std_size",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        626.0,
                        191.0,
                        90,
                        22
                    ],
                    "text": "set 50.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        415.0,
                        191.0,
                        100.0,
                        22.0
                    ],
                    "text": "g_std_density (%)"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        515.0,
                        191.0,
                        50.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        515.0,
                        215.0,
                        120,
                        22
                    ],
                    "text": "prepend g_std_density",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        640.0,
                        215.0,
                        90,
                        22
                    ],
                    "text": "set 20.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        113.0,
                        60.0,
                        22.0
                    ],
                    "text": "g_mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        323.0,
                        113.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        137.0,
                        120,
                        22
                    ],
                    "text": "prepend g_mix",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        448.0,
                        137.0,
                        90,
                        22
                    ],
                    "text": "set 50.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        325.0,
                        65.0,
                        22.0
                    ],
                    "text": "g_regen (%)"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        328.0,
                        325.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        328.0,
                        349.0,
                        120,
                        22
                    ],
                    "text": "prepend g_regen",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        453.0,
                        349.0,
                        90,
                        22
                    ],
                    "text": "set 40.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        384.0,
                        65.0,
                        22.0
                    ],
                    "text": "gainout (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        328.0,
                        384.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -60.0,
                    "maximum": 12.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        328.0,
                        408.0,
                        120,
                        22
                    ],
                    "text": "prepend gainout",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        453.0,
                        408.0,
                        90,
                        22
                    ],
                    "text": "set 0.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        191.0,
                        79.0,
                        22.0
                    ],
                    "text": "g_density (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        342.0,
                        191.0,
                        71.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.001,
                    "maximum": 60.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        342.0,
                        215.0,
                        120,
                        22
                    ],
                    "text": "prepend g_density",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        467.0,
                        215.0,
                        90,
                        22
                    ],
                    "text": "set 4.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        263.0,
                        60.0,
                        22.0
                    ],
                    "text": "g_skew (%)"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        323.0,
                        263.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        287.0,
                        120,
                        22
                    ],
                    "text": "prepend g_skew",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        448.0,
                        287.0,
                        90,
                        22
                    ],
                    "text": "set 0.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        415.0,
                        239.0,
                        79.0,
                        22.0
                    ],
                    "text": "g_std_pos (%)"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        494.0,
                        239.0,
                        71.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        494.0,
                        263.0,
                        120,
                        22
                    ],
                    "text": "prepend g_std_pos",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        619.0,
                        263.0,
                        90,
                        22
                    ],
                    "text": "set 5.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        419.0,
                        60.0,
                        22.0
                    ],
                    "text": "r_mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        323.0,
                        419.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.11764705882352941,
                        0.3333333333333333,
                        0.20392156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        443.0,
                        120,
                        22
                    ],
                    "text": "prepend r_mix",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        448.0,
                        443.0,
                        90,
                        22
                    ],
                    "text": "set 40.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        287.0,
                        72.0,
                        22.0
                    ],
                    "text": "g_window"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        335.0,
                        287.0,
                        78.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        335.0,
                        311.0,
                        120,
                        22
                    ],
                    "text": "prepend g_window",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        460.0,
                        311.0,
                        90,
                        22
                    ],
                    "text": "set 0.5",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        443.0,
                        60.0,
                        22.0
                    ],
                    "text": "r_size (%)"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        323.0,
                        443.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.5,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.11764705882352941,
                        0.3333333333333333,
                        0.20392156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        467.0,
                        120,
                        22
                    ],
                    "text": "prepend r_size",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        448.0,
                        467.0,
                        90,
                        22
                    ],
                    "text": "set 50.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        167.0,
                        60.0,
                        22.0
                    ],
                    "text": "g_size (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        323.0,
                        167.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 2.0,
                    "maximum": 2000.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        191.0,
                        120,
                        22
                    ],
                    "text": "prepend g_size",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        448.0,
                        191.0,
                        90,
                        22
                    ],
                    "text": "set 200.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        415.0,
                        141.0,
                        60.0,
                        22.0
                    ],
                    "text": "freeze"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        475.0,
                        141.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        475.0,
                        165.0,
                        120,
                        22
                    ],
                    "text": "prepend freeze",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        600.0,
                        165.0,
                        90,
                        22
                    ],
                    "text": "set 0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        215.0,
                        60.0,
                        22.0
                    ],
                    "text": "g_prob (%)"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        323.0,
                        215.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        239.0,
                        120,
                        22
                    ],
                    "text": "prepend g_prob",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        448.0,
                        239.0,
                        90,
                        22
                    ],
                    "text": "set 100.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        467.0,
                        65.0,
                        22.0
                    ],
                    "text": "r_decay (%)"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        328.0,
                        467.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 110.0,
                    "bgcolor": [
                        0.11764705882352941,
                        0.3333333333333333,
                        0.20392156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        328.0,
                        491.0,
                        120,
                        22
                    ],
                    "text": "prepend r_decay",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        453.0,
                        491.0,
                        90,
                        22
                    ],
                    "text": "set 60.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        491.0,
                        72.0,
                        22.0
                    ],
                    "text": "r_absorb (%)"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        335.0,
                        491.0,
                        78.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.11764705882352941,
                        0.3333333333333333,
                        0.20392156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        335.0,
                        515.0,
                        120,
                        22
                    ],
                    "text": "prepend r_absorb",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        460.0,
                        515.0,
                        90,
                        22
                    ],
                    "text": "set 40.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        539.0,
                        65.0,
                        22.0
                    ],
                    "text": "r_depth"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        328.0,
                        539.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 20.0,
                    "bgcolor": [
                        0.11764705882352941,
                        0.3333333333333333,
                        0.20392156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        328.0,
                        563.0,
                        120,
                        22
                    ],
                    "text": "prepend r_depth",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        453.0,
                        563.0,
                        90,
                        22
                    ],
                    "text": "set 2.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        563.0,
                        65.0,
                        22.0
                    ],
                    "text": "r_speed (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        328.0,
                        563.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.1,
                    "maximum": 10.0,
                    "bgcolor": [
                        0.11764705882352941,
                        0.3333333333333333,
                        0.20392156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        328.0,
                        587.0,
                        120,
                        22
                    ],
                    "text": "prepend r_speed",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        453.0,
                        587.0,
                        90,
                        22
                    ],
                    "text": "set 1.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        515.0,
                        60.0,
                        22.0
                    ],
                    "text": "r_tilt"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        323.0,
                        515.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -1.0,
                    "maximum": 1.0,
                    "bgcolor": [
                        0.11764705882352941,
                        0.3333333333333333,
                        0.20392156862745098,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        539.0,
                        120,
                        22
                    ],
                    "text": "prepend r_tilt",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        448.0,
                        539.0,
                        90,
                        22
                    ],
                    "text": "set 0.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        350.0,
                        65.0,
                        22.0
                    ],
                    "text": "g_crush (%)"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        328.0,
                        350.0,
                        85.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        328.0,
                        374.0,
                        120,
                        22
                    ],
                    "text": "prepend g_crush",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        453.0,
                        374.0,
                        90,
                        22
                    ],
                    "text": "set 30.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        263.0,
                        239.0,
                        60.0,
                        22.0
                    ],
                    "text": "g_pos (%)"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        323.0,
                        239.0,
                        90.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 100.0,
                    "bgcolor": [
                        0.09803921568627451,
                        0.12941176470588237,
                        0.2784313725490196,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        323.0,
                        263.0,
                        120,
                        22
                    ],
                    "text": "prepend g_pos",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        448.0,
                        263.0,
                        90,
                        22
                    ],
                    "text": "set 10.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        24.0,
                        268.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen aether-particle replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/aether-particle.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/aether-particle.maxpat.",
                    "textcolor": [
                        0.6,
                        0.1,
                        0.1,
                        1.0
                    ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "obj-1",
                        1
                    ],
                    "destination": [
                        "obj-10",
                        1
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-1",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-1",
                        0
                    ],
                    "destination": [
                        "obj-12",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-1",
                        1
                    ],
                    "destination": [
                        "obj-4",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-10",
                        1
                    ],
                    "destination": [
                        "obj-14",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-10",
                        0
                    ],
                    "destination": [
                        "obj-14",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-11",
                        0
                    ],
                    "destination": [
                        "obj-18",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-15",
                        0
                    ],
                    "destination": [
                        "obj-7",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-17",
                        0
                    ],
                    "destination": [
                        "obj-18",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-18",
                        2
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-18",
                        2
                    ],
                    "destination": [
                        "obj-7",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-32",
                        0
                    ],
                    "destination": [
                        "obj-33",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-7",
                        1
                    ],
                    "destination": [
                        "obj-1",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-7",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-13",
                        0
                    ],
                    "destination": [
                        "obj-41",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-41",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-42",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-42",
                        0
                    ],
                    "destination": [
                        "obj-13",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-16",
                        0
                    ],
                    "destination": [
                        "obj-44",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-44",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-45",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-45",
                        0
                    ],
                    "destination": [
                        "obj-16",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-19",
                        0
                    ],
                    "destination": [
                        "obj-47",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-47",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-48",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-48",
                        0
                    ],
                    "destination": [
                        "obj-19",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-2",
                        0
                    ],
                    "destination": [
                        "obj-50",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-50",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-51",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-51",
                        0
                    ],
                    "destination": [
                        "obj-2",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-20",
                        0
                    ],
                    "destination": [
                        "obj-53",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-53",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-54",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-54",
                        0
                    ],
                    "destination": [
                        "obj-20",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-21",
                        0
                    ],
                    "destination": [
                        "obj-56",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-56",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-57",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-57",
                        0
                    ],
                    "destination": [
                        "obj-21",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-22",
                        0
                    ],
                    "destination": [
                        "obj-59",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-59",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-60",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-60",
                        0
                    ],
                    "destination": [
                        "obj-22",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-23",
                        0
                    ],
                    "destination": [
                        "obj-62",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-62",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-63",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-63",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-24",
                        0
                    ],
                    "destination": [
                        "obj-65",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-65",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-66",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-66",
                        0
                    ],
                    "destination": [
                        "obj-24",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-25",
                        0
                    ],
                    "destination": [
                        "obj-68",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-68",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-69",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-69",
                        0
                    ],
                    "destination": [
                        "obj-25",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-71",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-71",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-72",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-72",
                        0
                    ],
                    "destination": [
                        "obj-27",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-33",
                        0
                    ],
                    "destination": [
                        "obj-27",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-29",
                        0
                    ],
                    "destination": [
                        "obj-74",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-74",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-75",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-75",
                        0
                    ],
                    "destination": [
                        "obj-29",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        0
                    ],
                    "destination": [
                        "obj-77",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-77",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-78",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-78",
                        0
                    ],
                    "destination": [
                        "obj-3",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-30",
                        0
                    ],
                    "destination": [
                        "obj-80",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-80",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-81",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-30",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-28",
                        0
                    ],
                    "destination": [
                        "obj-30",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-31",
                        0
                    ],
                    "destination": [
                        "obj-83",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-83",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-84",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-84",
                        0
                    ],
                    "destination": [
                        "obj-31",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-34",
                        0
                    ],
                    "destination": [
                        "obj-86",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-86",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-87",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-87",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-35",
                        0
                    ],
                    "destination": [
                        "obj-89",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-89",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-90",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-90",
                        0
                    ],
                    "destination": [
                        "obj-35",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-36",
                        0
                    ],
                    "destination": [
                        "obj-92",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-92",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-93",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-93",
                        0
                    ],
                    "destination": [
                        "obj-36",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-37",
                        0
                    ],
                    "destination": [
                        "obj-95",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-95",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-96",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-96",
                        0
                    ],
                    "destination": [
                        "obj-37",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-38",
                        0
                    ],
                    "destination": [
                        "obj-98",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-98",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-99",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-99",
                        0
                    ],
                    "destination": [
                        "obj-38",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-5",
                        0
                    ],
                    "destination": [
                        "obj-101",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-101",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-102",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-102",
                        0
                    ],
                    "destination": [
                        "obj-5",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        0
                    ],
                    "destination": [
                        "obj-104",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-104",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-105",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-105",
                        0
                    ],
                    "destination": [
                        "obj-6",
                        0
                    ],
                    "order": 0
                }
            }
        ],
        "autosave": 0,
        "openrect": [
            50.0,
            50.0,
            600.0,
            600.0
        ],
        "openrectmode": 0,
        "parameters": {
            "obj-10": [
                "live.gain~",
                "live.gain~",
                0
            ],
            "obj-32": [
                "live.tab",
                "live.tab",
                0
            ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ],
                    "buttons": [
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-",
                        "-"
                    ]
                }
            },
            "inherited_shortname": 1
        }
    }
}