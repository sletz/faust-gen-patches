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
        "subpatcher_template": "maxb-default-template",
        "boxes": [
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        528.3870967741935,
                        290.35483870967744,
                        59.61290322580646,
                        35.0
                    ],
                    "linecount": 2,
                    "outlettype": [
                        ""
                    ],
                    "presentation_linecount": 3,
                    "text": "stereo_spread $1"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        528.3870967741935,
                        231.00000000000003,
                        44.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        0.403921568627451,
                        0.690196078431373,
                        1.0
                    ],
                    "activefgdialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "annotation": "",
                    "bordercolor": [
                        0.352941176470588,
                        0.352941176470588,
                        0.352941176470588,
                        0.0
                    ],
                    "dialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.313725490196078,
                        0.313725490196078,
                        0.313725490196078,
                        0.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "prototypename": "amount",
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                40
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "stspread",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "stspread",
                            "parameter_type": 0,
                            "parameter_unitstyle": 5
                        }
                    },
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "varname": "stspread"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        228.0,
                        231.0,
                        52.0,
                        48.0
                    ],
                    "needlemode": 2,
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "filtenv",
                            "parameter_mmax": 100.0,
                            "parameter_mmin": -100.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "filtenv",
                            "parameter_type": 0,
                            "parameter_unitstyle": 5
                        }
                    },
                    "varname": "filtenv"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        228.0,
                        290.0,
                        52.0,
                        35.0
                    ],
                    "linecount": 2,
                    "outlettype": [
                        ""
                    ],
                    "presentation_linecount": 2,
                    "text": "env_to_filt $1"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        43.0,
                        49.0,
                        545.0,
                        47.0
                    ],
                    "fontsize": 18.0,
                    "linecount": 2,
                    "text": "Performs a sort of \"telephone\" effect. Filter (Lwpass<->Hpass) + Distort (overdive) + hickup a signal (brutal on/off amp modulation).",
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        43.0,
                        6.0,
                        146.0,
                        41.0
                    ],
                    "fontsize": 31.282376425230325,
                    "text": "Fhickup",
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        147.0,
                        376.0,
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
                    "id": "obj-23",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        147.0,
                        420.0,
                        127.0,
                        53.0
                    ],
                    "active1": [
                        0.0,
                        0.584313725490196,
                        0.996078431372549,
                        1.0
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
                                "obj-105",
                                "live.dial",
                                "float",
                                50.0,
                                5,
                                "obj-2",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "live.dial",
                                "float",
                                1211.9815673828125,
                                5,
                                "obj-5",
                                "live.dial",
                                "float",
                                71.6535415649414,
                                5,
                                "obj-21",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-20",
                                "live.dial",
                                "float",
                                12.897945404052734,
                                5,
                                "obj-7",
                                "live.dial",
                                "float",
                                98.4251937866211,
                                5,
                                "obj-18",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                40.0
                            ]
                        },
                        {
                            "number": 2,
                            "data": [
                                5,
                                "obj-105",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-2",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "live.dial",
                                "float",
                                1357.4091796875,
                                5,
                                "obj-5",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-21",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-20",
                                "live.dial",
                                "float",
                                3.5089263916015625,
                                5,
                                "obj-7",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-18",
                                "live.dial",
                                "float",
                                -61.41732406616211,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                100.0
                            ]
                        },
                        {
                            "number": 3,
                            "data": [
                                5,
                                "obj-105",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-2",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "live.dial",
                                "float",
                                2625.16650390625,
                                5,
                                "obj-5",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-21",
                                "live.dial",
                                "float",
                                9.0,
                                5,
                                "obj-20",
                                "live.dial",
                                "float",
                                5.413562774658203,
                                5,
                                "obj-7",
                                "live.dial",
                                "float",
                                36.45669174194336,
                                5,
                                "obj-18",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                0.0
                            ]
                        },
                        {
                            "number": 4,
                            "data": [
                                5,
                                "obj-105",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-2",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "live.dial",
                                "float",
                                7609.15771484375,
                                5,
                                "obj-5",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-21",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-20",
                                "live.dial",
                                "float",
                                144.50259399414062,
                                5,
                                "obj-7",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-18",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                0.0
                            ]
                        },
                        {
                            "number": 5,
                            "data": [
                                5,
                                "obj-105",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-2",
                                "live.dial",
                                "float",
                                68.50393676757812,
                                5,
                                "obj-12",
                                "live.dial",
                                "float",
                                790.9557495117188,
                                5,
                                "obj-5",
                                "live.dial",
                                "float",
                                32.28346633911133,
                                5,
                                "obj-21",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-20",
                                "live.dial",
                                "float",
                                17.991790771484375,
                                5,
                                "obj-7",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-18",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                0.0
                            ]
                        },
                        {
                            "number": 6,
                            "data": [
                                5,
                                "obj-105",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-2",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-12",
                                "live.dial",
                                "float",
                                334.4194641113281,
                                5,
                                "obj-5",
                                "live.dial",
                                "float",
                                32.28346633911133,
                                5,
                                "obj-21",
                                "live.dial",
                                "float",
                                23.0,
                                5,
                                "obj-20",
                                "live.dial",
                                "float",
                                144.71185302734375,
                                5,
                                "obj-7",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-18",
                                "live.dial",
                                "float",
                                36.22047424316406,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                0.0
                            ]
                        },
                        {
                            "number": 7,
                            "data": [
                                5,
                                "obj-105",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-2",
                                "live.dial",
                                "float",
                                91.33858489990234,
                                5,
                                "obj-12",
                                "live.dial",
                                "float",
                                1015.4693603515625,
                                5,
                                "obj-5",
                                "live.dial",
                                "float",
                                32.28346633911133,
                                5,
                                "obj-21",
                                "live.dial",
                                "float",
                                7.0,
                                5,
                                "obj-20",
                                "live.dial",
                                "float",
                                10.72421646118164,
                                5,
                                "obj-7",
                                "live.dial",
                                "float",
                                100.0
                            ]
                        },
                        {
                            "number": 8,
                            "data": [
                                5,
                                "obj-105",
                                "live.dial",
                                "float",
                                78.74015808105469,
                                5,
                                "obj-2",
                                "live.dial",
                                "float",
                                64.56693267822266,
                                5,
                                "obj-12",
                                "live.dial",
                                "float",
                                308.7215270996094,
                                5,
                                "obj-5",
                                "live.dial",
                                "float",
                                100.0,
                                5,
                                "obj-21",
                                "live.dial",
                                "float",
                                4.0,
                                5,
                                "obj-20",
                                "live.dial",
                                "float",
                                1.791704773902893,
                                5,
                                "obj-7",
                                "live.dial",
                                "float",
                                40.1574821472168,
                                5,
                                "obj-18",
                                "live.dial",
                                "float",
                                0.0,
                                5,
                                "obj-24",
                                "live.dial",
                                "float",
                                37.00787353515625
                            ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        461.0,
                        290.0,
                        65.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "hickmix $1"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        461.0,
                        231.0,
                        44.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        0.403921568627451,
                        0.690196078431373,
                        1.0
                    ],
                    "activefgdialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "annotation": "",
                    "bordercolor": [
                        0.352941176470588,
                        0.352941176470588,
                        0.352941176470588,
                        0.0
                    ],
                    "dialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.313725490196078,
                        0.313725490196078,
                        0.313725490196078,
                        0.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "prototypename": "amount",
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "live.dial[3]",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "HickMx",
                            "parameter_type": 0,
                            "parameter_unitstyle": 5
                        }
                    },
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "varname": "live.dial[3]"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        379.0,
                        290.0,
                        70.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "hickclick $1"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        299.0,
                        290.0,
                        67.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "hickfreq $1"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        299.0,
                        231.0,
                        44.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        0.403921568627451,
                        0.690196078431373,
                        1.0
                    ],
                    "activefgdialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "annotation": "",
                    "bordercolor": [
                        0.352941176470588,
                        0.352941176470588,
                        0.352941176470588,
                        0.0
                    ],
                    "dialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.313725490196078,
                        0.313725490196078,
                        0.313725490196078,
                        0.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "prototypename": "freq",
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_exponent": 3.333333,
                            "parameter_initial": [
                                5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "HickFrq",
                            "parameter_mmax": 1000.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "HickFrq",
                            "parameter_type": 0,
                            "parameter_unitstyle": 3
                        }
                    },
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "varname": "HickFrq"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        379.0,
                        231.0,
                        44.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        0.403921568627451,
                        0.690196078431373,
                        1.0
                    ],
                    "activefgdialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "annotation": "",
                    "bordercolor": [
                        0.352941176470588,
                        0.352941176470588,
                        0.352941176470588,
                        0.0
                    ],
                    "dialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.313725490196078,
                        0.313725490196078,
                        0.313725490196078,
                        0.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "prototypename": "amount",
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                5
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "live.dial[5]",
                            "parameter_mmax": 50.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "HickClik",
                            "parameter_type": 1,
                            "parameter_unitstyle": 2
                        }
                    },
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "varname": "live.dial[5]"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "patching_rect": [
                        38.0,
                        404.0,
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
                    "id": "obj-13",
                    "maxclass": "playlist~",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "patching_rect": [
                        38.0,
                        115.0,
                        279.0,
                        57.0
                    ],
                    "clipheight": 27.5,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "FemVoice.aif",
                                "filename": "FemVoice.aif",
                                "filekind": "audiofile",
                                "id": "u795000759",
                                "selection": [
                                    0.23660714285714285,
                                    0.20535714285714285
                                ],
                                "loop": 1,
                                "content_state": {
                                    "loop": 1
                                }
                            },
                            {
                                "absolutepath": "tabla-solo.wav",
                                "filename": "tabla-solo.wav",
                                "filekind": "audiofile",
                                "id": "u470002311",
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
                    "id": "obj-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        54.0,
                        290.0,
                        51.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "drive $1"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        54.0,
                        231.0,
                        44.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        0.403921568627451,
                        0.690196078431373,
                        1.0
                    ],
                    "activefgdialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "annotation": "",
                    "bordercolor": [
                        0.352941176470588,
                        0.352941176470588,
                        0.352941176470588,
                        0.0
                    ],
                    "dialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.313725490196078,
                        0.313725490196078,
                        0.313725490196078,
                        0.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "prototypename": "amount",
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "live.dial[2]",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Drive",
                            "parameter_type": 0,
                            "parameter_unitstyle": 5
                        }
                    },
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "varname": "live.dial[2]"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        405.0,
                        407.09677419354836,
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
                    "id": "obj-14",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        110.0,
                        290.0,
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
                    "id": "obj-12",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        110.0,
                        231.0,
                        44.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        0.403921568627451,
                        0.690196078431373,
                        1.0
                    ],
                    "activefgdialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "annotation": "",
                    "bordercolor": [
                        0.352941176470588,
                        0.352941176470588,
                        0.352941176470588,
                        0.0
                    ],
                    "dialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.313725490196078,
                        0.313725490196078,
                        0.313725490196078,
                        0.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "prototypename": "freq",
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_exponent": 3.333333,
                            "parameter_initial": [
                                2000.0000000000002
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "live.dial[1]",
                            "parameter_mmax": 18000.0,
                            "parameter_mmin": 40.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "Freq",
                            "parameter_type": 0,
                            "parameter_unitstyle": 3
                        }
                    },
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "varname": "live.dial[1]"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        85.0,
                        512.0,
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
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        38.0,
                        575.0,
                        35.0,
                        22.0
                    ],
                    "text": "dac~"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        405.0,
                        347.09677419354836,
                        44.0,
                        48.0
                    ],
                    "activedialcolor": [
                        0.0,
                        0.403921568627451,
                        0.690196078431373,
                        1.0
                    ],
                    "activefgdialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "activeneedlecolor": [
                        0.501960784313725,
                        0.501960784313725,
                        0.501960784313725,
                        1.0
                    ],
                    "annotation": "",
                    "bordercolor": [
                        0.352941176470588,
                        0.352941176470588,
                        0.352941176470588,
                        0.0
                    ],
                    "dialcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.313725490196078,
                        0.313725490196078,
                        0.313725490196078,
                        0.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "prototypename": "amount",
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": ""
                        },
                        "activefgdialcolor": {
                            "expression": ""
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "bordercolor": {
                            "expression": ""
                        },
                        "dialcolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "mix",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "mix",
                            "parameter_type": 0,
                            "parameter_unitstyle": 5
                        }
                    },
                    "textcolor": [
                        1.0,
                        1.0,
                        1.0,
                        1.0
                    ],
                    "varname": "mix"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "patching_rect": [
                        38.0,
                        343.0,
                        118.0,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "varname": "faust_fhickup",
                    "sourcecode": "// fhickup: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/fhickup.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// FHICKUP: overdrive, random amplitude chopper and morphing telephone filter\n// (gen~: gendsp/fhickup.gendsp)\n//\n// An atan overdrive (gain 1 + 1255 (drive/100)^3.664, compensated by a\n// linear map of atan(gain) and by 1 - 0.8 drive/100); then the \"hickup\": a\n// phasor of `hickfreq` Hz draws, at each wrap, a new noise value per channel\n// whose sign opens (< 0) or closes the gate, slewed over `hickclick` ms,\n// crossfaded from a unipolar gate to a bipolar ring modulator (`ringmod`) and\n// mixed in by `hickmix` (+ in4); a DC blocker (pole 0.995); a TPT state\n// variable filter (k = 1/1.414) at `freq`, moved up to +-3 octaves by an\n// input envelope follower (5 ms attack, 60 ms release, `env_to_filt`), whose\n// output morphs low-pass -> band-pass -> high-pass (`filter_morph`); a tanh\n// soft limiter (tanh(1.2 x) 0.95) and the dry/wet `mix`.\n//\n// in1, in2: audio L, R    in3: drive CV (added to drive)\n// in4: hickup depth CV (added to hickmix, in %)\n// out1, out2: processed L, R\n//\n// Parameters (gen~'s ranges and defaults): drive (0..100 %, 15),\n// freq (50..8000 Hz, 1200), filter_morph (0..100 %, 50),\n// env_to_filt (-100..100 %, 0), hickfreq (0.1..1000 Hz, 8),\n// hickclick (0.5..100 ms, 15), hickmix (0..100 %, 60), ringmod (0..100 %, 0),\n// stereo_spread (0..100 %, 40), mix (0..100 %, 100).\n//\n// gen~ quirks kept:\n// - `stereo_spread` does nothing: the GenExpr computes `spr` from it and\n//   never uses it. The two choppers run on the same phase (both histories\n//   start at 0 and step by the same increment); they differ only by their\n//   noise draws.\n// - the gates start closed for the first period (h_rnd starts at 0, and the\n//   gate opens on h_rnd < 0) while their slewed value starts at 1.\n//\n// Noise sites (export order): 0 the left draw, 1 the right draw (each on a\n// phasor wrap).\n\ndeclare name \"fhickup\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them), in genlib's\n// order of operations: every intermediate goes through keep() (below), so\n// that the normalizer neither factors nor folds them (it rewrote\n// x + a*(y - x) and regrouped cubic_interp's coefficient products, a few\n// ulps off genlib's)\nlinear_interp(a, x, y) = x + keep(a * keep(y - x));\ncubic_interp(a, w, x, y, z) = keep(keep(keep(keep(w * fw) + keep(x * fx)) + keep(y * fy)) + keep(z * fz))\nwith {\n    a1 = keep(1 + a); aa = keep(a * a1); b = keep(1 - a); b1 = keep(2 - a); bb = keep(b * b1);\n    fw = keep(keep(-0.1666667 * bb) * a); fx = keep(keep(0.5 * bb) * a1);\n    fy = keep(keep(0.5 * aa) * b1); fz = keep(keep(-0.1666667 * aa) * b);\n};\nspline_interp(a, w, x, y, z) = keep(keep(keep(keep(keep(keep(c3 * a) + c2) * a) + c1) * a) + c0)\nwith {\n    c0 = x;\n    c1 = keep(0.5 * keep(y - w));\n    c2 = keep(keep(keep(keep(w - keep(2.5 * x)) + y) + y) - keep(0.5 * z));\n    c3 = keep(keep(0.5 * keep(z - w)) + keep(1.5 * keep(x - y)));\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = h(h(h(h(h(c5, c4), c3), c2), c1), c0)\nwith {\n    h(p, c) = keep(keep(p * a) + c);\n    m(k, v) = keep(k * v);\n    ym2py2 = keep(y0+y4); ym1py1 = keep(y1+y3); y2mym2 = keep(y4-y0); y1mym1 = keep(y3-y1);\n    sixthym1py1 = m(1/6.0, ym1py1);\n    c0 = keep(keep(m(1/120.0, ym2py2) + m(13/60.0, ym1py1)) + m(11/20.0, y2));\n    c1 = keep(m(1/24.0, y2mym2) + m(5/12.0, y1mym1));\n    c2 = keep(keep(m(1/12.0, ym2py2) + sixthym1py1) - m(1/2.0, y2));\n    c3 = keep(m(1/12.0, y2mym2) - m(1/6.0, y1mym1));\n    c4 = keep(keep(m(1/24.0, ym2py2) - sixthym1py1) + m(1/4.0, y2));\n    c5 = keep(keep(m(1/120.0, keep(y5-y0)) + m(1/24.0, keep(y1-y4))) + m(1/12.0, keep(y3-y2)));\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x):   a true division by the sample rate (x finite, |x| < 1e300)\n//   tdiv(n, d): a true division by any d > 0 (gen's safediv(n, d) then):\n//               Faust neither turns n / d into n * (1/d) for a d that only\n//               changes with the controls, nor pulls a constant factor of n\n//               out of the quotient (n finite, |n| < 1e300 * d)\n//   keep(x):    an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\ntdiv(n0, d) = n / max(d, abs(n) * 1e-300) with { n = keep(n0); };\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes\n// (r and a go through keep(): the normalizer would otherwise fold the delay\n// into the integer part, size + rd - (d + r1), an ulp off).\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d - 0.5));\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1 + mind, maxd, d));\n    r0 = int(r); a = keep(r - float(r0));\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d - 0.5));\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(1, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = keep(float(size + rd) - clamp(2, maxd, d));\n    r1 = int(r); a = keep(r - float(r1));\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\nma = library(\"maths.lib\");\n\ndrive = hslider(\"drive [unit:%]\", 15, 0, 100, 0.01);\nfreq = hslider(\"freq [unit:Hz]\", 1200, 50, 8000, 0.01);\nfilter_morph = hslider(\"filter_morph [unit:%]\", 50, 0, 100, 0.01);\nenv_to_filt = hslider(\"env_to_filt [unit:%]\", 0, -100, 100, 0.01);\nhickfreq = hslider(\"hickfreq [unit:Hz]\", 8, 0.1, 1000, 0.01);\nhickclick = hslider(\"hickclick [unit:ms]\", 15, 0.5, 100, 0.01);\nhickmix = hslider(\"hickmix [unit:%]\", 60, 0, 100, 0.01);\nringmod = hslider(\"ringmod [unit:%]\", 0, 0, 100, 0.01);\nstereo_spread = hslider(\"stereo_spread [unit:%]\", 40, 0, 100, 0.01);\nmix = hslider(\"mix [unit:%]\", 100, 0, 100, 0.01);\n\nPI = 3.1415926535897931;\nTWOPI = 6.2831853071795862;\n\n// envelope follower (reads the updated history)\nenvf(in_mag) = (\\(h).(g.fixdenorm(h + (in_mag - h) * select2(in_mag > h, env_rel, env_att)))) ~ _\nwith {\n    // 5 * (sr * 0.001), not 0.005 * sr as Faust would fold g.mstosamps(5.0)\n    env_att = g.safediv(1, max(1, 5.0 * g.keep(ma.SR * 0.001)));\n    env_rel = g.safediv(1, max(1, 60.0 * g.keep(ma.SR * 0.001)));\n};\n\n// k: g.keep, an identity the Faust normalizer does not see through. The\n// port pins with it the intermediate values of the GenExpr that Faust would\n// otherwise expand, factor or reorder (the export computes them as written:\n// e.g. mix(sat, sat*gate, m) would become sat*(1 - m*(1 - gate)))\nk = g.keep;\n\n// the chopper phase (the same for L and R), and its wraps\ninc = g.divsr(g.keep(g.clip(0.1, 1000, hickfreq) * TWOPI));\nph = (\\(p).(g.wrap(0, TWOPI, k(p + inc)))) ~ _;\nwrapped = ph < ph';\n\nslew_alpha = g.safediv(1, max(1, g.mstosamps(g.clip(0.5, 100, hickclick))));\nrm_amt = g.clip(0, 1, ringmod * 0.01);\n\n// one gate: the noise held at each wrap, its sign slewed (history starts at 1)\ngate(nz) = (\\(hd).(g.fixdenorm(g.init(1, hd) + (raw - g.init(1, hd)) * slew_alpha))) ~ _\nwith {\n    rnd = (\\(r).(select2(wrapped, r, nz))) ~ _;\n    raw = select2(rnd < 0, 0, 1);\n};\n\n// DC blocker on fixdenormed histories\ndcb(x) = (\\(yd).(k(x - g.fixdenorm(x')) + 0.995 * yd)) ~ g.fixdenorm;\n\n// TPT SVF: hp, bp, lp\nK2 = 1.4144271570014144;  // 2 k, k = 1/1.414, as gen folds it\nsvf(gc, x) = (loop ~ (_, _)) : !, !, _, _, _\nwith {\n    loop(s1, s2) = g.fixdenorm(gc * hp + bp), g.fixdenorm(gc * bp + lp), hp, bp, lp\n    with {\n        hp = k(g.safediv(k(x - (K2 + gc) * s1) - s2, k(1.0 + K2 * gc) + gc * gc));\n        bp = k(gc * hp + s1);\n        lp = k(gc * bp + s2);\n    };\n};\n\nfhickup(in1, in2, in3, in4, nL, nR) = out1, out2\nwith {\n    env = envf(max(abs(in1), abs(in2)));\n\n    eff_drive = g.clip(0, 100, drive + in3);\n    gain = 1.0 + g.safepow(eff_drive * 0.01, 3.664) * 1255.0;\n    // gen folds / (1.570796 - 0.785398) into * 1.2732398096251836 and\n    // (1 - 0.18) into 0.82000000000000006; g.keep stops Faust folding further\n    comp = 1.0 - g.keep((atan(gain) - 0.785398) * 1.2732398096251836) * (1.0 - 0.18);\n    drv_scale = 1.0 - g.keep(eff_drive * 0.01) * 0.8;\n    sat_L = k(k(atan(in1 * gain) * comp) * drv_scale);\n    sat_R = k(k(atan(in2 * gain) * comp) * drv_scale);\n\n    gL = gate(nL);\n    gR = gate(nR);\n    eff_gate_L = k(g.mix(gL, k(gL * 2.0 - 1.0), rm_amt));\n    eff_gate_R = k(g.mix(gR, k(gR * 2.0 - 1.0), rm_amt));\n    eff_hickmix = g.clip(0, 1, hickmix * 0.01 + g.keep(in4 * 0.01));\n    dc_L = dcb(k(g.mix(sat_L, k(sat_L * eff_gate_L), eff_hickmix)));\n    dc_R = dcb(k(g.mix(sat_R, k(sat_R * eff_gate_R), eff_hickmix)));\n\n    oct_shift = g.keep(g.keep(env_to_filt * 0.01) * env) * 3.0;\n    f_clamped = g.clip(50, ma.SR * 0.45, freq * g.safepow(2.0, oct_shift));\n    gc = tan(g.divsr(g.keep(PI * f_clamped)));\n\n    fL = svf(gc, dc_L);\n    fR = svf(gc, dc_R);\n    morph_pos = g.clip(0, 1, filter_morph * 0.01);\n    morph(hp, bp, lp) = k(select2(morph_pos < 0.5,\n                                g.mix(bp, hp, (morph_pos - 0.5) * 2.0),\n                                g.mix(lp, bp, morph_pos * 2.0)));\n    filt_L = fL : morph;\n    filt_R = fR : morph;\n\n    wet_L = k(ma.tanh(filt_L * 1.2) * 0.95);\n    wet_R = k(ma.tanh(filt_R * 1.2) * 0.95);\n    mix_val = g.clip(0, 1, mix * 0.01);\n    // stereo_spread kept in the interface, without effect (as in gen~)\n    out1 = attach(g.mix(in1, wet_L, mix_val), stereo_spread);\n    out2 = g.mix(in2, wet_R, mix_val);\n};\n\n// the port with its noises as inputs: in1..in4, noise site 0 (left draw),\n// noise site 1 (right draw)\ndet = fhickup;\nprocess = (_, _, _, _, g.noises(2, 0), g.noises(2, 1)) : det;\n",
                    "sourcecode_size": 19731,
                    "sample_format": 1,
                    "version": "1.87"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        162.0,
                        231.0,
                        41.0,
                        48.0
                    ],
                    "outlettype": [
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [
                                50.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "filter_morph",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "morph",
                            "parameter_type": 0,
                            "parameter_unitstyle": 5
                        }
                    },
                    "varname": "filter_morph"
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        162.0,
                        290.0,
                        62.65822784810126,
                        35.0
                    ],
                    "linecount": 2,
                    "outlettype": [
                        ""
                    ],
                    "text": "filter_morph $1"
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        238.0,
                        373.0,
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
                    "id": "obj-108",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        38.0,
                        295.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen fhickup replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/fhickup.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/fhickup.maxpat.",
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
                        "obj-17",
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
                        "obj-17",
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
                        "obj-1",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        308.5,
                        328.717791411043,
                        47.5,
                        328.717791411043
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
                        "obj-106",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-1",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        171.5,
                        328.6155099693251,
                        47.5,
                        328.6155099693251
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
                        "obj-9",
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
                        "obj-14",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-13",
                        1
                    ],
                    "destination": [
                        "obj-1",
                        1
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-13",
                        0
                    ],
                    "destination": [
                        "obj-1",
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
                        "obj-1",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        119.5,
                        328.717791411043,
                        47.5,
                        328.717791411043
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
                        "obj-1",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-17",
                        1
                    ],
                    "destination": [
                        "obj-9",
                        1
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
                        "obj-9",
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
                        "obj-19",
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
                        "obj-1",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        237.5,
                        328.15625,
                        47.5,
                        328.15625
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
                        "obj-16",
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
                        "obj-10",
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
                        "obj-8",
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
                        "obj-1",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        537.8870967741935,
                        327.6774193548387,
                        47.5,
                        327.6774193548387
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-23",
                        2
                    ],
                    "destination": [
                        "obj-11",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-23",
                        2
                    ],
                    "destination": [
                        "obj-13",
                        0
                    ],
                    "hidden": 1,
                    "order": 2
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-23",
                        2
                    ],
                    "destination": [
                        "obj-17",
                        0
                    ],
                    "hidden": 1,
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-24",
                        0
                    ],
                    "destination": [
                        "obj-22",
                        0
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
                        "obj-23",
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
                        "obj-1",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        63.5,
                        328.717791411043,
                        47.5,
                        328.717791411043
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
                        "obj-3",
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
                    ],
                    "hidden": 1,
                    "midpoints": [
                        470.5,
                        328.71779141104287,
                        47.5,
                        328.71779141104287
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
                        "obj-6",
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
                        "obj-1",
                        0
                    ],
                    "hidden": 1,
                    "midpoints": [
                        388.5,
                        328.717791411043,
                        47.5,
                        328.717791411043
                    ]
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
            "obj-105": [
                "filter_morph",
                "morph",
                0
            ],
            "obj-12": [
                "live.dial[1]",
                "Freq",
                0
            ],
            "obj-17": [
                "live.gain~",
                "live.gain~",
                0
            ],
            "obj-18": [
                "filtenv",
                "filtenv",
                0
            ],
            "obj-2": [
                "mix",
                "mix",
                0
            ],
            "obj-20": [
                "HickFrq",
                "HickFrq",
                0
            ],
            "obj-21": [
                "live.dial[5]",
                "HickClik",
                0
            ],
            "obj-24": [
                "stspread",
                "stspread",
                0
            ],
            "obj-5": [
                "live.dial[2]",
                "Drive",
                0
            ],
            "obj-7": [
                "live.dial[3]",
                "HickMx",
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
        },
        "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
        ],
        "editing_bgcolor": [
            0.349019607843137,
            0.349019607843137,
            0.349019607843137,
            1.0
        ]
    }
}