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
        "openrect": [ 50.0, 50.0, 600.0, 600.0 ],
        "openrectmode": 0,
        "boxes": [
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 477.0, 410.0, 99.0, 20.0 ],
                    "text": "continuous noise"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 450.0, 315.0, 69.0, 20.0 ],
                    "text": "noise pulse"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
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
                        "rect": [ 0.0, 0.0, 1000.0, 780.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-29",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 50.0, 328.64869689941406, 38.0, 22.0 ],
                                    "text": "pink~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-28",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 50.0, 362.64869689941406, 67.0, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 98.0, 238.14869689941406, 48.0, 22.0 ],
                                    "text": "pipe 40"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-24",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 98.0, 266.64869689941406, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 4,
                                    "outlettype": [ "signal", "signal", "", "" ],
                                    "patching_rect": [ 98.0, 300.64869689941406, 99.0, 22.0 ],
                                    "text": "adsr~ 0 100 1 40"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-17",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "int", "int" ],
                                    "patching_rect": [ 98.0, 194.64869689941406, 40.0, 22.0 ],
                                    "text": "t 0 1 i"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 98.0, 137.64869689941406, 110.0, 35.0 ],
                                    "text": "random 1000 @range 100 4000"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 98.0, 107.64869689941406, 63.0, 22.0 ],
                                    "text": "metro 500"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-30",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 98.0, 39.999999899414064, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-31",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 444.64869689941406, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 1 ],
                                    "source": [ "obj-17", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-24", 0 ],
                                    "source": [ "obj-17", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 1 ],
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-24", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-31", 0 ],
                                    "source": [ "obj-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 0 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "source": [ "obj-30", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 450.0, 376.0, 19.0, 22.0 ],
                    "text": "p"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 18.0, 110.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "clipheight": 28.5,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "drumLoop.aif",
                                "filename": "drumLoop.aif",
                                "filekind": "audiofile",
                                "id": "u764007122",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            },
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u571007144",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            }
                        ]
                    },
                    "id": "obj-8",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 64.0, 101.0, 334.0, 59.0 ],
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
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 219.0, 409.0, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 219.0, 439.0, 100.0, 40.0 ],
                    "preset_data": [
                        {
                            "number": 1,
                            "data": [ 5, "obj-attrui", "number", "float", 110.0, 5, "obj-4", "toggle", "int", 0, 5, "obj-1", "number", "float", 40.0, 5, "obj-3", "number", "float", 20.0, 5, "obj-5", "number", "float", 0.3, 5, "obj-6", "number", "float", 0.15, 5, "obj-11", "number", "float", 0.22, 5, "obj-10", "number", "float", 0.9000000000000001, 5, "obj-9", "number", "float", 0.25, 5, "obj-19", "toggle", "int", 1, 5, "obj-8", "playlist~", "preset_count", 2, 7, "obj-8", "playlist~", "preset_clipstate", 1, "filekind", "audiofile", 7, "obj-8", "playlist~", "preset_clipstate", 1, "absolutepath", "drumLoop.aif", 7, "obj-8", "playlist~", "preset_clipstate", 1, "filename", "drumLoop.aif", 7, "obj-8", "playlist~", "preset_clipstate", 1, "loop", 1, 8, "obj-8", "playlist~", "preset_clipstate", 1, "selection", -1.0, -1.0, 7, "obj-8", "playlist~", "preset_clipstate", 1, "id", "u764007122", 7, "obj-8", "playlist~", "preset_content", 1, "loop", 1, 7, "obj-8", "playlist~", "preset_clipstate", 2, "filekind", "audiofile", 7, "obj-8", "playlist~", "preset_clipstate", 2, "absolutepath", "FemVoice.aif", 7, "obj-8", "playlist~", "preset_clipstate", 2, "filename", "FemVoice.aif", 7, "obj-8", "playlist~", "preset_clipstate", 2, "loop", 1, 8, "obj-8", "playlist~", "preset_clipstate", 2, "selection", -1.0, -1.0, 7, "obj-8", "playlist~", "preset_clipstate", 2, "id", "u571007144", 7, "obj-8", "playlist~", "preset_content", 2, "loop", 1, 4, "obj-8", "playlist~", "preset_execute", 5, "obj-18", "number", "float", 100.0 ]
                        },
                        {
                            "number": 2,
                            "data": [ 5, "obj-attrui", "number", "float", 110.0, 5, "obj-4", "toggle", "int", 0, 5, "obj-1", "number", "float", 5.0, 5, "obj-3", "number", "float", 9.0, 5, "obj-5", "number", "float", 0.6500000000000001, 5, "obj-6", "number", "float", 0.15, 5, "obj-11", "number", "float", 0.22, 5, "obj-10", "number", "float", 0.5, 5, "obj-9", "number", "float", 0.25, 5, "obj-19", "toggle", "int", 1, 5, "obj-8", "playlist~", "preset_count", 2, 7, "obj-8", "playlist~", "preset_clipstate", 1, "filekind", "audiofile", 7, "obj-8", "playlist~", "preset_clipstate", 1, "absolutepath", "drumLoop.aif", 7, "obj-8", "playlist~", "preset_clipstate", 1, "filename", "drumLoop.aif", 7, "obj-8", "playlist~", "preset_clipstate", 1, "loop", 1, 8, "obj-8", "playlist~", "preset_clipstate", 1, "selection", -1.0, -1.0, 7, "obj-8", "playlist~", "preset_clipstate", 1, "id", "u764007122", 7, "obj-8", "playlist~", "preset_content", 1, "loop", 1, 7, "obj-8", "playlist~", "preset_clipstate", 2, "filekind", "audiofile", 7, "obj-8", "playlist~", "preset_clipstate", 2, "absolutepath", "FemVoice.aif", 7, "obj-8", "playlist~", "preset_clipstate", 2, "filename", "FemVoice.aif", 7, "obj-8", "playlist~", "preset_clipstate", 2, "loop", 1, 8, "obj-8", "playlist~", "preset_clipstate", 2, "selection", -1.0, -1.0, 7, "obj-8", "playlist~", "preset_clipstate", 2, "id", "u571007144", 7, "obj-8", "playlist~", "preset_content", 2, "loop", 1, 4, "obj-8", "playlist~", "preset_execute", 5, "obj-18", "number", "float", 100.0 ]
                        },
                        {
                            "number": 3,
                            "data": [ 5, "obj-attrui", "number", "float", 450.0, 5, "obj-4", "toggle", "int", 0, 5, "obj-1", "number", "float", 20.0, 5, "obj-3", "number", "float", 9.0, 5, "obj-5", "number", "float", 0.8, 5, "obj-6", "number", "float", 0.06000000000000001, 5, "obj-11", "number", "float", 0.6000000000000001, 5, "obj-10", "number", "float", 0.5, 5, "obj-9", "number", "float", 0.25, 5, "obj-19", "toggle", "int", 0, 5, "obj-8", "playlist~", "preset_count", 2, 7, "obj-8", "playlist~", "preset_clipstate", 1, "filekind", "audiofile", 7, "obj-8", "playlist~", "preset_clipstate", 1, "absolutepath", "drumLoop.aif", 7, "obj-8", "playlist~", "preset_clipstate", 1, "filename", "drumLoop.aif", 7, "obj-8", "playlist~", "preset_clipstate", 1, "loop", 1, 8, "obj-8", "playlist~", "preset_clipstate", 1, "selection", -1.0, -1.0, 7, "obj-8", "playlist~", "preset_clipstate", 1, "id", "u764007122", 7, "obj-8", "playlist~", "preset_content", 1, "loop", 1, 7, "obj-8", "playlist~", "preset_clipstate", 2, "filekind", "audiofile", 7, "obj-8", "playlist~", "preset_clipstate", 2, "absolutepath", "FemVoice.aif", 7, "obj-8", "playlist~", "preset_clipstate", 2, "filename", "FemVoice.aif", 7, "obj-8", "playlist~", "preset_clipstate", 2, "loop", 1, 8, "obj-8", "playlist~", "preset_clipstate", 2, "selection", -1.0, -1.0, 7, "obj-8", "playlist~", "preset_clipstate", 2, "id", "u571007144", 7, "obj-8", "playlist~", "preset_content", 2, "loop", 1, 4, "obj-8", "playlist~", "preset_execute", 5, "obj-18", "number", "float", 100.0 ]
                        },
                        {
                            "number": 4,
                            "data": [ 5, "obj-attrui", "number", "float", 20.0, 5, "obj-4", "toggle", "int", 0, 5, "obj-1", "number", "float", 45.0, 5, "obj-3", "number", "float", 6.0, 5, "obj-5", "number", "float", 0.45000000000000007, 5, "obj-6", "number", "float", 0.06000000000000001, 5, "obj-11", "number", "float", 0.6000000000000001, 5, "obj-10", "number", "float", 0.5, 5, "obj-9", "number", "float", 0.25, 5, "obj-19", "toggle", "int", 0, 5, "obj-8", "playlist~", "preset_count", 2, 7, "obj-8", "playlist~", "preset_clipstate", 1, "filekind", "audiofile", 7, "obj-8", "playlist~", "preset_clipstate", 1, "absolutepath", "drumLoop.aif", 7, "obj-8", "playlist~", "preset_clipstate", 1, "filename", "drumLoop.aif", 7, "obj-8", "playlist~", "preset_clipstate", 1, "loop", 1, 8, "obj-8", "playlist~", "preset_clipstate", 1, "selection", -1.0, -1.0, 7, "obj-8", "playlist~", "preset_clipstate", 1, "id", "u764007122", 7, "obj-8", "playlist~", "preset_content", 1, "loop", 1, 7, "obj-8", "playlist~", "preset_clipstate", 2, "filekind", "audiofile", 7, "obj-8", "playlist~", "preset_clipstate", 2, "absolutepath", "FemVoice.aif", 7, "obj-8", "playlist~", "preset_clipstate", 2, "filename", "FemVoice.aif", 7, "obj-8", "playlist~", "preset_clipstate", 2, "loop", 1, 8, "obj-8", "playlist~", "preset_clipstate", 2, "selection", -1.0, -1.0, 7, "obj-8", "playlist~", "preset_clipstate", 2, "id", "u571007144", 7, "obj-8", "playlist~", "preset_content", 2, "loop", 1, 4, "obj-8", "playlist~", "preset_execute", 5, "obj-18", "number", "float", 100.0 ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 341.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 447.5, 408.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 447.5, 443.0, 42.0, 22.0 ],
                    "text": "trig $1"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 36.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 6.0, 13.0, 479.0, 47.0 ],
                    "text": "Non-Linear Waveguide String"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "id": "obj-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 28.0, 62.0, 225.0, 24.0 ],
                    "text": "not your regular karplus strong"
                }
            },
            {
                "box": {
                    "id": "obj-ezdac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 64.0, 543.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-gain",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 64.0, 373.0, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ -70.0 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "live.gain~",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 0,
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
                    "id": "obj-gen",
                    "library_path0": "/Users/letz/Documents/Max 9/Packages/faustgen/externals/msp/faustgen~.mxo/Contents/Resources/",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "", "" ],
                    "patching_rect": [ 64.0, 329.0, 73.0, 22.0 ],
                    "sourcecode": "// waveguide-string: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/waveguide-string.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// WAVEGUIDE-STRING: 4-voice waveguide string (extended Karplus-Strong)\n// (gen~: gendsp/waveguide-string.gendsp)\n//\n// An exciter (a decaying noise burst started by a trigger, plus the input\n// itself) goes through a pick-position comb (a cubic-interpolated delay of\n// pick_pos of the period, modulated +-5 % by two slow LFOs), then into four\n// detuned waveguide loops, each a linear-interpolated delay, a first-order\n// allpass (stiffness), a one-pole damping low-pass, a T60 loop gain and a\n// tanh bridge saturation. The four voices are panned to two outputs, through\n// a tanh, and mixed with the dry input.\n//\n// in1: excitation audio / strike (a rise above 0.1 triggers a burst)\n// in2: pitch modulation (Hz, added to freq)\n// out1, out2: string L, R (dry/wet)\n//\n// freq (Hz), detune (0..100 %: fine detune up to 4.5 Hz plus a spread of up to\n// 2.5 octaves), decay_time (T60, s), damping, stiffness, pick_pos,\n// strike_res (burst length 0.5..8 ms), nl_bridge, trig (> 0: a trigger at\n// every sample, the burst restarted while held), mix_pct (%).\n//\n// As in gen: the dry part of out2 is in1 (not in2, the pitch CV, and there is\n// no right input), so both outputs carry in1 dry.\n\ndeclare name \"waveguide-string\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nfreq = hslider(\"freq [unit:Hz]\", 110, 20, 2000, 0.01);\ndetune = hslider(\"detune [unit:%]\", 5, 0, 100, 0.01);\ndecay_time = hslider(\"decay_time [unit:s]\", 3.5, 0.1, 20, 0.01);\ndamping = hslider(\"damping\", 0.3, 0, 1, 0.001);\nstiffness = hslider(\"stiffness\", 0.15, 0, 1, 0.001);\npick_pos = hslider(\"pick_pos\", 0.22, 0.01, 0.99, 0.001);\nstrike_res = hslider(\"strike_res\", 0.5, 0, 1, 0.001);\nnl_bridge = hslider(\"nl_bridge\", 0.25, 0, 1, 0.001);\ntrig = hslider(\"trig\", 0, 0, 1, 1);\nmix_pct = hslider(\"mix_pct [unit:%]\", 100, 0, 100, 0.01);\n\nTWOPI = 6.2831853071795862;\nMAXD = 192000;   // the string delays are read at most sr - 10 samples back\n\n// nz: the burst noise (gen's noise(), uniform in [-1, 1), drawn while the\n// burst runs)\nwstring(nz, in1, in2) = out1, out2\nwith {\n    // --- 1. exciter and pick comb\n    ext_trig = (in1 > 0.1) & (in1' <= 0.1);\n    is_trig = ext_trig | (trig > 0);\n    burst_len = g.clamp(4, 1200, g.scale(strike_res, 0, 1, 0.5, 8, 1) * (ma.SR * 0.001));\n    // h_burst_cnt: set on a trigger, then counted down while > 0\n    cnt_pre(c) = select2(is_trig, c, burst_len);\n    h_burst_cnt = (\\(c).(select2(cnt_pre(c) > 0, cnt_pre(c), cnt_pre(c) - 1))) ~ _;\n    cnt = cnt_pre(h_burst_cnt');\n    exc_noise = select2(cnt > 0, 0, nz * (cnt * 0.00083333333333333339));\n    raw_exc = in1 * 0.5 + exc_noise * 0.8;\n\n    ph1 = (\\(p).(g.wrap(0, 1, p + g.safediv(0.13, ma.SR)))) ~ _;\n    ph2 = (\\(p).(g.wrap(0, 1, p + g.safediv(0.21, ma.SR)))) ~ _;\n    pick_lfo = 0.65 * sin(ph1 * TWOPI) + 0.35 * sin(ph2 * TWOPI);\n    eff_pick_pos = g.clamp(0.01, 0.99, pick_pos + pick_lfo * 0.05);\n    base_f = g.clamp(10, ma.SR * 0.45, freq + in2);\n    pick_samps = g.clamp(1, 4000, eff_pick_pos * g.safediv(ma.SR, base_f));\n    pick_sig = raw_exc - g.rd_cubic(4096, 4096, 1, raw_exc, pick_samps);\n\n    // --- 2. detune\n    detune_norm = detune * 0.01;\n    fine_hz = detune_norm * 4.5;\n    wide_oct = g.safepow(detune_norm, 1.7) * 2.5;\n    fmax = ma.SR * 0.45;\n    f1 = g.clamp(10, fmax, (base_f - fine_hz) * g.safepow(2, (0 - wide_oct) * 1));\n    f2 = g.clamp(10, fmax, (base_f - fine_hz * 0.33) * g.safepow(2, (0 - wide_oct) * 0.35));\n    f3 = g.clamp(10, fmax, (base_f + fine_hz * 0.33) * g.safepow(2, wide_oct * 0.35));\n    f4 = g.clamp(10, fmax, (base_f + fine_hz) * g.safepow(2, wide_oct * 1));\n\n    // --- 3-5. one voice: allpass, damping, loop gain, bridge\n    ap_coeff = g.scale(stiffness, 0, 1, 0, 0.72, 1);\n    damp_alpha = g.scale(damping, 0, 1, 0.96, 0.04, 1);\n    drive_term = 1 + nl_bridge * 3;\n    voice(f) = (\\(wd).(pick_sig + sat(wd), sat(wd))) ~ _ : (!, _)\n    with {\n        d_samps = g.clamp(2, int(ma.SR) - 10, g.safediv(ma.SR, f) - 2);\n        gain = g.safepow(0.001, g.safediv(1, max(decay_time * f, 0.1)));\n        sat(wd) = g.safediv(ma.tanh(dampv * gain * drive_term), drive_term)\n        with {\n            sig = g.rd_linear_fb(MAXD, 2 * ma.SR, wd, d_samps);\n            disp = (\\(ap_out).(sig * (0 - ap_coeff) + sig' + ap_out * ap_coeff)) ~ _;\n            dampv = (\\(h).(disp * (1 - damp_alpha) + h * damp_alpha)) ~ _;\n        };\n    };\n    sat1 = voice(f1);\n    sat2 = voice(f2);\n    sat3 = voice(f3);\n    sat4 = voice(f4);\n\n    // --- 6. panning and mix\n    outL = sat1 * 0.35 + sat2 * 0.15 + sat3 * 0.28 + sat4 * 0.12;\n    outR = sat1 * 0.12 + sat2 * 0.28 + sat3 * 0.15 + sat4 * 0.35;\n    wetL = ma.tanh(outL * 1.2);\n    wetR = ma.tanh(outR * 1.2);\n    bal = g.clamp(0, 1, mix_pct * 0.01);\n    out1 = g.mix(in1, wetL, bal);\n    out2 = g.mix(in1, wetR, bal);\n};\n\nprocess = wstring(g.noises(1, 0));\n// the port with its noise as an input, for scripts/test_gen.py: in1, in2, noise\ndet(in1, in2, nz) = wstring(nz, in1, in2);\n",
                    "sourcecode_size": 17120,
                    "text": "faustgen~",
                    "varname": "faustgen-36670795792",
                    "version": "1.87"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 264.0, 359.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 119.0, 199.0, 67.0, 20.0 ],
                    "text": "detune (%)"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-1",
                    "maxclass": "flonum",
                    "maximum": 100.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 179.0, 199.0, 82.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 179.0, 223.0, 120.0, 22.0 ],
                    "text": "prepend detune"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-39",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 304.0, 223.0, 90.0, 22.0 ],
                    "text": "set 5."
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 263.0, 199.0, 86.0, 20.0 ],
                    "text": "strike_res"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-10",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 349.0, 199.0, 56.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 349.0, 223.0, 120.0, 22.0 ],
                    "text": "prepend strike_res"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-42",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 474.0, 223.0, 90.0, 22.0 ],
                    "text": "set 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 263.0, 173.0, 72.0, 20.0 ],
                    "text": "pick_pos"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-11",
                    "maxclass": "flonum",
                    "maximum": 0.99,
                    "minimum": 0.01,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 335.0, 173.0, 70.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 335.0, 197.0, 120.0, 22.0 ],
                    "text": "prepend pick_pos"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-45",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 460.0, 197.0, 90.0, 22.0 ],
                    "text": "set 0.22"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 263.0, 277.0, 336.0, 20.0 ],
                    "text": "gen~ History 'h_pick_ph2': internal state in Faust, not settable",
                    "textcolor": [ 0.6, 0.1, 0.1, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 263.0, 308.0, 72.0, 20.0 ],
                    "text": "mix_pct (%)"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-18",
                    "maxclass": "flonum",
                    "maximum": 100.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 328.0, 308.0, 77.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 328.0, 332.0, 120.0, 22.0 ],
                    "text": "prepend mix_pct"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-49",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 453.0, 332.0, 90.0, 22.0 ],
                    "text": "set 100."
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 119.0, 225.0, 87.0, 20.0 ],
                    "text": "decay_time (s)"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-3",
                    "maxclass": "flonum",
                    "maximum": 20.0,
                    "minimum": 0.1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 205.0, 225.0, 56.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 205.0, 249.0, 120.0, 22.0 ],
                    "text": "prepend decay_time"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-52",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 330.0, 249.0, 90.0, 22.0 ],
                    "text": "set 3.5"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 119.0, 251.0, 65.0, 20.0 ],
                    "text": "damping"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-5",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 184.0, 251.0, 77.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 184.0, 275.0, 120.0, 22.0 ],
                    "text": "prepend damping"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-55",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 309.0, 275.0, 90.0, 22.0 ],
                    "text": "set 0.3"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 119.0, 277.0, 79.0, 20.0 ],
                    "text": "stiffness"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-6",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 198.0, 277.0, 63.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 198.0, 301.0, 120.0, 22.0 ],
                    "text": "prepend stiffness"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-58",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 323.0, 301.0, 90.0, 22.0 ],
                    "text": "set 0.15"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 263.0, 225.0, 79.0, 20.0 ],
                    "text": "nl_bridge"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-9",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 342.0, 225.0, 63.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 342.0, 249.0, 120.0, 22.0 ],
                    "text": "prepend nl_bridge"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-61",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 467.0, 249.0, 90.0, 22.0 ],
                    "text": "set 0.25"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 119.0, 173.0, 85.0, 20.0 ],
                    "text": "freq (Hz)"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-attrui",
                    "maxclass": "flonum",
                    "maximum": 2000.0,
                    "minimum": 20.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 204.0, 173.0, 57.0, 22.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 204.0, 197.0, 120.0, 22.0 ],
                    "text": "prepend freq"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-64",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 329.0, 197.0, 90.0, 22.0 ],
                    "text": "set 110."
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 263.0, 251.0, 336.0, 20.0 ],
                    "text": "gen~ History 'h_pick_ph1': internal state in Faust, not settable",
                    "textcolor": [ 0.6, 0.1, 0.1, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 64.0, 281.0, 560.0, 47.0 ],
                    "text": "Faust version: gen~ @gen waveguide-string replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/waveguide-string.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/waveguide-string.maxpat.",
                    "textcolor": [ 0.6, 0.1, 0.1, 1.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "hidden": 1,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain", 0 ],
                    "hidden": 1,
                    "source": [ "obj-20", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "hidden": 1,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "order": 8,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "order": 0,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 2,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "order": 3,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "order": 4,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 7,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "order": 6,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "order": 1,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "order": 5,
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-attrui", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 1 ],
                    "hidden": 1,
                    "source": [ "obj-8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "hidden": 1,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-attrui", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ezdac", 1 ],
                    "source": [ "obj-gain", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ezdac", 0 ],
                    "source": [ "obj-gain", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain", 1 ],
                    "source": [ "obj-gen", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gain", 0 ],
                    "source": [ "obj-gen", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-gain": [ "live.gain~", "live.gain~", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}