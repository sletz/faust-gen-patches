#include "aether_particle.h"

namespace aether_particle {

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
	Data m_g_bufferR_56;
	Data m_g_bufferL_57;
	DCBlock __m_dcblock_132;
	DCBlock __m_dcblock_82;
	DCBlock __m_dcblock_131;
	DCBlock __m_dcblock_129;
	DCBlock __m_dcblock_83;
	DCBlock __m_dcblock_130;
	Delay m_rd4_15;
	Delay m_rap1_14;
	Delay m_rd3_16;
	Delay m_rd2_17;
	Delay m_rap2_13;
	Delay m_rd1_18;
	Delay m_rpre_dly_12;
	int __exception;
	int vectorsize;
	t_sample m_rh2_10;
	t_sample m_r_decay_62;
	t_sample m_r_absorb_61;
	t_sample m_r_size_63;
	t_sample m_r_mix_64;
	t_sample m_g_skew_65;
	t_sample m_r_tilt_60;
	t_sample m_g_regen_66;
	t_sample m_g_crush_67;
	t_sample m_r_speed_59;
	t_sample m_h_dcR_3;
	t_sample m_h_g_fbR_53;
	t_sample m_h_g_clock_52;
	t_sample m_r_depth_58;
	t_sample m_h_g_fbL_54;
	t_sample m_h_dcL_4;
	t_sample m_h_g_write_55;
	t_sample m_h_g_next_51;
	t_sample m_g_window_68;
	t_sample m_g_std_size_70;
	t_sample m_h_dc_inL_2;
	t_sample m_gainout_80;
	t_sample m_clear_79;
	t_sample m_h_dc_inR_1;
	t_sample samplerate;
	t_sample __m_slide_121;
	t_sample m_g_pitch_69;
	t_sample m_freeze_78;
	t_sample m_g_prob_76;
	t_sample m_g_std_pos_72;
	t_sample m_g_size_71;
	t_sample m_g_mix_77;
	t_sample m_g_pos_73;
	t_sample m_g_density_75;
	t_sample m_g_std_density_74;
	t_sample m_rh1_11;
	t_sample m_v1_tmr_50;
	t_sample m_v1_ptr_48;
	t_sample m_v4_dur_25;
	t_sample m_v4_ptr_24;
	t_sample m_v4_crsh_23;
	t_sample m_v4_tmr_26;
	t_sample m_v3_c_cnt_28;
	t_sample m_v3_sk_27;
	t_sample m_v3_sR_29;
	t_sample m_v3_sL_30;
	t_sample m_v4_sL_22;
	t_sample m_v4_c_cnt_20;
	t_sample m_rh4_8;
	t_sample m_rh3_9;
	t_sample m_v4_sR_21;
	t_sample m_rh_lpL_7;
	t_sample m_v4_sk_19;
	t_sample m_rh_lpR_6;
	t_sample m_v1_dur_49;
	t_sample m_v3_crsh_31;
	t_sample m_v3_dur_33;
	t_sample m_v1_c_cnt_44;
	t_sample m_v1_sk_43;
	t_sample m_rh_ph_5;
	t_sample m_v1_sR_45;
	t_sample m_v1_crsh_47;
	t_sample m_v1_sL_46;
	t_sample m_v3_ptr_32;
	t_sample m_v2_dur_41;
	t_sample m_v2_crsh_39;
	t_sample m_v2_sk_35;
	t_sample m_v3_tmr_34;
	t_sample m_v2_ptr_40;
	t_sample m_v2_c_cnt_36;
	t_sample m_v2_sL_38;
	t_sample m_v2_sR_37;
	t_sample m_v2_tmr_42;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_dc_inR_1 = ((int)0);
		m_h_dc_inL_2 = ((int)0);
		m_h_dcR_3 = ((int)0);
		m_h_dcL_4 = ((int)0);
		m_rh_ph_5 = ((int)0);
		m_rh_lpR_6 = ((int)0);
		m_rh_lpL_7 = ((int)0);
		m_rh4_8 = ((int)0);
		m_rh3_9 = ((int)0);
		m_rh2_10 = ((int)0);
		m_rh1_11 = ((int)0);
		m_rpre_dly_12.reset("m_rpre_dly_12", ((int)9600));
		m_rap2_13.reset("m_rap2_13", ((int)2000));
		m_rap1_14.reset("m_rap1_14", ((int)2000));
		m_rd4_15.reset("m_rd4_15", ((int)15000));
		m_rd3_16.reset("m_rd3_16", ((int)15000));
		m_rd2_17.reset("m_rd2_17", ((int)15000));
		m_rd1_18.reset("m_rd1_18", ((int)15000));
		m_v4_sk_19 = ((int)0);
		m_v4_c_cnt_20 = ((int)0);
		m_v4_sR_21 = ((int)0);
		m_v4_sL_22 = ((int)0);
		m_v4_crsh_23 = ((int)1);
		m_v4_ptr_24 = ((int)0);
		m_v4_dur_25 = ((int)100);
		m_v4_tmr_26 = ((int)999999);
		m_v3_sk_27 = ((int)0);
		m_v3_c_cnt_28 = ((int)0);
		m_v3_sR_29 = ((int)0);
		m_v3_sL_30 = ((int)0);
		m_v3_crsh_31 = ((int)1);
		m_v3_ptr_32 = ((int)0);
		m_v3_dur_33 = ((int)100);
		m_v3_tmr_34 = ((int)999999);
		m_v2_sk_35 = ((int)0);
		m_v2_c_cnt_36 = ((int)0);
		m_v2_sR_37 = ((int)0);
		m_v2_sL_38 = ((int)0);
		m_v2_crsh_39 = ((int)1);
		m_v2_ptr_40 = ((int)0);
		m_v2_dur_41 = ((int)100);
		m_v2_tmr_42 = ((int)999999);
		m_v1_sk_43 = ((int)0);
		m_v1_c_cnt_44 = ((int)0);
		m_v1_sR_45 = ((int)0);
		m_v1_sL_46 = ((int)0);
		m_v1_crsh_47 = ((int)1);
		m_v1_ptr_48 = ((int)0);
		m_v1_dur_49 = ((int)100);
		m_v1_tmr_50 = ((int)999999);
		m_h_g_next_51 = ((int)1);
		m_h_g_clock_52 = ((int)0);
		m_h_g_fbR_53 = ((int)0);
		m_h_g_fbL_54 = ((int)0);
		m_h_g_write_55 = ((int)0);
		m_g_bufferR_56.reset("g_bufferR", (samplerate * ((int)20)), ((int)1));
		m_g_bufferL_57.reset("g_bufferL", (samplerate * ((int)20)), ((int)1));
		m_r_depth_58 = ((int)2);
		m_r_speed_59 = ((int)1);
		m_r_tilt_60 = ((int)0);
		m_r_absorb_61 = ((int)40);
		m_r_decay_62 = ((int)60);
		m_r_size_63 = ((int)50);
		m_r_mix_64 = ((int)40);
		m_g_skew_65 = ((int)0);
		m_g_regen_66 = ((int)40);
		m_g_crush_67 = ((int)30);
		m_g_window_68 = ((t_sample)0.5);
		m_g_pitch_69 = ((int)1);
		m_g_std_size_70 = ((int)50);
		m_g_size_71 = ((int)200);
		m_g_std_pos_72 = ((int)5);
		m_g_pos_73 = ((int)10);
		m_g_std_density_74 = ((int)20);
		m_g_density_75 = ((int)4);
		m_g_prob_76 = ((int)100);
		m_g_mix_77 = ((int)50);
		m_freeze_78 = ((int)0);
		m_clear_79 = ((int)0);
		m_gainout_80 = ((int)0);
		__m_dcblock_82.reset();
		__m_dcblock_83.reset();
		__m_slide_121 = 0;
		__m_dcblock_129.reset();
		__m_dcblock_130.reset();
		__m_dcblock_131.reset();
		__m_dcblock_132.reset();
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
		int is_frozen = (m_freeze_78 > ((t_sample)0.5));
		int is_clearing = (m_clear_79 > ((t_sample)0.5));
		t_sample iffalse_81 = (m_g_regen_66 * ((t_sample)0.01));
		t_sample fb_g = (is_clearing ? ((int)0) : iffalse_81);
		t_sample slide_input_122 = (m_r_size_63 * ((t_sample)0.01));
		t_sample iup_123 = (1 / maximum(1, fabs(((int)2000))));
		t_sample idown_124 = (1 / maximum(1, fabs(((int)2000))));
		t_sample rfb = (m_r_decay_62 * ((t_sample)0.01));
		t_sample rdamp = (m_r_absorb_61 * ((t_sample)0.01));
		t_sample tmp_abs_914 = fabs(m_r_tilt_60);
		int cond_133 = (m_r_tilt_60 < ((int)0));
		t_sample tmp_abs_918 = fabs(m_r_tilt_60);
		int cond_134 = (m_r_tilt_60 < ((int)0));
		t_sample tmp_div_922 = (m_g_mix_77 * ((t_sample)0.01));
		t_sample tmp_div_924 = (m_r_mix_64 * ((t_sample)0.01));
		t_sample tmp_div_926 = (m_g_mix_77 * ((t_sample)0.01));
		t_sample tmp_div_928 = (m_r_mix_64 * ((t_sample)0.01));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample o1L = ((int)0);
			t_sample o1R = ((int)0);
			t_sample o2L = ((int)0);
			t_sample o2R = ((int)0);
			t_sample o3L = ((int)0);
			t_sample o3R = ((int)0);
			t_sample o4L = ((int)0);
			t_sample o4R = ((int)0);
			t_sample in_effL = __m_dcblock_82((in1 + tanh((m_h_g_fbL_54 * fb_g))));
			t_sample in_effR = __m_dcblock_83((in2 + tanh((m_h_g_fbR_53 * fb_g))));
			if ((!is_frozen)) {
				int g_bufferL_dim = m_g_bufferL_57.dim;
				int g_bufferL_channels = m_g_bufferL_57.channels;
				int index_trunc_84 = fixnan(floor(m_h_g_write_55));
				bool index_ignore_85 = ((index_trunc_84 >= g_bufferL_dim) || (index_trunc_84 < 0));
				if ((!index_ignore_85)) {
					m_g_bufferL_57.write((is_clearing ? ((int)0) : in_effL), index_trunc_84, 0);
					
				};
				int g_bufferR_dim = m_g_bufferR_56.dim;
				int g_bufferR_channels = m_g_bufferR_56.channels;
				int index_trunc_86 = fixnan(floor(m_h_g_write_55));
				bool index_ignore_87 = ((index_trunc_86 >= g_bufferR_dim) || (index_trunc_86 < 0));
				if ((!index_ignore_87)) {
					m_g_bufferR_56.write((is_clearing ? ((int)0) : in_effR), index_trunc_86, 0);
					
				};
				m_h_g_write_55 = wrap((m_h_g_write_55 + ((int)1)), ((int)0), g_bufferL_dim);
				
			};
			m_h_g_clock_52 = (m_h_g_clock_52 + ((int)1));
			if ((m_h_g_clock_52 >= m_h_g_next_51)) {
				m_h_g_clock_52 = ((int)0);
				t_sample bp = safediv(samplerate, ((m_g_density_75 < ((t_sample)0.001)) ? ((t_sample)0.001) : m_g_density_75));
				t_sample jt = (((int)1) + (box_muller_() * (m_g_std_density_74 * ((t_sample)0.01))));
				t_sample v_89 = (bp * jt);
				int max_90 = (samplerate * ((int)5));
				m_h_g_next_51 = ((v_89 <= ((int)40)) ? ((int)40) : ((v_89 >= max_90) ? max_90 : v_89));
				if ((((noise() * ((t_sample)0.5)) + ((t_sample)0.5)) < (m_g_prob_76 * ((t_sample)0.01)))) {
					int cond_91 = (m_v1_tmr_50 >= m_v1_dur_49);
					int cond_92 = (m_v2_tmr_42 >= m_v2_dur_41);
					int cond_93 = (m_v3_tmr_34 >= m_v3_dur_33);
					int cond_94 = (m_v4_tmr_26 >= m_v4_dur_25);
					int iffalse_95 = (cond_94 ? ((int)4) : ((int)0));
					int iffalse_96 = (cond_93 ? ((int)3) : iffalse_95);
					int iffalse_97 = (cond_92 ? ((int)2) : iffalse_96);
					int v_idx = (cond_91 ? ((int)1) : iffalse_97);
					if ((v_idx > ((int)0))) {
						t_sample gauss = box_muller_();
						t_sample maxa_98 = (m_g_size_71 + (gauss * m_g_std_size_70));
						t_sample d = (((maxa_98 < ((int)1)) ? ((int)1) : maxa_98) * (samplerate * 0.001));
						int g_bufferL_dim = m_g_bufferL_57.dim;
						int g_bufferL_channels = m_g_bufferL_57.channels;
						int ms = g_bufferL_dim;
						t_sample v_99 = (((m_g_pos_73 * ((t_sample)0.01)) * ms) + (((gauss * (m_g_std_pos_72 * ((t_sample)0.01))) * ms) * ((t_sample)0.20000000000000001)));
						t_sample max_100 = ((ms - d) - ((int)100));
						t_sample off = ((v_99 <= ((int)10)) ? ((int)10) : ((v_99 >= max_100) ? max_100 : v_99));
						t_sample skw = ((safepow((m_g_skew_65 * ((t_sample)0.01)), ((int)3)) * ((int)1000)) * (samplerate * 0.001));
						int cond_101 = (((noise() * ((t_sample)0.5)) + ((t_sample)0.5)) < (m_g_crush_67 * ((t_sample)0.01)));
						t_sample iftrue_102 = (floor((fabs(noise()) * ((int)80))) + ((int)2));
						t_sample cr = (cond_101 ? iftrue_102 : ((int)1));
						t_sample p_st = wrap((m_h_g_write_55 - off), ((int)0), ms);
						if ((v_idx == ((int)1))) {
							m_v1_tmr_50 = ((int)0);
							m_v1_dur_49 = d;
							m_v1_ptr_48 = p_st;
							m_v1_crsh_47 = cr;
							m_v1_sk_43 = skw;
							m_v1_c_cnt_44 = ((int)0);
							
						};
						if ((v_idx == ((int)2))) {
							m_v2_tmr_42 = ((int)0);
							m_v2_dur_41 = d;
							m_v2_ptr_40 = p_st;
							m_v2_crsh_39 = cr;
							m_v2_sk_35 = skw;
							m_v2_c_cnt_36 = ((int)0);
							
						};
						if ((v_idx == ((int)3))) {
							m_v3_tmr_34 = ((int)0);
							m_v3_dur_33 = d;
							m_v3_ptr_32 = p_st;
							m_v3_crsh_31 = cr;
							m_v3_sk_27 = skw;
							m_v3_c_cnt_28 = ((int)0);
							
						};
						if ((v_idx == ((int)4))) {
							m_v4_tmr_26 = ((int)0);
							m_v4_dur_25 = d;
							m_v4_ptr_24 = p_st;
							m_v4_crsh_23 = cr;
							m_v4_sk_19 = skw;
							m_v4_c_cnt_20 = ((int)0);
							
						};
						
					};
					
				};
				
			};
			if ((m_v1_tmr_50 < m_v1_dur_49)) {
				int g_bufferL_dim = m_g_bufferL_57.dim;
				int g_bufferL_channels = m_g_bufferL_57.channels;
				m_v1_ptr_48 = wrap((m_v1_ptr_48 + m_g_pitch_69), ((int)0), g_bufferL_dim);
				m_v1_c_cnt_44 = (m_v1_c_cnt_44 + ((int)1));
				if ((m_v1_c_cnt_44 >= m_v1_crsh_47)) {
					int index_trunc_103 = fixnan(floor(m_v1_ptr_48));
					bool index_ignore_104 = ((index_trunc_103 >= g_bufferL_dim) || (index_trunc_103 < 0));
					// samples g_bufferL channel 1;
					m_v1_sL_46 = (index_ignore_104 ? 0 : m_g_bufferL_57.read(index_trunc_103, 0));
					int g_bufferR_dim = m_g_bufferR_56.dim;
					int g_bufferR_channels = m_g_bufferR_56.channels;
					int index_trunc_105 = fixnan(floor(wrap((m_v1_ptr_48 - m_v1_sk_43), ((int)0), g_bufferL_dim)));
					bool index_ignore_106 = ((index_trunc_105 >= g_bufferR_dim) || (index_trunc_105 < 0));
					// samples g_bufferR channel 1;
					m_v1_sR_45 = (index_ignore_106 ? 0 : m_g_bufferR_56.read(index_trunc_105, 0));
					m_v1_c_cnt_44 = ((int)0);
					
				};
				t_sample w_env = get_window_d_d(safediv(m_v1_tmr_50, m_v1_dur_49), m_g_window_68);
				o1L = (m_v1_sL_46 * w_env);
				o1R = (m_v1_sR_45 * w_env);
				m_v1_tmr_50 = (m_v1_tmr_50 + ((int)1));
				
			};
			if ((m_v2_tmr_42 < m_v2_dur_41)) {
				int g_bufferL_dim = m_g_bufferL_57.dim;
				int g_bufferL_channels = m_g_bufferL_57.channels;
				m_v2_ptr_40 = wrap((m_v2_ptr_40 + m_g_pitch_69), ((int)0), g_bufferL_dim);
				m_v2_c_cnt_36 = (m_v2_c_cnt_36 + ((int)1));
				if ((m_v2_c_cnt_36 >= m_v2_crsh_39)) {
					int index_trunc_109 = fixnan(floor(m_v2_ptr_40));
					bool index_ignore_110 = ((index_trunc_109 >= g_bufferL_dim) || (index_trunc_109 < 0));
					// samples g_bufferL channel 1;
					m_v2_sL_38 = (index_ignore_110 ? 0 : m_g_bufferL_57.read(index_trunc_109, 0));
					int g_bufferR_dim = m_g_bufferR_56.dim;
					int g_bufferR_channels = m_g_bufferR_56.channels;
					int index_trunc_111 = fixnan(floor(wrap((m_v2_ptr_40 - m_v2_sk_35), ((int)0), g_bufferL_dim)));
					bool index_ignore_112 = ((index_trunc_111 >= g_bufferR_dim) || (index_trunc_111 < 0));
					// samples g_bufferR channel 1;
					m_v2_sR_37 = (index_ignore_112 ? 0 : m_g_bufferR_56.read(index_trunc_111, 0));
					m_v2_c_cnt_36 = ((int)0);
					
				};
				t_sample w_env = get_window_d_d(safediv(m_v2_tmr_42, m_v2_dur_41), m_g_window_68);
				o2L = (m_v2_sL_38 * w_env);
				o2R = (m_v2_sR_37 * w_env);
				m_v2_tmr_42 = (m_v2_tmr_42 + ((int)1));
				
			};
			if ((m_v3_tmr_34 < m_v3_dur_33)) {
				int g_bufferL_dim = m_g_bufferL_57.dim;
				int g_bufferL_channels = m_g_bufferL_57.channels;
				m_v3_ptr_32 = wrap((m_v3_ptr_32 + m_g_pitch_69), ((int)0), g_bufferL_dim);
				m_v3_c_cnt_28 = (m_v3_c_cnt_28 + ((int)1));
				if ((m_v3_c_cnt_28 >= m_v3_crsh_31)) {
					int index_trunc_113 = fixnan(floor(m_v3_ptr_32));
					bool index_ignore_114 = ((index_trunc_113 >= g_bufferL_dim) || (index_trunc_113 < 0));
					// samples g_bufferL channel 1;
					m_v3_sL_30 = (index_ignore_114 ? 0 : m_g_bufferL_57.read(index_trunc_113, 0));
					int g_bufferR_dim = m_g_bufferR_56.dim;
					int g_bufferR_channels = m_g_bufferR_56.channels;
					int index_trunc_115 = fixnan(floor(wrap((m_v3_ptr_32 - m_v3_sk_27), ((int)0), g_bufferL_dim)));
					bool index_ignore_116 = ((index_trunc_115 >= g_bufferR_dim) || (index_trunc_115 < 0));
					// samples g_bufferR channel 1;
					m_v3_sR_29 = (index_ignore_116 ? 0 : m_g_bufferR_56.read(index_trunc_115, 0));
					m_v3_c_cnt_28 = ((int)0);
					
				};
				t_sample w_env = get_window_d_d(safediv(m_v3_tmr_34, m_v3_dur_33), m_g_window_68);
				o3L = (m_v3_sL_30 * w_env);
				o3R = (m_v3_sR_29 * w_env);
				m_v3_tmr_34 = (m_v3_tmr_34 + ((int)1));
				
			};
			if ((m_v4_tmr_26 < m_v4_dur_25)) {
				int g_bufferL_dim = m_g_bufferL_57.dim;
				int g_bufferL_channels = m_g_bufferL_57.channels;
				m_v4_ptr_24 = wrap((m_v4_ptr_24 + m_g_pitch_69), ((int)0), g_bufferL_dim);
				m_v4_c_cnt_20 = (m_v4_c_cnt_20 + ((int)1));
				if ((m_v4_c_cnt_20 >= m_v4_crsh_23)) {
					int index_trunc_117 = fixnan(floor(m_v4_ptr_24));
					bool index_ignore_118 = ((index_trunc_117 >= g_bufferL_dim) || (index_trunc_117 < 0));
					// samples g_bufferL channel 1;
					m_v4_sL_22 = (index_ignore_118 ? 0 : m_g_bufferL_57.read(index_trunc_117, 0));
					int g_bufferR_dim = m_g_bufferR_56.dim;
					int g_bufferR_channels = m_g_bufferR_56.channels;
					int index_trunc_119 = fixnan(floor(wrap((m_v4_ptr_24 - m_v4_sk_19), ((int)0), g_bufferL_dim)));
					bool index_ignore_120 = ((index_trunc_119 >= g_bufferR_dim) || (index_trunc_119 < 0));
					// samples g_bufferR channel 1;
					m_v4_sR_21 = (index_ignore_120 ? 0 : m_g_bufferR_56.read(index_trunc_119, 0));
					m_v4_c_cnt_20 = ((int)0);
					
				};
				t_sample w_env = get_window_d_d(safediv(m_v4_tmr_26, m_v4_dur_25), m_g_window_68);
				o4L = (m_v4_sL_22 * w_env);
				o4R = (m_v4_sR_21 * w_env);
				m_v4_tmr_26 = (m_v4_tmr_26 + ((int)1));
				
			};
			t_sample wet_granL = ((((o1L + o2L) + o3L) + o4L) * ((t_sample)0.5));
			t_sample wet_granR = ((((o1R + o2R) + o3R) + o4R) * ((t_sample)0.5));
			m_h_g_fbL_54 = fixdenorm(wet_granL);
			m_h_g_fbR_53 = fixdenorm(wet_granR);
			__m_slide_121 = fixdenorm((__m_slide_121 + (((slide_input_122 > __m_slide_121) ? iup_123 : idown_124) * (slide_input_122 - __m_slide_121))));
			t_sample rs_size = __m_slide_121;
			m_rh_ph_5 = wrap((m_rh_ph_5 + safediv(m_r_speed_59, samplerate)), ((int)0), ((int)1));
			t_sample rlfo = (sin((m_rh_ph_5 * ((t_sample)6.2831853071795862))) * (m_r_depth_58 * ((int)5)));
			t_sample v_125 = ((((int)1531) * rs_size) + rlfo);
			t_sample rt1 = ((v_125 <= ((int)10)) ? ((int)10) : ((v_125 >= ((int)14000)) ? ((int)14000) : v_125));
			t_sample v_126 = ((((int)2237) * rs_size) - rlfo);
			t_sample rt2 = ((v_126 <= ((int)10)) ? ((int)10) : ((v_126 >= ((int)14000)) ? ((int)14000) : v_126));
			t_sample v_127 = ((((int)3163) * rs_size) + rlfo);
			t_sample rt3 = ((v_127 <= ((int)10)) ? ((int)10) : ((v_127 >= ((int)14000)) ? ((int)14000) : v_127));
			t_sample v_128 = ((((int)4453) * rs_size) - rlfo);
			t_sample rt4 = ((v_128 <= ((int)10)) ? ((int)10) : ((v_128 >= ((int)14000)) ? ((int)14000) : v_128));
			t_sample r_in = ((wet_granL + wet_granR) * ((t_sample)0.5));
			t_sample r_pre = m_rpre_dly_12.read_linear((((int)10) * (samplerate * 0.001)));
			m_rpre_dly_12.write(r_in);
			t_sample rv_ap1 = (r_pre - (m_rap1_14.read_linear((((int)400) * rs_size)) * ((t_sample)0.59999999999999998)));
			m_rap1_14.write(rv_ap1);
			t_sample rdf1 = (m_rap1_14.read_linear((((int)400) * rs_size)) + (rv_ap1 * ((t_sample)0.59999999999999998)));
			t_sample rv_ap2 = (rdf1 - (m_rap2_13.read_linear((((int)600) * rs_size)) * ((t_sample)0.59999999999999998)));
			m_rap2_13.write(rv_ap2);
			t_sample r_diff_in = (m_rap2_13.read_linear((((int)600) * rs_size)) + (rv_ap2 * ((t_sample)0.59999999999999998)));
			t_sample rr1 = m_rd1_18.read_linear(rt1);
			t_sample rr2 = m_rd2_17.read_linear(rt2);
			t_sample rr3 = m_rd3_16.read_linear(rt3);
			t_sample rr4 = m_rd4_15.read_linear(rt4);
			t_sample rj1 = ((((rr1 + rr2) + rr3) + rr4) * ((t_sample)0.5));
			t_sample rj2 = ((((rr1 - rr2) + rr3) - rr4) * ((t_sample)0.5));
			t_sample rj3 = ((((rr1 + rr2) - rr3) - rr4) * ((t_sample)0.5));
			t_sample rj4 = ((((rr1 - rr2) - rr3) + rr4) * ((t_sample)0.5));
			t_sample tmp_mix_907 = (rj1 + (rdamp * (m_rh1_11 - rj1)));
			m_rh1_11 = tmp_mix_907;
			t_sample tmp_mix_908 = (rj2 + (rdamp * (m_rh2_10 - rj2)));
			m_rh2_10 = tmp_mix_908;
			t_sample tmp_mix_909 = (rj3 + (rdamp * (m_rh3_9 - rj3)));
			m_rh3_9 = tmp_mix_909;
			t_sample tmp_mix_910 = (rj4 + (rdamp * (m_rh4_8 - rj4)));
			m_rh4_8 = tmp_mix_910;
			m_rd1_18.write(fixdenorm(__m_dcblock_129((r_diff_in + tanh((m_rh1_11 * rfb))))));
			m_rd2_17.write(fixdenorm(__m_dcblock_130((r_diff_in + tanh((m_rh2_10 * rfb))))));
			m_rd3_16.write(fixdenorm(__m_dcblock_131((r_diff_in + tanh((m_rh3_9 * rfb))))));
			m_rd4_15.write(fixdenorm(__m_dcblock_132((r_diff_in + tanh((m_rh4_8 * rfb))))));
			t_sample rrawL = ((rr1 + rr3) * ((t_sample)0.5));
			t_sample rrawR = ((rr2 + rr4) * ((t_sample)0.5));
			t_sample tmp_mix_911 = (rrawL + (((t_sample)0.10000000000000001) * (m_rh_lpL_7 - rrawL)));
			t_sample rt_lpL = tmp_mix_911;
			m_rh_lpL_7 = rt_lpL;
			t_sample tmp_mix_912 = (rrawR + (((t_sample)0.10000000000000001) * (m_rh_lpR_6 - rrawR)));
			t_sample rt_lpR = tmp_mix_912;
			m_rh_lpR_6 = rt_lpR;
			t_sample tmp_mix_913 = (rrawL + (tmp_abs_914 * (rt_lpL - rrawL)));
			t_sample tmp_sub_916 = (rrawL - rt_lpL);
			t_sample tmp_mix_915 = (rrawL + (m_r_tilt_60 * (tmp_sub_916 - rrawL)));
			t_sample rresL = (cond_133 ? tmp_mix_913 : tmp_mix_915);
			t_sample tmp_mix_917 = (rrawR + (tmp_abs_918 * (rt_lpR - rrawR)));
			t_sample tmp_sub_920 = (rrawR - rt_lpR);
			t_sample tmp_mix_919 = (rrawR + (m_r_tilt_60 * (tmp_sub_920 - rrawR)));
			t_sample rresR = (cond_134 ? tmp_mix_917 : tmp_mix_919);
			t_sample tmp_mix_921 = (in1 + (tmp_div_922 * (wet_granL - in1)));
			t_sample tmp_mix_923 = (tmp_mix_921 + (tmp_div_924 * (rresL - tmp_mix_921)));
			t_sample finalL = (tmp_mix_923 * dbtoa(m_gainout_80));
			t_sample tmp_mix_925 = (in2 + (tmp_div_926 * (wet_granR - in2)));
			t_sample tmp_mix_927 = (tmp_mix_925 + (tmp_div_928 * (rresR - tmp_mix_925)));
			t_sample finalR = (tmp_mix_927 * dbtoa(m_gainout_80));
			t_sample out_fL = ((finalL - m_h_dc_inL_2) + (((t_sample)0.995) * m_h_dcL_4));
			m_h_dc_inL_2 = finalL;
			m_h_dcL_4 = out_fL;
			t_sample out_fR = ((finalR - m_h_dc_inR_1) + (((t_sample)0.995) * m_h_dcR_3));
			m_h_dc_inR_1 = finalR;
			m_h_dcR_3 = out_fR;
			t_sample tmp_expr_103 = tanh(out_fL);
			t_sample tmp_expr_104 = tanh(out_fR);
			t_sample out2 = tmp_expr_104;
			t_sample out1 = tmp_expr_103;
			m_rpre_dly_12.step();
			m_rap2_13.step();
			m_rap1_14.step();
			m_rd4_15.step();
			m_rd3_16.step();
			m_rd2_17.step();
			m_rd1_18.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_g_bufferR(void * _value) {
		m_g_bufferR_56.setbuffer(_value);
	};
	inline void set_g_bufferL(void * _value) {
		m_g_bufferL_57.setbuffer(_value);
	};
	inline void set_r_depth(t_param _value) {
		m_r_depth_58 = (_value < 0 ? 0 : (_value > 20 ? 20 : _value));
	};
	inline void set_r_speed(t_param _value) {
		m_r_speed_59 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 10 ? 10 : _value));
	};
	inline void set_r_tilt(t_param _value) {
		m_r_tilt_60 = (_value < -1 ? -1 : (_value > 1 ? 1 : _value));
	};
	inline void set_r_absorb(t_param _value) {
		m_r_absorb_61 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_r_decay(t_param _value) {
		m_r_decay_62 = (_value < 0 ? 0 : (_value > 110 ? 110 : _value));
	};
	inline void set_r_size(t_param _value) {
		m_r_size_63 = (_value < 0.5 ? 0.5 : (_value > 100 ? 100 : _value));
	};
	inline void set_r_mix(t_param _value) {
		m_r_mix_64 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_g_skew(t_param _value) {
		m_g_skew_65 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_g_regen(t_param _value) {
		m_g_regen_66 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_g_crush(t_param _value) {
		m_g_crush_67 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_g_window(t_param _value) {
		m_g_window_68 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_g_pitch(t_param _value) {
		m_g_pitch_69 = (_value < -4 ? -4 : (_value > 4 ? 4 : _value));
	};
	inline void set_g_std_size(t_param _value) {
		m_g_std_size_70 = (_value < 0 ? 0 : (_value > 1000 ? 1000 : _value));
	};
	inline void set_g_size(t_param _value) {
		m_g_size_71 = (_value < 2 ? 2 : (_value > 2000 ? 2000 : _value));
	};
	inline void set_g_std_pos(t_param _value) {
		m_g_std_pos_72 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_g_pos(t_param _value) {
		m_g_pos_73 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_g_std_density(t_param _value) {
		m_g_std_density_74 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_g_density(t_param _value) {
		m_g_density_75 = (_value < 0.001 ? 0.001 : (_value > 60 ? 60 : _value));
	};
	inline void set_g_prob(t_param _value) {
		m_g_prob_76 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_g_mix(t_param _value) {
		m_g_mix_77 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_freeze(t_param _value) {
		m_freeze_78 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_clear(t_param _value) {
		m_clear_79 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_gainout(t_param _value) {
		m_gainout_80 = (_value < -60 ? -60 : (_value > 12 ? 12 : _value));
	};
	inline t_sample box_muller_() {
		t_sample v_88 = fabs(noise());
		t_sample u1 = ((v_88 <= ((t_sample)0.0001)) ? ((t_sample)0.0001) : ((v_88 >= ((int)1)) ? ((int)1) : v_88));
		t_sample u2 = (noise() * ((t_sample)3.1415926535897931));
		return (sqrt(((-((int)2)) * log(u1))) * cos(u2));
		
	};
	inline t_sample get_window_d_d(t_sample p, t_sample shape) {
		t_sample tri = (((int)1) - fabs(((p * ((int)2)) - ((int)1))));
		t_sample spline = ((((int)3) * safepow(tri, ((int)2))) - (((int)2) * safepow(tri, ((int)3))));
		t_sample perc = safepow(tri, ((int)4));
		t_sample v_107 = (tri * ((int)3));
		t_sample trap = ((v_107 <= ((int)0)) ? ((int)0) : ((v_107 >= ((int)1)) ? ((int)1) : v_107));
		t_sample tmp_mul_904 = (shape * ((int)2));
		t_sample tmp_mix_903 = (perc + (tmp_mul_904 * (spline - perc)));
		t_sample tmp_mul_906 = ((shape - ((t_sample)0.5)) * ((int)2));
		t_sample tmp_mix_905 = (spline + (tmp_mul_906 * (trap - spline)));
		int cond_108 = (shape < ((t_sample)0.5));
		t_sample tmp_tmp__get_window_ret_96 = (cond_108 ? tmp_mix_903 : tmp_mix_905);
		return tmp_tmp__get_window_ret_96;
		
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
int num_params() { return 25; }

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
		case 0: self->set_clear(value); break;
		case 1: self->set_freeze(value); break;
		case 2: self->set_g_bufferL(ref); break;
		case 3: self->set_g_bufferR(ref); break;
		case 4: self->set_g_crush(value); break;
		case 5: self->set_g_density(value); break;
		case 6: self->set_g_mix(value); break;
		case 7: self->set_g_pitch(value); break;
		case 8: self->set_g_pos(value); break;
		case 9: self->set_g_prob(value); break;
		case 10: self->set_g_regen(value); break;
		case 11: self->set_g_size(value); break;
		case 12: self->set_g_skew(value); break;
		case 13: self->set_g_std_density(value); break;
		case 14: self->set_g_std_pos(value); break;
		case 15: self->set_g_std_size(value); break;
		case 16: self->set_g_window(value); break;
		case 17: self->set_gainout(value); break;
		case 18: self->set_r_absorb(value); break;
		case 19: self->set_r_decay(value); break;
		case 20: self->set_r_depth(value); break;
		case 21: self->set_r_mix(value); break;
		case 22: self->set_r_size(value); break;
		case 23: self->set_r_speed(value); break;
		case 24: self->set_r_tilt(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_clear_79; break;
		case 1: *value = self->m_freeze_78; break;
		
		
		case 4: *value = self->m_g_crush_67; break;
		case 5: *value = self->m_g_density_75; break;
		case 6: *value = self->m_g_mix_77; break;
		case 7: *value = self->m_g_pitch_69; break;
		case 8: *value = self->m_g_pos_73; break;
		case 9: *value = self->m_g_prob_76; break;
		case 10: *value = self->m_g_regen_66; break;
		case 11: *value = self->m_g_size_71; break;
		case 12: *value = self->m_g_skew_65; break;
		case 13: *value = self->m_g_std_density_74; break;
		case 14: *value = self->m_g_std_pos_72; break;
		case 15: *value = self->m_g_std_size_70; break;
		case 16: *value = self->m_g_window_68; break;
		case 17: *value = self->m_gainout_80; break;
		case 18: *value = self->m_r_absorb_61; break;
		case 19: *value = self->m_r_decay_62; break;
		case 20: *value = self->m_r_depth_58; break;
		case 21: *value = self->m_r_mix_64; break;
		case 22: *value = self->m_r_size_63; break;
		case 23: *value = self->m_r_speed_59; break;
		case 24: *value = self->m_r_tilt_60; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(25 * sizeof(ParamInfo));
	self->__commonstate.numparams = 25;
	// initialize parameter 0 ("m_clear_79")
	pi = self->__commonstate.params + 0;
	pi->name = "clear";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_clear_79;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_freeze_78")
	pi = self->__commonstate.params + 1;
	pi->name = "freeze";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freeze_78;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_g_bufferL_57")
	pi = self->__commonstate.params + 2;
	pi->name = "g_bufferL";
	pi->paramtype = GENLIB_PARAMTYPE_SYM;
	pi->defaultvalue = 0.;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = false;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_g_bufferR_56")
	pi = self->__commonstate.params + 3;
	pi->name = "g_bufferR";
	pi->paramtype = GENLIB_PARAMTYPE_SYM;
	pi->defaultvalue = 0.;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = false;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_g_crush_67")
	pi = self->__commonstate.params + 4;
	pi->name = "g_crush";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_crush_67;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_g_density_75")
	pi = self->__commonstate.params + 5;
	pi->name = "g_density";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_density_75;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.001;
	pi->outputmax = 60;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_g_mix_77")
	pi = self->__commonstate.params + 6;
	pi->name = "g_mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_mix_77;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_g_pitch_69")
	pi = self->__commonstate.params + 7;
	pi->name = "g_pitch";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_pitch_69;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -4;
	pi->outputmax = 4;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_g_pos_73")
	pi = self->__commonstate.params + 8;
	pi->name = "g_pos";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_pos_73;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_g_prob_76")
	pi = self->__commonstate.params + 9;
	pi->name = "g_prob";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_prob_76;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_g_regen_66")
	pi = self->__commonstate.params + 10;
	pi->name = "g_regen";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_regen_66;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 11 ("m_g_size_71")
	pi = self->__commonstate.params + 11;
	pi->name = "g_size";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_size_71;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 2;
	pi->outputmax = 2000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 12 ("m_g_skew_65")
	pi = self->__commonstate.params + 12;
	pi->name = "g_skew";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_skew_65;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 13 ("m_g_std_density_74")
	pi = self->__commonstate.params + 13;
	pi->name = "g_std_density";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_std_density_74;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 14 ("m_g_std_pos_72")
	pi = self->__commonstate.params + 14;
	pi->name = "g_std_pos";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_std_pos_72;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 15 ("m_g_std_size_70")
	pi = self->__commonstate.params + 15;
	pi->name = "g_std_size";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_std_size_70;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 16 ("m_g_window_68")
	pi = self->__commonstate.params + 16;
	pi->name = "g_window";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_g_window_68;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 17 ("m_gainout_80")
	pi = self->__commonstate.params + 17;
	pi->name = "gainout";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gainout_80;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -60;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 18 ("m_r_absorb_61")
	pi = self->__commonstate.params + 18;
	pi->name = "r_absorb";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_r_absorb_61;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 19 ("m_r_decay_62")
	pi = self->__commonstate.params + 19;
	pi->name = "r_decay";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_r_decay_62;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 110;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 20 ("m_r_depth_58")
	pi = self->__commonstate.params + 20;
	pi->name = "r_depth";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_r_depth_58;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 20;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 21 ("m_r_mix_64")
	pi = self->__commonstate.params + 21;
	pi->name = "r_mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_r_mix_64;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 22 ("m_r_size_63")
	pi = self->__commonstate.params + 22;
	pi->name = "r_size";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_r_size_63;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.5;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 23 ("m_r_speed_59")
	pi = self->__commonstate.params + 23;
	pi->name = "r_speed";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_r_speed_59;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 10;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 24 ("m_r_tilt_60")
	pi = self->__commonstate.params + 24;
	pi->name = "r_tilt";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_r_tilt_60;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -1;
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


} // aether_particle::
