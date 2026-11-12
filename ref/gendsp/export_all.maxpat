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
   50,
   50,
   900,
   1000
  ],
  "boxes": [
   {
    "box": {
     "id": "lb",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      20,
      300,
      22
     ],
     "text": "loadbang"
    }
   },
   {
    "box": {
     "id": "del",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      60,
      300,
      22
     ],
     "text": "delay 3000"
    }
   },
   {
    "box": {
     "id": "trig",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20,
      100,
      300,
      22
     ],
     "text": "t b b"
    }
   },
   {
    "box": {
     "id": "q",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      400,
      100,
      300,
      22
     ],
     "text": "delay 20000"
    }
   },
   {
    "box": {
     "id": "quit",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      400,
      140,
      300,
      22
     ],
     "text": ";\rmax quit"
    }
   },
   {
    "box": {
     "id": "msg",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      140,
      300,
      22
     ],
     "text": "exportcode"
    }
   },
   {
    "box": {
     "id": "g0",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      200,
      300,
      22
     ],
     "text": "gen~ @gen aether-drift @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname aether_drift"
    }
   },
   {
    "box": {
     "id": "g1",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      230,
      300,
      22
     ],
     "text": "gen~ @gen aether-particle @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname aether_particle"
    }
   },
   {
    "box": {
     "id": "g2",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      260,
      300,
      22
     ],
     "text": "gen~ @gen bernoulli-gate @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname bernoulli_gate"
    }
   },
   {
    "box": {
     "id": "g3",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      290,
      300,
      22
     ],
     "text": "gen~ @gen cswitch-tremolo @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname cswitch_tremolo"
    }
   },
   {
    "box": {
     "id": "g4",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      320,
      300,
      22
     ],
     "text": "gen~ @gen curvature-shaper @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname curvature_shaper"
    }
   },
   {
    "box": {
     "id": "g5",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      350,
      300,
      22
     ],
     "text": "gen~ @gen delays-delays @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname delays_delays"
    }
   },
   {
    "box": {
     "id": "g6",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      380,
      300,
      22
     ],
     "text": "gen~ @gen erbeverb-clone @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname erbeverb_clone"
    }
   },
   {
    "box": {
     "id": "g7",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      410,
      300,
      22
     ],
     "text": "gen~ @gen frost-machine @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname frost_machine"
    }
   },
   {
    "box": {
     "id": "g8",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      440,
      300,
      22
     ],
     "text": "gen~ @gen householder-fdn-16 @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname householder_fdn_16"
    }
   },
   {
    "box": {
     "id": "g9",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      470,
      300,
      22
     ],
     "text": "gen~ @gen hp_butterworth @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname hp_butterworth"
    }
   },
   {
    "box": {
     "id": "g10",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      500,
      300,
      22
     ],
     "text": "gen~ @gen lorenz-rossler-chaos @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname lorenz_rossler_chaos"
    }
   },
   {
    "box": {
     "id": "g11",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      530,
      300,
      22
     ],
     "text": "gen~ @gen lp_butterworth @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname lp_butterworth"
    }
   },
   {
    "box": {
     "id": "g12",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      560,
      300,
      22
     ],
     "text": "gen~ @gen offset-spline-random @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname offset_spline_random"
    }
   },
   {
    "box": {
     "id": "g13",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      590,
      300,
      22
     ],
     "text": "gen~ @gen poisson-cloud @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname poisson_cloud"
    }
   },
   {
    "box": {
     "id": "g14",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      620,
      300,
      22
     ],
     "text": "gen~ @gen precision-svf-48db @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname precision_svf_48db"
    }
   },
   {
    "box": {
     "id": "g15",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      650,
      300,
      22
     ],
     "text": "gen~ @gen pulsar-synth @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname pulsar_synth"
    }
   },
   {
    "box": {
     "id": "g16",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      680,
      300,
      22
     ],
     "text": "gen~ @gen sature-delay @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname sature_delay"
    }
   },
   {
    "box": {
     "id": "g17",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      710,
      300,
      22
     ],
     "text": "gen~ @gen tape-hysteresis @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname tape_hysteresis"
    }
   },
   {
    "box": {
     "id": "g18",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      740,
      300,
      22
     ],
     "text": "gen~ @gen ufo @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname ufo"
    }
   },
   {
    "box": {
     "id": "g19",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      770,
      300,
      22
     ],
     "text": "gen~ @gen ufo-core @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname ufo_core"
    }
   },
   {
    "box": {
     "id": "g20",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      800,
      300,
      22
     ],
     "text": "gen~ @gen ufo-core-simple @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname ufo_core_simple"
    }
   },
   {
    "box": {
     "id": "g21",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      830,
      300,
      22
     ],
     "text": "gen~ @gen volt-drama @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname volt_drama"
    }
   },
   {
    "box": {
     "id": "g22",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      860,
      300,
      22
     ],
     "text": "gen~ @gen volt-syphon @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname volt_syphon"
    }
   },
   {
    "box": {
     "id": "g23",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      890,
      300,
      22
     ],
     "text": "gen~ @gen waveguide-string @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname waveguide_string"
    }
   },
   {
    "box": {
     "id": "g24",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      920,
      300,
      22
     ],
     "text": "gen~ @gen zdf-diode-ladder @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname zdf_diode_ladder"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "del",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "del",
      0
     ],
     "destination": [
      "trig",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "trig",
      1
     ],
     "destination": [
      "msg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "trig",
      0
     ],
     "destination": [
      "q",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "q",
      0
     ],
     "destination": [
      "quit",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g10",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g11",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g19",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g21",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g22",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g23",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g24",
      0
     ]
    }
   }
  ]
 }
}