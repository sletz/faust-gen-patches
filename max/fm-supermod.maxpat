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
                    "id": "obj-36",
                    "maxclass": "live.menu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        739.0,
                        406.0,
                        71.0,
                        18.0
                    ],
                    "fontsize": 12.0,
                    "outlettype": [
                        "",
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "free",
                                "harmonic",
                                "risset"
                            ],
                            "parameter_linknames": 1,
                            "parameter_longname": "quantize",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "quantize",
                            "parameter_type": 2
                        }
                    },
                    "varname": "quantize"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        739.0,
                        448.0,
                        71.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "quantize $1"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        465.0,
                        227.0,
                        32.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "mtof"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        425.0,
                        194.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        ""
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        106.0,
                        287.0,
                        33.0,
                        22.0
                    ],
                    "outlettype": [
                        "int"
                    ],
                    "text": "== 4"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        25.0,
                        255.0,
                        100.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        ""
                    ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        739.0,
                        168.0,
                        41.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                50
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "spread",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "spread",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "spread"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        739.0,
                        235.0,
                        102.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "stereo_spread $1"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        325.0,
                        426.0,
                        50.0,
                        22.0
                    ],
                    "format": 6,
                    "maximum": 16000.0,
                    "minimum": 40.0,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "spectroscope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        312.0,
                        643.0,
                        300.0,
                        100.0
                    ],
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "kslider",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        425.0,
                        137.0,
                        280.0,
                        45.0
                    ],
                    "offset": 24,
                    "outlettype": [
                        "int",
                        "int"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        224.87499999999997,
                        424.0,
                        50.0,
                        22.0
                    ],
                    "format": 6,
                    "maximum": 16000.0,
                    "minimum": 40.0,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "live.menu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        25.0,
                        221.0,
                        82.14285714285714,
                        18.0
                    ],
                    "fontsize": 12.0,
                    "outlettype": [
                        "",
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "audio",
                                "sinewave",
                                "noise",
                                "midi"
                            ],
                            "parameter_longname": "live.menu[1]",
                            "parameter_mmax": 4,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.menu",
                            "parameter_type": 2
                        }
                    },
                    "varname": "live.menu[1]"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "live.toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        654.0,
                        397.0,
                        20.535714285714285,
                        20.535714285714285
                    ],
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_longname": "live.toggle[1]",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.toggle",
                            "parameter_type": 2
                        }
                    },
                    "varname": "live.toggle[1]"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "live.menu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        560.0,
                        246.0,
                        111.0,
                        18.0
                    ],
                    "fontsize": 12.0,
                    "outlettype": [
                        "",
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "ring mod",
                                "time/ doppler",
                                "adaptive audio"
                            ],
                            "parameter_longname": "live.menu",
                            "parameter_mmax": 3,
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.menu",
                            "parameter_type": 2
                        }
                    },
                    "varname": "live.menu"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        654.0,
                        448.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "filter_lp $1"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "live.toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        556.0,
                        397.0,
                        20.535714285714285,
                        20.535714285714285
                    ],
                    "hidden": 1,
                    "hint": "Treat in1 as MIDI pitch, 0: Treat in1 as Audio",
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "off",
                                "on"
                            ],
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "midiornot",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "midiornot",
                            "parameter_type": 2
                        }
                    },
                    "varname": "midiornot"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        556.0,
                        448.0,
                        91.0,
                        22.0
                    ],
                    "hidden": 1,
                    "outlettype": [
                        ""
                    ],
                    "text": "use_note_in $1"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        245.0,
                        643.0,
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
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        164.0,
                        643.0,
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
                    "id": "obj-3",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        164.0,
                        694.0,
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
                                "obj-90",
                                "live.dial",
                                "float",
                                110.0,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                1.4140000343322754,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                1.7999999523162842,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                45,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                41.73228454589844,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                293.6647644042969,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                11.344802856445312,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                3.9445804955740016e-10,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                62,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                2.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                110.0,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                3.3159842491149902,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                1.7999999523162842,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                2.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                45,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                93.70079040527344,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                41.20344543457031,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                3.173504114151001,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                2.9770724773406982,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                28,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                30.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 5,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                43.65353012084961,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                10.0,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                4.182594299316406,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.7716535329818726,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                2.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                29,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                2.0
                            ]
                        },
                        {
                            "number": 9,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                65.4063949584961,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                2.358566999435425,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                2.511708974838257,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.7874016165733337,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                36,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                40.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 10,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                73.41619110107422,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                6.467432975769043,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                1.7999999523162842,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.6929134130477905,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                38,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                40.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                85.43306732177734,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                2.0
                            ]
                        },
                        {
                            "number": 11,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                220.0,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                11.426409721374512,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                0.44682690501213074,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.6929134130477905,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                57,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                40.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                50.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 17,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                36.70809555053711,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                1.4140000343322754,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                1.7999999523162842,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                26,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                50.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 18,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                65.4063949584961,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                1.4140000343322754,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                2.318079948425293,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.4566929042339325,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                3.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                36,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                80.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                0.0
                            ]
                        },
                        {
                            "number": 19,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                65.4063949584961,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                1.4140000343322754,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                3.160285472869873,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.4094488322734833,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                36,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                50.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                2.0
                            ]
                        },
                        {
                            "number": 20,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                65.4063949584961,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                2.83085036277771,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                1.7999999523162842,
                                5,
                                "obj-29",
                                "playlist~",
                                "preset_count",
                                1,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u241001144",
                                7,
                                "obj-29",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                4,
                                "obj-29",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.6771653890609741,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                1.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                2.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                36,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                50.0,
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0
                            ]
                        },
                        {
                            "number": 24,
                            "data": [
                                5,
                                "obj-90",
                                "live.dial",
                                "float",
                                110.0,
                                5,
                                "obj-17",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                1.4140000343322754,
                                5,
                                "obj-26",
                                "live.dial",
                                "float",
                                1.7999999523162842,
                                5,
                                "obj-32",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-13",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-16",
                                "live.menu",
                                "float",
                                0.0,
                                5,
                                "obj-19",
                                "live.toggle",
                                "float",
                                0.0,
                                5,
                                "obj-20",
                                "live.menu",
                                "float",
                                0.0,
                                5,
                                "obj-22",
                                "number",
                                "float",
                                100.0,
                                5,
                                "obj-23",
                                "kslider",
                                "int",
                                45,
                                5,
                                "obj-11",
                                "number",
                                "float",
                                450.0,
                                5,
                                "obj-1",
                                "live.dial",
                                "float",
                                41.73228454589844
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        124.9375,
                        314.57142857142856,
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
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.357142857142854,
                        72.32142857142857,
                        430.35714285714283,
                        47.0
                    ],
                    "fontsize": 18.0,
                    "linecount": 2,
                    "text": "Quadrature Cross-Feedback FM Engine & Live Audio Modulator (Ring Mod / Doppler FM / Adaptive)"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.357142857142854,
                        19.642857142857142,
                        327.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "FM Supermodulator"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        504.0,
                        496.0,
                        29.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "thru"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        815.0,
                        274.0,
                        41.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "feedback",
                            "parameter_mmax": 2.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "feedback",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "feedback"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        815.0,
                        341.0,
                        74.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "feedback $1"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        124.9375,
                        342.57142857142856,
                        222.32142857142856,
                        46.42857142857142
                    ],
                    "clipheight": 45.42857142857142,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u241001144",
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
                    "id": "obj-26",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        739.0,
                        274.0,
                        41.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_exponent": 3.333,
                            "parameter_initial": [
                                1.8000000000000003
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "index",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "index",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "index"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        739.0,
                        341.0,
                        74.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "fm_index $1"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        680.0,
                        274.0,
                        41.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                1.414
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "ratio",
                            "parameter_mmax": 30.0,
                            "parameter_mmin": 0.01,
                            "parameter_modmode": 4,
                            "parameter_shortname": "ratio",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "ratio"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        680.0,
                        341.0,
                        49.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "ratio $1"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        504.0,
                        274.0,
                        41.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                100
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "mix",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "mix",
                            "parameter_type": 1,
                            "parameter_unitstyle": 5
                        }
                    },
                    "varname": "mix"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        504.0,
                        341.0,
                        44.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "mix $1"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        25.0,
                        623.0,
                        94.0,
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
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        25.0,
                        774.0,
                        37.75,
                        22.0
                    ],
                    "text": "dac~"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        621.0,
                        274.0,
                        41.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.0,
                        1.0,
                        0.984313725490196,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_exponent": 2.22222,
                            "parameter_initial": [
                                60.00000000000001
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "freq",
                            "parameter_mmax": 10000.0,
                            "parameter_mmin": 0.1,
                            "parameter_modmode": 2,
                            "parameter_shortname": "freq",
                            "parameter_speedlim": 1.666,
                            "parameter_type": 0,
                            "parameter_unitstyle": 3
                        }
                    },
                    "varname": "freq"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        621.0,
                        341.0,
                        46.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "freq $1"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        560.0,
                        341.0,
                        55.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "mode $1"
                }
            },
            {
                "box": {
                    "id": "obj-cycle",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        224.87499999999997,
                        454.0,
                        66.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "cycle~ 100"
                }
            },
            {
                "box": {
                    "id": "obj-noise",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        325.0,
                        458.0,
                        56.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "rand~ 40"
                }
            },
            {
                "box": {
                    "id": "obj-sig-note",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        425.0,
                        391.0,
                        48.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "sig~ 60"
                }
            },
            {
                "box": {
                    "id": "obj-sel-L",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "patching_rect": [
                        25.0,
                        496.0,
                        418.74999999999994,
                        22.0
                    ],
                    "outlettype": [
                        "signal"
                    ],
                    "text": "selector~ 4 0"
                }
            },
            {
                "box": {
                    "id": "obj-gen",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "patching_rect": [
                        25.0,
                        570.0,
                        93.99999999999993,
                        35.0
                    ],
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "linecount": 2,
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "sourcecode": "// fm-supermod: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/fm-supermod.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// FM-SUPERMOD: stereo bell phase modulation and audio processor\n// (gen~: gendsp/fm-supermod.gendsp)\n//\n// Two sine modulators with self-feedback (DX7-style: the last output, times\n// `feedback`, added to the phase) phase-modulate two sine carriers, L and R,\n// detuned by `stereo_spread` (+-0.3 % on the carriers, +0.2 % more on the\n// right modulator) with a quarter-cycle (at most) phase offset on the right.\n// The modulator ratio is free, rounded to integers, or snapped to Risset's\n// bell partials (`quantize`; in that mode the right modulator beats 1.2 Hz\n// above). An optional fixed 2nd-order low-pass follows the carriers. Then:\n// mode 1 rings the inputs by the carriers (x1.5), or plays the carriers\n// (x0.4) when there is no input; mode 2 reads the inputs through a 4 ms\n// cubic delay modulated by the carriers (Doppler FM, depth from fm_index);\n// mode 3 plays the carriers with the input added to the modulator phases.\n// A warm asymmetric tanh, the dry/wet `mix`; mode 0 mutes.\n//\n// in1: audio L, or the MIDI note when use_note_in = 1\n// in2: audio R, and the ratio CV (in2 * 0.05 is added to ratio)\n// in3: fm_index CV (added)    in4: feedback CV (added)\n// out1, out2: processed L, R\n//\n// Parameters: mode (0..3: off, ring mod, time FM, adaptive FM; default 1),\n// freq (20..10000 Hz, 220), ratio (0.01..30, 1.414), quantize (0..2: free,\n// integers, Risset; 0), fm_index (0..50, 1.8), feedback (0..2, 0.25),\n// stereo_spread (0..100 %, 50), use_note_in (0/1, 0), filter_lp (0/1, 0),\n// mix (0..100 %, 100).\n//\n// As in gen:\n// - in2 is both the right audio input and the ratio CV: right-channel audio\n//   modulates the ratio by +-0.05 per unit; when in2 is exactly 0 the right\n//   channel takes in1;\n// - mode 1 switches between ring modulation and the plain carriers on the\n//   presence of input (|in1| or |in2| > 0.0001), sample by sample;\n// - with use_note_in = 1 the dry signal is 0 (mix < 100 % fades the output\n//   down), and in2 still moves the ratio;\n// - the low-pass has fixed coefficients: its cutoff follows the sample rate;\n// - in mode 3 the input only reaches the output through the dry mix and\n//   the phase injection (it is not in the wet signal).\n//\n// No noise: det = the program.\n\ndeclare name \"fm-supermod\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nmode = hslider(\"mode\", 1, 0, 3, 1);\nfreq = hslider(\"freq [unit:Hz]\", 220, 20, 10000, 0.01);\nratio = hslider(\"ratio\", 1.414, 0.01, 30, 0.001);\nquantize = hslider(\"quantize\", 0, 0, 2, 1);\nfm_index = hslider(\"fm_index\", 1.8, 0, 50, 0.01);\nfeedback = hslider(\"feedback\", 0.25, 0, 2, 0.001);\nstereo_spread = hslider(\"stereo_spread [unit:%]\", 50, 0, 100, 0.01);\nuse_note_in = hslider(\"use_note_in\", 0, 0, 1, 1);\nfilter_lp = hslider(\"filter_lp\", 0, 0, 1, 1);\nmix_p = hslider(\"mix [unit:%]\", 100, 0, 100, 0.01);\n\nTWOPI = 6.2831853071795862;\nHALFPI = 1.5707963267948966;\nMAXD = 4800;\n\nbiquad_lp(sig) = (\\(y1, y2).(y(y1, y2), y1)) ~ (_, _) : (_, !)\nwith {\n    y(y1, y2) = g.keep(g.keep(g.keep(g.keep(sig * 0.469) + g.keep(sig' * 0.938)) + g.keep(sig'' * 0.469))\n                - g.keep(y1 * 0.74)) - g.keep(y2 * 0.137);\n};\n\nsaturate_hot(x) = ma.tanh(b * 1.25) * 0.95\nwith { b = x + 0.08 * g.keep(x * abs(x)); };\n\nsupermod(in1, in2, in3, in4) = out1, out2\nwith {\n    note_mode = use_note_in > 0.5;\n    eff_note = g.clip(0, 128, in1);\n    f_base = select2(note_mode, max(freq, 10.0), g.mtof(eff_note));\n    spr = g.keep(stereo_spread * 0.01);\n    f_car_L = g.keep(f_base * (1.0 - g.keep(spr * 0.003)));\n    f_car_R = g.keep(f_base * (1.0 + g.keep(spr * 0.003)));\n\n    raw_ratio = g.clip(0.01, 30.0, ratio + in2 * 0.05);\n    risset_ratio = select2(raw_ratio < 0.74, select2(raw_ratio < 1.05, select2(raw_ratio < 1.30,\n                   select2(raw_ratio < 1.55, select2(raw_ratio < 1.85, select2(raw_ratio < 2.37,\n                   select2(raw_ratio < 2.87, select2(raw_ratio < 3.38, select2(raw_ratio < 3.91,\n                   select2(raw_ratio < 4.50, floor(raw_ratio) * 1.19 - 0.1, 4.07), 3.76), 3.00), 2.74),\n                   2.00), 1.70), 1.414), 1.19), 0.92), 0.56);\n    eff_ratio = select2(quantize < 0.5, select2(quantize < 1.5, risset_ratio,\n                max(1.0, floor(raw_ratio + 0.5))), raw_ratio);\n    risset_beat = select2(quantize >= 1.5, 0.0, 1.2);\n\n    f_mod_L = g.keep(f_car_L * eff_ratio);\n    f_mod_R = g.keep(g.keep(f_car_R * eff_ratio) * (1.0 + g.keep(spr * 0.002))) + risset_beat;\n\n    eff_index = g.clip(0.0, 50.0, fm_index + in3);\n    eff_fb = g.clip(0.0, 2.0, feedback + in4);\n\n    // modulators with self-FM\n    inc_mod_L = g.divsr(g.keep(f_mod_L * TWOPI));\n    inc_mod_R = g.divsr(g.keep(f_mod_R * TWOPI));\n    ph_mod_L = (\\(p).(g.wrap(0, TWOPI, g.keep(p + inc_mod_L)))) ~ _;\n    ph_mod_R = (\\(p).(g.wrap(0, TWOPI, g.keep(p + inc_mod_R)))) ~ _;\n\n    audio_in_L = in1;\n    audio_in_R = select2(in2 != 0, in1, in2);\n    clean_audio_in = select2(note_mode, audio_in_L * 0.5 + audio_in_R * 0.5, 0.0);\n    audio_inject = select2(mode >= 2.5, 0.0, g.keep(clean_audio_in * eff_index) * 0.5);\n\n    raw_mod_L = (\\(md).(sin(g.keep(ph_mod_L + g.keep(md * eff_fb)) + audio_inject))) ~ g.fixdenorm;\n    raw_mod_R = (\\(md).(sin(g.keep(ph_mod_R + g.keep(md * eff_fb)) + audio_inject))) ~ g.fixdenorm;\n\n    // carriers\n    inc_car_L = g.divsr(g.keep(f_car_L * TWOPI));\n    inc_car_R = g.divsr(g.keep(f_car_R * TWOPI));\n    ph_car_L = (\\(p).(g.wrap(0, TWOPI, g.keep(p + inc_car_L)))) ~ _;\n    ph_car_R = (\\(p).(g.wrap(0, TWOPI, g.keep(p + inc_car_R)))) ~ _;\n    spatial_offset = g.keep(spr * HALFPI) * 0.5;\n    bell_car_L = sin(ph_car_L + g.keep(raw_mod_L * eff_index));\n    bell_car_R = sin(g.keep(ph_car_R + spatial_offset) + g.keep(raw_mod_R * eff_index));\n\n    lp_on = filter_lp > 0.5;\n    filt_car_L = select2(lp_on, bell_car_L, biquad_lp(bell_car_L));\n    filt_car_R = select2(lp_on, bell_car_R, biquad_lp(bell_car_R));\n\n    // audio modes\n    dry_L = select2(note_mode, audio_in_L, 0.0);\n    dry_R = select2(note_mode, audio_in_R, 0.0);\n    synth_gain = 0.40;\n    has_audio = ((abs(in1) > 0.0001) | (abs(in2) > 0.0001)) & (use_note_in < 0.5);\n    m1_L = select2(has_audio, filt_car_L * synth_gain, g.keep(dry_L * filt_car_L) * 1.5);\n    m1_R = select2(has_audio, filt_car_R * synth_gain, g.keep(dry_R * filt_car_R) * 1.5);\n\n    span_ms = min(3.8, g.keep(eff_index * 0.08) + 0.1);\n    mod_time_L = g.keep(4.0 + g.keep(filt_car_L * span_ms)) * (ma.SR * 0.001);\n    mod_time_R = g.keep(4.0 + g.keep(filt_car_R * span_ms)) * (ma.SR * 0.001);\n    // Delay dly(4800), written then read (cubic) in the frame\n    m2_L = g.rd_cubic(MAXD, MAXD, 0, dry_L, mod_time_L);\n    m2_R = g.rd_cubic(MAXD, MAXD, 0, dry_R, mod_time_R);\n\n    m3_L = filt_car_L * synth_gain;\n    m3_R = filt_car_R * synth_gain;\n\n    raw_wet_L = select2(mode < 1.5, select2(mode < 2.5, m3_L, m2_L), m1_L);\n    raw_wet_R = select2(mode < 1.5, select2(mode < 2.5, m3_R, m2_R), m1_R);\n\n    sat_wet_L = saturate_hot(raw_wet_L);\n    sat_wet_R = saturate_hot(raw_wet_R);\n\n    mix_val = g.clip(0.0, 1.0, mix_p * 0.01);\n    is_active = mode >= 0.5;\n    out1 = select2(is_active, 0, g.mix(dry_L, sat_wet_L, mix_val));\n    out2 = select2(is_active, 0, g.mix(dry_R, sat_wet_R, mix_val));\n};\n\ndet = supermod;\nprocess = (_, _, _, _) : det;\n",
                    "sourcecode_size": 20677,
                    "sample_format": 1,
                    "version": "1.87",
                    "varname": "faust_fm_supermod"
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        225.0,
                        600.0,
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
                    "id": "obj-92",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        25.0,
                        522.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen fm-supermod replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/fm-supermod.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/fm-supermod.maxpat.",
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
                        "obj-noise",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-12",
                        1
                    ],
                    "destination": [
                        "obj-8",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-12",
                        0
                    ],
                    "destination": [
                        "obj-8",
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
                        "obj-9",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-14",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-15",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "midpoints": [
                        663.5,
                        482.7678571428572,
                        513.5,
                        482.7678571428572
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-16",
                        0
                    ],
                    "destination": [
                        "obj-40",
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
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-19",
                        0
                    ],
                    "destination": [
                        "obj-15",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-20",
                        0
                    ],
                    "destination": [
                        "obj-21",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-21",
                        1
                    ],
                    "destination": [
                        "obj-28",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-21",
                        0
                    ],
                    "destination": [
                        "obj-sel-L",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-22",
                        0
                    ],
                    "destination": [
                        "obj-cycle",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-23",
                        0
                    ],
                    "destination": [
                        "obj-30",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-24",
                        0
                    ],
                    "destination": [
                        "obj-25",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-25",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "midpoints": [
                        689.5,
                        386.7182539682541,
                        513.5,
                        386.7182539682541
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-26",
                        0
                    ],
                    "destination": [
                        "obj-27",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "midpoints": [
                        748.5,
                        386.7182539682541,
                        513.5,
                        386.7182539682541
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-28",
                        0
                    ],
                    "destination": [
                        "obj-13",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-29",
                        0
                    ],
                    "destination": [
                        "obj-sel-L",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        2
                    ],
                    "destination": [
                        "obj-12",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-30",
                        1
                    ],
                    "destination": [
                        "obj-31",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-30",
                        0
                    ],
                    "destination": [
                        "obj-sig-note",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-31",
                        0
                    ],
                    "destination": [
                        "obj-90",
                        0
                    ],
                    "hidden": 1
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
                        "obj-33",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "midpoints": [
                        824.5,
                        386.9199146609459,
                        513.5,
                        386.9199146609459
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-34",
                        0
                    ],
                    "destination": [
                        "obj-gen",
                        0
                    ],
                    "midpoints": [
                        513.5,
                        557.946428571428,
                        34.5,
                        557.946428571428
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-35",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "midpoints": [
                        748.5,
                        483.0,
                        513.5,
                        483.0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-36",
                        0
                    ],
                    "destination": [
                        "obj-35",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-4",
                        0
                    ],
                    "destination": [
                        "obj-29",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-4",
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
                        "obj-40",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "midpoints": [
                        569.5,
                        387.37513950892867,
                        513.5,
                        387.37513950892867
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-6",
                        0
                    ],
                    "destination": [
                        "obj-3",
                        0
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
                        "obj-29",
                        0
                    ]
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
                    "midpoints": [
                        630.5,
                        386.7182539682541,
                        513.5,
                        386.7182539682541
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-9",
                        0
                    ],
                    "destination": [
                        "obj-34",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        565.5,
                        482.7678571428572,
                        513.5,
                        482.7678571428572
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-90",
                        0
                    ],
                    "destination": [
                        "obj-87",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-cycle",
                        0
                    ],
                    "destination": [
                        "obj-sel-L",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        34.5,
                        623.6428571428571,
                        321.5,
                        623.6428571428571
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
                        1
                    ],
                    "destination": [
                        "obj-12",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-gen",
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
                        "obj-noise",
                        0
                    ],
                    "destination": [
                        "obj-sel-L",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sel-L",
                        0
                    ],
                    "destination": [
                        "obj-gen",
                        1
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sel-L",
                        0
                    ],
                    "destination": [
                        "obj-gen",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-sig-note",
                        0
                    ],
                    "destination": [
                        "obj-sel-L",
                        4
                    ]
                }
            }
        ],
        "autosave": 0,
        "openrect": [
            50.0,
            50.0,
            900.0,
            800.0
        ],
        "openrectmode": 0,
        "parameters": {
            "obj-1": [
                "spread",
                "spread",
                0
            ],
            "obj-12": [
                "live.gain~",
                "live.gain~",
                0
            ],
            "obj-13": [
                "midiornot",
                "midiornot",
                0
            ],
            "obj-16": [
                "live.menu",
                "live.menu",
                0
            ],
            "obj-17": [
                "mix",
                "mix",
                0
            ],
            "obj-19": [
                "live.toggle[1]",
                "live.toggle",
                0
            ],
            "obj-20": [
                "live.menu[1]",
                "live.menu",
                0
            ],
            "obj-24": [
                "ratio",
                "ratio",
                0
            ],
            "obj-26": [
                "index",
                "index",
                0
            ],
            "obj-32": [
                "feedback",
                "feedback",
                0
            ],
            "obj-36": [
                "quantize",
                "quantize",
                0
            ],
            "obj-90": [
                "freq",
                "freq",
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