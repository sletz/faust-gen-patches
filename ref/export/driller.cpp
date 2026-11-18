#include "driller.h"

namespace driller {

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
	Delay m_rec_R_27;
	Delay m_rec_L_28;
	int __exception;
	int vectorsize;
	t_sample m_roll_filter_33;
	t_sample m_stereo_spread_35;
	t_sample m_pan_spread_34;
	t_sample m_degrade_32;
	t_sample m_mode_30;
	t_sample m_feedback_36;
	t_sample m_degrade_prob_31;
	t_sample m_h_target_tap_26;
	t_sample m_mix_29;
	t_sample m_h_beat_ph_25;
	t_sample m_mute_prob_37;
	t_sample m_vol6_39;
	t_sample m_div5_46;
	t_sample m_div6_45;
	t_sample m_div4_47;
	t_sample m_div3_48;
	t_sample m_probability_38;
	t_sample m_vol1_44;
	t_sample m_vol3_42;
	t_sample m_vol2_43;
	t_sample m_vol5_40;
	t_sample m_vol4_41;
	t_sample m_div2_49;
	t_sample m_h_prev_mode_24;
	t_sample m_h_sub_count_22;
	t_sample m_h_hp_yR_6;
	t_sample m_h_deg_amt_5;
	t_sample m_h_hp_xR_7;
	t_sample m_h_hp_yL_8;
	t_sample m_h_hp_xL_9;
	t_sample m_h_is_degraded_4;
	t_sample m_h_hold_L_2;
	t_sample m_h_down_count_3;
	t_sample samplerate;
	t_sample m_h_hold_R_1;
	t_sample m_h_D_23;
	t_sample m_h_pingpong_10;
	t_sample m_h_pan_cur_12;
	t_sample m_h_w2_19;
	t_sample m_h_w3_18;
	t_sample m_h_w1_20;
	t_sample m_h_sub_len_21;
	t_sample m_h_pan_jitter_11;
	t_sample m_h_w4_17;
	t_sample m_h_w6_15;
	t_sample m_h_w5_16;
	t_sample m_h_fb_R_13;
	t_sample m_h_fb_L_14;
	t_sample m_maindelay_50;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_hold_R_1 = ((int)0);
		m_h_hold_L_2 = ((int)0);
		m_h_down_count_3 = ((int)0);
		m_h_is_degraded_4 = ((int)0);
		m_h_deg_amt_5 = ((int)0);
		m_h_hp_yR_6 = ((int)0);
		m_h_hp_xR_7 = ((int)0);
		m_h_hp_yL_8 = ((int)0);
		m_h_hp_xL_9 = ((int)0);
		m_h_pingpong_10 = ((int)0);
		m_h_pan_jitter_11 = ((int)0);
		m_h_pan_cur_12 = ((int)0);
		m_h_fb_R_13 = ((int)0);
		m_h_fb_L_14 = ((int)0);
		m_h_w6_15 = ((int)0);
		m_h_w5_16 = ((int)0);
		m_h_w4_17 = ((int)0);
		m_h_w3_18 = ((int)0);
		m_h_w2_19 = ((int)0);
		m_h_w1_20 = ((int)1);
		m_h_sub_len_21 = ((int)24000);
		m_h_sub_count_22 = ((int)0);
		m_h_D_23 = ((int)24000);
		m_h_prev_mode_24 = ((int)0);
		m_h_beat_ph_25 = ((int)0);
		m_h_target_tap_26 = ((int)1);
		m_rec_R_27.reset("m_rec_R_27", ((int)192000));
		m_rec_L_28.reset("m_rec_L_28", ((int)192000));
		m_mix_29 = ((int)100);
		m_mode_30 = ((int)0);
		m_degrade_prob_31 = ((int)30);
		m_degrade_32 = ((int)0);
		m_roll_filter_33 = ((int)50);
		m_pan_spread_34 = ((int)50);
		m_stereo_spread_35 = ((int)30);
		m_feedback_36 = ((int)60);
		m_mute_prob_37 = ((int)10);
		m_probability_38 = ((int)75);
		m_vol6_39 = ((t_sample)0.65000000000000002);
		m_vol5_40 = ((t_sample)0.69999999999999996);
		m_vol4_41 = ((t_sample)0.69999999999999996);
		m_vol3_42 = ((t_sample)0.80000000000000004);
		m_vol2_43 = ((t_sample)0.80000000000000004);
		m_vol1_44 = ((int)1);
		m_div6_45 = ((int)12);
		m_div5_46 = ((int)10);
		m_div4_47 = ((int)8);
		m_div3_48 = ((int)4);
		m_div2_49 = ((int)2);
		m_maindelay_50 = ((int)500);
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		const t_sample * __in3 = __ins[2];
		const t_sample * __in4 = __ins[3];
		t_sample * __out1 = __outs[0];
		t_sample * __out2 = __outs[1];
		t_sample * __out3 = __outs[2];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__in3 == 0) || (__in4 == 0) || (__out1 == 0) || (__out2 == 0) || (__out3 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		t_sample r2 = ((((int)1) < m_div2_49) ? m_div2_49 : ((int)1));
		t_sample r3 = ((((int)1) < m_div3_48) ? m_div3_48 : ((int)1));
		t_sample r4 = ((((int)1) < m_div4_47) ? m_div4_47 : ((int)1));
		t_sample r5 = ((((int)1) < m_div5_46) ? m_div5_46 : ((int)1));
		t_sample r6 = ((((int)1) < m_div6_45) ? m_div6_45 : ((int)1));
		t_sample v_66 = (m_feedback_36 * ((t_sample)0.01));
		t_sample user_fb = ((v_66 <= ((int)0)) ? ((int)0) : ((v_66 >= ((t_sample)0.94999999999999996)) ? ((t_sample)0.94999999999999996) : v_66));
		t_sample spr_samps = (((m_stereo_spread_35 * ((t_sample)0.01)) * ((int)12)) * (samplerate * 0.001));
		t_sample mina_68 = (((t_sample)1.5) * (samplerate * 0.001));
		t_sample v1 = ((m_vol1_44 <= ((int)0)) ? ((int)0) : ((m_vol1_44 >= ((int)3)) ? ((int)3) : m_vol1_44));
		t_sample v2 = ((m_vol2_43 <= ((int)0)) ? ((int)0) : ((m_vol2_43 >= ((int)3)) ? ((int)3) : m_vol2_43));
		t_sample v3 = ((m_vol3_42 <= ((int)0)) ? ((int)0) : ((m_vol3_42 >= ((int)3)) ? ((int)3) : m_vol3_42));
		t_sample v4 = ((m_vol4_41 <= ((int)0)) ? ((int)0) : ((m_vol4_41 >= ((int)3)) ? ((int)3) : m_vol4_41));
		t_sample v5 = ((m_vol5_40 <= ((int)0)) ? ((int)0) : ((m_vol5_40 >= ((int)3)) ? ((int)3) : m_vol5_40));
		t_sample v6 = ((m_vol6_39 <= ((int)0)) ? ((int)0) : ((m_vol6_39 >= ((int)3)) ? ((int)3) : m_vol6_39));
		t_sample v_102 = (m_roll_filter_33 * ((t_sample)0.01));
		t_sample filt_mix = ((v_102 <= ((int)0)) ? ((int)0) : ((v_102 >= ((int)1)) ? ((int)1) : v_102));
		t_sample v_103 = (m_degrade_32 * ((t_sample)0.01));
		t_sample iftrue_104 = ((v_103 <= ((int)0)) ? ((int)0) : ((v_103 >= ((int)1)) ? ((int)1) : v_103));
		int cond_106 = (m_mode_30 < ((t_sample)0.5));
		int cond_108 = (m_mode_30 < ((t_sample)0.5));
		t_sample v_110 = (m_mix_29 * ((t_sample)0.01));
		t_sample mix_val = ((v_110 <= ((int)0)) ? ((int)0) : ((v_110 >= ((int)1)) ? ((int)1) : v_110));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			const t_sample in3 = (*(__in3++));
			const t_sample in4 = (*(__in4++));
			t_sample v_51 = (m_maindelay_50 + in3);
			t_sample eff_main = ((v_51 <= ((int)10)) ? ((int)10) : ((v_51 >= ((int)4000)) ? ((int)4000) : v_51));
			t_sample N_main = (eff_main * (samplerate * 0.001));
			t_sample f_beat = safediv(((int)1000), eff_main);
			t_sample inc_beat = safediv((f_beat * ((t_sample)6.2831853071795862)), samplerate);
			t_sample new_beat_ph = wrap((m_h_beat_ph_25 + inc_beat), ((int)0), ((t_sample)6.2831853071795862));
			int is_beat = (new_beat_ph < m_h_beat_ph_25);
			m_h_beat_ph_25 = new_beat_ph;
			int mode_changed = (m_mode_30 != m_h_prev_mode_24);
			m_h_prev_mode_24 = m_mode_30;
			int should_refresh = ((is_beat && (m_mode_30 < ((t_sample)1.5))) || mode_changed);
			if (should_refresh) {
				t_sample v_52 = (m_probability_38 + in4);
				t_sample eff_p = ((v_52 <= ((int)0)) ? ((int)0) : ((v_52 >= ((int)100)) ? ((int)100) : v_52));
				t_sample eff_m = ((m_mute_prob_37 <= ((int)0)) ? ((int)0) : ((m_mute_prob_37 >= ((int)100)) ? ((int)100) : m_mute_prob_37));
				int cond_53 = (m_h_pingpong_10 > ((t_sample)0.5));
				m_h_pingpong_10 = (cond_53 ? ((int)0) : ((int)1));
				t_sample roll_deg = (((noise() * ((t_sample)0.5)) + ((t_sample)0.5)) * ((int)100));
				t_sample eff_deg_p = ((m_degrade_prob_31 <= ((int)0)) ? ((int)0) : ((m_degrade_prob_31 >= ((int)100)) ? ((int)100) : m_degrade_prob_31));
				m_h_is_degraded_4 = ((roll_deg < eff_deg_p) && (m_degrade_32 > ((t_sample)0.5)));
				if ((eff_p <= ((t_sample)0.001))) {
					m_h_target_tap_26 = ((int)1);
					m_h_pan_jitter_11 = ((int)0);
					
				} else {
					t_sample roll = (((noise() * ((t_sample)0.5)) + ((t_sample)0.5)) * ((int)100));
					if ((roll < eff_p)) {
						t_sample roll_m = (((noise() * ((t_sample)0.5)) + ((t_sample)0.5)) * ((int)100));
						if ((roll_m < eff_m)) {
							m_h_target_tap_26 = ((int)0);
							
						} else {
							t_sample r_pick = (floor((((noise() * ((t_sample)0.5)) + ((t_sample)0.5)) * ((int)6))) + ((int)1));
							m_h_target_tap_26 = ((r_pick <= ((int)1)) ? ((int)1) : ((r_pick >= ((int)6)) ? ((int)6) : r_pick));
							m_h_pan_jitter_11 = ((noise() * ((t_sample)0.40000000000000002)) * (m_pan_spread_34 * ((t_sample)0.01)));
							
						};
						
					};
					
				};
				int cond_54 = (m_h_target_tap_26 == ((int)0));
				int cond_55 = (m_h_target_tap_26 == ((int)1));
				int cond_56 = (m_h_target_tap_26 == ((int)2));
				int cond_57 = (m_h_target_tap_26 == ((int)3));
				int cond_58 = (m_h_target_tap_26 == ((int)4));
				int cond_59 = (m_h_target_tap_26 == ((int)5));
				t_sample iffalse_60 = (cond_59 ? r5 : r6);
				t_sample iffalse_61 = (cond_58 ? r4 : iffalse_60);
				t_sample iffalse_62 = (cond_57 ? r3 : iffalse_61);
				t_sample iffalse_63 = (cond_56 ? r2 : iffalse_62);
				t_sample iffalse_64 = (cond_55 ? ((int)1) : iffalse_63);
				t_sample active_r = (cond_54 ? ((int)1) : iffalse_64);
				t_sample maxb_65 = floor(safediv(N_main, active_r));
				t_sample new_sub_samps = ((((int)2) < maxb_65) ? maxb_65 : ((int)2));
				m_h_sub_len_21 = new_sub_samps;
				m_h_D_23 = new_sub_samps;
				m_h_sub_count_22 = ((int)0);
				
			};
			t_sample fb_in_L = (tanh((m_h_fb_L_14 * ((t_sample)1.05))) * user_fb);
			t_sample fb_in_R = (tanh((m_h_fb_R_13 * ((t_sample)1.05))) * user_fb);
			m_rec_L_28.write((in1 + fb_in_L));
			m_rec_R_27.write((in2 + fb_in_R));
			t_sample read_D_L = ((m_h_D_23 <= ((int)2)) ? ((int)2) : ((m_h_D_23 >= ((int)190000)) ? ((int)190000) : m_h_D_23));
			t_sample v_67 = (m_h_D_23 + spr_samps);
			t_sample read_D_R = ((v_67 <= ((int)2)) ? ((int)2) : ((v_67 >= ((int)190000)) ? ((int)190000) : v_67));
			t_sample raw_tap_L = m_rec_L_28.read_cubic(read_D_L);
			t_sample raw_tap_R = m_rec_R_27.read_cubic(read_D_R);
			t_sample minb_69 = floor((m_h_sub_len_21 * ((t_sample)0.25)));
			t_sample fade_samps = ((minb_69 < mina_68) ? minb_69 : mina_68);
			t_sample fade_gain = ((int)1);
			if ((fade_samps > ((int)1))) {
				if ((m_h_sub_count_22 < fade_samps)) {
					fade_gain = (((t_sample)0.5) - (((t_sample)0.5) * cos((safediv(m_h_sub_count_22, fade_samps) * ((t_sample)3.1415926535897931)))));
					
				} else {
					if ((m_h_sub_count_22 > (m_h_sub_len_21 - fade_samps))) {
						t_sample dist_end = (m_h_sub_len_21 - m_h_sub_count_22);
						fade_gain = (((t_sample)0.5) - (((t_sample)0.5) * cos((safediv(dist_end, fade_samps) * ((t_sample)3.1415926535897931)))));
						
					};
					
				};
				
			};
			m_h_sub_count_22 = (m_h_sub_count_22 + ((int)1));
			if ((m_h_sub_count_22 >= m_h_sub_len_21)) {
				m_h_sub_count_22 = ((int)0);
				m_h_D_23 = (m_h_D_23 + m_h_sub_len_21);
				
			};
			int cond_70 = (m_h_target_tap_26 == ((int)1));
			int target_w1 = (cond_70 ? ((int)1) : ((int)0));
			int cond_71 = (m_h_target_tap_26 == ((int)2));
			int target_w2 = (cond_71 ? ((int)1) : ((int)0));
			int cond_72 = (m_h_target_tap_26 == ((int)3));
			int target_w3 = (cond_72 ? ((int)1) : ((int)0));
			int cond_73 = (m_h_target_tap_26 == ((int)4));
			int target_w4 = (cond_73 ? ((int)1) : ((int)0));
			int cond_74 = (m_h_target_tap_26 == ((int)5));
			int target_w5 = (cond_74 ? ((int)1) : ((int)0));
			int cond_75 = (m_h_target_tap_26 == ((int)6));
			int target_w6 = (cond_75 ? ((int)1) : ((int)0));
			m_h_w1_20 = fixdenorm((m_h_w1_20 + ((target_w1 - m_h_w1_20) * ((t_sample)0.050000000000000003))));
			m_h_w2_19 = fixdenorm((m_h_w2_19 + ((target_w2 - m_h_w2_19) * ((t_sample)0.050000000000000003))));
			m_h_w3_18 = fixdenorm((m_h_w3_18 + ((target_w3 - m_h_w3_18) * ((t_sample)0.050000000000000003))));
			m_h_w4_17 = fixdenorm((m_h_w4_17 + ((target_w4 - m_h_w4_17) * ((t_sample)0.050000000000000003))));
			m_h_w5_16 = fixdenorm((m_h_w5_16 + ((target_w5 - m_h_w5_16) * ((t_sample)0.050000000000000003))));
			m_h_w6_15 = fixdenorm((m_h_w6_15 + ((target_w6 - m_h_w6_15) * ((t_sample)0.050000000000000003))));
			t_sample active_vol = ((((((v1 * m_h_w1_20) + (v2 * m_h_w2_19)) + (v3 * m_h_w3_18)) + (v4 * m_h_w4_17)) + (v5 * m_h_w5_16)) + (v6 * m_h_w6_15));
			t_sample drill_clean_L = ((raw_tap_L * fade_gain) * active_vol);
			t_sample drill_clean_R = ((raw_tap_R * fade_gain) * active_vol);
			m_h_fb_L_14 = fixdenorm(drill_clean_L);
			m_h_fb_R_13 = fixdenorm(drill_clean_R);
			int cond_76 = (m_h_target_tap_26 == ((int)0));
			int cond_77 = (m_h_target_tap_26 == ((int)1));
			int cond_78 = (m_h_target_tap_26 == ((int)2));
			int cond_79 = (m_h_target_tap_26 == ((int)3));
			int cond_80 = (m_h_target_tap_26 == ((int)4));
			int cond_81 = (m_h_target_tap_26 == ((int)5));
			int cond_82 = (m_h_pingpong_10 > ((t_sample)0.5));
			t_sample iffalse_83 = (cond_82 ? ((t_sample)-0.94999999999999996) : ((t_sample)0.94999999999999996));
			t_sample iffalse_84 = (cond_81 ? ((t_sample)0.75) : iffalse_83);
			t_sample iffalse_85 = (cond_80 ? ((t_sample)-0.75) : iffalse_84);
			t_sample iffalse_86 = (cond_79 ? ((t_sample)0.34999999999999998) : iffalse_85);
			t_sample iffalse_87 = (cond_78 ? ((t_sample)-0.34999999999999998) : iffalse_86);
			t_sample iffalse_88 = (cond_77 ? ((int)0) : iffalse_87);
			t_sample base_pan = (cond_76 ? ((int)0) : iffalse_88);
			t_sample v_89 = ((base_pan * (m_pan_spread_34 * ((t_sample)0.01))) + m_h_pan_jitter_11);
			t_sample pan_target = ((v_89 <= ((int)-1)) ? ((int)-1) : ((v_89 >= ((int)1)) ? ((int)1) : v_89));
			m_h_pan_cur_12 = fixdenorm((m_h_pan_cur_12 + ((pan_target - m_h_pan_cur_12) * ((t_sample)0.029999999999999999))));
			t_sample theta_pan = ((m_h_pan_cur_12 + ((int)1)) * ((t_sample)0.78539816339744828));
			t_sample pan_gL = (cos(theta_pan) * ((t_sample)1.4142135600000001));
			t_sample pan_gR = (sin(theta_pan) * ((t_sample)1.4142135600000001));
			t_sample pan_drill_L = (drill_clean_L * pan_gL);
			t_sample pan_drill_R = (drill_clean_R * pan_gR);
			int cond_90 = (m_h_target_tap_26 == ((int)0));
			int cond_91 = (m_h_target_tap_26 == ((int)1));
			int cond_92 = (m_h_target_tap_26 == ((int)2));
			int cond_93 = (m_h_target_tap_26 == ((int)3));
			int cond_94 = (m_h_target_tap_26 == ((int)4));
			int cond_95 = (m_h_target_tap_26 == ((int)5));
			t_sample iffalse_96 = (cond_95 ? r5 : r6);
			t_sample iffalse_97 = (cond_94 ? r4 : iffalse_96);
			t_sample iffalse_98 = (cond_93 ? r3 : iffalse_97);
			t_sample iffalse_99 = (cond_92 ? r2 : iffalse_98);
			t_sample iffalse_100 = (cond_91 ? ((int)1) : iffalse_99);
			t_sample active_r_cur = (cond_90 ? ((int)1) : iffalse_100);
			t_sample v_101 = (((int)20) + (((active_r_cur - ((int)1)) * ((int)45)) * (m_roll_filter_33 * ((t_sample)0.01))));
			t_sample f_hp = ((v_101 <= ((int)20)) ? ((int)20) : ((v_101 >= ((int)2500)) ? ((int)2500) : v_101));
			t_sample omega_hp = safediv((f_hp * ((t_sample)6.2831853071795862)), samplerate);
			t_sample alpha_hp = safediv(((int)1), (((int)1) + omega_hp));
			t_sample hp_outL = (alpha_hp * ((m_h_hp_yL_8 + pan_drill_L) - m_h_hp_xL_9));
			m_h_hp_xL_9 = pan_drill_L;
			m_h_hp_yL_8 = hp_outL;
			t_sample hp_outR = (alpha_hp * ((m_h_hp_yR_6 + pan_drill_R) - m_h_hp_xR_7));
			m_h_hp_xR_7 = pan_drill_R;
			m_h_hp_yR_6 = hp_outR;
			t_sample tmp_mix_833 = (pan_drill_L + (filt_mix * (hp_outL - pan_drill_L)));
			t_sample filt_drill_L = tmp_mix_833;
			t_sample tmp_mix_834 = (pan_drill_R + (filt_mix * (hp_outR - pan_drill_R)));
			t_sample filt_drill_R = tmp_mix_834;
			t_sample target_deg_amt = (m_h_is_degraded_4 ? iftrue_104 : ((int)0));
			m_h_deg_amt_5 = fixdenorm((m_h_deg_amt_5 + ((target_deg_amt - m_h_deg_amt_5) * ((t_sample)0.050000000000000003))));
			t_sample down_factor = floor((((int)1) + (m_h_deg_amt_5 * ((int)24))));
			m_h_down_count_3 = (m_h_down_count_3 + ((int)1));
			if ((m_h_down_count_3 >= down_factor)) {
				m_h_hold_L_2 = filt_drill_L;
				m_h_hold_R_1 = filt_drill_R;
				m_h_down_count_3 = ((int)0);
				
			};
			t_sample maxb_105 = (((int)16) - (m_h_deg_amt_5 * ((int)12)));
			t_sample bit_steps = floor(safepow(((int)2), ((((int)3) < maxb_105) ? maxb_105 : ((int)3))));
			t_sample crush_L = safediv(floor(((m_h_hold_L_2 * bit_steps) + ((t_sample)0.5))), bit_steps);
			t_sample crush_R = safediv(floor(((m_h_hold_R_1 * bit_steps) + ((t_sample)0.5))), bit_steps);
			t_sample drive_gain = (((int)1) + (m_h_deg_amt_5 * ((t_sample)2.5)));
			t_sample drive_norm = safediv(((int)1), (((int)1) + (m_h_deg_amt_5 * ((t_sample)0.34999999999999998))));
			t_sample driven_L = (tanh((crush_L * drive_gain)) * drive_norm);
			t_sample driven_R = (tanh((crush_R * drive_gain)) * drive_norm);
			t_sample tmp_mix_835 = (filt_drill_L + (m_h_deg_amt_5 * (driven_L - filt_drill_L)));
			t_sample drill_L = tmp_mix_835;
			t_sample tmp_mix_836 = (filt_drill_R + (m_h_deg_amt_5 * (driven_R - filt_drill_R)));
			t_sample drill_R = tmp_mix_836;
			t_sample iftrue_107 = (in1 + drill_L);
			t_sample wet_L = (cond_106 ? iftrue_107 : drill_L);
			t_sample iftrue_109 = (in2 + drill_R);
			t_sample wet_R = (cond_108 ? iftrue_109 : drill_R);
			t_sample tmp_mix_837 = (in1 + (mix_val * (wet_L - in1)));
			t_sample tmp_expr_226 = tmp_mix_837;
			t_sample tmp_mix_838 = (in2 + (mix_val * (wet_R - in2)));
			t_sample tmp_expr_227 = tmp_mix_838;
			t_sample tmp_expr_228 = m_h_target_tap_26;
			t_sample out1 = tmp_expr_226;
			t_sample out2 = tmp_expr_227;
			t_sample out3 = tmp_expr_228;
			m_rec_R_27.step();
			m_rec_L_28.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			
		};
		return __exception;
		
	};
	inline void set_mix(t_param _value) {
		m_mix_29 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_mode(t_param _value) {
		m_mode_30 = (_value < 0 ? 0 : (_value > 2 ? 2 : _value));
	};
	inline void set_degrade_prob(t_param _value) {
		m_degrade_prob_31 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_degrade(t_param _value) {
		m_degrade_32 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_roll_filter(t_param _value) {
		m_roll_filter_33 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_pan_spread(t_param _value) {
		m_pan_spread_34 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_stereo_spread(t_param _value) {
		m_stereo_spread_35 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_feedback(t_param _value) {
		m_feedback_36 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_mute_prob(t_param _value) {
		m_mute_prob_37 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_probability(t_param _value) {
		m_probability_38 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_vol6(t_param _value) {
		m_vol6_39 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_vol5(t_param _value) {
		m_vol5_40 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_vol4(t_param _value) {
		m_vol4_41 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_vol3(t_param _value) {
		m_vol3_42 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_vol2(t_param _value) {
		m_vol2_43 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_vol1(t_param _value) {
		m_vol1_44 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_div6(t_param _value) {
		m_div6_45 = (_value < 1 ? 1 : (_value > 32 ? 32 : _value));
	};
	inline void set_div5(t_param _value) {
		m_div5_46 = (_value < 1 ? 1 : (_value > 32 ? 32 : _value));
	};
	inline void set_div4(t_param _value) {
		m_div4_47 = (_value < 1 ? 1 : (_value > 32 ? 32 : _value));
	};
	inline void set_div3(t_param _value) {
		m_div3_48 = (_value < 1 ? 1 : (_value > 32 ? 32 : _value));
	};
	inline void set_div2(t_param _value) {
		m_div2_49 = (_value < 1 ? 1 : (_value > 32 ? 32 : _value));
	};
	inline void set_maindelay(t_param _value) {
		m_maindelay_50 = (_value < 10 ? 10 : (_value > 4000 ? 4000 : _value));
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 4;
int gen_kernel_numouts = 3;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 22; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio Left In", "Audio Right In", "Main Delay CV (ms)", "Probability CV (0..100)" };
const char *gen_kernel_outnames[] = { "Processed Left", "Processed Right", "Active Tap CV" };

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
		case 0: self->set_degrade(value); break;
		case 1: self->set_degrade_prob(value); break;
		case 2: self->set_div2(value); break;
		case 3: self->set_div3(value); break;
		case 4: self->set_div4(value); break;
		case 5: self->set_div5(value); break;
		case 6: self->set_div6(value); break;
		case 7: self->set_feedback(value); break;
		case 8: self->set_maindelay(value); break;
		case 9: self->set_mix(value); break;
		case 10: self->set_mode(value); break;
		case 11: self->set_mute_prob(value); break;
		case 12: self->set_pan_spread(value); break;
		case 13: self->set_probability(value); break;
		case 14: self->set_roll_filter(value); break;
		case 15: self->set_stereo_spread(value); break;
		case 16: self->set_vol1(value); break;
		case 17: self->set_vol2(value); break;
		case 18: self->set_vol3(value); break;
		case 19: self->set_vol4(value); break;
		case 20: self->set_vol5(value); break;
		case 21: self->set_vol6(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_degrade_32; break;
		case 1: *value = self->m_degrade_prob_31; break;
		case 2: *value = self->m_div2_49; break;
		case 3: *value = self->m_div3_48; break;
		case 4: *value = self->m_div4_47; break;
		case 5: *value = self->m_div5_46; break;
		case 6: *value = self->m_div6_45; break;
		case 7: *value = self->m_feedback_36; break;
		case 8: *value = self->m_maindelay_50; break;
		case 9: *value = self->m_mix_29; break;
		case 10: *value = self->m_mode_30; break;
		case 11: *value = self->m_mute_prob_37; break;
		case 12: *value = self->m_pan_spread_34; break;
		case 13: *value = self->m_probability_38; break;
		case 14: *value = self->m_roll_filter_33; break;
		case 15: *value = self->m_stereo_spread_35; break;
		case 16: *value = self->m_vol1_44; break;
		case 17: *value = self->m_vol2_43; break;
		case 18: *value = self->m_vol3_42; break;
		case 19: *value = self->m_vol4_41; break;
		case 20: *value = self->m_vol5_40; break;
		case 21: *value = self->m_vol6_39; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(22 * sizeof(ParamInfo));
	self->__commonstate.numparams = 22;
	// initialize parameter 0 ("m_degrade_32")
	pi = self->__commonstate.params + 0;
	pi->name = "degrade";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_degrade_32;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_degrade_prob_31")
	pi = self->__commonstate.params + 1;
	pi->name = "degrade_prob";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_degrade_prob_31;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_div2_49")
	pi = self->__commonstate.params + 2;
	pi->name = "div2";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_div2_49;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 32;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_div3_48")
	pi = self->__commonstate.params + 3;
	pi->name = "div3";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_div3_48;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 32;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_div4_47")
	pi = self->__commonstate.params + 4;
	pi->name = "div4";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_div4_47;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 32;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_div5_46")
	pi = self->__commonstate.params + 5;
	pi->name = "div5";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_div5_46;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 32;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_div6_45")
	pi = self->__commonstate.params + 6;
	pi->name = "div6";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_div6_45;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 32;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_feedback_36")
	pi = self->__commonstate.params + 7;
	pi->name = "feedback";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_feedback_36;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_maindelay_50")
	pi = self->__commonstate.params + 8;
	pi->name = "maindelay";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_maindelay_50;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 10;
	pi->outputmax = 4000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_mix_29")
	pi = self->__commonstate.params + 9;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_29;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_mode_30")
	pi = self->__commonstate.params + 10;
	pi->name = "mode";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mode_30;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 2;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 11 ("m_mute_prob_37")
	pi = self->__commonstate.params + 11;
	pi->name = "mute_prob";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mute_prob_37;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 12 ("m_pan_spread_34")
	pi = self->__commonstate.params + 12;
	pi->name = "pan_spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_pan_spread_34;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 13 ("m_probability_38")
	pi = self->__commonstate.params + 13;
	pi->name = "probability";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_probability_38;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 14 ("m_roll_filter_33")
	pi = self->__commonstate.params + 14;
	pi->name = "roll_filter";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_roll_filter_33;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 15 ("m_stereo_spread_35")
	pi = self->__commonstate.params + 15;
	pi->name = "stereo_spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_stereo_spread_35;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 16 ("m_vol1_44")
	pi = self->__commonstate.params + 16;
	pi->name = "vol1";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_vol1_44;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 17 ("m_vol2_43")
	pi = self->__commonstate.params + 17;
	pi->name = "vol2";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_vol2_43;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 18 ("m_vol3_42")
	pi = self->__commonstate.params + 18;
	pi->name = "vol3";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_vol3_42;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 19 ("m_vol4_41")
	pi = self->__commonstate.params + 19;
	pi->name = "vol4";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_vol4_41;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 20 ("m_vol5_40")
	pi = self->__commonstate.params + 20;
	pi->name = "vol5";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_vol5_40;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 21 ("m_vol6_39")
	pi = self->__commonstate.params + 21;
	pi->name = "vol6";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_vol6_39;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
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


} // driller::
