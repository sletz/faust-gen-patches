{
 "patcher": {
  "fileversion": 1,
  "classnamespace": "box",
  "rect": [
   50,
   50,
   900,
   1000
  ],
  "appversion": {
   "major": 9,
   "minor": 2,
   "revision": 1,
   "architecture": "x64",
   "modernui": 1
  },
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
      600,
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
      600,
      22
     ],
     "text": "delay 3000"
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
      100,
      600,
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
      160,
      600,
      22
     ],
     "text": "gen~ @gen adm_panner @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname adm_panner"
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
      190,
      600,
      22
     ],
     "text": "gen~ @gen aether-drift @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname aether_drift"
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
      220,
      600,
      22
     ],
     "text": "gen~ @gen aether-particle @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname aether_particle"
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
      250,
      600,
      22
     ],
     "text": "gen~ @gen bernoulli-gate @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname bernoulli_gate"
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
      280,
      600,
      22
     ],
     "text": "gen~ @gen cswitch-tremolo @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname cswitch_tremolo"
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
      310,
      600,
      22
     ],
     "text": "gen~ @gen curvature-shaper @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname curvature_shaper"
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
      340,
      600,
      22
     ],
     "text": "gen~ @gen delays-delays @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname delays_delays"
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
      370,
      600,
      22
     ],
     "text": "gen~ @gen driller @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname driller"
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
      400,
      600,
      22
     ],
     "text": "gen~ @gen erbeverb-clone @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname erbeverb_clone"
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
      430,
      600,
      22
     ],
     "text": "gen~ @gen fdn_multireverb @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname fdn_multireverb"
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
      460,
      600,
      22
     ],
     "text": "gen~ @gen fhickup @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname fhickup"
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
      490,
      600,
      22
     ],
     "text": "gen~ @gen filterbank-8 @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname filterbank_8"
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
      520,
      600,
      22
     ],
     "text": "gen~ @gen fm-supermod @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname fm_supermod"
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
      550,
      600,
      22
     ],
     "text": "gen~ @gen frost-machine @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname frost_machine"
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
      580,
      600,
      22
     ],
     "text": "gen~ @gen grainer @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname grainer"
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
      610,
      600,
      22
     ],
     "text": "gen~ @gen householder-fdn-16 @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname householder_fdn_16"
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
      640,
      600,
      22
     ],
     "text": "gen~ @gen hp_butterworth @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname hp_butterworth"
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
      670,
      600,
      22
     ],
     "text": "gen~ @gen lorenz-rossler-chaos @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname lorenz_rossler_chaos"
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
      700,
      600,
      22
     ],
     "text": "gen~ @gen lp_butterworth @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname lp_butterworth"
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
      730,
      600,
      22
     ],
     "text": "gen~ @gen modeldrive @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname modeldrive"
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
      760,
      600,
      22
     ],
     "text": "gen~ @gen multiband-drive @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname multiband_drive"
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
      790,
      600,
      22
     ],
     "text": "gen~ @gen offset-spline-random @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname offset_spline_random"
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
      820,
      600,
      22
     ],
     "text": "gen~ @gen poisson-cloud @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname poisson_cloud"
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
      850,
      600,
      22
     ],
     "text": "gen~ @gen precision-svf-48db @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname precision_svf_48db"
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
      880,
      600,
      22
     ],
     "text": "gen~ @gen pulsar-synth @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname pulsar_synth"
    }
   },
   {
    "box": {
     "id": "g25",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      910,
      600,
      22
     ],
     "text": "gen~ @gen rings @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname rings"
    }
   },
   {
    "box": {
     "id": "g26",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      940,
      600,
      22
     ],
     "text": "gen~ @gen sature-delay @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname sature_delay"
    }
   },
   {
    "box": {
     "id": "g27",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      970,
      600,
      22
     ],
     "text": "gen~ @gen skipper @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname skipper"
    }
   },
   {
    "box": {
     "id": "g28",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      1000,
      600,
      22
     ],
     "text": "gen~ @gen spatial-dbap @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname spatial_dbap"
    }
   },
   {
    "box": {
     "id": "g29",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      1030,
      600,
      22
     ],
     "text": "gen~ @gen tape-hysteresis @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname tape_hysteresis"
    }
   },
   {
    "box": {
     "id": "g30",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      1060,
      600,
      22
     ],
     "text": "gen~ @gen ufo @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname ufo"
    }
   },
   {
    "box": {
     "id": "g31",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      1090,
      600,
      22
     ],
     "text": "gen~ @gen volt-drama @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname volt_drama"
    }
   },
   {
    "box": {
     "id": "g32",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      1120,
      600,
      22
     ],
     "text": "gen~ @gen volt-syphon @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname volt_syphon"
    }
   },
   {
    "box": {
     "id": "g33",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      1150,
      600,
      22
     ],
     "text": "gen~ @gen waveguide-string @exportfolder \"/Users/letz/Developpements/RUST/faust-gen-patches/ref/export/\" @exportname waveguide_string"
    }
   },
   {
    "box": {
     "id": "g34",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      1180,
      600,
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
      "msg",
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
   },
   {
    "patchline": {
     "source": [
      "msg",
      0
     ],
     "destination": [
      "g25",
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
      "g26",
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
      "g27",
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
      "g28",
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
      "g29",
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
      "g30",
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
      "g31",
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
      "g32",
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
      "g33",
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
      "g34",
      0
     ]
    }
   }
  ]
 }
}