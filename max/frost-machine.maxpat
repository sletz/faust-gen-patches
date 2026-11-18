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
                    "id": "obj-75",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        186.0,
                        139.0,
                        31.0,
                        20.0
                    ],
                    "text": "sine"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        141.0,
                        124.0,
                        45.0,
                        20.0
                    ],
                    "text": "burst 2"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        91.0,
                        139.0,
                        45.0,
                        20.0
                    ],
                    "text": "burst 1"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        44.0,
                        124.0,
                        61.0,
                        20.0
                    ],
                    "text": "play sfiles"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        62.0,
                        408.0,
                        47.0
                    ],
                    "fontsize": 18.0,
                    "linecount": 2,
                    "text": "industrial reverb with hard fuzz and auto-pumping compressor (think Ben Frost)"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        120.0,
                        403.0,
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
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        11.0,
                        309.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "The Frost Machine"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        120.0,
                        441.0,
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
                                "obj-7",
                                "flonum",
                                "float",
                                21.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                94.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                0.10000000000000002,
                                5,
                                "obj-9",
                                "number",
                                "int",
                                200.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                -16.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.6,
                                5,
                                "obj-111",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-16",
                                "number",
                                "int",
                                800.0,
                                5,
                                "obj-18",
                                "flonum",
                                "float",
                                6.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-20",
                                "number",
                                "int",
                                1000.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                -8.0
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                94.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                0.07000000000000002,
                                5,
                                "obj-9",
                                "number",
                                "int",
                                500.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                -15.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.9320000000000003,
                                5,
                                "obj-111",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-16",
                                "number",
                                "int",
                                2000.0,
                                5,
                                "obj-18",
                                "flonum",
                                "float",
                                10.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                6.0,
                                5,
                                "obj-20",
                                "number",
                                "int",
                                6000.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                -9.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                100.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                60.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                0.4,
                                5,
                                "obj-9",
                                "number",
                                "int",
                                500.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                -15.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.9,
                                5,
                                "obj-111",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-16",
                                "number",
                                "int",
                                800.0,
                                5,
                                "obj-18",
                                "flonum",
                                "float",
                                30.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                6.0,
                                5,
                                "obj-20",
                                "number",
                                "int",
                                6000.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                -16.0
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                53.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                85.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                0.15,
                                5,
                                "obj-9",
                                "number",
                                "int",
                                500.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                -20.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.9300000000000002,
                                5,
                                "obj-111",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-16",
                                "number",
                                "int",
                                800.0,
                                5,
                                "obj-18",
                                "flonum",
                                "float",
                                50.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                20.0,
                                5,
                                "obj-20",
                                "number",
                                "int",
                                3000.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                -22.0
                            ]
                        },
                        {
                            "number": 5,
                            "data": [
                                5,
                                "obj-7",
                                "flonum",
                                "float",
                                40.0,
                                5,
                                "obj-4",
                                "flonum",
                                "float",
                                80.0,
                                5,
                                "obj-8",
                                "flonum",
                                "float",
                                0.07000000000000002,
                                5,
                                "obj-9",
                                "number",
                                "int",
                                250.0,
                                5,
                                "obj-10",
                                "flonum",
                                "float",
                                -24.0,
                                5,
                                "obj-11",
                                "flonum",
                                "float",
                                0.7000000000000001,
                                5,
                                "obj-111",
                                "toggle",
                                "int",
                                0,
                                5,
                                "obj-16",
                                "number",
                                "int",
                                1000.0,
                                5,
                                "obj-18",
                                "flonum",
                                "float",
                                18.0,
                                5,
                                "obj-19",
                                "flonum",
                                "float",
                                8.0,
                                5,
                                "obj-20",
                                "number",
                                "int",
                                9000.0,
                                5,
                                "obj-12",
                                "flonum",
                                "float",
                                -16.0
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 2,
                    "patching_rect": [
                        50.0,
                        192.0,
                        157.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
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
                            775.0,
                            147.0,
                            361.0,
                            452.0
                        ],
                        "openinpresentation": 1,
                        "lefttoolbarpinned": 2,
                        "toptoolbarpinned": 2,
                        "righttoolbarpinned": 2,
                        "bottomtoolbarpinned": 2,
                        "toolbars_unpinned_last_save": 15,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        613.0,
                                        410.0,
                                        30.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "*~ 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        530.0,
                                        160.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 3,
                                    "outlettype": [
                                        "bang"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        530.0,
                                        198.0,
                                        102.0,
                                        23.0
                                    ],
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0, 0.05 10 0 150"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        613.0,
                                        277.0,
                                        50.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        613.0,
                                        239.0,
                                        172.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "random 1000 @range 100 800"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        687.0,
                                        198.0,
                                        32.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang"
                                    ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        686.0,
                                        160.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 4,
                                    "outlettype": [
                                        "bang"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        613.0,
                                        348.0,
                                        30.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "*~ 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        613.0,
                                        380.0,
                                        93.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        687.0,
                                        323.0,
                                        95.0,
                                        23.0
                                    ],
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0, 0.05 10 0 80"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        687.0,
                                        348.0,
                                        36.0,
                                        23.0
                                    ],
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "outlettype": [
                                        "signal",
                                        "bang"
                                    ],
                                    "text": "line~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        613.0,
                                        314.0,
                                        66.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "cycle~ 500"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        418.0,
                                        254.0,
                                        30.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "*~ 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-29",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        418.0,
                                        289.0,
                                        93.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        492.0,
                                        229.0,
                                        95.0,
                                        23.0
                                    ],
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "0, 0.05 10 0 40"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        492.0,
                                        254.0,
                                        36.0,
                                        23.0
                                    ],
                                    "fontname": "Arial",
                                    "fontsize": 13.0,
                                    "outlettype": [
                                        "signal",
                                        "bang"
                                    ],
                                    "text": "line~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        418.0,
                                        186.0,
                                        70.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "rand~ 6000"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-86",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        492.0,
                                        160.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 2,
                                    "outlettype": [
                                        "bang"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-117",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        13.0,
                                        153.0,
                                        35.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "presentation": 1,
                                    "presentation_rect": [
                                        12.0,
                                        47.0,
                                        35.0,
                                        22.0
                                    ],
                                    "text": "clear"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-112",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        14.0,
                                        97.0,
                                        29.5,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "int"
                                    ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-109",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        14.0,
                                        123.0,
                                        50.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0,
                                    "presentation": 1,
                                    "presentation_rect": [
                                        13.0,
                                        17.0,
                                        50.0,
                                        22.0
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-105",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        14.0,
                                        67.0,
                                        59.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "random 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-94",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        14.0,
                                        40.0,
                                        76.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "text": "metro 90000"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "playlist~",
                                    "numinlets": 1,
                                    "numoutlets": 5,
                                    "patching_rect": [
                                        13.0,
                                        186.0,
                                        388.0,
                                        84.0
                                    ],
                                    "clipheight": 41.0,
                                    "data": {
                                        "clips": []
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
                                    "presentation": 1,
                                    "presentation_rect": [
                                        12.0,
                                        80.0,
                                        332.0,
                                        344.0
                                    ],
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
                                    "id": "obj-5",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        14.0,
                                        5.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1,
                                    "outlettype": [
                                        "int"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        109.0,
                                        571.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 2
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-28",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        13.0,
                                        571.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1
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
                                        "obj-10",
                                        0
                                    ],
                                    "destination": [
                                        "obj-16",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-105",
                                        0
                                    ],
                                    "destination": [
                                        "obj-112",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-109",
                                        0
                                    ],
                                    "destination": [
                                        "obj-91",
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
                                        "obj-10",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-112",
                                        0
                                    ],
                                    "destination": [
                                        "obj-109",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-117",
                                        0
                                    ],
                                    "destination": [
                                        "obj-91",
                                        0
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
                                        "obj-6",
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
                                        "obj-29",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-14",
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
                                        "obj-14",
                                        0
                                    ],
                                    "destination": [
                                        "obj-28",
                                        0
                                    ],
                                    "order": 1
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-15",
                                        0
                                    ],
                                    "destination": [
                                        "obj-16",
                                        0
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
                                        "obj-29",
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
                                        "obj-14",
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
                                        "obj-13",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-29",
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
                                        "obj-28",
                                        0
                                    ],
                                    "order": 1
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
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-4",
                                        0
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
                                        "obj-5",
                                        0
                                    ],
                                    "destination": [
                                        "obj-94",
                                        0
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
                                        "obj-1",
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
                                        "obj-8",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-8",
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
                                        "obj-8",
                                        1
                                    ],
                                    "destination": [
                                        "obj-9",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-86",
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
                                        "obj-9",
                                        0
                                    ],
                                    "destination": [
                                        "obj-12",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-91",
                                        1
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
                                        "obj-91",
                                        0
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
                                        "obj-94",
                                        0
                                    ],
                                    "destination": [
                                        "obj-105",
                                        0
                                    ]
                                }
                            }
                        ],
                        "visible": 1
                    },
                    "text": "p -sfplayer-hihat-"
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        50.0,
                        162.0,
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
                    "id": "obj-100",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        143.0,
                        161.0,
                        25.0,
                        25.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        189.0,
                        161.0,
                        25.0,
                        25.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        96.0,
                        161.0,
                        25.0,
                        25.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        50.0,
                        548.0,
                        45.0,
                        45.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        50.0,
                        385.0,
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
                        50.0,
                        342.0,
                        157.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "varname": "faust_frost_machine",
                    "sourcecode": "// frost-machine: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/frost-machine.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// FROST-MACHINE: industrial lush / dark ambient sound processor\n// (gen~: gendsp/frost-machine.gendsp)\n//\n// Industrial sound sculpture inspired by Ben Frost's music:\n//  1. input damping: a one-pole lowpass (p_damp_hz) darkening the input;\n//  2. pre-diffusion: 4 fixed allpasses per channel (512..1571 samples,\n//     g = 0.7, 0.6, 0.5, 0.4) smearing the attacks;\n//  3. reverb core: a cross-coupled stereo loop of two allpasses per channel\n//     (g = 0.7, 0.6) on delays of (50 + 400*p_size) ms times 0.41/0.89 (L) and\n//     0.47/0.83 (R), modulated by a sine/cosine LFO (p_mod_ms, p_mod_hz,\n//     linear interpolation), each channel's output fed to the other's input\n//     scaled by p_decay_pct;\n//  4. fuzz: asymmetric hard clip of the reverb output (gain p_fuzz_db,\n//     clamp to [-1.1, 0.8]);\n//  5. tone: a one-pole lowpass after the fuzz (p_fuzz_hz);\n//  6. \"la vague\": ducking of the wet signal by an envelope of the dry input\n//     (5 ms attack, p_release_ms release), (thresh/env)^2.5 above p_pump_db;\n//  7. wet gain (x2, p_gain_wet_db) and dry/wet mix (p_mix_pct).\n//\n// in1, in2: audio L, R     out1, out2: processed L, R\n//\n// Parameters: p_size (0..1), p_decay_pct (0..100 %, clipped to 0.98),\n// p_damp_hz (100..16000 Hz), p_mod_ms (0..20 ms), p_mod_hz (0..5 Hz),\n// p_fuzz_db (0..60 dB), p_fuzz_hz (100..8000 Hz), p_pump_db (-60..0 dB),\n// p_release_ms (10..5000 ms), p_gain_wet_db (-60..24 dB), p_mix_pct (0..100 %).\n//\n// Note: the gendsp's header comment lists a soft-clip safety limiter as the\n// last stage; the code has none (the wet signal is only gained, x2, and\n// mixed). The port follows the code.\n\ndeclare name \"frost-machine\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\nma = library(\"maths.lib\");\nsi = library(\"signals.lib\");\n\np_size = hslider(\"p_size\", 0.6, 0, 1, 0.001);\np_decay_pct = hslider(\"p_decay_pct [unit:%]\", 94, 0, 100, 0.01);\np_damp_hz = hslider(\"p_damp_hz [unit:Hz]\", 3000, 100, 16000, 1);\np_mod_ms = hslider(\"p_mod_ms [unit:ms]\", 6.0, 0, 20, 0.01);\np_mod_hz = hslider(\"p_mod_hz [unit:Hz]\", 0.2, 0, 5, 0.001);\np_fuzz_db = hslider(\"p_fuzz_db [unit:dB]\", 35, 0, 60, 0.01);\np_fuzz_hz = hslider(\"p_fuzz_hz [unit:Hz]\", 800, 100, 8000, 1);\np_pump_db = hslider(\"p_pump_db [unit:dB]\", -30, -60, 0, 0.01);\np_release_ms = hslider(\"p_release_ms [unit:ms]\", 2000, 10, 5000, 1);\np_gain_wet_db = hslider(\"p_gain_wet_db [unit:dB]\", 0, -60, 24, 0.01);\np_mix_pct = hslider(\"p_mix_pct [unit:%]\", 50, 0, 100, 0.01);\n\nTWOPI_NEG = 0 - 6.2831853071795862;\n\n// ---------------------------------------------------------------- LFO, damping\nph = (+(g.safediv(p_mod_hz, ma.SR)) : g.wrap(0, 1)) ~ _;\nlfoL = sin((ph * 2) * 3.1415926535897931);\nlfoR = cos((ph * 2) * 3.1415926535897931);\n\ncd = exp(g.safediv(TWOPI_NEG * p_damp_hz, ma.SR));\n// h_d = fixdenorm(x*(1 - cd) + h_d*cd), the new value read\ndamp(x) = (\\(h).(g.fixdenorm((x * (1 - cd)) + (h * cd)))) ~ _;\n\n// ---------------------------------------------------------------- pre-diffusion\n// Delay of maximum >= N read at N (read_step, before its write: delay N):\n// r = w@N, w = x + c*r, out = -c*x + r\nap(N, c, x) = ((0 - c) * x) + (w @ N)\nwith { w = (\\(wd).(x + (c * (wd @ (N - 1))))) ~ _; };\n\npreL = ap(512, 0.7) : ap(773, 0.6) : ap(1131, 0.5) : ap(1571, 0.4);\npreR = ap(523, 0.7) : ap(761, 0.6) : ap(1153, 0.5) : ap(1549, 0.4);\n\n// ---------------------------------------------------------------- reverb core\nv_decay = g.clamp(0, 0.98, p_decay_pct * 0.01);\nm_depth = p_mod_ms * (ma.SR * 0.001);\ns_base = (50 + (p_size * 400)) * (ma.SR * 0.001);\n\n// the cross-coupled loop: the four Delays' written signals and hR_fb come back\n// one sample late (the `~`); outputs vL2, vR2 after the five fed back\ntank(wL1d, wL2d, wR1d, wR2d, hR_fbd, xL, xR) = wL1, wL2, wR1, wR2, hR_fb, vL2, vR2\nwith {\n    nL = xL + (hR_fbd * v_decay);\n    sL1 = (s_base * 0.41) + (lfoL * m_depth);\n    rL1 = g.rd_linear_fb(12000, 12000, wL1d, sL1);\n    vL1 = ((0 - 0.7) * nL) + rL1;\n    wL1 = nL + (0.7 * vL1);\n    sL2 = (s_base * 0.89) + (lfoR * m_depth);\n    rL2 = g.rd_linear_fb(18000, 18000, wL2d, sL2);\n    vL2 = ((0 - 0.6) * vL1) + rL2;\n    wL2 = vL1 + (0.6 * vL2);\n    hL_fb = g.fixdenorm(vL2);\n\n    nR = xR + (hL_fb * v_decay);\n    sR1 = (s_base * 0.47) + (lfoR * m_depth);\n    rR1 = g.rd_linear_fb(12000, 12000, wR1d, sR1);\n    vR1 = ((0 - 0.7) * nR) + rR1;\n    wR1 = nR + (0.7 * vR1);\n    sR2 = (s_base * 0.83) + (lfoL * m_depth);\n    rR2 = g.rd_linear_fb(18000, 18000, wR2d, sR2);\n    vR2 = ((0 - 0.6) * vR1) + rR2;\n    wR2 = vR1 + (0.6 * vR2);\n    hR_fb = g.fixdenorm(vR2);\n};\n\n// ---------------------------------------------------------------- fuzz, tone\nf_gain = g.safepow(10, p_fuzz_db * 0.05);\nfuzz(v) = g.clamp(-1.1, 0.8, v * f_gain);\ncf_f = exp(g.safediv(TWOPI_NEG * p_fuzz_hz, ma.SR));\n// f = x*(1-cf) + h*cf, h = fixdenorm(f): f is output\ntone(x) = (\\(h).(g.fixdenorm(f(h)), f(h))) ~ _ : !, _\nwith { f(h) = (x * (1 - cf_f)) + (h * cf_f); };\n\n// ---------------------------------------------------------------- la vague\nc_atk = exp(g.safediv(-1, ma.SR * 0.005));\nc_rel = exp(g.safediv(-1, ma.SR * (p_release_ms * 0.001)));\nv_thresh = g.safepow(10, p_pump_db * 0.05);\nenv(a) = (\\(h).(select2(a > h, a + (c_rel * (h - a)), a + (c_atk * (h - a))))) ~ _;\ngain_vague(h) = select2(h > v_thresh, 1, g.safepow(g.safediv(v_thresh, h), 2.5));\n\n// ---------------------------------------------------------------- mix\nv_gain_wet = g.safepow(10, p_gain_wet_db * 0.05);\nv_mix = p_mix_pct * 0.01;\n\nfrost(in1, in2) = (damp(in1) : preL), (damp(in2) : preR)\n    : (tank ~ si.bus(5)) : si.block(5), (fuzz : tone), (fuzz : tone)\n    : mixout\nwith {\n    gv = gain_vague(env((abs(in1) + abs(in2)) * 0.5));\n    mixout(fL, fR) = out1, out2\n    with {\n        wetL_final = ((fL * gv) * v_gain_wet) * 2;\n        wetR_final = ((fR * gv) * v_gain_wet) * 2;\n        out1 = (in1 * (1 - v_mix)) + (wetL_final * v_mix);\n        out2 = (in2 * (1 - v_mix)) + (wetR_final * v_mix);\n    };\n};\n\nprocess = frost;\n// no noise() in the patch: det is process\ndet = process;\n",
                    "sourcecode_size": 19458,
                    "sample_format": 1,
                    "version": "1.87"
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        250.0,
                        372.0,
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
                    "id": "obj-113",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        442.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_pump_db (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        442.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -60.0,
                    "maximum": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        466.0,
                        120,
                        22
                    ],
                    "text": "prepend p_pump_db",
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
                        530.0,
                        466.0,
                        90,
                        22
                    ],
                    "text": "set -30.0",
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
                        274.0,
                        222.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_size"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        222.0,
                        64.0,
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
                    "id": "obj-117",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        246.0,
                        120,
                        22
                    ],
                    "text": "prepend p_size",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-118",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        246.0,
                        90,
                        22
                    ],
                    "text": "set 0.6",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        508.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_gain_wet_db (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        508.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": -60.0,
                    "maximum": 24.0
                }
            },
            {
                "box": {
                    "id": "obj-120",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        532.0,
                        120,
                        22
                    ],
                    "text": "prepend p_gain_wet_db",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-121",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        532.0,
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
                    "id": "obj-122",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        387.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_fuzz_hz (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        387.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 100.0,
                    "maximum": 8000.0
                }
            },
            {
                "box": {
                    "id": "obj-123",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        411.0,
                        120,
                        22
                    ],
                    "text": "prepend p_fuzz_hz",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-124",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        411.0,
                        90,
                        22
                    ],
                    "text": "set 800",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-125",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        363.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_fuzz_db (dB)"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        363.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 60.0
                }
            },
            {
                "box": {
                    "id": "obj-126",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        387.0,
                        120,
                        22
                    ],
                    "text": "prepend p_fuzz_db",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-127",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        387.0,
                        90,
                        22
                    ],
                    "text": "set 35.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-128",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        319.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_mod_ms (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        319.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 20.0
                }
            },
            {
                "box": {
                    "id": "obj-129",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        343.0,
                        120,
                        22
                    ],
                    "text": "prepend p_mod_ms",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-130",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        343.0,
                        90,
                        22
                    ],
                    "text": "set 6.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-131",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        271.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_damp_hz (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        271.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 100.0,
                    "maximum": 16000.0
                }
            },
            {
                "box": {
                    "id": "obj-132",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        295.0,
                        120,
                        22
                    ],
                    "text": "prepend p_damp_hz",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-133",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        295.0,
                        90,
                        22
                    ],
                    "text": "set 3000",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-134",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        246.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_decay_pct (%)"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        246.0,
                        64.0,
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
                    "id": "obj-135",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        270.0,
                        120,
                        22
                    ],
                    "text": "prepend p_decay_pct",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-136",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        270.0,
                        90,
                        22
                    ],
                    "text": "set 94.0",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-137",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        183.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_mix_pct (%)"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        183.0,
                        64.0,
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
                    "id": "obj-138",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        207.0,
                        120,
                        22
                    ],
                    "text": "prepend p_mix_pct",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-139",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        207.0,
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
                    "id": "obj-140",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        295.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_mod_hz (Hz)"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        295.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 0.0,
                    "maximum": 5.0
                }
            },
            {
                "box": {
                    "id": "obj-141",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        319.0,
                        120,
                        22
                    ],
                    "text": "prepend p_mod_hz",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-142",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        319.0,
                        90,
                        22
                    ],
                    "text": "set 0.2",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-143",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        274.0,
                        467.0,
                        131.0,
                        22.0
                    ],
                    "text": "p_release_ms (ms)"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        467.0,
                        64.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "minimum": 10.0,
                    "maximum": 5000.0
                }
            },
            {
                "box": {
                    "id": "obj-144",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        491.0,
                        120,
                        22
                    ],
                    "text": "prepend p_release_ms",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-145",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        530.0,
                        491.0,
                        90,
                        22
                    ],
                    "text": "set 2000",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-146",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        50.0,
                        294.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen frost-machine replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/frost-machine.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/frost-machine.maxpat.",
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
                        "obj-3",
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
                        "obj-3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-100",
                        0
                    ],
                    "destination": [
                        "obj-29",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-111",
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
                        "obj-13",
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
                        2
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
                        "obj-25",
                        0
                    ],
                    "destination": [
                        "obj-29",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-29",
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
                        "obj-29",
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
                        "obj-3",
                        1
                    ],
                    "destination": [
                        "obj-6",
                        1
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
                        "obj-6",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-86",
                        0
                    ],
                    "destination": [
                        "obj-29",
                        3
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
                        "obj-112",
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
                        "obj-10",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-11",
                        0
                    ],
                    "destination": [
                        "obj-117",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-117",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-118",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-118",
                        0
                    ],
                    "destination": [
                        "obj-11",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-12",
                        0
                    ],
                    "destination": [
                        "obj-120",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-120",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-121",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-121",
                        0
                    ],
                    "destination": [
                        "obj-12",
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
                        "obj-123",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-123",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-124",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-124",
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
                        "obj-18",
                        0
                    ],
                    "destination": [
                        "obj-126",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-126",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-127",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-127",
                        0
                    ],
                    "destination": [
                        "obj-18",
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
                        "obj-129",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-129",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-130",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-130",
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
                        "obj-20",
                        0
                    ],
                    "destination": [
                        "obj-132",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-132",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-133",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-133",
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
                        "obj-4",
                        0
                    ],
                    "destination": [
                        "obj-135",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-135",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-136",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-136",
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
                        "obj-7",
                        0
                    ],
                    "destination": [
                        "obj-138",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-138",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-139",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-139",
                        0
                    ],
                    "destination": [
                        "obj-7",
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
                        "obj-141",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-141",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-142",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-142",
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
                        "obj-144",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-144",
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
                        "obj-112",
                        0
                    ],
                    "destination": [
                        "obj-145",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-145",
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
            600.0,
            600.0
        ],
        "openrectmode": 0,
        "parameters": {
            "obj-3": [
                "live.gain~",
                "live.gain~",
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