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
        "toolbars_unpinned_last_save": 2,
        "boxes": [
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        35.0,
                        79.0,
                        246.0,
                        27.0
                    ],
                    "fontsize": 18.0,
                    "text": "Skipping cd effect. Think Oval"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        35.0,
                        19.0,
                        131.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "Skipper"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        231.0,
                        366.0,
                        92.0,
                        20.0
                    ],
                    "text": "playback speed"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        15.0,
                        553.0,
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
                    "id": "obj-28",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        331.0,
                        208.0,
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
                    "id": "obj-23",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        331.0,
                        236.0,
                        24.0,
                        24.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        359.0,
                        237.0,
                        18.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
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
                        "rect": [
                            59.0,
                            121.0,
                            242.0,
                            311.0
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        83.0,
                                        162.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        83.0,
                                        122.0,
                                        48.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "pipe 50"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        83.0,
                                        88.0,
                                        32.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "int",
                                        "int"
                                    ],
                                    "text": "t 0 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        83.0,
                                        49.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1,
                                    "outlettype": [
                                        "bang"
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
                                        "obj-2",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-2",
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
                                        "obj-2",
                                        1
                                    ],
                                    "destination": [
                                        "obj-4",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-3",
                                        0
                                    ],
                                    "destination": [
                                        "obj-4",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "text": "p"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "live.menu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        305.0,
                        164.0,
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
                                "manual",
                                "automatic"
                            ],
                            "parameter_linknames": 1,
                            "parameter_longname": "auto",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "auto",
                            "parameter_type": 2
                        }
                    },
                    "varname": "auto"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        173.0,
                        457.0,
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
                    "id": "obj-20",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        46.0,
                        180.0,
                        232.0754716981132,
                        83.28301886792464
                    ],
                    "clipheight": 40.64150943396232,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u210012308",
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            },
                            {
                                "absolutepath": "tabla-solo.wav",
                                "filename": "tabla-solo.wav",
                                "filekind": "audiofile",
                                "id": "u496005161",
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
                        46.0,
                        139.0,
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
                    "id": "obj-13",
                    "maxclass": "number~",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        237.0,
                        342.0,
                        56.0,
                        22.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "mode": 2,
                    "outlettype": [
                        "signal",
                        "float"
                    ],
                    "sig": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        595.0,
                        488.0,
                        67.0,
                        20.0
                    ],
                    "text": "grains max"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        541.0,
                        118.0,
                        20.0
                    ],
                    "text": "max playback speed"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        46.0,
                        387.0,
                        83.0,
                        146.0
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
                    "id": "obj-72",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        162.0,
                        394.0,
                        78.0,
                        20.0
                    ],
                    "text": "duration time"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "number~",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [
                        173.0,
                        373.0,
                        56.0,
                        22.0
                    ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "mode": 2,
                    "outlettype": [
                        "signal",
                        "float"
                    ],
                    "sig": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        141.0,
                        41.0,
                        20.0
                    ],
                    "text": "mix %"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        262.0,
                        150.0,
                        20.0
                    ],
                    "text": "reading speed = varispeed"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        376.0,
                        76.0,
                        20.0
                    ],
                    "text": "downsample"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        350.0,
                        109.0,
                        20.0
                    ],
                    "text": "random panning %"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        325.0,
                        101.0,
                        20.0
                    ],
                    "text": "random hickup %"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        303.0,
                        105.0,
                        20.0
                    ],
                    "text": "random volume %"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        595.0,
                        237.0,
                        66.0,
                        20.0
                    ],
                    "text": "kill capture"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        595.0,
                        210.0,
                        85.0,
                        20.0
                    ],
                    "text": "manuel trigger"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        392.0,
                        440.0,
                        105.0,
                        20.0
                    ],
                    "text": "automode params"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        595.0,
                        188.0,
                        95.0,
                        20.0
                    ],
                    "text": "automode on/off"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        595.0,
                        164.0,
                        187.0,
                        20.0
                    ],
                    "text": "trigger mode (0=manuel / 1=auto)"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        515.0,
                        115.0,
                        20.0
                    ],
                    "text": "min playback speed"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        593.0,
                        463.0,
                        64.0,
                        20.0
                    ],
                    "text": "grains min"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        173.0,
                        493.0,
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
                                "obj-16",
                                "flonum",
                                "float",
                                75.0,
                                5,
                                "obj-14",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-26",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-29",
                                "number",
                                "int",
                                1.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                35.0,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                15.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                1.0,
                                6,
                                "obj-71",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                250.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                250.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                80.0,
                                6,
                                "obj-13",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u496005161",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-14",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-26",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-29",
                                "number",
                                "int",
                                1.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                45.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                1.0,
                                6,
                                "obj-71",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                2.0,
                                6,
                                "obj-13",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u496005161",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                85.0,
                                5,
                                "obj-14",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-26",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-29",
                                "number",
                                "int",
                                1.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                1.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                1.0,
                                6,
                                "obj-71",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                100.0,
                                6,
                                "obj-13",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u655006480",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-14",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-26",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-29",
                                "number",
                                "int",
                                1.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                90.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                -1.0,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                25.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                1.0,
                                6,
                                "obj-71",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                1500.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                500.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                2.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                2.0,
                                6,
                                "obj-13",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u537011248",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0
                            ]
                        },
                        {
                            "number": 5,
                            "data": [
                                5,
                                "obj-16",
                                "flonum",
                                "float",
                                70.0,
                                5,
                                "obj-14",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-26",
                                "number",
                                "int",
                                0.0,
                                5,
                                "obj-29",
                                "number",
                                "int",
                                1.0,
                                5,
                                "obj-9",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-6",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-32",
                                "flonum",
                                "float",
                                25.0,
                                5,
                                "obj-39",
                                "flonum",
                                "float",
                                0.25,
                                5,
                                "obj-34",
                                "flonum",
                                "float",
                                0.0,
                                5,
                                "obj-55",
                                "number",
                                "int",
                                1.0,
                                6,
                                "obj-71",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                800.0,
                                5,
                                "obj-5",
                                "flonum",
                                "float",
                                150.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-3",
                                "flonum",
                                "float",
                                50.0,
                                6,
                                "obj-13",
                                "number~",
                                "list",
                                0.0,
                                0.0,
                                5,
                                "obj-20",
                                "playlist~",
                                "preset_count",
                                2,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "absolutepath",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "filename",
                                "FemVoice.aif",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                1,
                                "id",
                                "u210012308",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                1,
                                "loop",
                                1,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filekind",
                                "audiofile",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "absolutepath",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "filename",
                                "tabla-solo.wav",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "loop",
                                1,
                                8,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "selection",
                                -1.0,
                                -1.0,
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_clipstate",
                                2,
                                "id",
                                "u537011248",
                                7,
                                "obj-20",
                                "playlist~",
                                "preset_content",
                                2,
                                "loop",
                                1,
                                4,
                                "obj-20",
                                "playlist~",
                                "preset_execute",
                                5,
                                "obj-36",
                                "live.menu",
                                "float",
                                1.0,
                                5,
                                "obj-28",
                                "toggle",
                                "int",
                                0
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        46.0,
                        554.0,
                        48.0,
                        22.0
                    ],
                    "text": "dac~"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 6,
                    "patching_rect": [
                        46.0,
                        293.0,
                        209.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "varname": "faust_skipper",
                    "sourcecode": "// skipper: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/skipper.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// SKIPPER: stochastic CD-skip looper and stutter (gen~: gendsp/skipper.gendsp)\n//\n// Two pairs of 288000-sample buffers (6 s at 48 kHz, whatever the sample\n// rate) in ping-pong: a capture records the input into the buffer that is\n// not playing, from its start; when it ends, that buffer plays, looped over\n// the captured length, at `speed` (negative: reversed) with linear\n// interpolation and a raised-cosine fade of 1.5 ms (at most a quarter of the\n// loop) at both ends. In auto mode (`triggermode` = 1) a metro of random\n// period (automode_speedmin..max ms) starts captures of random length\n// (automode_grainmin..max ms); `automode_on` = 0 stops the metro and any\n// capture (the loop goes on). In manual mode the input is captured while\n// `trigger` is 1, and the loop starts when it falls. Each new loop draws a\n// pan (equal power, width `pan_percentage`), a volume drop (up to 80 % of\n// `volume_percentage`) and, with probability `hickup_percentage`, a dropout\n// (the gain slides to 0). Then a sample-and-hold decimation (`downsample`,\n// hold of 1..25 samples), a soft limiter and the dry/wet `mix`.\n//\n// in1, in2: audio L, R\n// out1, out2: processed L, R    out3: loop length (ms)    out4: speed\n//\n// Parameters: automode_speedmin (2..10000 ms, default 250), automode_speedmax\n// (2..10000 ms, 1000), automode_grainmin (2..6000 ms, 40), automode_grainmax\n// (2..6000 ms, 800), automode_on (0/1, 1), triggermode (0/1, 1), trigger\n// (0/1, 0), speed (-4..4, 1), downsample (0..100, 0), volume_percentage\n// (0..100, 20), hickup_percentage (0..100, 20), pan_percentage (0..100, 80),\n// kill_capture (0/1, 0), mix (0..100 %, 80).\n//\n// As in gen:\n// - the buffers are 288000 samples whatever the sample rate (6 s at 48 kHz\n//   only): a manual capture stops recording there, and an auto grain is\n//   capped to 288000 samples;\n// - the first auto capture starts after 24000 samples (h_metro_interval's\n//   initial value), whatever the sample rate; while capturing, the metro\n//   does not count;\n// - `kill_capture` only silences the loop until the next capture: it does\n//   not clear the buffers, nor stop the metro (the header says \"purge\");\n// - the loop length is fractional (milliseconds times the sample rate) and\n//   the capture runs to its ceiling;\n// - the hickup gate slides only while a loop plays;\n// - the decimation counter runs whether `downsample` is on or not, and the\n//   held value is the wet signal of the frame the counter fires;\n// - the right output is panned with sin, the left with cos, of the same\n//   angle: at pan 0 both are at unity (x1.41421356 * 0.7071).\n//\n// Noise sites (export order): 0 the interval, 1 the grain length (at a metro\n// tick), 2 the pan, 3 the volume, 4 the hickup (at a new loop).\n\ndeclare name \"skipper\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nsi = library(\"signals.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nautomode_speedmin = hslider(\"automode_speedmin [unit:ms]\", 250, 2, 10000, 0.01);\nautomode_speedmax = hslider(\"automode_speedmax [unit:ms]\", 1000, 2, 10000, 0.01);\nautomode_grainmin = hslider(\"automode_grainmin [unit:ms]\", 40, 2, 6000, 0.01);\nautomode_grainmax = hslider(\"automode_grainmax [unit:ms]\", 800, 2, 6000, 0.01);\nautomode_on = hslider(\"automode_on\", 1, 0, 1, 1);\ntriggermode = hslider(\"triggermode\", 1, 0, 1, 1);\ntrigger = hslider(\"trigger\", 0, 0, 1, 1);\nspeed = hslider(\"speed\", 1, -4, 4, 0.001);\ndownsample = hslider(\"downsample\", 0, 0, 100, 0.01);\nvolume_percentage = hslider(\"volume_percentage [unit:%]\", 20, 0, 100, 0.01);\nhickup_percentage = hslider(\"hickup_percentage [unit:%]\", 20, 0, 100, 0.01);\npan_percentage = hslider(\"pan_percentage [unit:%]\", 80, 0, 100, 0.01);\nkill_capture = hslider(\"kill_capture\", 0, 0, 1, 1);\nmix_p = hslider(\"mix [unit:%]\", 80, 0, 100, 0.01);\n\nPI = 3.1415926535897931;\nBUF = 288000;\n\n// ---------------------------------------------------------------- control\n// 17 Histories, fed back: play_buf, has_data, play_ph, loop_len, loop_ms,\n// metro_timer, metro_interval, auto_capturing, auto_cap_timer, target,\n// prev_manual_trig, man_rec_count, pan_cur, vol_scale, is_hickup,\n// hickup_gate, down_count. Outputs after them: the write slot (buffer *\n// BUF + index, 2 * BUF: no write), the playing flag, the two read slots,\n// the interpolation fraction, fade, volume, gate, pan angle, the loop length\n// in ms and the decimation tick.\nNS = 17;\nctrl(n0, n1, n2, n3, n4) = (body ~ si.bus(NS)) : si.block(NS), si.bus(11)\nwith {\n    body(play_bufd, has_datad, play_phd, loop_lend, loop_msd, metro_timerd, metro_intervald,\n         auto_capd, cap_timerd, targetd, prev_mand, man_countd, pan_curd, vol_scaled,\n         is_hickupd, gated, down_countd) =\n        play_buf, has_data, play_ph, loop_len, loop_ms, metro_timer, metro_interval,\n        auto_cap, cap_timer, target, prev_man, man_count, pan_cur, vol_scale,\n        is_hickup, gate, down_count,\n        widx, active, ri0, ri1, fr, fade_gain, vol_scale, gate, theta, loop_ms, dtick\n    with {\n        // 3. kill\n        kill_on = kill_capture > 0.5;\n        kill_hit = kill_on & ((kill_on)' == 0);\n        has_data0 = select2(kill_hit, has_datad, 0);\n        play_ph0 = select2(kill_hit, play_phd, 0.0);\n        auto_cap0 = select2(kill_hit, auto_capd, 0);\n        man_count0 = select2(kill_hit, man_countd, 0);\n        loop_len_p = g.init(4800, loop_lend);\n        loop_ms_p = g.init(100.0, loop_msd);\n        metro_interval_p = g.init(24000, metro_intervald);\n        target_p = g.init(4800, targetd);\n        vol_scale_p = g.init(1.0, vol_scaled);\n        gate_p = g.init(1.0, gated);\n\n        // 4. capture\n        rec_buf = 1 - play_bufd;\n        auto_mode = triggermode > 0.5;\n        auto_run = auto_mode & (automode_on > 0.5);\n        man_mode = auto_mode == 0;\n\n        // auto: the metro\n        counting = auto_run & (auto_cap0 == 0);\n        mt1 = metro_timerd + 1;\n        tick = counting & (mt1 >= metro_interval_p);\n        min_i = min(automode_speedmin, automode_speedmax);\n        max_i = max(automode_speedmin, automode_speedmax);\n        r_int = n0 * 0.5 + 0.5;\n        new_interval = max(64, g.keep(min_i + g.keep(r_int * (max_i - min_i))) * (ma.SR * 0.001));\n        min_d = min(automode_grainmin, automode_grainmax);\n        max_d = max(automode_grainmin, automode_grainmax);\n        r_dur = n1 * 0.5 + 0.5;\n        new_target = max(64, min(g.keep(min_d + g.keep(r_dur * (max_d - min_d))) * (ma.SR * 0.001), 288000));\n        metro_timer = select2(auto_mode, metro_timerd,\n                      select2(auto_run, 0, select2(counting, metro_timerd, select2(tick, mt1, 0))));\n        metro_interval = select2(tick, metro_interval_p, new_interval);\n        target = select2(tick, target_p, new_target);\n        auto_cap1 = select2(tick, auto_cap0, 1);\n        cap_timer1 = select2(tick, cap_timerd, 0);\n        // auto: capturing\n        capturing = auto_run & (auto_cap1 != 0);\n        auto_poke = capturing & (cap_timer1 < 288000);\n        cap_timer2 = cap_timer1 + 1;\n        auto_done = capturing & (cap_timer2 >= target);\n        cap_timer = select2(capturing, cap_timer1, cap_timer2);\n        auto_cap = select2(auto_mode, auto_cap0,\n                   select2(auto_run, 0, select2(auto_done, auto_cap1, 0)));\n\n        // manual\n        man_now = trigger > 0.5;\n        man_poke = man_mode & man_now & (man_count0 < 288000);\n        man_count1 = select2(man_poke, man_count0, man_count0 + 1);\n        man_done = man_mode & (man_now == 0) & (g.init(0, prev_mand) != 0);\n        man_count = select2(man_done, man_count1, 0);\n        prev_man = select2(man_mode, prev_mand, man_now);\n\n        poke_idx = select2(auto_mode, man_count0, cap_timer1);\n        widx = select2(auto_poke | man_poke, 2 * BUF, rec_buf * BUF + poke_idx);\n\n        jfc = auto_done | man_done;\n        captured = select2(auto_mode, max(64, man_count1), target);\n\n        // 5. new loop\n        play_buf = select2(jfc, play_bufd, rec_buf);\n        loop_len = select2(jfc, loop_len_p, max(64, min(captured, 288000)));\n        loop_ms = select2(jfc, loop_ms_p, loop_len * g.divsr(1000.0));\n        has_data = select2(jfc, has_data0, 1);\n        play_ph1 = select2(jfc, play_ph0, select2(speed >= 0.0, 1.0, 0.0));\n        pan_cur = select2(jfc, pan_curd, n2 * g.clip(0.0, 1.0, pan_percentage * 0.01));\n        r_vol = n3 * 0.5 + 0.5;\n        vol_scale = select2(jfc, vol_scale_p, 1.0 - g.keep(r_vol * g.clip(0.0, 0.8, g.keep(volume_percentage * 0.01) * 0.8)));\n        r_hick = (n4 * 0.5 + 0.5) * 100.0;\n        is_hickup = select2(jfc, is_hickupd, r_hick < hickup_percentage);\n\n        // 6. playhead\n        active = (has_data > 0.5) & (loop_len > 1);\n        curr_idx = g.clip(0.0, loop_len - 1.0, g.keep(play_ph1 * loop_len));\n        fade_len = min(g.mstosamps(1.5), floor(loop_len * 0.25));\n        fade_gain = select2(fade_len > 1.0, 1.0,\n                    select2(curr_idx < fade_len,\n                        select2(curr_idx > (loop_len - fade_len), 1.0,\n                            0.5 - 0.5 * cos(g.safediv(loop_len - curr_idx, fade_len) * PI)),\n                        0.5 - 0.5 * cos(g.safediv(curr_idx, fade_len) * PI)));\n        i0 = floor(curr_idx);\n        i1 = min(i0 + 1, loop_len - 1);\n        fr = curr_idx - i0;\n        slot(i) = select2((j >= BUF) | (j < 0), play_buf * BUF + j, 2 * BUF) with { j = int(floor(i)); };\n        ri0 = slot(i0);\n        ri1 = slot(i1);\n        target_gate = select2(is_hickup != 0, 1.0, 0.0);\n        gate = select2(active, gate_p, g.fixdenorm(gate_p + g.keep((target_gate - gate_p) * 0.02)));\n        theta = g.keep(g.clip(-1.0, 1.0, pan_cur) + 1.0) * 0.78539816339744828;\n        safe_speed = select2(abs(speed) < 0.001, speed, 0.0);\n        ph_inc = g.safediv(safe_speed, max(1.0, loop_len));\n        play_ph = select2(active, play_ph1, g.wrap(0.0, 1.0, g.keep(play_ph1 + ph_inc)));\n\n        // 7. decimation counter\n        down_factor = floor(1.0 + g.clip(0.0, 1.0, downsample * 0.01) * 24.0);\n        dc1 = down_countd + 1;\n        dtick = dc1 >= down_factor;\n        down_count = select2(dtick, dc1, 0);\n    };\n};\n\n// ---------------------------------------------------------------- audio\n// Data b0_L/b1_L (b0_R/b1_R) as one table of 2 * BUF slots and a trash slot,\n// written at widx before this frame's peeks (one table per read)\npeek(x, widx, ri) = select2(ri < 2 * BUF, 0.0, rwtable(2 * BUF + 1, 0.0, int(widx), x, int(ri)));\n\nskipper(in1, in2, n0, n1, n2, n3, n4) = out1, out2, loop_ms, speed\nwith {\n    c = ctrl(n0, n1, n2, n3, n4);\n    widx = c : ba.selector(0, 11);\n    active = c : ba.selector(1, 11);\n    ri0 = c : ba.selector(2, 11);\n    ri1 = c : ba.selector(3, 11);\n    fr = c : ba.selector(4, 11);\n    fade_gain = c : ba.selector(5, 11);\n    vol_scale = c : ba.selector(6, 11);\n    gate = c : ba.selector(7, 11);\n    theta = c : ba.selector(8, 11);\n    loop_ms = c : ba.selector(9, 11);\n    dtick = c : ba.selector(10, 11);\n\n    raw_L = g.mix(peek(in1, widx, ri0), peek(in1, widx, ri1), fr);\n    raw_R = g.mix(peek(in2, widx, ri0), peek(in2, widx, ri1), fr);\n    grain_L = g.keep(g.keep(g.keep(raw_L * fade_gain) * vol_scale) * gate);\n    grain_R = g.keep(g.keep(g.keep(raw_R * fade_gain) * vol_scale) * gate);\n    wet_L = select2(active, 0.0, g.keep(grain_L * cos(theta)) * 1.41421356);\n    wet_R = select2(active, 0.0, g.keep(grain_R * sin(theta)) * 1.41421356);\n\n    hold(x) = (\\(h).(select2(dtick, h, x))) ~ _;\n    ds_on = downsample > 0.5;\n    ds_wet_L = select2(ds_on, wet_L, hold(wet_L));\n    ds_wet_R = select2(ds_on, wet_R, hold(wet_R));\n    lim_wet_L = ma.tanh(ds_wet_L * 1.15) * 0.95;\n    lim_wet_R = ma.tanh(ds_wet_R * 1.15) * 0.95;\n    eff_mix = g.clip(0.0, 1.0, mix_p * 0.01);\n    out1 = g.mix(in1, lim_wet_L, eff_mix);\n    out2 = g.mix(in2, lim_wet_R, eff_mix);\n};\n\nba = library(\"basics.lib\");\n\ndet = skipper;\nprocess = (_, _, g.noises(5, 0), g.noises(5, 1), g.noises(5, 2), g.noises(5, 3), g.noises(5, 4)) : det;\n",
                    "sourcecode_size": 25305,
                    "sample_format": 1,
                    "version": "1.87"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        246.0,
                        323.0,
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
                    "id": "obj-74",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        210.0,
                        125.49801170825958,
                        22.0
                    ],
                    "text": "trigger"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        513.4980117082596,
                        210.0,
                        77.53384864330292,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        513.4980117082596,
                        234.0,
                        120,
                        22
                    ],
                    "text": "prepend trigger",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        638.4980117082596,
                        234.0,
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
                    "id": "obj-77",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        139.0,
                        124.0,
                        22.0
                    ],
                    "text": "mix (%)"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        512.0,
                        139.0,
                        79.0318603515625,
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
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        512.0,
                        163.0,
                        120,
                        22
                    ],
                    "text": "prepend mix",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        637.0,
                        163.0,
                        90,
                        22
                    ],
                    "text": "set 80.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        236.0,
                        125.49801170825958,
                        22.0
                    ],
                    "text": "kill_capture"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        513.4980117082596,
                        236.0,
                        77.53384864330292,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        513.4980117082596,
                        260.0,
                        120,
                        22
                    ],
                    "text": "prepend kill_capture",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        638.4980117082596,
                        260.0,
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
                    "id": "obj-83",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        161.0,
                        124.51056250929832,
                        22.0
                    ],
                    "text": "triggermode"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        512.5105625092983,
                        161.0,
                        78.15611389279366,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        512.5105625092983,
                        185.0,
                        120,
                        22
                    ],
                    "text": "prepend triggermode",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        637.5105625092983,
                        185.0,
                        90,
                        22
                    ],
                    "text": "set 1",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        514.0,
                        145.31986784934998,
                        22.0
                    ],
                    "text": "automode_speedmin (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        533.31986784935,
                        514.0,
                        57.711992502212524,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 2.0,
                    "maximum": 10000.0
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        533.31986784935,
                        538.0,
                        120,
                        22
                    ],
                    "text": "prepend automode_speedmin",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        658.31986784935,
                        538.0,
                        90,
                        22
                    ],
                    "text": "set 250.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        301.0,
                        125.09960532188416,
                        22.0
                    ],
                    "text": "volume_percentage (%)"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        513.0996053218842,
                        301.0,
                        77.93225502967834,
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
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        513.0996053218842,
                        325.0,
                        120,
                        22
                    ],
                    "text": "prepend volume_percentage",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        638.0996053218842,
                        325.0,
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
                    "id": "obj-92",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        374.0,
                        125.09960532188416,
                        22.0
                    ],
                    "text": "downsample"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        513.0996053218842,
                        374.0,
                        77.93225502967834,
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
                    "id": "obj-93",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        513.0996053218842,
                        398.0,
                        120,
                        22
                    ],
                    "text": "prepend downsample",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        638.0996053218842,
                        398.0,
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
                    "id": "obj-95",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        259.0,
                        125.09960532188416,
                        22.0
                    ],
                    "text": "speed"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        513.0996053218842,
                        259.0,
                        77.93225502967834,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -4.0,
                    "maximum": 4.0
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        513.0996053218842,
                        283.0,
                        120,
                        22
                    ],
                    "text": "prepend speed",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        638.0996053218842,
                        283.0,
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
                    "id": "obj-98",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        540.0,
                        145.31986784934998,
                        22.0
                    ],
                    "text": "automode_speedmax (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        533.31986784935,
                        540.0,
                        57.711992502212524,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 2.0,
                    "maximum": 10000.0
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        533.31986784935,
                        564.0,
                        120,
                        22
                    ],
                    "text": "prepend automode_speedmax",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        658.31986784935,
                        564.0,
                        90,
                        22
                    ],
                    "text": "set 1000.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        462.0,
                        145.31986784934998,
                        22.0
                    ],
                    "text": "automode_grainmin (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        533.31986784935,
                        462.0,
                        57.711992502212524,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 2.0,
                    "maximum": 6000.0
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        533.31986784935,
                        486.0,
                        120,
                        22
                    ],
                    "text": "prepend automode_grainmin",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        658.31986784935,
                        486.0,
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
                    "id": "obj-104",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        186.0,
                        124.51056250929832,
                        22.0
                    ],
                    "text": "automode_on"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        512.5105625092983,
                        186.0,
                        78.15611389279366,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        512.5105625092983,
                        210.0,
                        120,
                        22
                    ],
                    "text": "prepend automode_on",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        637.5105625092983,
                        210.0,
                        90,
                        22
                    ],
                    "text": "set 1",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        325.0,
                        125.09960532188416,
                        22.0
                    ],
                    "text": "hickup_percentage (%)"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        513.0996053218842,
                        325.0,
                        77.93225502967834,
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
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        513.0996053218842,
                        349.0,
                        120,
                        22
                    ],
                    "text": "prepend hickup_percentage",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        638.0996053218842,
                        349.0,
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
                    "id": "obj-110",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        487.0,
                        145.31986784934998,
                        22.0
                    ],
                    "text": "automode_grainmax (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        533.31986784935,
                        487.0,
                        57.711992502212524,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 2.0,
                    "maximum": 6000.0
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        533.31986784935,
                        511.0,
                        120,
                        22
                    ],
                    "text": "prepend automode_grainmax",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        658.31986784935,
                        511.0,
                        90,
                        22
                    ],
                    "text": "set 800.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        388.0,
                        350.0,
                        125.09960532188416,
                        22.0
                    ],
                    "text": "pan_percentage (%)"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        513.0996053218842,
                        350.0,
                        77.93225502967834,
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
                    "id": "obj-114",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        513.0996053218842,
                        374.0,
                        120,
                        22
                    ],
                    "text": "prepend pan_percentage",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-115",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        638.0996053218842,
                        374.0,
                        90,
                        22
                    ],
                    "text": "set 80.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-116",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        46.0,
                        245.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen skipper replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/skipper.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/skipper.maxpat.",
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
                        3
                    ],
                    "destination": [
                        "obj-13",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-1",
                        1
                    ],
                    "destination": [
                        "obj-2",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-1",
                        0
                    ],
                    "destination": [
                        "obj-2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-1",
                        2
                    ],
                    "destination": [
                        "obj-71",
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
                        "obj-20",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-11",
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
                        "obj-17",
                        0
                    ],
                    "destination": [
                        "obj-20",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-2",
                        1
                    ],
                    "destination": [
                        "obj-7",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-2",
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
                        "obj-20",
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
                        "obj-20",
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
                        "obj-22",
                        2
                    ],
                    "destination": [
                        "obj-2",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-22",
                        2
                    ],
                    "destination": [
                        "obj-31",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-23",
                        0
                    ],
                    "destination": [
                        "obj-18",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-31",
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
                        "obj-36",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-14",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-76",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-76",
                        0
                    ],
                    "destination": [
                        "obj-14",
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
                        "obj-14",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-79",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-79",
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
                        "obj-26",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-82",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-82",
                        0
                    ],
                    "destination": [
                        "obj-26",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-18",
                        0
                    ],
                    "destination": [
                        "obj-26",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-85",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-85",
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
                        "obj-36",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-88",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-88",
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
                        "obj-32",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-91",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-91",
                        0
                    ],
                    "destination": [
                        "obj-32",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-94",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-94",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-97",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-97",
                        0
                    ],
                    "destination": [
                        "obj-39",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-4",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-100",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-100",
                        0
                    ],
                    "destination": [
                        "obj-4",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-103",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-103",
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
                        "obj-55",
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
                        "obj-1",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-106",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-55",
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
                        "obj-108",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-108",
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
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-109",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-109",
                        0
                    ],
                    "destination": [
                        "obj-6",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-8",
                        0
                    ],
                    "destination": [
                        "obj-111",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-111",
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
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-112",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-8",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-9",
                        0
                    ],
                    "destination": [
                        "obj-114",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-114",
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
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-115",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-115",
                        0
                    ],
                    "destination": [
                        "obj-9",
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
            800.0,
            600.0
        ],
        "openrectmode": 0,
        "globalpatchername": "skipper",
        "parameters": {
            "obj-2": [
                "live.gain~",
                "live.gain~",
                0
            ],
            "obj-36": [
                "auto",
                "auto",
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