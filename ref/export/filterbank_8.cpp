#include "filterbank_8.h"

namespace filterbank_8 {

/****************************************************************************************
Copyright (c) 2023 Cycling '74

The code that Max generates automatically and that end users are capable of
exporting and using, and any associated documentation files (the “Software”)
is a work of authorship for which Cycling '74 is the author and owner for
copyright purposes.

This Software is dual-licensed either under the terms of the Cycling '74
License for Max-Generated Code for Export, or alternatively under the terms
of the General Public License (GPL) Version 3. You may use the Software
according to either of these licenses as it is most appropriate for your
project on a case-by-case basis (proprietary or not).

A) Cycling '74 License for Max-Generated Code for Export

A license is hereby granted, free of charge, to any person obtaining a copy
of the Software (“Licensee”) to use, copy, modify, merge, publish, and
distribute copies of the Software, and to permit persons to whom the Software
is furnished to do so, subject to the following conditions:

The Software is licensed to Licensee for all uses that do not include the sale,
sublicensing, or commercial distribution of software that incorporates this
source code. This means that the Licensee is free to use this software for
educational, research, and prototyping purposes, to create musical or other
creative works with software that incorporates this source code, or any other
use that does not constitute selling software that makes use of this source
code. Commercial distribution also includes the packaging of free software with
other paid software, hardware, or software-provided commercial services.

For entities with UNDER 200k USD in annual revenue or funding, a license is hereby
granted, free of charge, for the sale, sublicensing, or commercial distribution
of software that incorporates this source code, for as long as the entity's
annual revenue remains below 200k USD annual revenue or funding.

For entities with OVER 200k USD in annual revenue or funding interested in the
sale, sublicensing, or commercial distribution of software that incorporates
this source code, please send inquiries to licensing (at) cycling74.com.

The above copyright notice and this license shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Please see
https://support.cycling74.com/hc/en-us/articles/360050779193-Gen-Code-Export-Licensing-FAQ
for additional information

B) General Public License Version 3 (GPLv3)
Details of the GPLv3 license can be found at: https://www.gnu.org/licenses/gpl-3.0.html
****************************************************************************************/

// global noise generator
Noise noise;
static const int GENLIB_LOOPCOUNT_BAIL = 100000;


// The State struct contains all the state and procedures for the gendsp kernel
typedef struct State {
	CommonState __commonstate;
	int __exception;
	int vectorsize;
	t_sample m_s1_R1_34;
	t_sample m_s2_R1_33;
	t_sample m_s2_L1_35;
	t_sample m_s1_L1_36;
	t_sample m_s1_L2_32;
	t_sample m_s2_L2_31;
	t_sample m_s1_R2_30;
	t_sample m_s2_L3_27;
	t_sample m_mix_37;
	t_sample m_s1_L3_28;
	t_sample m_s2_R2_29;
	t_sample m_s1_R3_26;
	t_sample m_gain_38;
	t_sample m_gain_40;
	t_sample m_stereo_spread_47;
	t_sample m_gain_46;
	t_sample m_soft_clip_48;
	t_sample m_drive_49;
	t_sample m_gain_39;
	t_sample m_gain_45;
	t_sample m_gain_43;
	t_sample m_gain_44;
	t_sample m_gain_41;
	t_sample m_gain_42;
	t_sample m_s2_R3_25;
	t_sample m_s1_L4_24;
	t_sample m_s2_L4_23;
	t_sample m_s2_L8_7;
	t_sample m_s1_R8_6;
	t_sample m_s1_L8_8;
	t_sample m_s2_R7_9;
	t_sample m_s1_R7_10;
	t_sample m_s2_R8_5;
	t_sample m_h_dc_y_L_3;
	t_sample samplerate;
	t_sample m_h_dc_x_L_4;
	t_sample m_h_dc_y_R_1;
	t_sample m_h_dc_x_R_2;
	t_sample m_q_global_50;
	t_sample m_s2_L7_11;
	t_sample m_s2_R6_13;
	t_sample m_s1_L5_20;
	t_sample m_s2_L5_19;
	t_sample m_s2_R4_21;
	t_sample m_s1_R4_22;
	t_sample m_s1_L7_12;
	t_sample m_s1_R5_18;
	t_sample m_s1_L6_16;
	t_sample m_s2_R5_17;
	t_sample m_s1_R6_14;
	t_sample m_s2_L6_15;
	t_sample m_freq_shift_51;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_dc_y_R_1 = ((int)0);
		m_h_dc_x_R_2 = ((int)0);
		m_h_dc_y_L_3 = ((int)0);
		m_h_dc_x_L_4 = ((int)0);
		m_s2_R8_5 = ((int)0);
		m_s1_R8_6 = ((int)0);
		m_s2_L8_7 = ((int)0);
		m_s1_L8_8 = ((int)0);
		m_s2_R7_9 = ((int)0);
		m_s1_R7_10 = ((int)0);
		m_s2_L7_11 = ((int)0);
		m_s1_L7_12 = ((int)0);
		m_s2_R6_13 = ((int)0);
		m_s1_R6_14 = ((int)0);
		m_s2_L6_15 = ((int)0);
		m_s1_L6_16 = ((int)0);
		m_s2_R5_17 = ((int)0);
		m_s1_R5_18 = ((int)0);
		m_s2_L5_19 = ((int)0);
		m_s1_L5_20 = ((int)0);
		m_s2_R4_21 = ((int)0);
		m_s1_R4_22 = ((int)0);
		m_s2_L4_23 = ((int)0);
		m_s1_L4_24 = ((int)0);
		m_s2_R3_25 = ((int)0);
		m_s1_R3_26 = ((int)0);
		m_s2_L3_27 = ((int)0);
		m_s1_L3_28 = ((int)0);
		m_s2_R2_29 = ((int)0);
		m_s1_R2_30 = ((int)0);
		m_s2_L2_31 = ((int)0);
		m_s1_L2_32 = ((int)0);
		m_s2_R1_33 = ((int)0);
		m_s1_R1_34 = ((int)0);
		m_s2_L1_35 = ((int)0);
		m_s1_L1_36 = ((int)0);
		m_mix_37 = ((int)100);
		m_gain_38 = ((int)0);
		m_gain_39 = ((int)0);
		m_gain_40 = ((int)0);
		m_gain_41 = ((int)0);
		m_gain_42 = ((int)0);
		m_gain_43 = ((int)0);
		m_gain_44 = ((int)0);
		m_gain_45 = ((int)0);
		m_gain_46 = ((int)0);
		m_stereo_spread_47 = ((int)50);
		m_soft_clip_48 = ((int)50);
		m_drive_49 = ((int)20);
		m_q_global_50 = ((int)4);
		m_freq_shift_51 = ((int)0);
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		t_sample * __out1 = __outs[0];
		t_sample * __out2 = __outs[1];
		t_sample * __out3 = __outs[2];
		t_sample * __out4 = __outs[3];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__out1 == 0) || (__out2 == 0) || (__out3 == 0) || (__out4 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		t_sample transp = safepow(((int)2), (m_freq_shift_51 * ((t_sample)0.083333333333333329)));
		t_sample eff_q = ((((t_sample)0.5) < m_q_global_50) ? m_q_global_50 : ((t_sample)0.5));
		t_sample d = safediv(((int)1), eff_q);
		t_sample res_boost = safepow(eff_q, ((t_sample)0.45000000000000001));
		t_sample clip_drive = (((int)1) + ((m_soft_clip_48 * ((t_sample)0.01)) * ((t_sample)1.5)));
		t_sample clip_norm = safediv(((int)1), sqrt(clip_drive));
		t_sample v_52 = (((t_sample)65.409999999999997) * transp);
		t_sample max_53 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f1 = ((v_52 <= ((int)10)) ? ((int)10) : ((v_52 >= max_53) ? max_53 : v_52));
		t_sample v_54 = (((t_sample)130.81) * transp);
		t_sample max_55 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f2 = ((v_54 <= ((int)10)) ? ((int)10) : ((v_54 >= max_55) ? max_55 : v_54));
		t_sample v_56 = (((t_sample)261.63) * transp);
		t_sample max_57 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f3 = ((v_56 <= ((int)10)) ? ((int)10) : ((v_56 >= max_57) ? max_57 : v_56));
		t_sample v_58 = (((t_sample)523.25) * transp);
		t_sample max_59 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f4 = ((v_58 <= ((int)10)) ? ((int)10) : ((v_58 >= max_59) ? max_59 : v_58));
		t_sample v_60 = (((t_sample)1046.5) * transp);
		t_sample max_61 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f5 = ((v_60 <= ((int)10)) ? ((int)10) : ((v_60 >= max_61) ? max_61 : v_60));
		t_sample v_62 = (((int)2093) * transp);
		t_sample max_63 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f6 = ((v_62 <= ((int)10)) ? ((int)10) : ((v_62 >= max_63) ? max_63 : v_62));
		t_sample v_64 = (((t_sample)4186.0100000000002) * transp);
		t_sample max_65 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f7 = ((v_64 <= ((int)10)) ? ((int)10) : ((v_64 >= max_65) ? max_65 : v_64));
		t_sample v_66 = (((t_sample)8372.0200000000004) * transp);
		t_sample max_67 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f8 = ((v_66 <= ((int)10)) ? ((int)10) : ((v_66 >= max_67) ? max_67 : v_66));
		t_sample g1 = tan(safediv((((t_sample)3.1415926535897931) * f1), samplerate));
		t_sample h1 = safediv(((int)1), (((int)1) + (g1 * (g1 + d))));
		t_sample g2 = tan(safediv((((t_sample)3.1415926535897931) * f2), samplerate));
		t_sample h2 = safediv(((int)1), (((int)1) + (g2 * (g2 + d))));
		t_sample g3 = tan(safediv((((t_sample)3.1415926535897931) * f3), samplerate));
		t_sample h3 = safediv(((int)1), (((int)1) + (g3 * (g3 + d))));
		t_sample g4 = tan(safediv((((t_sample)3.1415926535897931) * f4), samplerate));
		t_sample h4 = safediv(((int)1), (((int)1) + (g4 * (g4 + d))));
		t_sample g5 = tan(safediv((((t_sample)3.1415926535897931) * f5), samplerate));
		t_sample h5 = safediv(((int)1), (((int)1) + (g5 * (g5 + d))));
		t_sample g6 = tan(safediv((((t_sample)3.1415926535897931) * f6), samplerate));
		t_sample h6 = safediv(((int)1), (((int)1) + (g6 * (g6 + d))));
		t_sample g7 = tan(safediv((((t_sample)3.1415926535897931) * f7), samplerate));
		t_sample h7 = safediv(((int)1), (((int)1) + (g7 * (g7 + d))));
		t_sample g8 = tan(safediv((((t_sample)3.1415926535897931) * f8), samplerate));
		t_sample h8 = safediv(((int)1), (((int)1) + (g8 * (g8 + d))));
		int cond_68 = (m_gain_46 <= ((int)-40));
		t_sample iffalse_69 = dbtoa(m_gain_46);
		t_sample k1 = (cond_68 ? ((int)0) : iffalse_69);
		int cond_70 = (m_gain_45 <= ((int)-40));
		t_sample iffalse_71 = dbtoa(m_gain_45);
		t_sample k2 = (cond_70 ? ((int)0) : iffalse_71);
		int cond_72 = (m_gain_44 <= ((int)-40));
		t_sample iffalse_73 = dbtoa(m_gain_44);
		t_sample k3 = (cond_72 ? ((int)0) : iffalse_73);
		int cond_74 = (m_gain_43 <= ((int)-40));
		t_sample iffalse_75 = dbtoa(m_gain_43);
		t_sample k4 = (cond_74 ? ((int)0) : iffalse_75);
		int cond_76 = (m_gain_42 <= ((int)-40));
		t_sample iffalse_77 = dbtoa(m_gain_42);
		t_sample k5 = (cond_76 ? ((int)0) : iffalse_77);
		int cond_78 = (m_gain_41 <= ((int)-40));
		t_sample iffalse_79 = dbtoa(m_gain_41);
		t_sample k6 = (cond_78 ? ((int)0) : iffalse_79);
		int cond_80 = (m_gain_40 <= ((int)-40));
		t_sample iffalse_81 = dbtoa(m_gain_40);
		t_sample k7 = (cond_80 ? ((int)0) : iffalse_81);
		int cond_82 = (m_gain_39 <= ((int)-40));
		t_sample iffalse_83 = dbtoa(m_gain_39);
		t_sample k8 = (cond_82 ? ((int)0) : iffalse_83);
		t_sample v_84 = (m_stereo_spread_47 * ((t_sample)0.01));
		t_sample sp = (((v_84 <= ((int)0)) ? ((int)0) : ((v_84 >= ((int)1)) ? ((int)1) : v_84)) * ((t_sample)0.5));
		t_sample pan_odd_L = (((int)1) + sp);
		t_sample pan_odd_R = (((int)1) - sp);
		t_sample pan_evn_L = (((int)1) - sp);
		t_sample pan_evn_R = (((int)1) + sp);
		t_sample in_drive = (((int)1) + ((m_drive_49 * ((t_sample)0.01)) * ((int)2)));
		t_sample make_up = dbtoa(m_gain_38);
		t_sample v_85 = (m_mix_37 * ((t_sample)0.01));
		t_sample eff_mix = ((v_85 <= ((int)0)) ? ((int)0) : ((v_85 >= ((int)1)) ? ((int)1) : v_85));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample x_L = tanh((in1 * in_drive));
			t_sample x_R = tanh((in2 * in_drive));
			t_sample hp_L1 = (((x_L - ((g1 + d) * m_s1_L1_36)) - m_s2_L1_35) * h1);
			t_sample v1_L1 = (g1 * hp_L1);
			t_sample bp_L1 = (v1_L1 + m_s1_L1_36);
			m_s1_L1_36 = ((((int)2) * v1_L1) + m_s1_L1_36);
			t_sample v2_L1 = (g1 * bp_L1);
			m_s2_L1_35 = ((((int)2) * v2_L1) + m_s2_L1_35);
			t_sample sat_L1 = (tanh((((bp_L1 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_L2 = (((x_L - ((g2 + d) * m_s1_L2_32)) - m_s2_L2_31) * h2);
			t_sample v1_L2 = (g2 * hp_L2);
			t_sample bp_L2 = (v1_L2 + m_s1_L2_32);
			m_s1_L2_32 = ((((int)2) * v1_L2) + m_s1_L2_32);
			t_sample v2_L2 = (g2 * bp_L2);
			m_s2_L2_31 = ((((int)2) * v2_L2) + m_s2_L2_31);
			t_sample sat_L2 = (tanh((((bp_L2 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_L3 = (((x_L - ((g3 + d) * m_s1_L3_28)) - m_s2_L3_27) * h3);
			t_sample v1_L3 = (g3 * hp_L3);
			t_sample bp_L3 = (v1_L3 + m_s1_L3_28);
			m_s1_L3_28 = ((((int)2) * v1_L3) + m_s1_L3_28);
			t_sample v2_L3 = (g3 * bp_L3);
			m_s2_L3_27 = ((((int)2) * v2_L3) + m_s2_L3_27);
			t_sample sat_L3 = (tanh((((bp_L3 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_L4 = (((x_L - ((g4 + d) * m_s1_L4_24)) - m_s2_L4_23) * h4);
			t_sample v1_L4 = (g4 * hp_L4);
			t_sample bp_L4 = (v1_L4 + m_s1_L4_24);
			m_s1_L4_24 = ((((int)2) * v1_L4) + m_s1_L4_24);
			t_sample v2_L4 = (g4 * bp_L4);
			m_s2_L4_23 = ((((int)2) * v2_L4) + m_s2_L4_23);
			t_sample sat_L4 = (tanh((((bp_L4 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_L5 = (((x_L - ((g5 + d) * m_s1_L5_20)) - m_s2_L5_19) * h5);
			t_sample v1_L5 = (g5 * hp_L5);
			t_sample bp_L5 = (v1_L5 + m_s1_L5_20);
			m_s1_L5_20 = ((((int)2) * v1_L5) + m_s1_L5_20);
			t_sample v2_L5 = (g5 * bp_L5);
			m_s2_L5_19 = ((((int)2) * v2_L5) + m_s2_L5_19);
			t_sample sat_L5 = (tanh((((bp_L5 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_L6 = (((x_L - ((g6 + d) * m_s1_L6_16)) - m_s2_L6_15) * h6);
			t_sample v1_L6 = (g6 * hp_L6);
			t_sample bp_L6 = (v1_L6 + m_s1_L6_16);
			m_s1_L6_16 = ((((int)2) * v1_L6) + m_s1_L6_16);
			t_sample v2_L6 = (g6 * bp_L6);
			m_s2_L6_15 = ((((int)2) * v2_L6) + m_s2_L6_15);
			t_sample sat_L6 = (tanh((((bp_L6 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_L7 = (((x_L - ((g7 + d) * m_s1_L7_12)) - m_s2_L7_11) * h7);
			t_sample v1_L7 = (g7 * hp_L7);
			t_sample bp_L7 = (v1_L7 + m_s1_L7_12);
			m_s1_L7_12 = ((((int)2) * v1_L7) + m_s1_L7_12);
			t_sample v2_L7 = (g7 * bp_L7);
			m_s2_L7_11 = ((((int)2) * v2_L7) + m_s2_L7_11);
			t_sample sat_L7 = (tanh((((bp_L7 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_L8 = (((x_L - ((g8 + d) * m_s1_L8_8)) - m_s2_L8_7) * h8);
			t_sample v1_L8 = (g8 * hp_L8);
			t_sample bp_L8 = (v1_L8 + m_s1_L8_8);
			m_s1_L8_8 = ((((int)2) * v1_L8) + m_s1_L8_8);
			t_sample v2_L8 = (g8 * bp_L8);
			m_s2_L8_7 = ((((int)2) * v2_L8) + m_s2_L8_7);
			t_sample sat_L8 = (tanh((((bp_L8 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_R1 = (((x_R - ((g1 + d) * m_s1_R1_34)) - m_s2_R1_33) * h1);
			t_sample v1_R1 = (g1 * hp_R1);
			t_sample bp_R1 = (v1_R1 + m_s1_R1_34);
			m_s1_R1_34 = ((((int)2) * v1_R1) + m_s1_R1_34);
			t_sample v2_R1 = (g1 * bp_R1);
			m_s2_R1_33 = ((((int)2) * v2_R1) + m_s2_R1_33);
			t_sample sat_R1 = (tanh((((bp_R1 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_R2 = (((x_R - ((g2 + d) * m_s1_R2_30)) - m_s2_R2_29) * h2);
			t_sample v1_R2 = (g2 * hp_R2);
			t_sample bp_R2 = (v1_R2 + m_s1_R2_30);
			m_s1_R2_30 = ((((int)2) * v1_R2) + m_s1_R2_30);
			t_sample v2_R2 = (g2 * bp_R2);
			m_s2_R2_29 = ((((int)2) * v2_R2) + m_s2_R2_29);
			t_sample sat_R2 = (tanh((((bp_R2 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_R3 = (((x_R - ((g3 + d) * m_s1_R3_26)) - m_s2_R3_25) * h3);
			t_sample v1_R3 = (g3 * hp_R3);
			t_sample bp_R3 = (v1_R3 + m_s1_R3_26);
			m_s1_R3_26 = ((((int)2) * v1_R3) + m_s1_R3_26);
			t_sample v2_R3 = (g3 * bp_R3);
			m_s2_R3_25 = ((((int)2) * v2_R3) + m_s2_R3_25);
			t_sample sat_R3 = (tanh((((bp_R3 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_R4 = (((x_R - ((g4 + d) * m_s1_R4_22)) - m_s2_R4_21) * h4);
			t_sample v1_R4 = (g4 * hp_R4);
			t_sample bp_R4 = (v1_R4 + m_s1_R4_22);
			m_s1_R4_22 = ((((int)2) * v1_R4) + m_s1_R4_22);
			t_sample v2_R4 = (g4 * bp_R4);
			m_s2_R4_21 = ((((int)2) * v2_R4) + m_s2_R4_21);
			t_sample sat_R4 = (tanh((((bp_R4 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_R5 = (((x_R - ((g5 + d) * m_s1_R5_18)) - m_s2_R5_17) * h5);
			t_sample v1_R5 = (g5 * hp_R5);
			t_sample bp_R5 = (v1_R5 + m_s1_R5_18);
			m_s1_R5_18 = ((((int)2) * v1_R5) + m_s1_R5_18);
			t_sample v2_R5 = (g5 * bp_R5);
			m_s2_R5_17 = ((((int)2) * v2_R5) + m_s2_R5_17);
			t_sample sat_R5 = (tanh((((bp_R5 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_R6 = (((x_R - ((g6 + d) * m_s1_R6_14)) - m_s2_R6_13) * h6);
			t_sample v1_R6 = (g6 * hp_R6);
			t_sample bp_R6 = (v1_R6 + m_s1_R6_14);
			m_s1_R6_14 = ((((int)2) * v1_R6) + m_s1_R6_14);
			t_sample v2_R6 = (g6 * bp_R6);
			m_s2_R6_13 = ((((int)2) * v2_R6) + m_s2_R6_13);
			t_sample sat_R6 = (tanh((((bp_R6 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_R7 = (((x_R - ((g7 + d) * m_s1_R7_10)) - m_s2_R7_9) * h7);
			t_sample v1_R7 = (g7 * hp_R7);
			t_sample bp_R7 = (v1_R7 + m_s1_R7_10);
			m_s1_R7_10 = ((((int)2) * v1_R7) + m_s1_R7_10);
			t_sample v2_R7 = (g7 * bp_R7);
			m_s2_R7_9 = ((((int)2) * v2_R7) + m_s2_R7_9);
			t_sample sat_R7 = (tanh((((bp_R7 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample hp_R8 = (((x_R - ((g8 + d) * m_s1_R8_6)) - m_s2_R8_5) * h8);
			t_sample v1_R8 = (g8 * hp_R8);
			t_sample bp_R8 = (v1_R8 + m_s1_R8_6);
			m_s1_R8_6 = ((((int)2) * v1_R8) + m_s1_R8_6);
			t_sample v2_R8 = (g8 * bp_R8);
			m_s2_R8_5 = ((((int)2) * v2_R8) + m_s2_R8_5);
			t_sample sat_R8 = (tanh((((bp_R8 * d) * res_boost) * clip_drive)) * clip_norm);
			t_sample b1_L = ((sat_L1 * k1) * pan_odd_L);
			t_sample b1_R = ((sat_R1 * k1) * pan_odd_R);
			t_sample b2_L = ((sat_L2 * k2) * pan_evn_L);
			t_sample b2_R = ((sat_R2 * k2) * pan_evn_R);
			t_sample b3_L = ((sat_L3 * k3) * pan_odd_L);
			t_sample b3_R = ((sat_R3 * k3) * pan_odd_R);
			t_sample b4_L = ((sat_L4 * k4) * pan_evn_L);
			t_sample b4_R = ((sat_R4 * k4) * pan_evn_R);
			t_sample b5_L = ((sat_L5 * k5) * pan_odd_L);
			t_sample b5_R = ((sat_R5 * k5) * pan_odd_R);
			t_sample b6_L = ((sat_L6 * k6) * pan_evn_L);
			t_sample b6_R = ((sat_R6 * k6) * pan_evn_R);
			t_sample b7_L = ((sat_L7 * k7) * pan_odd_L);
			t_sample b7_R = ((sat_R7 * k7) * pan_odd_R);
			t_sample b8_L = ((sat_L8 * k8) * pan_evn_L);
			t_sample b8_R = ((sat_R8 * k8) * pan_evn_R);
			t_sample low_sub_L = (((b1_L + b2_L) + b3_L) + b4_L);
			t_sample low_sub_R = (((b1_R + b2_R) + b3_R) + b4_R);
			t_sample high_sub_L = (((b5_L + b6_L) + b7_L) + b8_L);
			t_sample high_sub_R = (((b5_R + b6_R) + b7_R) + b8_R);
			t_sample sum_raw_L = (low_sub_L + high_sub_L);
			t_sample sum_raw_R = (low_sub_R + high_sub_R);
			t_sample dc_L = ((sum_raw_L - m_h_dc_x_L_4) + (((t_sample)0.995) * m_h_dc_y_L_3));
			m_h_dc_x_L_4 = sum_raw_L;
			m_h_dc_y_L_3 = dc_L;
			t_sample dc_R = ((sum_raw_R - m_h_dc_x_R_2) + (((t_sample)0.995) * m_h_dc_y_R_1));
			m_h_dc_x_R_2 = sum_raw_R;
			m_h_dc_y_R_1 = dc_R;
			t_sample lim_L = ((tanh((dc_L * ((t_sample)0.40000000000000002))) * ((t_sample)2.5)) * make_up);
			t_sample lim_R = ((tanh((dc_R * ((t_sample)0.40000000000000002))) * ((t_sample)2.5)) * make_up);
			t_sample tmp_mix_775 = (in1 + (eff_mix * (lim_L - in1)));
			t_sample tmp_expr_267 = tmp_mix_775;
			t_sample tmp_mix_776 = (in2 + (eff_mix * (lim_R - in2)));
			t_sample tmp_expr_268 = tmp_mix_776;
			t_sample tmp_expr_269 = ((low_sub_L + low_sub_R) * ((t_sample)0.5));
			t_sample tmp_expr_270 = ((high_sub_L + high_sub_R) * ((t_sample)0.5));
			t_sample out1 = tmp_expr_267;
			t_sample out2 = tmp_expr_268;
			t_sample out3 = tmp_expr_269;
			t_sample out4 = tmp_expr_270;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			(*(__out4++)) = out4;
			
		};
		return __exception;
		
	};
	inline void set_mix(t_param _value) {
		m_mix_37 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_gain(t_param _value) {
		m_gain_38 = (_value < -24 ? -24 : (_value > 12 ? 12 : _value));
	};
	inline void set_gain_8(t_param _value) {
		m_gain_39 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_gain_7(t_param _value) {
		m_gain_40 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_gain_6(t_param _value) {
		m_gain_41 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_gain_5(t_param _value) {
		m_gain_42 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_gain_4(t_param _value) {
		m_gain_43 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_gain_3(t_param _value) {
		m_gain_44 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_gain_2(t_param _value) {
		m_gain_45 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_gain_1(t_param _value) {
		m_gain_46 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_stereo_spread(t_param _value) {
		m_stereo_spread_47 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_soft_clip(t_param _value) {
		m_soft_clip_48 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_drive(t_param _value) {
		m_drive_49 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_q_global(t_param _value) {
		m_q_global_50 = (_value < 0.5 ? 0.5 : (_value > 50 ? 50 : _value));
	};
	inline void set_freq_shift(t_param _value) {
		m_freq_shift_51 = (_value < -24 ? -24 : (_value > 24 ? 24 : _value));
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 2;
int gen_kernel_numouts = 4;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 15; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio Left In", "Audio Right In" };
const char *gen_kernel_outnames[] = { "Processed Left Out", "Processed Right Out", "Low Sub Sum", "High Sub Sum" };

/// Invoke the signal process of a State object

int perform(CommonState *cself, t_sample **ins, long numins, t_sample **outs, long numouts, long n) {
	State* self = (State *)cself;
	return self->perform(ins, outs, n);
}

/// Reset all parameters and stateful operators of a State object

void reset(CommonState *cself) {
	State* self = (State *)cself;
	self->reset(cself->sr, cself->vs);
}

/// Set a parameter of a State object

void setparameter(CommonState *cself, long index, t_param value, void *ref) {
	State *self = (State *)cself;
	switch (index) {
		case 0: self->set_drive(value); break;
		case 1: self->set_freq_shift(value); break;
		case 2: self->set_gain(value); break;
		case 3: self->set_gain_1(value); break;
		case 4: self->set_gain_2(value); break;
		case 5: self->set_gain_3(value); break;
		case 6: self->set_gain_4(value); break;
		case 7: self->set_gain_5(value); break;
		case 8: self->set_gain_6(value); break;
		case 9: self->set_gain_7(value); break;
		case 10: self->set_gain_8(value); break;
		case 11: self->set_mix(value); break;
		case 12: self->set_q_global(value); break;
		case 13: self->set_soft_clip(value); break;
		case 14: self->set_stereo_spread(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_drive_49; break;
		case 1: *value = self->m_freq_shift_51; break;
		case 2: *value = self->m_gain_38; break;
		case 3: *value = self->m_gain_46; break;
		case 4: *value = self->m_gain_45; break;
		case 5: *value = self->m_gain_44; break;
		case 6: *value = self->m_gain_43; break;
		case 7: *value = self->m_gain_42; break;
		case 8: *value = self->m_gain_41; break;
		case 9: *value = self->m_gain_40; break;
		case 10: *value = self->m_gain_39; break;
		case 11: *value = self->m_mix_37; break;
		case 12: *value = self->m_q_global_50; break;
		case 13: *value = self->m_soft_clip_48; break;
		case 14: *value = self->m_stereo_spread_47; break;
		
		default: break;
	}
}

/// Get the name of a parameter of a State object

const char *getparametername(CommonState *cself, long index) {
	if (index >= 0 && index < cself->numparams) {
		return cself->params[index].name;
	}
	return 0;
}

/// Get the minimum value of a parameter of a State object

t_param getparametermin(CommonState *cself, long index) {
	if (index >= 0 && index < cself->numparams) {
		return cself->params[index].outputmin;
	}
	return 0;
}

/// Get the maximum value of a parameter of a State object

t_param getparametermax(CommonState *cself, long index) {
	if (index >= 0 && index < cself->numparams) {
		return cself->params[index].outputmax;
	}
	return 0;
}

/// Get parameter of a State object has a minimum and maximum value

char getparameterhasminmax(CommonState *cself, long index) {
	if (index >= 0 && index < cself->numparams) {
		return cself->params[index].hasminmax;
	}
	return 0;
}

/// Get the units of a parameter of a State object

const char *getparameterunits(CommonState *cself, long index) {
	if (index >= 0 && index < cself->numparams) {
		return cself->params[index].units;
	}
	return 0;
}

/// Get the size of the state of all parameters of a State object

size_t getstatesize(CommonState *cself) {
	return genlib_getstatesize(cself, &getparameter);
}

/// Get the state of all parameters of a State object

short getstate(CommonState *cself, char *state) {
	return genlib_getstate(cself, state, &getparameter);
}

/// set the state of all parameters of a State object

short setstate(CommonState *cself, const char *state) {
	return genlib_setstate(cself, state, &setparameter);
}

/// Allocate and configure a new State object and it's internal CommonState:

void *create(t_param sr, long vs) {
	State *self = new State;
	self->reset(sr, vs);
	ParamInfo *pi;
	self->__commonstate.inputnames = gen_kernel_innames;
	self->__commonstate.outputnames = gen_kernel_outnames;
	self->__commonstate.numins = gen_kernel_numins;
	self->__commonstate.numouts = gen_kernel_numouts;
	self->__commonstate.sr = sr;
	self->__commonstate.vs = vs;
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(15 * sizeof(ParamInfo));
	self->__commonstate.numparams = 15;
	// initialize parameter 0 ("m_drive_49")
	pi = self->__commonstate.params + 0;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_49;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_freq_shift_51")
	pi = self->__commonstate.params + 1;
	pi->name = "freq_shift";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_shift_51;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -24;
	pi->outputmax = 24;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_gain_38")
	pi = self->__commonstate.params + 2;
	pi->name = "gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_38;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -24;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_gain_46")
	pi = self->__commonstate.params + 3;
	pi->name = "gain_1";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_46;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_gain_45")
	pi = self->__commonstate.params + 4;
	pi->name = "gain_2";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_45;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_gain_44")
	pi = self->__commonstate.params + 5;
	pi->name = "gain_3";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_44;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_gain_43")
	pi = self->__commonstate.params + 6;
	pi->name = "gain_4";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_43;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_gain_42")
	pi = self->__commonstate.params + 7;
	pi->name = "gain_5";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_42;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_gain_41")
	pi = self->__commonstate.params + 8;
	pi->name = "gain_6";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_41;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_gain_40")
	pi = self->__commonstate.params + 9;
	pi->name = "gain_7";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_40;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_gain_39")
	pi = self->__commonstate.params + 10;
	pi->name = "gain_8";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_39;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 11 ("m_mix_37")
	pi = self->__commonstate.params + 11;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_37;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 12 ("m_q_global_50")
	pi = self->__commonstate.params + 12;
	pi->name = "q_global";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_q_global_50;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.5;
	pi->outputmax = 50;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 13 ("m_soft_clip_48")
	pi = self->__commonstate.params + 13;
	pi->name = "soft_clip";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_soft_clip_48;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 14 ("m_stereo_spread_47")
	pi = self->__commonstate.params + 14;
	pi->name = "stereo_spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_stereo_spread_47;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	
	return self;
}

/// Release all resources and memory used by a State object:

void destroy(CommonState *cself) {
	State *self = (State *)cself;
	genlib_sysmem_freeptr(cself->params);
		
	delete self;
}


} // filterbank_8::
