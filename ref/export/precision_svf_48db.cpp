#include "precision_svf_48db.h"

namespace precision_svf_48db {

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
	DCBlock __m_dcblock_94;
	DCBlock __m_dcblock_93;
	int __loopcount;
	int __exception;
	int vectorsize;
	t_sample m_agc_2;
	t_sample m_lpR3_v2_33;
	t_sample m_lpR3_v1_34;
	t_sample m_lpR4_v1_32;
	t_sample m_lpR4_v2_31;
	t_sample m_hpL1_v1_30;
	t_sample m_hpL1_v2_29;
	t_sample m_lpR2_v2_35;
	t_sample m_hpL2_v2_27;
	t_sample m_hpL2_v1_28;
	t_sample m_lpR2_v1_36;
	t_sample m_lpR1_v2_37;
	t_sample m_lpR1_v1_38;
	t_sample m_lpL2_v1_44;
	t_sample m_lpL1_v2_45;
	t_sample m_lpL1_v1_46;
	t_sample m_hpL3_v1_26;
	t_sample m_lpL2_v2_43;
	t_sample m_lpL3_v2_41;
	t_sample m_lpL3_v1_42;
	t_sample m_lpL4_v2_39;
	t_sample m_lpL4_v1_40;
	t_sample m_smooth_1;
	t_sample m_hpL3_v2_25;
	t_sample samplerate;
	t_sample m_frequency_8;
	t_sample m_s_width_9;
	t_sample m_s_drive_10;
	t_sample m_s_gain_11;
	t_sample m_mode_7;
	t_sample m_gain_5;
	t_sample m_mix_6;
	t_sample m_width_3;
	t_sample m_drive_4;
	t_sample m_hpL4_v1_24;
	t_sample m_s_mix_12;
	t_sample m_s_log_f_14;
	t_sample m_hpR2_v1_20;
	t_sample m_hpR1_v2_21;
	t_sample m_hpR1_v1_22;
	t_sample m_s_mode_13;
	t_sample m_hpR2_v2_19;
	t_sample m_hpR3_v2_17;
	t_sample m_hpR3_v1_18;
	t_sample m_hpR4_v2_15;
	t_sample m_hpR4_v1_16;
	t_sample m_hpL4_v2_23;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_smooth_1 = ((int)50);
		m_agc_2 = ((t_sample)0.5);
		m_width_3 = ((int)0);
		m_drive_4 = ((int)0);
		m_gain_5 = ((int)0);
		m_mix_6 = ((int)1);
		m_mode_7 = ((int)1);
		m_frequency_8 = ((int)1000);
		m_s_width_9 = ((int)0);
		m_s_drive_10 = ((int)0);
		m_s_gain_11 = ((int)0);
		m_s_mix_12 = ((int)1);
		m_s_mode_13 = ((int)1);
		m_s_log_f_14 = ((t_sample)6.9077549999999999);
		m_hpR4_v2_15 = ((int)0);
		m_hpR4_v1_16 = ((int)0);
		m_hpR3_v2_17 = ((int)0);
		m_hpR3_v1_18 = ((int)0);
		m_hpR2_v2_19 = ((int)0);
		m_hpR2_v1_20 = ((int)0);
		m_hpR1_v2_21 = ((int)0);
		m_hpR1_v1_22 = ((int)0);
		m_hpL4_v2_23 = ((int)0);
		m_hpL4_v1_24 = ((int)0);
		m_hpL3_v2_25 = ((int)0);
		m_hpL3_v1_26 = ((int)0);
		m_hpL2_v2_27 = ((int)0);
		m_hpL2_v1_28 = ((int)0);
		m_hpL1_v2_29 = ((int)0);
		m_hpL1_v1_30 = ((int)0);
		m_lpR4_v2_31 = ((int)0);
		m_lpR4_v1_32 = ((int)0);
		m_lpR3_v2_33 = ((int)0);
		m_lpR3_v1_34 = ((int)0);
		m_lpR2_v2_35 = ((int)0);
		m_lpR2_v1_36 = ((int)0);
		m_lpR1_v2_37 = ((int)0);
		m_lpR1_v1_38 = ((int)0);
		m_lpL4_v2_39 = ((int)0);
		m_lpL4_v1_40 = ((int)0);
		m_lpL3_v2_41 = ((int)0);
		m_lpL3_v1_42 = ((int)0);
		m_lpL2_v2_43 = ((int)0);
		m_lpL2_v1_44 = ((int)0);
		m_lpL1_v2_45 = ((int)0);
		m_lpL1_v1_46 = ((int)0);
		__m_dcblock_93.reset();
		__m_dcblock_94.reset();
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		t_sample * __out1 = __outs[0];
		t_sample * __out2 = __outs[1];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__out1 == 0) || (__out2 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		t_sample ms = ((((t_sample)0.10000000000000001) < m_smooth_1) ? m_smooth_1 : ((t_sample)0.10000000000000001));
		t_sample alpha = (((int)1) - exp(safediv(((int)-1), ((ms * ((t_sample)0.001)) * samplerate))));
		t_sample target_log_f = log(((m_frequency_8 <= ((int)20)) ? ((int)20) : ((m_frequency_8 >= ((int)20000)) ? ((int)20000) : m_frequency_8)));
		t_sample max_48 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample max_50 = (samplerate * ((t_sample)0.45000000000000001));
		__loopcount = (__n * GENLIB_LOOPCOUNT_BAIL);
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			m_s_log_f_14 = (m_s_log_f_14 + (alpha * (target_log_f - m_s_log_f_14)));
			t_sample current_freq = exp(m_s_log_f_14);
			m_s_mode_13 = (m_s_mode_13 + (alpha * (((m_mode_7 <= ((int)0)) ? ((int)0) : ((m_mode_7 >= ((int)1)) ? ((int)1) : m_mode_7)) - m_s_mode_13)));
			m_s_mix_12 = (m_s_mix_12 + (alpha * (((m_mix_6 <= ((int)0)) ? ((int)0) : ((m_mix_6 >= ((int)1)) ? ((int)1) : m_mix_6)) - m_s_mix_12)));
			m_s_gain_11 = (m_s_gain_11 + (alpha * (((m_gain_5 <= ((int)0)) ? ((int)0) : ((m_gain_5 >= ((int)24)) ? ((int)24) : m_gain_5)) - m_s_gain_11)));
			m_s_drive_10 = (m_s_drive_10 + (alpha * (((m_drive_4 <= ((int)0)) ? ((int)0) : ((m_drive_4 >= ((int)24)) ? ((int)24) : m_drive_4)) - m_s_drive_10)));
			m_s_width_9 = (m_s_width_9 + (alpha * (((m_width_3 <= ((int)0)) ? ((int)0) : ((m_width_3 >= ((int)1)) ? ((int)1) : m_width_3)) - m_s_width_9)));
			t_sample w_off = (m_s_width_9 * ((t_sample)0.12));
			t_sample v_47 = (current_freq * (((int)1) - w_off));
			t_sample fL = ((v_47 <= ((int)20)) ? ((int)20) : ((v_47 >= max_48) ? max_48 : v_47));
			t_sample v_49 = (current_freq * (((int)1) + w_off));
			t_sample fR = ((v_49 <= ((int)20)) ? ((int)20) : ((v_49 >= max_50) ? max_50 : v_49));
			t_sample gL = tan(safediv((((t_sample)3.1415926535897931) * fL), samplerate));
			t_sample gR = tan(safediv((((t_sample)3.1415926535897931) * fR), samplerate));
			t_sample hL = safediv(((int)1), ((((int)1) + (((t_sample)1.4142135600000001) * gL)) + (gL * gL)));
			t_sample hR = safediv(((int)1), ((((int)1) + (((t_sample)1.4142135600000001) * gR)) + (gR * gR)));
			t_sample dryL = in1;
			t_sample dryR = in2;
			t_sample wet_in_amp = safepow(((int)10), (m_s_gain_11 * ((t_sample)0.050000000000000003)));
			t_sample wL = tanh((in1 * wet_in_amp));
			t_sample wR = tanh((in2 * wet_in_amp));
			t_sample tLP_L = wL;
			t_sample tHP_L = wL;
			t_sample tLP_R = wR;
			t_sample tHP_R = wR;
			// for loop initializer;
			int i = ((int)0);
			// for loop condition;
			// abort processing if an infinite loop is suspected;
			if (((__loopcount--) <= 0)) {
				__exception = GENLIB_ERR_LOOP_OVERFLOW;
				break ;
				
			};
			while ((i < ((int)4))) {
				// abort processing if an infinite loop is suspected;
				if (((__loopcount--) <= 0)) {
					__exception = GENLIB_ERR_LOOP_OVERFLOW;
					break ;
					
				};
				int cond_51 = (i == ((int)0));
				int cond_52 = (i == ((int)1));
				int cond_53 = (i == ((int)2));
				t_sample iffalse_54 = (cond_53 ? m_lpL3_v1_42 : m_lpL4_v1_40);
				t_sample iffalse_55 = (cond_52 ? m_lpL2_v1_44 : iffalse_54);
				t_sample v1_L = (cond_51 ? m_lpL1_v1_46 : iffalse_55);
				int cond_56 = (i == ((int)0));
				int cond_57 = (i == ((int)1));
				int cond_58 = (i == ((int)2));
				t_sample iffalse_59 = (cond_58 ? m_lpL3_v2_41 : m_lpL4_v2_39);
				t_sample iffalse_60 = (cond_57 ? m_lpL2_v2_43 : iffalse_59);
				t_sample v2_L = (cond_56 ? m_lpL1_v2_45 : iffalse_60);
				t_sample hp_f = ((((tLP_L - (((t_sample)1.4142135600000001) * v1_L)) - (gL * v1_L)) - v2_L) * hL);
				t_sample v1_n = ((gL * hp_f) + v1_L);
				t_sample lp_f = ((gL * v1_n) + v2_L);
				t_sample tmp_v1_L_451 = (v1_n + (gL * hp_f));
				t_sample tmp_v2_L_452 = (lp_f + (gL * v1_n));
				tLP_L = lp_f;
				if ((i == ((int)0))) {
					m_lpL1_v1_46 = tmp_v1_L_451;
					m_lpL1_v2_45 = tmp_v2_L_452;
					
				} else {
					if ((i == ((int)1))) {
						m_lpL2_v1_44 = tmp_v1_L_451;
						m_lpL2_v2_43 = tmp_v2_L_452;
						
					} else {
						if ((i == ((int)2))) {
							m_lpL3_v1_42 = tmp_v1_L_451;
							m_lpL3_v2_41 = tmp_v2_L_452;
							
						} else {
							m_lpL4_v1_40 = tmp_v1_L_451;
							m_lpL4_v2_39 = tmp_v2_L_452;
							
						};
						
					};
					
				};
				int cond_61 = (i == ((int)0));
				int cond_62 = (i == ((int)1));
				int cond_63 = (i == ((int)2));
				t_sample iffalse_64 = (cond_63 ? m_hpL3_v1_26 : m_hpL4_v1_24);
				t_sample iffalse_65 = (cond_62 ? m_hpL2_v1_28 : iffalse_64);
				t_sample v1_H = (cond_61 ? m_hpL1_v1_30 : iffalse_65);
				int cond_66 = (i == ((int)0));
				int cond_67 = (i == ((int)1));
				int cond_68 = (i == ((int)2));
				t_sample iffalse_69 = (cond_68 ? m_hpL3_v2_25 : m_hpL4_v2_23);
				t_sample iffalse_70 = (cond_67 ? m_hpL2_v2_27 : iffalse_69);
				t_sample v2_H = (cond_66 ? m_hpL1_v2_29 : iffalse_70);
				t_sample hp_h = ((((tHP_L - (((t_sample)1.4142135600000001) * v1_H)) - (gL * v1_H)) - v2_H) * hL);
				t_sample v1H_n = ((gL * hp_h) + v1_H);
				t_sample lp_h = ((gL * v1H_n) + v2_H);
				t_sample tmp_v1_H_453 = (v1H_n + (gL * hp_h));
				t_sample tmp_v2_H_454 = (lp_h + (gL * v1H_n));
				tHP_L = hp_h;
				if ((i == ((int)0))) {
					m_hpL1_v1_30 = tmp_v1_H_453;
					m_hpL1_v2_29 = tmp_v2_H_454;
					
				} else {
					if ((i == ((int)1))) {
						m_hpL2_v1_28 = tmp_v1_H_453;
						m_hpL2_v2_27 = tmp_v2_H_454;
						
					} else {
						if ((i == ((int)2))) {
							m_hpL3_v1_26 = tmp_v1_H_453;
							m_hpL3_v2_25 = tmp_v2_H_454;
							
						} else {
							m_hpL4_v1_24 = tmp_v1_H_453;
							m_hpL4_v2_23 = tmp_v2_H_454;
							
						};
						
					};
					
				};
				int cond_71 = (i == ((int)0));
				int cond_72 = (i == ((int)1));
				int cond_73 = (i == ((int)2));
				t_sample iffalse_74 = (cond_73 ? m_lpR3_v1_34 : m_lpR4_v1_32);
				t_sample iffalse_75 = (cond_72 ? m_lpR2_v1_36 : iffalse_74);
				t_sample v1_LR = (cond_71 ? m_lpR1_v1_38 : iffalse_75);
				int cond_76 = (i == ((int)0));
				int cond_77 = (i == ((int)1));
				int cond_78 = (i == ((int)2));
				t_sample iffalse_79 = (cond_78 ? m_lpR3_v2_33 : m_lpR4_v2_31);
				t_sample iffalse_80 = (cond_77 ? m_lpR2_v2_35 : iffalse_79);
				t_sample v2_LR = (cond_76 ? m_lpR1_v2_37 : iffalse_80);
				t_sample hp_fR = ((((tLP_R - (((t_sample)1.4142135600000001) * v1_LR)) - (gR * v1_LR)) - v2_LR) * hR);
				t_sample v1_nR = ((gR * hp_fR) + v1_LR);
				t_sample lp_fR = ((gR * v1_nR) + v2_LR);
				t_sample tmp_v1_LR_455 = (v1_nR + (gR * hp_fR));
				t_sample tmp_v2_LR_456 = (lp_fR + (gR * v1_nR));
				tLP_R = lp_fR;
				if ((i == ((int)0))) {
					m_lpR1_v1_38 = tmp_v1_LR_455;
					m_lpR1_v2_37 = tmp_v2_LR_456;
					
				} else {
					if ((i == ((int)1))) {
						m_lpR2_v1_36 = tmp_v1_LR_455;
						m_lpR2_v2_35 = tmp_v2_LR_456;
						
					} else {
						if ((i == ((int)2))) {
							m_lpR3_v1_34 = tmp_v1_LR_455;
							m_lpR3_v2_33 = tmp_v2_LR_456;
							
						} else {
							m_lpR4_v1_32 = tmp_v1_LR_455;
							m_lpR4_v2_31 = tmp_v2_LR_456;
							
						};
						
					};
					
				};
				int cond_81 = (i == ((int)0));
				int cond_82 = (i == ((int)1));
				int cond_83 = (i == ((int)2));
				t_sample iffalse_84 = (cond_83 ? m_hpR3_v1_18 : m_hpR4_v1_16);
				t_sample iffalse_85 = (cond_82 ? m_hpR2_v1_20 : iffalse_84);
				t_sample v1_HR = (cond_81 ? m_hpR1_v1_22 : iffalse_85);
				int cond_86 = (i == ((int)0));
				int cond_87 = (i == ((int)1));
				int cond_88 = (i == ((int)2));
				t_sample iffalse_89 = (cond_88 ? m_hpR3_v2_17 : m_hpR4_v2_15);
				t_sample iffalse_90 = (cond_87 ? m_hpR2_v2_19 : iffalse_89);
				t_sample v2_HR = (cond_86 ? m_hpR1_v2_21 : iffalse_90);
				t_sample hp_hR = ((((tHP_R - (((t_sample)1.4142135600000001) * v1_HR)) - (gR * v1_HR)) - v2_HR) * hR);
				t_sample v1H_nR = ((gR * hp_hR) + v1_HR);
				t_sample lp_hR = ((gR * v1H_nR) + v2_HR);
				t_sample tmp_v1_HR_457 = (v1H_nR + (gR * hp_hR));
				t_sample tmp_v2_HR_458 = (lp_hR + (gR * v1H_nR));
				tHP_R = hp_hR;
				if ((i == ((int)0))) {
					m_hpR1_v1_22 = tmp_v1_HR_457;
					m_hpR1_v2_21 = tmp_v2_HR_458;
					
				} else {
					if ((i == ((int)1))) {
						m_hpR2_v1_20 = tmp_v1_HR_457;
						m_hpR2_v2_19 = tmp_v2_HR_458;
						
					} else {
						if ((i == ((int)2))) {
							m_hpR3_v1_18 = tmp_v1_HR_457;
							m_hpR3_v2_17 = tmp_v2_HR_458;
							
						} else {
							m_hpR4_v1_16 = tmp_v1_HR_457;
							m_hpR4_v2_15 = tmp_v2_HR_458;
							
						};
						
					};
					
				};
				// for loop increment;
				i = (i + ((int)1));
				
			};
			t_sample angle_m = (m_s_mode_13 * ((t_sample)1.57079632679));
			t_sample wet_fL = ((tHP_L * cos(angle_m)) + (tLP_L * sin(angle_m)));
			t_sample wet_fR = ((tHP_R * cos(angle_m)) + (tLP_R * sin(angle_m)));
			t_sample log_f_diff = log2((current_freq * ((t_sample)0.001)));
			t_sample tmp_abs_711 = fabs(((log_f_diff < ((int)0)) ? log_f_diff : ((int)0)));
			t_sample tmp_abs_712 = fabs(((((int)0) < log_f_diff) ? log_f_diff : ((int)0)));
			t_sample tmp_mix_710 = (tmp_abs_711 + (m_s_mode_13 * (tmp_abs_712 - tmp_abs_711)));
			t_sample gain_agc = (((int)1) + ((m_agc_2 * tmp_mix_710) * ((t_sample)0.25)));
			t_sample tmp_wet_fL_459 = (wet_fL * gain_agc);
			t_sample tmp_wet_fR_460 = (wet_fR * gain_agc);
			t_sample wet_out_amp = safepow(((int)10), (m_s_drive_10 * ((t_sample)0.050000000000000003)));
			t_sample xL = (tmp_wet_fL_459 * wet_out_amp);
			t_sample xR = (tmp_wet_fR_460 * wet_out_amp);
			t_sample distL = tanh((xL + (((t_sample)0.059999999999999998) * tanh((xL * ((t_sample)0.5))))));
			t_sample distR = tanh((xR + (((t_sample)0.059999999999999998) * tanh((xR * ((t_sample)0.5))))));
			t_sample v_91 = (distL * ((t_sample)1.25));
			t_sample wet_finalL = ((v_91 <= ((t_sample)-0.96999999999999997)) ? ((t_sample)-0.96999999999999997) : ((v_91 >= ((t_sample)0.96999999999999997)) ? ((t_sample)0.96999999999999997) : v_91));
			t_sample v_92 = (distR * ((t_sample)1.25));
			t_sample wet_finalR = ((v_92 <= ((t_sample)-0.96999999999999997)) ? ((t_sample)-0.96999999999999997) : ((v_92 >= ((t_sample)0.96999999999999997)) ? ((t_sample)0.96999999999999997) : v_92));
			t_sample angle_x = (m_s_mix_12 * ((t_sample)1.57079632679));
			t_sample outL = ((dryL * cos(angle_x)) + (wet_finalL * sin(angle_x)));
			t_sample outR = ((dryR * cos(angle_x)) + (wet_finalR * sin(angle_x)));
			t_sample tmp_expr_461 = __m_dcblock_93(outL);
			t_sample tmp_expr_462 = __m_dcblock_94(outR);
			t_sample out2 = tmp_expr_462;
			t_sample out1 = tmp_expr_461;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_smooth(t_param _value) {
		m_smooth_1 = (_value < 0 ? 0 : (_value > 1000 ? 1000 : _value));
	};
	inline void set_agc(t_param _value) {
		m_agc_2 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_width(t_param _value) {
		m_width_3 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_drive(t_param _value) {
		m_drive_4 = (_value < 0 ? 0 : (_value > 24 ? 24 : _value));
	};
	inline void set_gain(t_param _value) {
		m_gain_5 = (_value < 0 ? 0 : (_value > 24 ? 24 : _value));
	};
	inline void set_mix(t_param _value) {
		m_mix_6 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_mode(t_param _value) {
		m_mode_7 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_frequency(t_param _value) {
		m_frequency_8 = (_value < 20 ? 20 : (_value > 20000 ? 20000 : _value));
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 2;
int gen_kernel_numouts = 2;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 8; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "in1", "in2" };
const char *gen_kernel_outnames[] = { "out1", "out2" };

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
		case 0: self->set_agc(value); break;
		case 1: self->set_drive(value); break;
		case 2: self->set_frequency(value); break;
		case 3: self->set_gain(value); break;
		case 4: self->set_mix(value); break;
		case 5: self->set_mode(value); break;
		case 6: self->set_smooth(value); break;
		case 7: self->set_width(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_agc_2; break;
		case 1: *value = self->m_drive_4; break;
		case 2: *value = self->m_frequency_8; break;
		case 3: *value = self->m_gain_5; break;
		case 4: *value = self->m_mix_6; break;
		case 5: *value = self->m_mode_7; break;
		case 6: *value = self->m_smooth_1; break;
		case 7: *value = self->m_width_3; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(8 * sizeof(ParamInfo));
	self->__commonstate.numparams = 8;
	// initialize parameter 0 ("m_agc_2")
	pi = self->__commonstate.params + 0;
	pi->name = "agc";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_agc_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_drive_4")
	pi = self->__commonstate.params + 1;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 24;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_frequency_8")
	pi = self->__commonstate.params + 2;
	pi->name = "frequency";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_frequency_8;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 20000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_gain_5")
	pi = self->__commonstate.params + 3;
	pi->name = "gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 24;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_mix_6")
	pi = self->__commonstate.params + 4;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_mode_7")
	pi = self->__commonstate.params + 5;
	pi->name = "mode";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mode_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_smooth_1")
	pi = self->__commonstate.params + 6;
	pi->name = "smooth";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_smooth_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_width_3")
	pi = self->__commonstate.params + 7;
	pi->name = "width";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_width_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
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


} // precision_svf_48db::
