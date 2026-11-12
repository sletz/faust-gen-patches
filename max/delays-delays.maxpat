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
        "rect": [
            71.0,
            68.0,
            1138.0,
            1095.0
        ],
        "lefttoolbarpinned": 2,
        "toptoolbarpinned": 2,
        "righttoolbarpinned": 2,
        "bottomtoolbarpinned": 2,
        "toolbars_unpinned_last_save": 15,
        "boxes": [
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        111.5,
                        93.0,
                        186.0,
                        27.0
                    ],
                    "fontsize": 18.0,
                    "text": "with V8 JSUI interface"
                }
            },
            {
                "box": {
                    "id": "obj-110",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        111.5,
                        64.0,
                        475.0,
                        27.0
                    ],
                    "fontsize": 18.0,
                    "text": "32 multitap Delay Line & 16-Channel Spatialization Engine"
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        111.5,
                        15.0,
                        281.0,
                        47.0
                    ],
                    "fontsize": 36.0,
                    "text": "Delays delays"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        532.0,
                        529.0,
                        43.0,
                        20.0
                    ],
                    "text": "trigger"
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        663.0,
                        529.0,
                        59.0,
                        20.0
                    ],
                    "text": "amp mod"
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        407.0,
                        489.0,
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
                        281.0,
                        489.0,
                        45.0,
                        20.0
                    ],
                    "text": "burst 2"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        156.0,
                        489.0,
                        45.0,
                        20.0
                    ],
                    "text": "burst 1"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        489.0,
                        61.0,
                        20.0
                    ],
                    "text": "play sfiles"
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        133.0,
                        188.0,
                        86.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "prepend buffer"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        17.0,
                        188.0,
                        102.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "prepend buf_taps"
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        621.0,
                        551.0,
                        130.0,
                        130.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        629.0,
                        868.0,
                        381.0,
                        181.0
                    ],
                    "embed": 1,
                    "embedstate": [
                        [
                            "bg_color",
                            0.01,
                            0.01,
                            0.015,
                            1
                        ],
                        [
                            "pivot_size",
                            0.1
                        ],
                        [
                            "playhead_size",
                            0.1
                        ],
                        [
                            "sphere_color",
                            1,
                            1,
                            1,
                            0.5
                        ],
                        [
                            "tap_color",
                            0,
                            0.7,
                            0.9,
                            0.8
                        ]
                    ],
                    "filename": "none",
                    "outlettype": [
                        "",
                        ""
                    ],
                    "parameter_enable": 0,
                    "textfile": {
                        "text": "/**\n * @file tap_manager.js\n * @description Professional 2D Sculptural UI for Multi-Tap Delay Engine.\n * Features: 32-tap distribution, 9 windowing models, \"del_in\" time-squeezing,\n * reactive glow, polyphonic \"Urn\" playheads, and full Pattr storage with \n * Inspector integration.\n * \n * @author Max Bruckert assisted by Gemini\n * \n * COMMANDS:\n * - max_delay [ms]      : Total duration (80-30000)\n * - del_in [0-1]        : Shifts the start of the taps (pre-delay)\n * - gravity_in/out      : [-100 to 100] Distribution curvature\n * - jitter [0-1]        : Non-linear temporal randomization\n * - mode [0/1]          : 0:Simple, 1:Mirror (Pivot at sphere X)\n * - window_type [0-8]   : Amplitude models (Gauss, Cos, Tri, Saw, Square...)\n * - reverse [0/1]       : Invert amplitude profile\n * - f_mix [0-100]       : Color morphing (Blue to Pink)\n * - f_on [0/1]          : Filter master toggle\n * - f_start/f_end [Hz]  : Spectral boundaries\n * - f_direction [0-3]   : Frequency modulation mode (Desc, Asc, Rand, Env)\n * - f_type [0-2]        : Filter nature (LP, HP, BP)\n * - resonance [0-1]     : Filter Q factor\n * - mix [0-1]           : Dry/Wet balance\n * - gain [0-5]          : Output drive\n * - feedback [0-100]    : Re-injection level & visual remanence\n * - hit [index]         : Trigger tap glow (from audio engine)\n * - trigger             : Launch a new playhead bubble\n * - panic / restore     : State management\n * \n * INSPECTOR ATTRIBUTES:\n * - bg_color, tap_color, sphere_color [RGBA]\n * - playhead_size, pivot_size [0..1]\n */\n\nautowatch = 1;\noutlets = 2;\nmgraphics.init();\nmgraphics.relative_coords = 0;\n\n// --- 1. PARAMETERS (PERSISTENT) ---\nvar numSteps = 32, maxDelay = 1000, delIn = 0.0;\nvar gravityIn = 0, gravityOut = 0, jitterValue = 0, appMode = 0; \nvar sphereX = 0.5, sphereY = 0.0;\nvar windowType = 0, isReverse = 0;\nvar fOn = 1, fMix = 0, fStart = 16000, fEnd = 800, resVal = 0.1, fDir = 0, fType = 0;\nvar mcMode = 0, offsetVal = 0, spreadVal = 0, fbVal = 0, mixVal = 0.5, gainVal = 1.0;\nvar playheadSize = 0.3, pivotSize = 0.5;\nvar bufName = \"buf_taps\";\n\n// --- 2. UI STATE & COLORS ---\nvar tapExcitations = new Array(32); for(var i=0; i<32; i++) tapExcitations[i] = 0;\nvar playheads = [], tapValues = new Array(32), ampValues = new Array(32), isDragging = false;\n\nvar colBg = [0.01, 0.01, 0.015, 1.0], colSphere = [1.0, 1.0, 1.0, 0.5];\nvar colBlue = [0.0, 0.7, 0.9, 0.8], colPink = [0.9, 0.1, 0.6, 0.8]; \n\n// --- 3. INSPECTOR ATTRIBUTES ---\ndeclareattribute(\"bg_color\", \"getbgcolor\", \"setbgcolor\", 1);\ndeclareattribute(\"tap_color\", \"gettapcolor\", \"settapcolor\", 1);\ndeclareattribute(\"sphere_color\", \"getspherecolor\", \"setspherecolor\", 1);\ndeclareattribute(\"playhead_size\", \"getphsize\", \"setphsize\", 1);\ndeclareattribute(\"pivot_size\", \"getpvsize\", \"setpvsize\", 1);\n\nfunction setbgcolor() { colBg = arrayfromargs(arguments); mgraphics.redraw(); } function getbgcolor() { return colBg; }\nfunction settapcolor() { colBlue = arrayfromargs(arguments); mgraphics.redraw(); } function gettapcolor() { return colBlue; }\nfunction setspherecolor() { colSphere = arrayfromargs(arguments); mgraphics.redraw(); } function getspherecolor() { return colSphere; }\nfunction setphsize(v) { playheadSize = v; mgraphics.redraw(); } function getphsize() { return playheadSize; }\nfunction setpvsize(v) { pivotSize = v; mgraphics.redraw(); } function getpvsize() { return pivotSize; }\n\n// =============================================================\n// PERSISTENCE PATTR (35 VALUES)\n// =============================================================\nfunction getvalueof() { \n    return [maxDelay, delIn, gravityIn, gravityOut, jitterValue, appMode, sphereX, sphereY, windowType, isReverse, fOn, fMix, fStart, fEnd, resVal, fDir, fType, mcMode, offsetVal, spreadVal, fbVal, mixVal, gainVal, playheadSize, pivotSize].concat(colBg).concat(colBlue).concat(colSphere); \n}\n\nfunction setvalueof() {\n    var v = arrayfromargs(arguments);\n    if (v.length >= 25) { \n        maxDelay = v[0]; delIn = v[1]; gravityIn = v[2]; gravityOut = v[3]; jitterValue = v[4]; appMode = v[5]; sphereX = v[6]; sphereY = v[7]; windowType = v[8]; isReverse = v[9]; fOn = v[10]; fMix = v[11]; fStart = v[12]; fEnd = v[13]; resVal = v[14]; fDir = v[15]; fType = v[16]; mcMode = v[17]; offsetVal = v[18]; spreadVal = v[19]; fbVal = v[20]; mixVal = v[21]; gainVal = v[22]; playheadSize = v[23]; pivotSize = v[24];\n    }\n    compute();\n}\n\n// =============================================================\n// MESSAGE HANDLERS (Fixed missing functions)\n// =============================================================\nfunction mix(v) { mixVal = v; notifyclients(); }\nfunction gain(v) { gainVal = v; notifyclients(); }\nfunction feedback(v) { fbVal = v; notifyclients(); }\nfunction resonance(v) { resVal = v; notifyclients(); }\nfunction res(v) { resVal = v; notifyclients(); }\nfunction f_on(v) { fOn = v; notifyclients(); }\nfunction f_mix(v) { fMix = v; notifyclients(); mgraphics.redraw(); }\nfunction f_start(v) { fStart = v; notifyclients(); }\nfunction f_end(v) { fEnd = v; notifyclients(); }\nfunction f_direction(v) { fDir = v; notifyclients(); }\nfunction f_type(v) { fType = v; notifyclients(); }\nfunction mc_mode(v) { mcMode = v; notifyclients(); mgraphics.redraw(); }\nfunction offset(v) { offsetVal = v; notifyclients(); }\nfunction spread(v) { spreadVal = v; notifyclients(); }\nfunction del_in(v) { delIn = Math.max(0, Math.min(0.8, v)); notifyclients(); compute(); }\nfunction max_delay(v) { maxDelay = Math.max(80, Math.min(30000, v)); notifyclients(); compute(); }\nfunction gravity_in(v) { gravityIn = v; notifyclients(); compute(); }\nfunction gravity_out(v) { gravityOut = v; notifyclients(); compute(); }\nfunction jitter(v) { jitterValue = v; notifyclients(); compute(); }\nfunction mode(v) { appMode = v; notifyclients(); compute(); }\nfunction window_type(v) { windowType = v; notifyclients(); compute(); }\nfunction reverse(v) { isReverse = v; notifyclients(); compute(); }\nfunction buffer(v) { bufName = v; compute(); }\nfunction restore() { compute(); dump(); }\nfunction panic() { var b = new Buffer(bufName); if (b.framecount() > 0) { for (var s = 0; s < 32; s++) b.poke(2, s, 0); } mgraphics.redraw(); }\nfunction dump() { outlet(1, \"max_delay\", maxDelay); outlet(1, \"gravity_in\", gravityIn); outlet(1, \"gravity_out\", gravityOut); outlet(1, \"jitter\", jitterValue); outlet(1, \"mode\", appMode); outlet(1, \"f_mix\", fMix); }\n\n// ANIMATION LOGIC\nfunction trigger() { var rY = 0.5 + (Math.random()*0.4); playheads.push({ startTime: Date.now(), pos: 0, yPos: rY }); if (playheads.length > 20) playheads.shift(); }\nfunction hit(v) { var idx = Math.floor(v); if (idx >= 0 && idx < 32) tapExcitations[idx] = 1.0; }\nfunction bang() {\n    var now = Date.now(), active = false;\n    for (var p = playheads.length - 1; p >= 0; p--) { playheads[p].pos = (now - playheads[p].startTime) / maxDelay; if (playheads[p].pos > 1.0) playheads.splice(p, 1); else active = true; }\n    var dF = 0.78 + (fbVal / 100) * 0.20;\n    for (var i = 0; i < 32; i++) { if (tapExcitations[i] > 0) { tapExcitations[i] *= dF; if (tapExcitations[i] < 0.01) tapExcitations[i] = 0; active = true; } }\n    if (active || isDragging) mgraphics.redraw();\n}\n\n// =============================================================\n// CORE CALCULATIONS\n// =============================================================\nfunction getExp(v) { return (v >= 0) ? 1.0 / (1.0 + (v / 50.0)) : 1.0 + (Math.abs(v) / 50.0); }\nfunction compute() {\n    var expIn = getExp(gravityIn), expOut = getExp(gravityOut), splitIndex = Math.floor(sphereX * 31);\n    var minT = maxDelay * delIn, span = maxDelay - minT;\n    for (var i = 0; i < 32; i++) {\n        var t;\n        if (appMode == 1) { if (i <= splitIndex) t = minT + Math.pow(i/Math.max(1, splitIndex), expIn) * (span*sphereX); else t = minT + (span*sphereX) + (Math.pow((i-splitIndex)/(31-splitIndex), expOut) * (span*(1.0-sphereX))); } else { t = minT + Math.pow(i / 31, expIn) * span; }\n        var jR = (jitterValue <= 0.3) ? (jitterValue/0.3)*0.05 : (jitterValue <= 0.6 ? 0.05+((jitterValue-0.3)/0.3)*0.15 : 0.2+((jitterValue-0.6)/0.4)*0.4);\n        tapValues[i] = Math.max(0.1, t + (Math.random()-0.5) * jR * maxDelay);\n        var dist = Math.abs((i / 31) - sphereX), width = Math.max(0.01, (1.0 - sphereY)), win = 1.0;\n        switch(parseInt(windowType)) {\n            case 0: win = Math.exp(-Math.pow(dist / (width * 0.6), 2)); break;\n            case 1: win = Math.cos(Math.min(Math.PI/2, dist / width)); break;\n            case 2: win = Math.max(0, 1.0 - (dist / width)); break;\n            case 3: win = Math.min(1.0, Math.max(0, 1.0 - (dist / width)) * 1.5); break;\n            case 4: win = Math.exp(-dist * (5.0 / width)); break;\n            case 5: win = (dist < width * 0.5) ? 1.0 : 0.0; break;\n            case 6: win = (i / 31); break;\n            case 7: win = 1.0 - (i / 31); break;\n            case 8: win = 1.0; break;\n        }\n        var a = (sphereY < 0.6) ? (win + (1.0 - win) * ((0.6 - sphereY) / 0.6)) : Math.pow(win, 1.0 + (sphereY - 0.6) * 5.0);\n        if (isReverse > 0) a = 1.0 - a;\n        if (i > 29) a *= (31 - i) / 2;\n        ampValues[i] = a;\n    }\n    var b = new Buffer(bufName); if (b.framecount() > 0) { for (var s = 0; s < 32; s++) { b.poke(1, s, tapValues[s]); b.poke(2, s, ampValues[s]); } }\n    mgraphics.redraw();\n}\n\nfunction paint() {\n    var w = box.rect[2] - box.rect[0], h = box.rect[3] - box.rect[1];\n    mgraphics.set_source_rgba(colBg); mgraphics.rectangle(0, 0, w, h); mgraphics.fill();\n    mgraphics.set_source_rgba(1, 1, 1, 0.03); mgraphics.rectangle(0, 0, delIn * w, h); mgraphics.fill();\n    var fR = fMix / 100;\n    var bR = colBlue[0] + fR * (colPink[0] - colBlue[0]), bG = colBlue[1] + fR * (colPink[1] - colBlue[1]), bB = colBlue[2] + fR * (colPink[2] - colBlue[2]);\n    for (var i = 0; i < 32; i++) {\n        var posX = (tapValues[i] / maxDelay) * w, barH = ampValues[i] * h * 0.85, exc = tapExcitations[i];\n        var r = bR + (exc * (1.0 - bR)), g = bG + (exc * (1.0 - bG)), b = bB + (exc * (1.0 - bB));\n        var pat = mgraphics.pattern_create_linear(posX, h - barH, posX, h);\n        pat.add_color_stop_rgba(0, r, g, b, 0.8 + (exc * 0.2)); pat.add_color_stop_rgba(1, 0, 0, 0, 0);\n        mgraphics.set_source(pat); mgraphics.set_line_width(2.2 + (exc * 4)); mgraphics.set_line_cap(\"round\");\n        mgraphics.move_to(posX, h); mgraphics.line_to(posX, h - barH); mgraphics.stroke();\n    }\n    var phRad = 2 + (playheadSize * 12);\n    for (var p = 0; p < playheads.length; p++) {\n        var px = playheads[p].pos * w, py = playheads[p].yPos * h;\n        mgraphics.set_source_rgba(1, 1, 1, 0.5); mgraphics.set_line_width(1.2);\n        mgraphics.ellipse(px - phRad, py - phRad, phRad * 2, phRad * 2); mgraphics.stroke();\n    }\n    var pvRad = 5 + (pivotSize * 20), sx = sphereX * w, sy = sphereY * h;\n    mgraphics.set_source_rgba(colSphere); mgraphics.set_line_width(1.5);\n    mgraphics.ellipse(sx - pvRad, sy - pvRad, pvRad * 2, pvRad * 2); mgraphics.stroke();\n}\n\nfunction onclick(x,y) { isDragging = true; ondrag(x,y); }\nfunction ondrag(x,y) { if (isDragging) { var w = box.rect[2]-box.rect[0], h = box.rect[3]-box.rect[1]; sphereX = Math.max(0.01, Math.min(0.99, x/w)); sphereY = Math.max(0.0, Math.min(1.0, y / h)); notifyclients(); compute(); } }\nfunction onrelease() { isDragging = false; }\nfunction loadbang() { compute(); }",
                        "filename": "none",
                        "flags": 0,
                        "embed": 1,
                        "autowatch": 1
                    },
                    "varname": "v8ui"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        347.0,
                        774.0,
                        50.0,
                        22.0
                    ],
                    "format": 6,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "spectroscope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        32.0,
                        934.0,
                        586.0,
                        151.0
                    ],
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "scope~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        482.0,
                        551.0,
                        130.0,
                        130.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        778.0,
                        474.0,
                        52.0,
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
                    "needlemode": 2,
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
                            "parameter_linknames": 1,
                            "parameter_longname": "del-in",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "del-in",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "del-in"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        885.0,
                        487.0,
                        57.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "del_in $1"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        933.0,
                        290.0,
                        60.74073874950409,
                        19.0
                    ],
                    "fontsize": 11.551384487659769,
                    "text": "saw down"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        933.0,
                        270.0,
                        45.18518370389938,
                        19.0
                    ],
                    "fontsize": 11.551384487659769,
                    "text": "saw up"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        933.0,
                        251.0,
                        44.07407262921333,
                        19.0
                    ],
                    "fontsize": 11.551384487659769,
                    "text": "square"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        933.0,
                        231.0,
                        44.07407262921333,
                        19.0
                    ],
                    "fontsize": 11.551384487659769,
                    "text": "needle"
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        933.0,
                        211.0,
                        26.0,
                        19.0
                    ],
                    "fontsize": 11.0,
                    "text": "soft"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        933.0,
                        192.0,
                        46.0,
                        19.0
                    ],
                    "fontsize": 11.551384487659769,
                    "text": "triangle"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        933.0,
                        173.0,
                        42.222220838069916,
                        19.0
                    ],
                    "fontsize": 11.551384487659769,
                    "text": "cosine"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        933.0,
                        153.0,
                        50.0,
                        19.0
                    ],
                    "fontsize": 11.551384487659769,
                    "text": "hanning"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        82.0,
                        379.0,
                        58.0,
                        22.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "text": "s -to-jsui-",
                    "varname": "u431010580[2]"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        240.0,
                        188.0,
                        45.0,
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
                            0.0,
                            0.0,
                            1000.0,
                            780.0
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        50.0,
                                        149.68152475357056,
                                        55.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "pipe 500"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-57",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        79.29936075210571,
                                        135.0318443775177,
                                        58.0,
                                        22.0
                                    ],
                                    "color": [
                                        0.6666666666666666,
                                        0.6470588235294118,
                                        0.0,
                                        1.0
                                    ],
                                    "text": "s -to-jsui-",
                                    "varname": "u431010580[5]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-65",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        50.0,
                                        198.08916425704956,
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
                                    "id": "obj-46",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        50.0,
                                        226.7515823841095,
                                        51.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "clear $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-19",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "patching_rect": [
                                        50.0,
                                        100.0,
                                        105.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "int",
                                        "restore",
                                        "panic",
                                        "int"
                                    ],
                                    "text": "t 0 restore panic 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        49.99999358586126,
                                        39.99999860380555,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1,
                                    "outlettype": [
                                        "bang"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        49.99999358586126,
                                        308.75157060380553,
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
                                        "obj-19",
                                        2
                                    ],
                                    "destination": [
                                        "obj-57",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-19",
                                        1
                                    ],
                                    "destination": [
                                        "obj-57",
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
                                        "obj-6",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-19",
                                        3
                                    ],
                                    "destination": [
                                        "obj-65",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-46",
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
                                        "obj-5",
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
                                        "obj-6",
                                        0
                                    ],
                                    "destination": [
                                        "obj-65",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-65",
                                        0
                                    ],
                                    "destination": [
                                        "obj-46",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "text": "p clear"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 2,
                    "patching_rect": [
                        32.0,
                        541.0,
                        393.34342399999997,
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
                            812.0,
                            197.0,
                            901.0,
                            476.0
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
                                    "id": "obj-14",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        759.0,
                                        184.0,
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
                                        179.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "random 1000 @range 250 2000"
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
                                        383.0,
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
                                    "text": "0, 0.05 10 0 40"
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
                                    "text": "random 3"
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
                                        69.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "bang"
                                    ],
                                    "text": "metro 4000"
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
                                    "clipheight": 27.0,
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
                                        875.0,
                                        376.0
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
                                        "obj-8",
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
                                        "obj-27",
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
                                        "obj-28",
                                        0
                                    ],
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
                    "id": "obj-107",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        629.0,
                        835.0,
                        41.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "jitter 1"
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        621.0,
                        222.0,
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
                                60
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "res",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "res",
                            "parameter_type": 1,
                            "parameter_unitstyle": 5
                        }
                    },
                    "varname": "res"
                }
            },
            {
                "box": {
                    "id": "obj-115",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        621.0,
                        292.0,
                        42.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "res $1"
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        32.0,
                        511.0,
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
                    "id": "obj-93",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        751.0,
                        222.0,
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
                                100.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "fmix",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "fmix",
                            "parameter_type": 1,
                            "parameter_unitstyle": 5
                        }
                    },
                    "varname": "fmix"
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "live.text",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        337.0,
                        188.0,
                        77.5,
                        28.0
                    ],
                    "fontsize": 12.0,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "val1",
                                "val2"
                            ],
                            "parameter_initial": [
                                1.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "compmode",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "compmode",
                            "parameter_type": 2
                        }
                    },
                    "text": "nocomp",
                    "texton": "comp",
                    "varname": "compmode"
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "live.text",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        337.0,
                        255.0,
                        77.5,
                        28.0
                    ],
                    "fontsize": 12.0,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [
                                "val1",
                                "val2"
                            ],
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "mcmode",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "mcmode",
                            "parameter_type": 2
                        }
                    },
                    "text": "stereo",
                    "texton": "multichannel",
                    "varname": "mcmode"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        281.0,
                        510.0,
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
                    "id": "obj-106",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        751.0,
                        292.0,
                        54.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "f_mix $1"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        845.0,
                        659.0,
                        39.0,
                        22.0
                    ],
                    "outlettype": [
                        "float"
                    ],
                    "text": "/ 100."
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        201.0,
                        225.0,
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
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "feedback",
                            "parameter_type": 1,
                            "parameter_unitstyle": 5
                        }
                    },
                    "varname": "feedback"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        201.0,
                        292.0,
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
                    "id": "obj-99",
                    "maxclass": "live.tab",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        663.0,
                        178.0,
                        50.5,
                        105.0
                    ],
                    "fontsize": 12.0,
                    "num_lines_patching": 4,
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
                                "down",
                                "up",
                                "rndm",
                                "env"
                            ],
                            "parameter_initial": [
                                3.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "fdirection",
                            "parameter_mmax": 3,
                            "parameter_modmode": 0,
                            "parameter_shortname": "fdirection",
                            "parameter_type": 2,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "fdirection"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        663.0,
                        292.0,
                        81.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "f_direction $1"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        556.0,
                        222.0,
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
                                12000
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "fmax",
                            "parameter_mmax": 18000.0,
                            "parameter_mmin": 40.0,
                            "parameter_modmode": 2,
                            "parameter_shortname": "fmax",
                            "parameter_speedlim": 1.666,
                            "parameter_type": 0,
                            "parameter_unitstyle": 3
                        }
                    },
                    "varname": "fmax"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        556.0,
                        292.0,
                        55.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "f_end $1"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        495.0,
                        222.0,
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
                                400
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "fmin",
                            "parameter_mmax": 18000.0,
                            "parameter_mmin": 40.0,
                            "parameter_modmode": 2,
                            "parameter_shortname": "fmin",
                            "parameter_speedlim": 1.666,
                            "parameter_type": 0,
                            "parameter_unitstyle": 3
                        }
                    },
                    "varname": "fmin"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        495.0,
                        292.0,
                        59.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "f_start $1"
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        406.0,
                        510.0,
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
                    "id": "obj-73",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        430.0,
                        292.0,
                        58.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "f_type $1"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "live.tab",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        430.0,
                        178.0,
                        50.0,
                        105.0
                    ],
                    "fontsize": 12.0,
                    "num_lines_patching": 3,
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
                                "lp",
                                "bp",
                                "hp"
                            ],
                            "parameter_initial": [
                                0.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "ftype",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ftype",
                            "parameter_type": 2,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "ftype"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "patching_rect": [
                        347.0,
                        716.0,
                        58.62068563699722,
                        49.0
                    ],
                    "linecount": 3,
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
                            1175.0,
                            228.0,
                            532.0,
                            491.0
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        69.0,
                                        282.0,
                                        172.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "random 1000000 @range 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        69.0,
                                        323.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        69.0,
                                        253.0,
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
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        69.0,
                                        202.0,
                                        42.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang"
                                    ],
                                    "text": "edge~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        291.0,
                                        35.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 3,
                                    "outlettype": [
                                        "signal"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        254.0,
                                        35.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 2,
                                    "outlettype": [
                                        "signal"
                                    ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-113",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        254.0,
                                        168.0,
                                        50.0,
                                        22.0
                                    ],
                                    "format": 6,
                                    "outlettype": [
                                        "",
                                        "bang"
                                    ],
                                    "parameter_enable": 0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-108",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        255.0,
                                        198.0,
                                        38.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        ""
                                    ],
                                    "text": "hit $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-102",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        254.0,
                                        133.0,
                                        138.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "float"
                                    ],
                                    "text": "snapshot~ 10 @active 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        254.0,
                                        97.0,
                                        55.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "sah~ 0.5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        255.0,
                                        240.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 2
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        69.0,
                                        35.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1,
                                    "outlettype": [
                                        "signal"
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
                                        "obj-6",
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
                                        "obj-9",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-102",
                                        0
                                    ],
                                    "destination": [
                                        "obj-113",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-108",
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
                                        "obj-113",
                                        0
                                    ],
                                    "destination": [
                                        "obj-108",
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
                                        "obj-5",
                                        1
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
                                        "obj-5",
                                        0
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
                                        "obj-102",
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
                                        "obj-10",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "text": "p -edge-sah-"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        387.0,
                        817.0,
                        58.0,
                        22.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "text": "s -to-jsui-",
                    "varname": "u431010580[7]"
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        17.0,
                        379.0,
                        60.0,
                        22.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "text": "s -to-gen-",
                    "varname": "u431010580[6]"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        516.0,
                        795.0,
                        96.0,
                        20.0
                    ],
                    "text": "elswhere"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        412.0,
                        795.0,
                        93.0,
                        20.0
                    ],
                    "text": "pour bufgranul~"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        629.0,
                        1063.0,
                        60.0,
                        22.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "text": "s -to-gen-",
                    "varname": "u431010580[4]"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        49.0,
                        577.0,
                        58.0,
                        22.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "r -to-gen-",
                    "varname": "u431010580[3]"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        886.0,
                        716.0,
                        58.0,
                        22.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "text": "s -to-jsui-",
                    "varname": "u431010580[1]"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        516.0,
                        774.0,
                        35.0,
                        22.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "text": "s trig"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 16,
                    "numoutlets": 1,
                    "patching_rect": [
                        32.0,
                        652.0,
                        314.53428210526323,
                        22.0
                    ],
                    "outlettype": [
                        "multichannelsignal"
                    ],
                    "text": "mc.pack~ 16 @chans 16"
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        279.0,
                        225.0,
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
                                0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "offset",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "offset",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "offset"
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        279.0,
                        292.0,
                        54.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "offset $1"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        629.0,
                        810.0,
                        35.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        65.0,
                        903.0,
                        134.0,
                        22.0
                    ],
                    "text": "mc.dac~ 1 2 3 4 5 6 7 8"
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "mc.live.gain~",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "patching_rect": [
                        34.0,
                        717.0,
                        73.0,
                        165.0
                    ],
                    "lastchannelcount": 6,
                    "outlettype": [
                        "multichannelsignal",
                        "",
                        "float",
                        "list"
                    ],
                    "parameter_enable": 1,
                    "relative": 1,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "mc.live.gain~",
                            "parameter_mmax": 0.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mc.live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "mc.live.gain~"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        337.0,
                        292.0,
                        78.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "mc_mode $1"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        131.0,
                        714.0,
                        90.0,
                        168.0
                    ],
                    "bgcolor": [
                        0.0,
                        0.0,
                        0.0,
                        0.0
                    ],
                    "monotone": 1,
                    "numleds": 20,
                    "outlettype": [
                        "float"
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        32.0,
                        689.0,
                        92.0,
                        22.0
                    ],
                    "outlettype": [
                        "multichannelsignal"
                    ],
                    "text": "mc.mixdown~ 6"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        412.0,
                        716.0,
                        123.0,
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
                            59.0,
                            121.0,
                            265.0,
                            268.0
                        ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        69.0,
                                        76.0,
                                        40.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": "-~ 0.5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-61",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        126.0,
                                        124.0,
                                        36.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "signal"
                                    ],
                                    "text": ">~ 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-60",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "patching_rect": [
                                        126.0,
                                        152.0,
                                        42.0,
                                        22.0
                                    ],
                                    "outlettype": [
                                        "bang",
                                        "bang"
                                    ],
                                    "text": "edge~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        126.0,
                                        199.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 2
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [
                                        68.0,
                                        199.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "patching_rect": [
                                        69.0,
                                        35.0,
                                        30.0,
                                        30.0
                                    ],
                                    "comment": "",
                                    "index": 1,
                                    "outlettype": [
                                        "signal"
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
                                        "obj-35",
                                        0
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
                                        "obj-2",
                                        0
                                    ],
                                    "order": 1
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-35",
                                        0
                                    ],
                                    "destination": [
                                        "obj-61",
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
                                        "obj-3",
                                        0
                                    ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [
                                        "obj-61",
                                        0
                                    ],
                                    "destination": [
                                        "obj-60",
                                        0
                                    ]
                                }
                            }
                        ]
                    },
                    "text": "p -edge-"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        516.0,
                        740.0,
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
                    "id": "obj-74",
                    "maxclass": "live.tab",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        779.0,
                        376.0,
                        105.16128718852997,
                        22.0
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
                                "simple",
                                "mirror"
                            ],
                            "parameter_linknames": 1,
                            "parameter_longname": "mirror",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "mirror",
                            "parameter_type": 2,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "mirror"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "live.toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        862.0,
                        351.0,
                        22.0,
                        22.0
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
                            "parameter_linknames": 1,
                            "parameter_longname": "reverse",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "reverse",
                            "parameter_type": 2
                        }
                    },
                    "varname": "reverse"
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        886.0,
                        351.0,
                        65.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "reverse $1"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "live.tab",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        886.0,
                        152.0,
                        47.77069687843323,
                        156.59871363639832
                    ],
                    "activebgcolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "activebgoncolor": [
                        0.0,
                        0.7176470588235294,
                        0.7019607843137254,
                        1.0
                    ],
                    "focusbordercolor": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "fontsize": 12.0,
                    "num_lines_patching": 8,
                    "num_lines_presentation": 0,
                    "outlettype": [
                        "",
                        "",
                        "float"
                    ],
                    "parameter_enable": 1,
                    "saved_attribute_attributes": {
                        "activebgcolor": {
                            "expression": ""
                        },
                        "activebgoncolor": {
                            "expression": ""
                        },
                        "focusbordercolor": {
                            "expression": ""
                        },
                        "valueof": {
                            "parameter_enum": [
                                "1",
                                "2",
                                "3",
                                "4",
                                "5",
                                "6",
                                "7",
                                "8"
                            ],
                            "parameter_linknames": 1,
                            "parameter_longname": "live.tab",
                            "parameter_mmax": 7,
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
                    "id": "obj-49",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        886.0,
                        321.0,
                        95.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "window_type $1"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        629.0,
                        786.0,
                        224.0,
                        22.0
                    ],
                    "attr": "bg_color",
                    "outlettype": [
                        ""
                    ],
                    "parameter_enable": 0
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "patching_rect": [
                        687.0,
                        835.0,
                        96.0,
                        22.0
                    ],
                    "outlettype": [
                        "",
                        "",
                        ""
                    ],
                    "restore": [
                        5000,
                        0,
                        -70,
                        34,
                        0,
                        0,
                        0.32808398950131235,
                        0.39779005524861877,
                        0,
                        0,
                        1,
                        100,
                        541.4173228346446,
                        12000,
                        0.1,
                        3,
                        1,
                        0,
                        0,
                        0,
                        58,
                        0.6535433070866148,
                        5,
                        0.1,
                        0.1,
                        0.01,
                        0.01,
                        0.015,
                        1,
                        0,
                        0.7,
                        0.9,
                        0.8,
                        1,
                        1,
                        1,
                        0.5
                    ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr ma_sphere",
                    "varname": "ma_sphere"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        407.0,
                        668.0,
                        68.0,
                        22.0
                    ],
                    "color": [
                        0.0,
                        0.47058823529411764,
                        0.0,
                        1.0
                    ],
                    "text": "send~ amp"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        412.0,
                        774.0,
                        62.0,
                        22.0
                    ],
                    "color": [
                        0.0,
                        0.47058823529411764,
                        0.0,
                        1.0
                    ],
                    "text": "send~ trig"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        160.0,
                        431.0,
                        53.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "clearlow"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        971.0,
                        626.0,
                        39.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "dump"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        240.0,
                        162.0,
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
                    "id": "obj-32",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        779.0,
                        588.0,
                        52.0,
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
                    "needlemode": 2,
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
                            "parameter_linknames": 1,
                            "parameter_longname": "gravity_out",
                            "parameter_mmax": 100.0,
                            "parameter_mmin": -100.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "gravity_out",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "gravity_out"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        886.0,
                        601.0,
                        84.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "gravity_out $1"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        886.0,
                        376.0,
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
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        17.0,
                        124.0,
                        58.0,
                        22.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        779.0,
                        642.0,
                        51.854875326156616,
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
                                0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "jitter",
                            "parameter_mmax": 100.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "jitter",
                            "parameter_type": 1,
                            "parameter_unitstyle": 5
                        }
                    },
                    "varname": "jitter"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        886.0,
                        659.0,
                        48.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "jitter $1"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        337.0,
                        225.0,
                        67.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "ducking $1"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        17.0,
                        151.0,
                        67.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "---buf_taps"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        137.0,
                        225.0,
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
                                100.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "spread",
                            "parameter_mmax": 100.0,
                            "parameter_mmin": -100.0,
                            "parameter_modmode": 2,
                            "parameter_shortname": "spread",
                            "parameter_type": 0,
                            "parameter_unitstyle": 5
                        }
                    },
                    "varname": "spread"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        137.0,
                        292.0,
                        62.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "spread $1"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        82.0,
                        225.0,
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
                                3.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "gain",
                            "parameter_mmax": 5.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "gain",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "gain"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        82.0,
                        292.0,
                        48.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "gain $1"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        33.0,
                        225.0,
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
                                1.0
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "mix",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "mix",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "mix"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        223.0,
                        431.0,
                        232.0,
                        22.0
                    ],
                    "color": [
                        1.0,
                        0.0,
                        1.0,
                        1.0
                    ],
                    "outlettype": [
                        "float",
                        "bang"
                    ],
                    "text": "buffer~ ---buf_taps @samps 32 @chans 2"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        156.0,
                        510.0,
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
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        33.0,
                        292.0,
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
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 22,
                    "patching_rect": [
                        32.0,
                        617.0,
                        393.34342399999997,
                        22.0
                    ],
                    "outlettype": [
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "signal",
                        "",
                        ""
                    ],
                    "text": "faustgen~",
                    "varname": "faust_delays_delays",
                    "sourcecode": "// delays-delays: Faust port of the gen~ patch of GEN-patches (Max Bruckert),\n// generated from faust-gen-patches/dsp/delays-delays.dsp by max/convert_patches.py;\n// edit that file and regenerate. Its libraries are embedded as environments.\n// DELAYS-DELAYS: 32-tap sculptural delay with ladder filters and 16-channel\n// spatialization (gen~: gendsp/delays-delays.gendsp)\n//\n// Two delay lines (L, R) are read by 32 taps whose times and amplitudes come\n// from a 2-channel buffer~ `buf_taps` (ch 0: time in ms, ch 1: amplitude). Each\n// tap is glided towards its time (smooth_time), the right line is read later\n// by up to 250 ms * i/31 depending on spread, and each tap runs a 4-pole\n// \"ladder\" (four one-poles, tanh feedback k = 4*res mapped to 0.6..0.98) whose\n// cutoff is spread between f_start and f_end over the taps (f_direction:\n// 0 descending, 1 ascending, 2 pseudo-random, 3 by the tap amplitude); f_type\n// morphs LP (0) -> HP (1) -> BP (2), f_mix blends raw and filtered taps. The\n// tap sum, tanh-saturated and DC-blocked, is fed back (feedback, rescaled to\n// 0..0.75), with input-envelope ducking. Stereo mode: out1, out2 = dry/wet\n// (constant-power mix) of the sums; mc_mode 1: each tap is panned on a ring of\n// 16 outputs (offset, spread = rotation). A third line carries the input\n// onset trigger (100 ms lockout) so that each tap reports its hit.\n//\n// in1, in2: audio\n// out1..out16: audio (stereo on 1-2, or 16 channels), out17: input onset\n// trigger (4800 samples), out18: tap hit pulse, out19: index of the last tap\n// hit, out20: its amplitude\n//\n// Parameters (gen Params without min/max: ranges from the gendsp comment):\n// mix, mc_mode, gain, spread, offset, ducking, smooth_time, clear, feedback,\n// f_mix, f_type, f_start, f_end, f_direction, res.\n//\n// The buffer: in GEN-patches/delays-delays.maxpat, `buffer~ ---buf_taps @samps\n// 32 @chans 2` is filled by the v8ui tap_manager.js from its parameters (max\n// delay, gravity in/out, sphere position, window...), which the UI changes at\n// run time. This port holds the content the patch loads (pattr ma_sphere\n// restore: 5000 ms, gravity -70/34, Gaussian window around 0.328), as float32,\n// as constants: scripts/delays_delays_buffer.py computes them (and the file\n// ref/buffers/delays_delays.buf_taps.txt the reference reads). With a constant\n// buffer the glissando (smooth_ms) is the identity: c_ms = t_target from the\n// first frame; it is kept as gen computes it.\n//\n// Quirks kept from gen~:\n// - the 16 output channels share ONE dcblock (a single DCBlock object called\n//   16 times per frame): its state runs through out1..out16 and on to the next\n//   frame;\n// - pos = wrap(..., 0, 15) never reaches 15 and idx2 = wrap(idx + 1, 0, 15):\n//   output 16 (bus 15) never receives a tap;\n// - the comments' \"f_on\" toggle does not exist in the GenExpr, and the doc's\n//   ranges for f_mix, feedback, res (0..100) and f_start/f_end (Hz) are those\n//   of gen~ in Max: the C++ export clamps these min/max-less Params to [0, 1].\n\ndeclare name \"delays-delays\";\ndeclare author \"Max Bruckert (gen~), Faust port\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\ng = environment {\n//##############################################################################\n// genops.lib: the gen~ operators (genlib, Max 9.2.1) in Faust\n//\n// Each function reproduces the arithmetic of its genlib counterpart\n// (ref/export/gen_dsp/genlib_ops.h), operation for operation, so that a port\n// written with them agrees with the gen~ export to the last bits wherever the\n// math library does. Conventions: arguments in genlib's order, signal last\n// (`wrap(lo, hi, v)`, `clamp(lo, hi, x)`) so that they compose as Faust\n// processors (`_ : wrap(0, 1)`).\n//\n// MIT License, as GEN-patches.\n//##############################################################################\n\ndeclare name \"genops\";\ndeclare version \"1.0.0\";\ndeclare license \"MIT\";\n\nma = library(\"maths.lib\");\nba = library(\"basics.lib\");\nde = library(\"delays.lib\");\nsi = library(\"signals.lib\");\n\n//---------------------------------------------------------------- scalars\n\n// trunc toward zero without going through a 32-bit int: (int64_t)x in genlib\ntrunc(x) = select2(x < 0, floor(x), ceil(x));\n\n// genlib minimum/maximum/clamp: clamp(x, lo, hi) = min(max(x, lo), hi)\nclamp(lo, hi, x) = min(max(x, lo), hi);\n\n// the clamp the exports inline for `clip` and Param ranges:\n// x <= lo ? lo : (x >= hi ? hi : x); differs from clamp when hi < lo or x is NaN\nclip(lo, hi, x) = select2(x <= lo, select2(x >= hi, x, hi), lo);\n\n// mix(x, y, a) = x + a*(y - x)\nmix(x, y, a) = x + a * (y - x);\n\n// safediv(num, den) = den == 0 ? 0 : num/den\nsafediv(n, d) = select2(d == 0, n / select2(d == 0, d, 1), 0);\n\n// fixnan: genlib's double test is \"exponent all ones\", so inf goes to 0 too\nfixnan(v) = select2((v - v) != (v - v), v, 0);\n\n// safepow(b, e) = fixnan(pow(b, e))\nsafepow(b, e) = fixnan(pow(b, e));\n\n// fixdenorm: a subnormal double becomes 0\nfixdenorm(v) = select2((abs(v) < 2.2250738585072014e-308) & (v != 0), v, 0);\n\n// wrap(v, lo, hi): genlib_ops.h, numWraps computed by int64 truncation\nwrap(lo1, hi1, v) = select2(lo1 == hi1, w, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    nw = trunc((v - lo) / range) - (v < lo);\n    r = v - range * nw;\n    r2 = select2(r >= hi, r, r - range);\n    w = select2((v >= lo) & (v < hi), select2(range <= 0.000000001, r2, lo), v);\n};\n\n// fold(v, lo, hi): genlib_ops.h\nfold(lo1, hi1, v) = select2(lo1 == hi1, out, lo1)\nwith {\n    lo = min(lo1, hi1);\n    hi = max(lo1, hi1);\n    range = hi - lo;\n    // v >= hi\n    va = v - range;\n    nwa = select2(va >= hi, 0, trunc((va - lo) / range));\n    ra = va - range * nwa;\n    na = nwa + 1;\n    // v < lo\n    vb = v + range;\n    nwb = select2(vb < lo, 0, trunc((vb - lo) / range) - 1);\n    rb = vb - range * nwb;\n    nb = nwb - 1;\n    hiCase = v >= hi;\n    loCase = v < lo;\n    r = select2(hiCase, select2(loCase, v, rb), ra);\n    n = select2(hiCase, select2(loCase, 0, nb), na);\n    odd = (int(n) % 2) != 0;\n    out = select2(odd, r, hi + lo - r);\n};\n\n// triangle(phase, p1): genlib_ops.h\ntriangle(ph0, p10) = select2(ph < p1, down, up)\nwith {\n    ph = wrap(0, 1, ph0);\n    p1 = clamp(0, 1, p10);\n    up = select2(p1 != 0, 0, ph / select2(p1 != 0, 1, p1));\n    down = select2(p1 == 1, 1 - ((ph - p1) / select2(p1 == 1, 1 - p1, 1)), ph);\n};\n\n// scale(in, inlow, inhigh, outlow, outhigh, power)\nscale(in, il, ih, ol, oh, pw) = v2 * (oh - ol) + ol\nwith {\n    v = (in - il) * safediv(1, ih - il);\n    v2 = select2(v > 0, select2(v < 0, v, 0 - pow(0 - v, pw)), pow(v, pw));\n};\n\nsign(v) = select2(v > 0, select2(v < 0, 0, -1), 1);\nfract(x) = x - trunc(x);\ndbtoa(x) = pow(10, x * 0.05);\natodb(x) = select2(x <= 0, 20 * log10(x), -999);\nmstosamps(ms) = ms * (ma.SR * 0.001);  // as the exports inline it\nmtof(m) = 440 * exp(0.057762265 * (m - 69));\n\n// genlib's interpolators (the delay readers below use them)\nlinear_interp(a, x, y) = x + a * (y - x);\ncubic_interp(a, w, x, y, z) = w * fw + x * fx + y * fy + z * fz\nwith {\n    a1 = 1 + a; aa = a * a1; b = 1 - a; b1 = 2 - a; bb = b * b1;\n    fw = -0.1666667 * bb * a; fx = 0.5 * bb * a1; fy = 0.5 * aa * b1; fz = -0.1666667 * aa * b;\n};\nspline_interp(a, w, x, y, z) = ((c3 * a + c2) * a + c1) * a + c0\nwith {\n    c0 = x;\n    c1 = 0.5 * (y - w);\n    c2 = w - 2.5 * x + y + y - 0.5 * z;\n    c3 = 0.5 * (z - w) + 1.5 * (x - y);\n};\nspline6_interp(a, y0, y1, y2, y3, y4, y5) = ((((c5*a+c4)*a+c3)*a+c2)*a+c1)*a+c0\nwith {\n    ym2py2 = y0+y4; ym1py1 = y1+y3; y2mym2 = y4-y0; y1mym1 = y3-y1;\n    sixthym1py1 = 1/6.0*ym1py1;\n    c0 = 1/120.0*ym2py2 + 13/60.0*ym1py1 + 11/20.0*y2;\n    c1 = 1/24.0*y2mym2 + 5/12.0*y1mym1;\n    c2 = 1/12.0*ym2py2 + sixthym1py1 - 1/2.0*y2;\n    c3 = 1/12.0*y2mym2 - 1/6.0*y1mym1;\n    c4 = 1/24.0*ym2py2 - sixthym1py1 + 1/4.0*y2;\n    c5 = 1/120.0*(y5-y0) + 1/24.0*(y1-y4) + 1/12.0*(y3-y2);\n};\n\n//---------------------------------------------------------------- evaluation order\n\n// The Faust normalizer rewrites arithmetic: x / ma.SR becomes x * (1/SR)\n// (1 ulp off genlib's division for about a quarter of the values), a*x + b*x\n// becomes (a+b)*x, constants are folded across products. Where the port must\n// follow the export's order (a chaotic system, a filter near self-oscillation\n// that amplifies the last bit), these keep it:\n//   divsr(x): a true division by the sample rate (x finite, |x| < 1e300)\n//   keep(x):  an identity the normalizer does not see through (x finite)\ndivsr(x) = x / max(ma.SR, abs(x) * 1e-300);\nkeep(x) = max(x, -1e308);\n\n//---------------------------------------------------------------- stateful operators\n\n// phasor(freq): phase = wrap(phase + freq*(1/sr), 0, 1), the new phase is output\nphasor(f) = (+(f * (1.0 / ma.SR)) : wrap(0, 1)) ~ _;\n\n// History h(init) read before it is written: x[n-1], and `init` at frame 0\nhist(init, x) = select2(1 - 1', x', init);\n// the same for a value fed back by `~` (already delayed): `init(80)` on it\ninit(v, x) = select2(1 - 1', x, v);\n\n// delta(x) = x - x[n-1] (history starts at 0)\ndelta(x) = x - x';\n\n// dcblock: y = x - x1 + 0.9997*y1\ndcblock(x) = (x - x') : (+ ~ *(0.9997));\n\n// sah(in, trig, thresh): latches `in` when trig crosses thresh upward\nsah(in, trig, thresh) = (\\(out).(select2((trig' <= thresh) & (trig > thresh), out, in))) ~ _;\n\n// slide(x, up, down): y += (x - y) / (x > y ? max(1, |up|) : max(1, |down|)),\n// the state passed through fixdenorm, starting at 0\nslide(up, down, x) = (\\(s).(fixdenorm(s + select2(x > s, idown, iup) * (x - s)))) ~ _\nwith { iup = 1 / max(1, abs(up)); idown = 1 / max(1, abs(down)); };\n\n// accum / plusequals: count = reset ? 0 : count + incr (post)\naccum(incr, reset) = (\\(c).(select2(reset != 0, c + incr, 0))) ~ _;\n\n//---------------------------------------------------------------- Delay\n\n// genlib's Delay: a ring of `size` = next power of two >= max(maxdelay, 2)\n// samples, a read head `reader` that advances once per sample (frame n:\n// n mod size), and readers that clamp the delay to [mind, maxdelay], mind = 1\n// for a read before the write of the frame, 0 after (linear, step), plus 1 for\n// the 4- and 6-point readers. `rd_*(MAXD, maxd, mind, x, d)` reads signal x\n// through that arithmetic: r = size + reader - clamp(d), r1 = int(r),\n// a = r - r1, so the interpolation fraction is the very double genlib computes.\n// Signal x is the signal written: x@k is memory[(reader - k) & wrap].\n// MAXD is a compile-time bound of maxdelay (Faust sizes its own line by it).\n//\n// The ring is reproduced too: the 4- and 6-point readers at a delay below 3\n// or 5 samples reach the write head, and genlib reads there slots written\n// `size` samples earlier (memory[reader] before this frame's write holds\n// x@size, memory[reader+1] x@(size-1)), not the latest samples. A slot k\n// samples back (k in mind-size..size) holds x@(((k - mind) mod size) + mind).\n//\n// For a read before the write in a feedback loop, pass the feedback delayed by\n// one (xd = x', the `~` of the loop): the readers `rd_*_fb` read x@k as\n// xd@(k-1), with mind = 1.\n\nnpow2(n) = 2 ^ ceil(log(max(n, 2)) / log(2) - 1e-9);\n_reader(size) = ba.time % int(size);\n_ring(MAXD, size, mind, x, k) = x @ max(0, min(2 * MAXD + 2, ((k - mind + size) % size) + mind));\n\n// step: round to nearest with the extra half\nrd_step(MAXD, maxd, mind, x, d) = _ring(MAXD, size, mind, x, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d - 0.5);\n};\n\nrd_linear(MAXD, maxd, mind, x, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n_rd4(MAXD, maxd, mind, x, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\nrd_cubic(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, cubic_interp);\nrd_spline(MAXD, maxd, mind, x, d) = _rd4(MAXD, maxd, mind, x, d, spline_interp);\n\nrd_spline6(MAXD, maxd, mind, x, d) = spline6_interp(a, tp(k0), tp(k0 - 1), tp(k0 - 2), tp(k0 - 3), tp(k0 - 4), tp(k0 - 5))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1 + mind, maxd, d);\n    r0 = int(r); a = r - float(r0);\n    k0 = size + rd - r0;\n    tp(k) = _ring(MAXD, size, mind, x, k);\n};\n\n// x@k = xd@(k-1), the slot k back being x@(((k-1) mod size) + 1)\n_ringfb(MAXD, size, xd, k) = xd @ max(0, min(2 * MAXD + 2, (k - 1 + size) % size));\n\nrd_step_fb(MAXD, maxd, xd, d) = _ringfb(MAXD, size, xd, size + rd - int(r))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d - 0.5);\n};\nrd_linear_fb(MAXD, maxd, xd, d) = linear_interp(a, tp(k1), tp(k1 - 1))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(1, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\n_rd4_fb(MAXD, maxd, xd, d, interp) = interp(a, tp(k1), tp(k1 - 1), tp(k1 - 2), tp(k1 - 3))\nwith {\n    size = int(npow2(maxd)); rd = _reader(size);\n    r = float(size + rd) - clamp(2, maxd, d);\n    r1 = int(r); a = r - float(r1);\n    k1 = size + rd - r1;\n    tp(k) = _ringfb(MAXD, size, xd, k);\n};\nrd_cubic_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, cubic_interp);\nrd_spline_fb(MAXD, maxd, xd, d) = _rd4_fb(MAXD, maxd, xd, d, spline_interp);\n\n//---------------------------------------------------------------- cycle\n\n// cycle(freq) with no buffer: genlib's SineCycle, a 32-bit phase stepped by\n// (uint32)(int64)(freq * 2^32/sr), read in a 16384-point cosine table with\n// linear interpolation (the table entry recomputed as genlib fills it). The\n// phase is kept as an exact integer in a double. Output: cos, then the phase\n// before the step is not needed: `cycle_phase` gives phase() after the step.\n_u32(x) = fmod(fmod(trunc(x), 4294967296.0) + 4294967296.0, 4294967296.0);\n_cycle_phasei(f) = (\\(p).(fmod(p + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0))) ~ _ : mem;\n_costab(i) = cos(float(i) * ma.PI * 2.0 / 16384.0);\ncycle(f) = linear_interp(frac, _costab(idx), _costab((idx + 1) & 16383))\nwith {\n    p = _cycle_phasei(f);\n    idx = int(floor(p / 262144.0));\n    frac = fmod(p, 262144.0) * 3.81471181759574e-6;\n};\n// phase() read after the call: the phase once stepped, in [0, 1)\ncycle_phase(f) = fmod(_cycle_phasei(f) + _u32(f * (4294967296.0 / ma.SR)), 4294967296.0) * 0.232830643653869629e-9;\n\n//---------------------------------------------------------------- noise\n\n// gen~'s noise() is uniform in [-1, 1) (xoshiro256+ seeded by the clock). The\n// ports take their noises as signals; programs use these: K independent\n// streams, stream k of K.\nnoises(K, k) = no.noises(K, k) with { no = library(\"noises.lib\"); };\n};\n\nmix = hslider(\"mix\", 0.5, 0, 1, 0.001);\nmc_mode = hslider(\"mc_mode [style:menu{'stereo':0;'16 channels':1}]\", 0, 0, 1, 1);\ngain = hslider(\"gain\", 1, 0, 5, 0.001);\nspread = hslider(\"spread\", 0, -100, 100, 0.01);\noffset = hslider(\"offset\", 0, 0, 1, 0.001);\nducking = hslider(\"ducking\", 0, 0, 1, 0.001);\nsmooth_time = hslider(\"smooth_time\", 0.9, 0, 1, 0.001);\nclear = hslider(\"clear\", 0, 0, 1, 1);\nf_type = hslider(\"f_type\", 0, 0, 2, 0.001);\nf_start = hslider(\"f_start [unit:Hz]\", 16000, 20, 16000, 1);\nf_end = hslider(\"f_end [unit:Hz]\", 800, 20, 16000, 1);\nf_direction = hslider(\"f_direction [style:menu{'desc':0;'asc':1;'random':2;'amplitude':3}]\", 0, 0, 3, 1);\nfeedback = hslider(\"feedback\", 0, 0, 100, 0.01);\nf_mix = hslider(\"f_mix\", 0, 0, 100, 0.01);\nres = hslider(\"res\", 0, 0, 100, 0.01);\n\n// buf_taps as the patch loads it (scripts/delays_delays_buffer.py --faust), float32 values\nbuf_t = (0.10000000149011612, 1.317352294921875, 6.953027248382568, 18.39894676208496, 36.698299407958984, 62.69457244873047, 97.11022186279297, 140.5844268798828, 193.6947784423828, 256.9709167480469, 330.9039306640625, 415.953125, 512.5508422851562, 621.1063842773438, 742.0090942382812, 875.6306762695312, 1022.3271484375, 1182.440673828125, 1356.300537109375, 1544.2249755859375, 1746.521484375, 1963.488037109375, 2195.413818359375, 2442.579833984375, 2705.259521484375, 2983.71923828125, 3278.218994140625, 3589.012451171875, 3916.347412109375, 4260.46630859375, 4621.6064453125, 5000.0);\nbuf_a = (0.6277148723602295, 0.6761665344238281, 0.7264364957809448, 0.7770863175392151, 0.8264593482017517, 0.8727630972862244, 0.9141733646392822, 0.9489516019821167, 0.9755649566650391, 0.992798388004303, 0.9998462200164795, 0.9963749647140503, 0.9825491309165955, 0.9590185880661011, 0.9268677830696106, 0.8875328898429871, 0.8426955938339233, 0.7941644191741943, 0.7437552809715271, 0.6931816339492798, 0.6439641118049622, 0.5973644852638245, 0.5543472170829773, 0.5155686736106873, 0.48138952255249023, 0.4519070088863373, 0.4269992411136627, 0.4063768684864044, 0.38963526487350464, 0.3763033151626587, 0.1829427033662796, 0.0);\nNT = 32;\nNC = 16;\n\nDMAXD = 1500000;   // Delay dL(1500000), dR(1500000), dS(1500000)\nMAXD = 1500000;    // compile-time bound of the Faust lines\n\nI31 = 0.032258064516129031;   // i/31 as the export computes it\n// History s(init) smoothed: s = mix(s, target, a)\nsmoothed(a, init, target) = (\\(s).(s + a * (target - s))) ~ g.init(init);\n// left fold f(0) ... f(n): (((f(0) [op] f(1)) ...)\nlsum(f, 0) = f(0);\nlsum(f, n) = lsum(f, n - 1) + f(n);\n\n// one frame: the L and R delay inputs fed back (delayed by one sample), the\n// audio inputs -> the L and R delay inputs written, the 20 outputs\ncore(wLd, wRd, in1, in2) = wL, wR, outs, ui_master_trig, tap_hit_pulse, h_idx, h_amp\nwith {\n    in1_c = g.dcblock(in1);\n    in2_c = g.dcblock(in2);\n    in_abs = (abs(in1_c) + abs(in2_c)) * 0.5;\n\n    // master UI trigger, 100 ms lockout\n    above = in_abs > 0.005;\n    prev_in = above';\n    arm(tp) = select2(above & (prev_in == 0) & (tp == 0), tp, 4800);\n    trig_timer = (\\(tp).(max(0, arm(tp) - 1))) ~ _;\n    ui_master_trig = arm(trig_timer') > 0;\n\n    env_fol = (\\(e).(e + select2(in_abs > e, 0.0008, 0.2) * (in_abs - e))) ~ _;\n    duck = 1 + ducking * ((1 - g.safepow(g.clamp(0, 1, env_fol * 5), 1.5) * 0.95) - 1);\n\n    s_f_mx = smoothed(0.05, 0, g.clamp(0, 1, f_mix * 0.01));\n    s_f_type = smoothed(0.05, 0, g.clamp(0, 2, f_type));\n    s_off = smoothed(0.1, 0, offset);\n    s_spr = smoothed(0.1, 0, spread);\n    s_gn = smoothed(0.1, 0, g.clamp(0, 5, gain));\n    s_mx = smoothed(0.1, 0, g.clamp(0, 1, mix));\n    s_mode = smoothed(0.1, 0, mc_mode);\n    s_f_st = smoothed(0.05, 16000, g.clamp(20, 16000, f_start));\n    s_f_ed = smoothed(0.05, 800, g.clamp(20, 16000, f_end));\n    s_res = smoothed(0.05, 0.5, 0.6 + g.clamp(0, 1, res * 0.01) * 0.38);\n\n    angle = s_mx * 1.57079632679;\n    dry_v = cos(angle);\n    wet_v = sin(angle);\n    fb_amt = g.safepow(g.clamp(0, 1, feedback * 0.01), 1.2) * 0.75;\n    mc_step = select2(s_spr < 0, 0.4838709677419355 + (s_spr * 0.01) * 2,\n                                 0.4838709677419355 * (1 + s_spr * 0.01));\n    f_min = min(s_f_st, s_f_ed);\n    f_max = max(s_f_st, s_f_ed);\n    log_ratio = log(f_max / f_min);\n    k_res = 4 * s_res;\n    mute = select2(clear > 0, 1, 0);\n    ws = ui_master_trig * mute;   // dS.write\n\n    // ---- tap i\n    t_target(i) = ba.take(i + 1, buf_t);\n    t_amp(i) = ba.take(i + 1, buf_a);\n    // smooth_ms[i] (0 at start): p = (p <= 0) ? t_target : p; c = mix(p, t_target, 1 - smooth)\n    c_ms(i) = (\\(p).(g.mix(pm(p), t_target(i), 1 - g.clamp(0, 0.999, smooth_time)))) ~ _\n    with { pm(p) = select2(p <= 0, p, t_target(i)); };\n    t_samp(i) = c_ms(i) * (ma.SR * 0.001);\n    sigL(i) = g.rd_linear_fb(MAXD, DMAXD, wLd, t_samp(i));\n    sigR(i) = g.rd_linear_fb(MAXD, DMAXD, wRd,\n        t_samp(i) + ((((s_spr + 100) * 0.005) * 250) * (i * I31)) * (ma.SR * 0.001));\n\n    rnd(i) = g.fract(sin(i * 12.98) * 43758);\n    mod(i) = select2(f_direction == 0,\n                select2(f_direction == 1,\n                    select2(f_direction == 2, t_amp(i), rnd(i)),\n                    i * I31),\n                1 - i * I31);\n    f_coeff(i) = (f_min * exp(mod(i) * log_ratio) * 2) / ma.SR;\n\n    // 4 one-poles with tanh feedback; outputs l1..l4 of the frame\n    ladder(f, x) = (\\(p1, p2, p3, p4).(st(f, x, p1, p2, p3, p4))) ~ (_, _, _, _)\n    with {\n        st(f, x, p1, p2, p3, p4) = l1, l2, l3, l4\n        with {\n            l_in = x - k_res * ma.tanh(p4);\n            l1 = p1 + f * (l_in - p1);\n            l2 = p2 + f * (l1 - p2);\n            l3 = p3 + f * (l2 - p3);\n            l4 = p4 + f * (l3 - p4);\n        };\n    };\n    shape(x, l1, l2, l3, l4) = select2(s_f_type < 1,\n            g.mix(hp, (l2 - l4) * 2, g.clamp(0, 1, s_f_type - 1)),\n            g.mix(l4, hp, s_f_type))\n    with { hp = (((x - 4 * l1) + 6 * l2) - 4 * l3) + l4; };\n    filt(i, x) = g.mix(x, ladder(f_coeff(i), x) : shape(x), s_f_mx) * t_amp(i);\n    fL(i) = filt(i, sigL(i));\n    fR(i) = filt(i, sigR(i));\n\n    // MC spatialisation\n    mono(i) = (fL(i) + fR(i)) * 0.5;\n    pos(i) = g.wrap(0, 15, (s_off * 15) + (i * mc_step));\n    idx(i) = floor(pos(i));\n    fr(i) = g.fract(pos(i));\n    idx2(i) = g.wrap(0, 15, idx(i) + 1);\n    // mc_bus[c] after taps 0..n, in gen's order (idx written, then idx2)\n    bus(c, 0) = bstep(c, 0, 0);\n    bus(c, n) = bstep(c, n, bus(c, n - 1));\n    bstep(c, i, acc) = select2(idx2(i) == c, a1, a1 + mono(i) * fr(i))\n    with { a1 = select2(idx(i) == c, acc, acc + mono(i) * (1 - fr(i))); };\n\n    // elastic sync: dS read 5 ms ahead (step, before its write)\n    is_hit(i) = g.rd_step(MAXD, DMAXD, 1, ws, max(0, c_ms(i) - 5) * (ma.SR * 0.001)) > 0.5;\n    hit(i) = is_hit(i) & (is_hit(i)' == 0);\n    tap_hit_pulse = lsum(hit, NT - 1) > 0;\n    hsel(v, prev, 0) = select2(hit(0), prev, v(0));\n    hsel(v, prev, n) = select2(hit(n), hsel(v, prev, n - 1), v(n));\n    h_idx = (\\(p).(hsel(\\(i).(i), p, NT - 1))) ~ g.init(-1);\n    h_amp = (\\(p).(hsel(t_amp, p, NT - 1))) ~ _;\n\n    sumL = lsum(fL, NT - 1);\n    sumR = lsum(fR, NT - 1);\n\n    // FB & writing\n    wL = (in1_c + (g.dcblock(ma.tanh(sumL * 0.05)) * fb_amt) * duck) * mute;\n    wR = (in2_c + (g.dcblock(ma.tanh(sumR * 0.05)) * fb_amt) * duck) * mute;\n\n    gn = ((s_gn * duck) * wet_v) * mute;\n    dry = dry_v * mute;\n    s_L = (in1 * dry) + g.dcblock(ma.tanh(sumL * 0.1)) * gn;\n    s_R = (in2 * dry) + g.dcblock(ma.tanh(sumR * 0.1)) * gn;\n\n    // one DCBlock for the 16 channels: y_n = x_n - x_{n-1} + 0.9997*y_{n-1},\n    // across channels and frames\n    mcx(n) = ma.tanh(bus(n, NT - 1) * 0.25);\n    dcstep(xp, yp) = mcx(NC - 1), y(NC - 1), par(n, NC, y(n))\n    with {\n        y(0) = (mcx(0) - xp) + yp * 0.9997;\n        y(n) = (mcx(n) - mcx(n - 1)) + y(n - 1) * 0.9997;\n    };\n    dcy = dcstep ~ (_, _) : !, !, par(n, NC, _);\n    chan(n, y) = g.mix(select2(n == 0, select2(n == 1, 0, s_R), s_L), mc, s_mode)\n    with { mc = y * gn + select2(n < 2, 0, select2(n == 0, in2, in1) * dry); };\n    outs = dcy : par(n, NC, chan(n));\n};\n\ndelays = core ~ (_, _) : !, !, par(n, 20, _);\n\nprocess = delays;\ndet = delays;\n",
                    "sourcecode_size": 23211,
                    "sample_format": 1,
                    "version": "1.87"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        779.0,
                        415.0,
                        51.854875326156616,
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
                    "needlemode": 2,
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
                                5000
                            ],
                            "parameter_initial_enable": 1,
                            "parameter_linknames": 1,
                            "parameter_longname": "del-time",
                            "parameter_mmax": 30000.0,
                            "parameter_mmin": 10.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "del-time",
                            "parameter_type": 0,
                            "parameter_unitstyle": 2
                        }
                    },
                    "varname": "del-time"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        779.0,
                        533.0,
                        51.854875326156616,
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
                    "needlemode": 2,
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
                            "parameter_linknames": 1,
                            "parameter_longname": "gravity_in",
                            "parameter_mmax": 100.0,
                            "parameter_mmin": -100.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "gravity_in",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "gravity_in"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        886.0,
                        546.0,
                        77.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "gravity_in $1"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        886.0,
                        441.0,
                        83.0,
                        22.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "max_delay $1"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        210.0,
                        716.0,
                        70.10308885574341,
                        70.10308885574341
                    ],
                    "local": 1,
                    "prototypename": "helpfile",
                    "varname": "autohelp_dac"
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        865.0,
                        819.0,
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
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        865.0,
                        786.0,
                        119.0,
                        22.0
                    ],
                    "outlettype": [
                        "bang"
                    ],
                    "text": "qmetro 33 @active 1"
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "patching_rect": [
                        907.0,
                        820.0,
                        56.0,
                        22.0
                    ],
                    "color": [
                        0.6666666666666666,
                        0.6470588235294118,
                        0.0,
                        1.0
                    ],
                    "outlettype": [
                        ""
                    ],
                    "text": "r -to-jsui-",
                    "varname": "u431010580[5]"
                }
            },
            {
                "box": {
                    "id": "obj-116",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        232.0,
                        647.0,
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
                    "id": "obj-117",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        109.0,
                        577.0,
                        60.0,
                        22.0
                    ],
                    "text": "res"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [
                        169.0,
                        577.0,
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
                    "id": "obj-118",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [
                        169.0,
                        601.0,
                        120,
                        22
                    ],
                    "text": "prepend res",
                    "outlettype": [
                        ""
                    ],
                    "hidden": 1
                }
            },
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [
                        294.0,
                        601.0,
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
                    "id": "obj-120",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        17.0,
                        212.0,
                        360,
                        20
                    ],
                    "text": "buf_taps: the tap table is fixed in the Faust program (the demo's load state)"
                }
            },
            {
                "box": {
                    "id": "obj-121",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        32.0,
                        569.0,
                        560,
                        34
                    ],
                    "text": "Faust version: gen~ @gen delays-delays replaced by faustgen~ running the Faust port (faust-gen-patches/dsp/delays-delays.dsp), double-click it to see the code. Generated by max/convert_patches.py from GEN-patches/delays-delays.maxpat.",
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
                        "obj-43",
                        0
                    ],
                    "hidden": 1
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
                        "obj-101",
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
                        "obj-102",
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
                        "obj-103",
                        0
                    ],
                    "destination": [
                        "obj-102",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-104",
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
                        "obj-105",
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
                        "obj-106",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "color": [
                        0.0,
                        0.9769930243492126,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        760.5,
                        325.9836779125035,
                        91.5,
                        325.9836779125035
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        760.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-107",
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
                        "obj-114",
                        0
                    ],
                    "destination": [
                        "obj-115",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-115",
                        0
                    ],
                    "destination": [
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        630.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
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
                        "obj-50",
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        346.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
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
                        "obj-33",
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        249.5,
                        212.43530461378396,
                        26.5,
                        212.43530461378396
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
                        "obj-104",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-21",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "color": [
                        0.0,
                        0.9769930243492126,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        42.5,
                        325.07323813438416,
                        91.5,
                        325.07323813438416
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        42.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-22",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
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
                        "obj-62",
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
                        "obj-26",
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
                        "obj-27",
                        0
                    ],
                    "destination": [
                        "obj-55",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-29",
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
                        "obj-29",
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
                        "obj-3",
                        15
                    ],
                    "destination": [
                        "obj-4",
                        15
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        14
                    ],
                    "destination": [
                        "obj-4",
                        14
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        13
                    ],
                    "destination": [
                        "obj-4",
                        13
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        12
                    ],
                    "destination": [
                        "obj-4",
                        12
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        11
                    ],
                    "destination": [
                        "obj-4",
                        11
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        10
                    ],
                    "destination": [
                        "obj-4",
                        10
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        9
                    ],
                    "destination": [
                        "obj-4",
                        9
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        8
                    ],
                    "destination": [
                        "obj-4",
                        8
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        7
                    ],
                    "destination": [
                        "obj-4",
                        7
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        6
                    ],
                    "destination": [
                        "obj-4",
                        6
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        5
                    ],
                    "destination": [
                        "obj-4",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        4
                    ],
                    "destination": [
                        "obj-4",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        3
                    ],
                    "destination": [
                        "obj-4",
                        3
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
                        "obj-4",
                        2
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
                        "obj-4",
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
                        "obj-4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        19
                    ],
                    "destination": [
                        "obj-42",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        17
                    ],
                    "destination": [
                        "obj-5",
                        0
                    ],
                    "hidden": 1,
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        18
                    ],
                    "destination": [
                        "obj-54",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        17
                    ],
                    "destination": [
                        "obj-54",
                        1
                    ],
                    "order": 2
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        16
                    ],
                    "destination": [
                        "obj-54",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        17
                    ],
                    "destination": [
                        "obj-71",
                        0
                    ],
                    "midpoints": [
                        376.43885305263154,
                        697.9112390642986,
                        421.5,
                        697.9112390642986
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        19
                    ],
                    "destination": [
                        "obj-88",
                        0
                    ],
                    "hidden": 1,
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
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
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
                        "obj-3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-32",
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
                        "obj-34",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
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
                        "obj-21",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-37",
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
                        "obj-39",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
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
                        "obj-77",
                        0
                    ],
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
                        "obj-78",
                        0
                    ],
                    "midpoints": [
                        41.5,
                        681.9407410621643,
                        140.5,
                        681.9407410621643
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
                        "obj-23",
                        0
                    ],
                    "color": [
                        0.0,
                        0.9769930243492126,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        91.5,
                        325.07323813438416,
                        91.5,
                        325.07323813438416
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        91.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-41",
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
                        "obj-43",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-44",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-47",
                        0
                    ],
                    "destination": [
                        "obj-97",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-49",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-52",
                        0
                    ],
                    "destination": [
                        "obj-53",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-53",
                        0
                    ],
                    "destination": [
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        146.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-54",
                        1
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
                        "obj-54",
                        0
                    ],
                    "destination": [
                        "obj-70",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-55",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-56",
                        0
                    ],
                    "destination": [
                        "obj-49",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-59",
                        0
                    ],
                    "destination": [
                        "obj-73",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-62",
                        0
                    ],
                    "destination": [
                        "obj-89",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-62",
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
                        "obj-66",
                        0
                    ],
                    "destination": [
                        "obj-51",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-67",
                        0
                    ],
                    "destination": [
                        "obj-44",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-69",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ],
                    "color": [
                        0.3725490196,
                        0.3725490196,
                        0.3725490196,
                        1.0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-71",
                        0
                    ],
                    "destination": [
                        "obj-38",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-71",
                        1
                    ],
                    "destination": [
                        "obj-66",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-72",
                        0
                    ],
                    "destination": [
                        "obj-69",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-73",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "color": [
                        0.0,
                        0.9769930243492126,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        439.5,
                        325.07323813438416,
                        91.5,
                        325.07323813438416
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
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        439.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-74",
                        0
                    ],
                    "destination": [
                        "obj-30",
                        0
                    ],
                    "hidden": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-77",
                        0
                    ],
                    "destination": [
                        "obj-6",
                        0
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-77",
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
                        "obj-79",
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
                        "obj-8",
                        1
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
                        "obj-80",
                        0
                    ],
                    "destination": [
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        346.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-81",
                        0
                    ],
                    "destination": [
                        "obj-85",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-82",
                        0
                    ],
                    "destination": [
                        "obj-80",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-83",
                        0
                    ],
                    "destination": [
                        "obj-84",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-85",
                        0
                    ],
                    "destination": [
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        288.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
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
                        "obj-87",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "color": [
                        0.0,
                        0.9769930243492126,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        504.5,
                        325.07323813438416,
                        91.5,
                        325.07323813438416
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        504.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ],
                    "order": 1
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
                        "obj-91",
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
                        "obj-93",
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
                        "obj-95",
                        0
                    ],
                    "destination": [
                        "obj-96",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-96",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "color": [
                        0.0,
                        0.9769930243492126,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        565.5,
                        325.07323813438416,
                        91.5,
                        325.07323813438416
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        565.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-97",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "color": [
                        0.0,
                        0.9769930243492126,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        210.5,
                        325.07323813438416,
                        91.5,
                        325.07323813438416
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        210.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-98",
                        0
                    ],
                    "destination": [
                        "obj-23",
                        0
                    ],
                    "color": [
                        0.0,
                        0.9769930243492126,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        672.5,
                        325.07323813438416,
                        91.5,
                        325.07323813438416
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
                        "obj-76",
                        0
                    ],
                    "color": [
                        0.0,
                        0.0,
                        0.0,
                        1.0
                    ],
                    "midpoints": [
                        672.5,
                        357.9407410621643,
                        26.5,
                        357.9407410621643
                    ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-99",
                        0
                    ],
                    "destination": [
                        "obj-98",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-63",
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
                        "obj-3",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-116",
                        0
                    ],
                    "destination": [
                        "obj-119",
                        0
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-119",
                        0
                    ],
                    "destination": [
                        "obj-63",
                        0
                    ],
                    "order": 0
                }
            }
        ],
        "autosave": 0,
        "parameters": {
            "obj-1": [
                "del-time",
                "del-time",
                0
            ],
            "obj-101": [
                "compmode",
                "compmode",
                0
            ],
            "obj-114": [
                "res",
                "res",
                0
            ],
            "obj-20": [
                "jitter",
                "jitter",
                0
            ],
            "obj-27": [
                "del-in",
                "del-in",
                0
            ],
            "obj-32": [
                "gravity_out",
                "gravity_out",
                0
            ],
            "obj-36": [
                "mix",
                "mix",
                0
            ],
            "obj-41": [
                "gain",
                "gain",
                0
            ],
            "obj-47": [
                "feedback",
                "feedback",
                0
            ],
            "obj-52": [
                "spread",
                "spread",
                0
            ],
            "obj-56": [
                "live.tab",
                "live.tab",
                0
            ],
            "obj-59": [
                "ftype",
                "ftype",
                0
            ],
            "obj-67": [
                "gravity_in",
                "gravity_in",
                0
            ],
            "obj-72": [
                "reverse",
                "reverse",
                0
            ],
            "obj-74": [
                "mirror",
                "mirror",
                0
            ],
            "obj-81": [
                "offset",
                "offset",
                0
            ],
            "obj-82": [
                "mcmode",
                "mcmode",
                0
            ],
            "obj-83": [
                "mc.live.gain~",
                "mc.live.gain~",
                0
            ],
            "obj-90": [
                "fmin",
                "fmin",
                0
            ],
            "obj-93": [
                "fmix",
                "fmix",
                0
            ],
            "obj-95": [
                "fmax",
                "fmax",
                0
            ],
            "obj-99": [
                "fdirection",
                "fdirection",
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
        "bgcolor": [
            0.19607843137254902,
            0.19607843137254902,
            0.19607843137254902,
            1.0
        ]
    }
}