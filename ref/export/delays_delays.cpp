#include "delays_delays.h"

namespace delays_delays {

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
	Data m_last_sync_state_31;
	Data m_out_table_35;
	Data m_mc_bus_36;
	Data m_filt_mem_37;
	Data m_dc_in_34;
	Data m_smooth_ms_32;
	Data m_dc_out_33;
	DCBlock __m_dcblock_101;
	DCBlock __m_dcblock_100;
	DCBlock __m_dcblock_98;
	DCBlock __m_dcblock_99;
	DCBlock __m_dcblock_42;
	DCBlock __m_dcblock_41;
	Delay m_dL_40;
	Delay m_dS_38;
	Delay m_dR_39;
	int __loopcount;
	int __exception;
	int vectorsize;
	t_sample m_clear_8;
	t_sample m_trig_timer_16;
	t_sample m_smooth_time_9;
	t_sample m_ducking_10;
	t_sample m_offset_11;
	t_sample m_f_type_7;
	t_sample m_f_start_6;
	t_sample m_f_end_5;
	t_sample m_f_direction_4;
	t_sample samplerate;
	t_sample m_spread_12;
	t_sample m_res_1;
	t_sample m_feedback_3;
	t_sample m_f_mix_2;
	t_sample m_mix_15;
	t_sample m_gain_13;
	t_sample m_env_fol_29;
	t_sample m_s_f_ed_20;
	t_sample m_s_f_st_21;
	t_sample m_s_res_19;
	t_sample m_h_amp_17;
	t_sample m_h_idx_18;
	t_sample m_prev_in_30;
	t_sample m_mc_mode_14;
	t_sample m_s_spr_24;
	t_sample m_s_mode_28;
	t_sample m_s_gn_23;
	t_sample m_s_f_mx_27;
	t_sample m_s_off_25;
	t_sample m_s_f_type_26;
	t_sample m_s_mx_22;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_res_1 = ((int)0);
		m_f_mix_2 = ((int)0);
		m_feedback_3 = ((int)0);
		m_f_direction_4 = ((int)0);
		m_f_end_5 = ((int)800);
		m_f_start_6 = ((int)16000);
		m_f_type_7 = ((int)0);
		m_clear_8 = ((int)0);
		m_smooth_time_9 = ((t_sample)0.90000000000000002);
		m_ducking_10 = ((int)0);
		m_offset_11 = ((int)0);
		m_spread_12 = ((int)0);
		m_gain_13 = ((int)1);
		m_mc_mode_14 = ((int)0);
		m_mix_15 = ((t_sample)0.5);
		m_trig_timer_16 = ((int)0);
		m_h_amp_17 = ((int)0);
		m_h_idx_18 = (-((int)1));
		m_s_res_19 = ((t_sample)0.5);
		m_s_f_ed_20 = ((int)800);
		m_s_f_st_21 = ((int)16000);
		m_s_mx_22 = ((int)0);
		m_s_gn_23 = ((int)0);
		m_s_spr_24 = ((int)0);
		m_s_off_25 = ((int)0);
		m_s_f_type_26 = ((int)0);
		m_s_f_mx_27 = ((int)0);
		m_s_mode_28 = ((int)0);
		m_env_fol_29 = ((int)0);
		m_prev_in_30 = ((int)0);
		m_last_sync_state_31.reset("last_sync_state", ((int)32), ((int)1));
		m_smooth_ms_32.reset("smooth_ms", ((int)32), ((int)1));
		m_dc_out_33.reset("dc_out", ((int)16), ((int)1));
		m_dc_in_34.reset("dc_in", ((int)16), ((int)1));
		m_out_table_35.reset("out_table", ((int)20), ((int)1));
		m_mc_bus_36.reset("mc_bus", ((int)16), ((int)1));
		m_filt_mem_37.reset("filt_mem", ((int)256), ((int)1));
		m_dS_38.reset("m_dS_38", ((int)1500000));
		m_dR_39.reset("m_dR_39", ((int)1500000));
		m_dL_40.reset("m_dL_40", ((int)1500000));
		__m_dcblock_41.reset();
		__m_dcblock_42.reset();
		__m_dcblock_98.reset();
		__m_dcblock_99.reset();
		__m_dcblock_100.reset();
		__m_dcblock_101.reset();
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
		t_sample * __out5 = __outs[4];
		t_sample * __out6 = __outs[5];
		t_sample * __out7 = __outs[6];
		t_sample * __out8 = __outs[7];
		t_sample * __out9 = __outs[8];
		t_sample * __out10 = __outs[9];
		t_sample * __out11 = __outs[10];
		t_sample * __out12 = __outs[11];
		t_sample * __out13 = __outs[12];
		t_sample * __out14 = __outs[13];
		t_sample * __out15 = __outs[14];
		t_sample * __out16 = __outs[15];
		t_sample * __out17 = __outs[16];
		t_sample * __out18 = __outs[17];
		t_sample * __out19 = __outs[18];
		t_sample * __out20 = __outs[19];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__out1 == 0) || (__out2 == 0) || (__out3 == 0) || (__out4 == 0) || (__out5 == 0) || (__out6 == 0) || (__out7 == 0) || (__out8 == 0) || (__out9 == 0) || (__out10 == 0) || (__out11 == 0) || (__out12 == 0) || (__out13 == 0) || (__out14 == 0) || (__out15 == 0) || (__out16 == 0) || (__out17 == 0) || (__out18 == 0) || (__out19 == 0) || (__out20 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		__loopcount = (__n * GENLIB_LOOPCOUNT_BAIL);
		t_sample v_47 = (m_f_mix_2 * ((t_sample)0.01));
		t_sample tmp_clamp_845 = ((v_47 <= ((int)0)) ? ((int)0) : ((v_47 >= ((int)1)) ? ((int)1) : v_47));
		t_sample tmp_clamp_847 = ((m_f_type_7 <= ((int)0)) ? ((int)0) : ((m_f_type_7 >= ((int)2)) ? ((int)2) : m_f_type_7));
		t_sample tmp_clamp_851 = ((m_gain_13 <= ((int)0)) ? ((int)0) : ((m_gain_13 >= ((int)5)) ? ((int)5) : m_gain_13));
		t_sample tmp_clamp_853 = ((m_mix_15 <= ((int)0)) ? ((int)0) : ((m_mix_15 >= ((int)1)) ? ((int)1) : m_mix_15));
		t_sample tmp_clamp_856 = ((m_f_start_6 <= ((int)20)) ? ((int)20) : ((m_f_start_6 >= ((int)16000)) ? ((int)16000) : m_f_start_6));
		t_sample tmp_clamp_858 = ((m_f_end_5 <= ((int)20)) ? ((int)20) : ((m_f_end_5 >= ((int)16000)) ? ((int)16000) : m_f_end_5));
		t_sample v_48 = (m_res_1 * ((t_sample)0.01));
		t_sample tmp_add_860 = (((t_sample)0.59999999999999998) + (((v_48 <= ((int)0)) ? ((int)0) : ((v_48 >= ((int)1)) ? ((int)1) : v_48)) * ((t_sample)0.38)));
		t_sample v_49 = (m_feedback_3 * ((t_sample)0.01));
		t_sample fb_amt = (safepow(((v_49 <= ((int)0)) ? ((int)0) : ((v_49 >= ((int)1)) ? ((int)1) : v_49)), ((t_sample)1.2)) * ((t_sample)0.75));
		int cond_97 = (m_clear_8 > ((int)0));
		int mute = (cond_97 ? ((int)0) : ((int)1));
		int out_table_dim = m_out_table_35.dim;
		int out_table_channels = m_out_table_35.channels;
		bool index_ignore_112 = (((int)1) >= out_table_dim);
		bool index_ignore_113 = (((int)2) >= out_table_dim);
		bool index_ignore_114 = (((int)3) >= out_table_dim);
		bool index_ignore_115 = (((int)4) >= out_table_dim);
		bool index_ignore_116 = (((int)5) >= out_table_dim);
		bool index_ignore_117 = (((int)6) >= out_table_dim);
		bool index_ignore_118 = (((int)7) >= out_table_dim);
		bool index_ignore_119 = (((int)8) >= out_table_dim);
		bool index_ignore_120 = (((int)9) >= out_table_dim);
		bool index_ignore_121 = (((int)10) >= out_table_dim);
		bool index_ignore_122 = (((int)11) >= out_table_dim);
		bool index_ignore_123 = (((int)12) >= out_table_dim);
		bool index_ignore_124 = (((int)13) >= out_table_dim);
		bool index_ignore_125 = (((int)14) >= out_table_dim);
		bool index_ignore_126 = (((int)15) >= out_table_dim);
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample in1_c = __m_dcblock_41(in1);
			t_sample in2_c = __m_dcblock_42(in2);
			t_sample in_abs = ((fabs(in1_c) + fabs(in2_c)) * ((t_sample)0.5));
			if ((((in_abs > ((t_sample)0.0050000000000000001)) && (m_prev_in_30 == ((int)0))) && (m_trig_timer_16 == ((int)0)))) {
				m_trig_timer_16 = ((int)4800);
				
			};
			int ui_master_trig = (m_trig_timer_16 > ((int)0));
			t_sample maxb_43 = (m_trig_timer_16 - ((int)1));
			m_trig_timer_16 = ((((int)0) < maxb_43) ? maxb_43 : ((int)0));
			m_prev_in_30 = (in_abs > ((t_sample)0.0050000000000000001));
			int cond_44 = (in_abs > m_env_fol_29);
			t_sample tmp_switch_841 = (cond_44 ? ((t_sample)0.20000000000000001) : ((t_sample)0.00080000000000000004));
			t_sample tmp_mix_840 = (m_env_fol_29 + (tmp_switch_841 * (in_abs - m_env_fol_29)));
			m_env_fol_29 = tmp_mix_840;
			t_sample v_45 = (m_env_fol_29 * ((int)5));
			t_sample tmp_sub_843 = (((int)1) - (safepow(((v_45 <= ((int)0)) ? ((int)0) : ((v_45 >= ((int)1)) ? ((int)1) : v_45)), ((t_sample)1.5)) * ((t_sample)0.94999999999999996)));
			t_sample tmp_mix_842 = (((int)1) + (m_ducking_10 * (tmp_sub_843 - ((int)1))));
			t_sample duck = tmp_mix_842;
			// for loop initializer;
			int k = ((int)0);
			// for loop condition;
			// abort processing if an infinite loop is suspected;
			if (((__loopcount--) <= 0)) {
				__exception = GENLIB_ERR_LOOP_OVERFLOW;
				break ;
				
			};
			while ((k < ((int)16))) {
				// abort processing if an infinite loop is suspected;
				if (((__loopcount--) <= 0)) {
					__exception = GENLIB_ERR_LOOP_OVERFLOW;
					break ;
					
				};
				int mc_bus_dim = m_mc_bus_36.dim;
				int mc_bus_channels = m_mc_bus_36.channels;
				bool index_ignore_46 = ((k >= mc_bus_dim) || (k < 0));
				if ((!index_ignore_46)) {
					m_mc_bus_36.write(((int)0), k, 0);
					
				};
				// for loop increment;
				k = (k + ((int)1));
				
			};
			t_sample tmp_mix_844 = (m_s_f_mx_27 + (((t_sample)0.050000000000000003) * (tmp_clamp_845 - m_s_f_mx_27)));
			m_s_f_mx_27 = tmp_mix_844;
			t_sample tmp_mix_846 = (m_s_f_type_26 + (((t_sample)0.050000000000000003) * (tmp_clamp_847 - m_s_f_type_26)));
			m_s_f_type_26 = tmp_mix_846;
			t_sample tmp_mix_848 = (m_s_off_25 + (((t_sample)0.10000000000000001) * (m_offset_11 - m_s_off_25)));
			m_s_off_25 = tmp_mix_848;
			t_sample tmp_mix_849 = (m_s_spr_24 + (((t_sample)0.10000000000000001) * (m_spread_12 - m_s_spr_24)));
			m_s_spr_24 = tmp_mix_849;
			t_sample tmp_mix_850 = (m_s_gn_23 + (((t_sample)0.10000000000000001) * (tmp_clamp_851 - m_s_gn_23)));
			m_s_gn_23 = tmp_mix_850;
			t_sample tmp_mix_852 = (m_s_mx_22 + (((t_sample)0.10000000000000001) * (tmp_clamp_853 - m_s_mx_22)));
			m_s_mx_22 = tmp_mix_852;
			t_sample tmp_mix_854 = (m_s_mode_28 + (((t_sample)0.10000000000000001) * (m_mc_mode_14 - m_s_mode_28)));
			m_s_mode_28 = tmp_mix_854;
			t_sample tmp_mix_855 = (m_s_f_st_21 + (((t_sample)0.050000000000000003) * (tmp_clamp_856 - m_s_f_st_21)));
			m_s_f_st_21 = tmp_mix_855;
			t_sample tmp_mix_857 = (m_s_f_ed_20 + (((t_sample)0.050000000000000003) * (tmp_clamp_858 - m_s_f_ed_20)));
			m_s_f_ed_20 = tmp_mix_857;
			t_sample tmp_mix_859 = (m_s_res_19 + (((t_sample)0.050000000000000003) * (tmp_add_860 - m_s_res_19)));
			m_s_res_19 = tmp_mix_859;
			t_sample angle = (m_s_mx_22 * ((t_sample)1.57079632679));
			t_sample dry_v = cos(angle);
			t_sample wet_v = sin(angle);
			int cond_50 = (m_s_spr_24 < ((int)0));
			t_sample iftrue_51 = (((t_sample)0.4838709677419355) * (((int)1) + (m_s_spr_24 * ((t_sample)0.01))));
			t_sample iffalse_52 = (((t_sample)0.4838709677419355) + ((m_s_spr_24 * ((t_sample)0.01)) * ((int)2)));
			t_sample mc_step = (cond_50 ? iftrue_51 : iffalse_52);
			t_sample f_min = ((m_s_f_ed_20 < m_s_f_st_21) ? m_s_f_ed_20 : m_s_f_st_21);
			t_sample f_max = ((m_s_f_st_21 < m_s_f_ed_20) ? m_s_f_ed_20 : m_s_f_st_21);
			t_sample log_ratio = log(safediv(f_max, f_min));
			t_sample sumL = ((int)0);
			t_sample sumR = ((int)0);
			int tap_hit_pulse = ((int)0);
			// for loop initializer;
			int i = ((int)0);
			// for loop condition;
			while ((i < ((int)32))) {
				// abort processing if an infinite loop is suspected;
				if (((__loopcount--) <= 0)) {
					__exception = GENLIB_ERR_LOOP_OVERFLOW;
					break ;
					
				};
				int buf_taps_dim = buf_taps.dim;
				int buf_taps_channels = buf_taps.channels;
				bool index_ignore_53 = ((i >= buf_taps_dim) || (i < 0));
				// samples buf_taps channel 1;
				t_sample t_target = (index_ignore_53 ? 0 : buf_taps.read(i, 0));
				bool index_ignore_54 = ((i >= buf_taps_dim) || (i < 0));
				// samples buf_taps channel 1;
				bool chan_ignore_55 = ((1 < 0) || (1 >= buf_taps_channels));
				t_sample t_amp = ((chan_ignore_55 || index_ignore_54) ? 0 : buf_taps.read(i, 1));
				int smooth_ms_dim = m_smooth_ms_32.dim;
				int smooth_ms_channels = m_smooth_ms_32.channels;
				bool index_ignore_56 = ((i >= smooth_ms_dim) || (i < 0));
				// samples smooth_ms channel 1;
				t_sample p_ms = (index_ignore_56 ? 0 : m_smooth_ms_32.read(i, 0));
				if ((p_ms <= ((int)0))) {
					p_ms = t_target;
					
				};
				t_sample tmp_sub_862 = (((int)1) - ((m_smooth_time_9 <= ((int)0)) ? ((int)0) : ((m_smooth_time_9 >= ((t_sample)0.999)) ? ((t_sample)0.999) : m_smooth_time_9)));
				t_sample tmp_mix_861 = (p_ms + (tmp_sub_862 * (t_target - p_ms)));
				t_sample c_ms = tmp_mix_861;
				bool index_ignore_57 = ((i >= smooth_ms_dim) || (i < 0));
				if ((!index_ignore_57)) {
					m_smooth_ms_32.write(c_ms, i, 0);
					
				};
				t_sample t_samp = (c_ms * (samplerate * 0.001));
				t_sample sigL = m_dL_40.read_linear(t_samp);
				t_sample tmp_div_864 = ((m_s_spr_24 + ((int)100)) * ((t_sample)0.0050000000000000001));
				t_sample tmp_mix_863 = (((int)0) + (tmp_div_864 * ((int)250)));
				t_sample sigR = m_dR_39.read_linear((t_samp + ((tmp_mix_863 * (i * ((t_sample)0.032258064516129031))) * (samplerate * 0.001))));
				int cond_58 = (m_f_direction_4 == ((int)0));
				t_sample iftrue_59 = (((int)1) - (i * ((t_sample)0.032258064516129031)));
				int cond_60 = (m_f_direction_4 == ((int)1));
				t_sample iftrue_61 = (i * ((t_sample)0.032258064516129031));
				int cond_62 = (m_f_direction_4 == ((int)2));
				t_sample iftrue_63 = fract((sin((i * ((t_sample)12.98))) * ((int)43758)));
				t_sample iffalse_64 = (cond_62 ? iftrue_63 : t_amp);
				t_sample iffalse_65 = (cond_60 ? iftrue_61 : iffalse_64);
				t_sample mod = (cond_58 ? iftrue_59 : iffalse_65);
				t_sample cutoff = (f_min * exp((mod * log_ratio)));
				t_sample f_coeff = safediv((cutoff * ((int)2)), samplerate);
				t_sample k_res = (((int)4) * m_s_res_19);
				int filt_mem_dim = m_filt_mem_37.dim;
				int filt_mem_channels = m_filt_mem_37.channels;
				bool index_ignore_66 = ((((i * ((int)8)) + ((int)0)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)0)) < 0));
				// samples filt_mem channel 1;
				t_sample l1 = (index_ignore_66 ? 0 : m_filt_mem_37.read(((i * ((int)8)) + ((int)0)), 0));
				bool index_ignore_67 = ((((i * ((int)8)) + ((int)1)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)1)) < 0));
				// samples filt_mem channel 1;
				t_sample l2 = (index_ignore_67 ? 0 : m_filt_mem_37.read(((i * ((int)8)) + ((int)1)), 0));
				bool index_ignore_68 = ((((i * ((int)8)) + ((int)2)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)2)) < 0));
				// samples filt_mem channel 1;
				t_sample l3 = (index_ignore_68 ? 0 : m_filt_mem_37.read(((i * ((int)8)) + ((int)2)), 0));
				bool index_ignore_69 = ((((i * ((int)8)) + ((int)3)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)3)) < 0));
				// samples filt_mem channel 1;
				t_sample l4 = (index_ignore_69 ? 0 : m_filt_mem_37.read(((i * ((int)8)) + ((int)3)), 0));
				t_sample l_in = (sigL - (k_res * tanh(l4)));
				t_sample tmp_l1_180 = (l1 + (f_coeff * (l_in - l1)));
				t_sample tmp_l2_181 = (l2 + (f_coeff * (tmp_l1_180 - l2)));
				t_sample tmp_l3_182 = (l3 + (f_coeff * (tmp_l2_181 - l3)));
				t_sample tmp_l4_183 = (l4 + (f_coeff * (tmp_l3_182 - l4)));
				bool index_ignore_70 = ((((i * ((int)8)) + ((int)0)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)0)) < 0));
				if ((!index_ignore_70)) {
					m_filt_mem_37.write(tmp_l1_180, ((i * ((int)8)) + ((int)0)), 0);
					
				};
				bool index_ignore_71 = ((((i * ((int)8)) + ((int)1)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)1)) < 0));
				if ((!index_ignore_71)) {
					m_filt_mem_37.write(tmp_l2_181, ((i * ((int)8)) + ((int)1)), 0);
					
				};
				bool index_ignore_72 = ((((i * ((int)8)) + ((int)2)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)2)) < 0));
				if ((!index_ignore_72)) {
					m_filt_mem_37.write(tmp_l3_182, ((i * ((int)8)) + ((int)2)), 0);
					
				};
				bool index_ignore_73 = ((((i * ((int)8)) + ((int)3)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)3)) < 0));
				if ((!index_ignore_73)) {
					m_filt_mem_37.write(tmp_l4_183, ((i * ((int)8)) + ((int)3)), 0);
					
				};
				bool index_ignore_74 = ((((i * ((int)8)) + ((int)4)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)4)) < 0));
				// samples filt_mem channel 1;
				t_sample r1 = (index_ignore_74 ? 0 : m_filt_mem_37.read(((i * ((int)8)) + ((int)4)), 0));
				bool index_ignore_75 = ((((i * ((int)8)) + ((int)5)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)5)) < 0));
				// samples filt_mem channel 1;
				t_sample r2 = (index_ignore_75 ? 0 : m_filt_mem_37.read(((i * ((int)8)) + ((int)5)), 0));
				bool index_ignore_76 = ((((i * ((int)8)) + ((int)6)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)6)) < 0));
				// samples filt_mem channel 1;
				t_sample r3 = (index_ignore_76 ? 0 : m_filt_mem_37.read(((i * ((int)8)) + ((int)6)), 0));
				bool index_ignore_77 = ((((i * ((int)8)) + ((int)7)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)7)) < 0));
				// samples filt_mem channel 1;
				t_sample r4 = (index_ignore_77 ? 0 : m_filt_mem_37.read(((i * ((int)8)) + ((int)7)), 0));
				t_sample r_in = (sigR - (k_res * tanh(r4)));
				t_sample tmp_r1_188 = (r1 + (f_coeff * (r_in - r1)));
				t_sample tmp_r2_189 = (r2 + (f_coeff * (tmp_r1_188 - r2)));
				t_sample tmp_r3_190 = (r3 + (f_coeff * (tmp_r2_189 - r3)));
				t_sample tmp_r4_191 = (r4 + (f_coeff * (tmp_r3_190 - r4)));
				bool index_ignore_78 = ((((i * ((int)8)) + ((int)4)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)4)) < 0));
				if ((!index_ignore_78)) {
					m_filt_mem_37.write(tmp_r1_188, ((i * ((int)8)) + ((int)4)), 0);
					
				};
				bool index_ignore_79 = ((((i * ((int)8)) + ((int)5)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)5)) < 0));
				if ((!index_ignore_79)) {
					m_filt_mem_37.write(tmp_r2_189, ((i * ((int)8)) + ((int)5)), 0);
					
				};
				bool index_ignore_80 = ((((i * ((int)8)) + ((int)6)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)6)) < 0));
				if ((!index_ignore_80)) {
					m_filt_mem_37.write(tmp_r3_190, ((i * ((int)8)) + ((int)6)), 0);
					
				};
				bool index_ignore_81 = ((((i * ((int)8)) + ((int)7)) >= filt_mem_dim) || (((i * ((int)8)) + ((int)7)) < 0));
				if ((!index_ignore_81)) {
					m_filt_mem_37.write(tmp_r4_191, ((i * ((int)8)) + ((int)7)), 0);
					
				};
				t_sample tmp_add_866 = ((((sigL - (((int)4) * tmp_l1_180)) + (((int)6) * tmp_l2_181)) - (((int)4) * tmp_l3_182)) + tmp_l4_183);
				t_sample tmp_mix_865 = (tmp_l4_183 + (m_s_f_type_26 * (tmp_add_866 - tmp_l4_183)));
				t_sample tmp_add_868 = ((((sigL - (((int)4) * tmp_l1_180)) + (((int)6) * tmp_l2_181)) - (((int)4) * tmp_l3_182)) + tmp_l4_183);
				t_sample tmp_mul_869 = ((tmp_l2_181 - tmp_l4_183) * ((int)2));
				t_sample v_82 = (m_s_f_type_26 - ((int)1));
				t_sample tmp_clamp_870 = ((v_82 <= ((int)0)) ? ((int)0) : ((v_82 >= ((int)1)) ? ((int)1) : v_82));
				t_sample tmp_mix_867 = (tmp_add_868 + (tmp_clamp_870 * (tmp_mul_869 - tmp_add_868)));
				int cond_83 = (m_s_f_type_26 < ((int)1));
				t_sample resL = (cond_83 ? tmp_mix_865 : tmp_mix_867);
				t_sample tmp_add_872 = ((((sigR - (((int)4) * tmp_r1_188)) + (((int)6) * tmp_r2_189)) - (((int)4) * tmp_r3_190)) + tmp_r4_191);
				t_sample tmp_mix_871 = (tmp_r4_191 + (m_s_f_type_26 * (tmp_add_872 - tmp_r4_191)));
				t_sample tmp_add_874 = ((((sigR - (((int)4) * tmp_r1_188)) + (((int)6) * tmp_r2_189)) - (((int)4) * tmp_r3_190)) + tmp_r4_191);
				t_sample tmp_mul_875 = ((tmp_r2_189 - tmp_r4_191) * ((int)2));
				t_sample v_84 = (m_s_f_type_26 - ((int)1));
				t_sample tmp_clamp_876 = ((v_84 <= ((int)0)) ? ((int)0) : ((v_84 >= ((int)1)) ? ((int)1) : v_84));
				t_sample tmp_mix_873 = (tmp_add_874 + (tmp_clamp_876 * (tmp_mul_875 - tmp_add_874)));
				int cond_85 = (m_s_f_type_26 < ((int)1));
				t_sample resR = (cond_85 ? tmp_mix_871 : tmp_mix_873);
				t_sample tmp_mix_877 = (sigL + (m_s_f_mx_27 * (resL - sigL)));
				t_sample fL = (tmp_mix_877 * t_amp);
				t_sample tmp_mix_878 = (sigR + (m_s_f_mx_27 * (resR - sigR)));
				t_sample fR = (tmp_mix_878 * t_amp);
				sumL = (sumL + fL);
				sumR = (sumR + fR);
				t_sample mono = ((fL + fR) * ((t_sample)0.5));
				t_sample pos = wrap(((m_s_off_25 * ((int)16)) + (i * mc_step)), ((int)0), ((int)16));
				t_sample idx = floor(pos);
				t_sample fr = fract(pos);
				t_sample idx2 = wrap((idx + ((int)1)), ((int)0), ((int)16));
				int mc_bus_dim = m_mc_bus_36.dim;
				int mc_bus_channels = m_mc_bus_36.channels;
				int index_trunc_86 = fixnan(floor(idx));
				bool index_ignore_87 = ((index_trunc_86 >= mc_bus_dim) || (index_trunc_86 < 0));
				// samples mc_bus channel 1;
				t_sample tmp_peek_172 = (index_ignore_87 ? 0 : m_mc_bus_36.read(index_trunc_86, 0));
				t_sample tmp_peek_173 = idx;
				int index_trunc_88 = fixnan(floor(idx));
				bool index_ignore_89 = ((index_trunc_88 >= mc_bus_dim) || (index_trunc_88 < 0));
				if ((!index_ignore_89)) {
					m_mc_bus_36.write((tmp_peek_172 + (mono * (((int)1) - fr))), index_trunc_88, 0);
					
				};
				int index_trunc_90 = fixnan(floor(idx2));
				bool index_ignore_91 = ((index_trunc_90 >= mc_bus_dim) || (index_trunc_90 < 0));
				// samples mc_bus channel 1;
				t_sample tmp_peek_174 = (index_ignore_91 ? 0 : m_mc_bus_36.read(index_trunc_90, 0));
				t_sample tmp_peek_175 = idx2;
				int index_trunc_92 = fixnan(floor(idx2));
				bool index_ignore_93 = ((index_trunc_92 >= mc_bus_dim) || (index_trunc_92 < 0));
				if ((!index_ignore_93)) {
					m_mc_bus_36.write((tmp_peek_174 + (mono * fr)), index_trunc_92, 0);
					
				};
				t_sample maxb_94 = (c_ms - ((int)5));
				t_sample sS = m_dS_38.read_step((((((int)0) < maxb_94) ? maxb_94 : ((int)0)) * (samplerate * 0.001)));
				int is_hit = (sS > ((t_sample)0.5));
				int last_sync_state_dim = m_last_sync_state_31.dim;
				int last_sync_state_channels = m_last_sync_state_31.channels;
				bool index_ignore_95 = ((i >= last_sync_state_dim) || (i < 0));
				// samples last_sync_state channel 1;
				t_sample tmp_peek_176 = (index_ignore_95 ? 0 : m_last_sync_state_31.read(i, 0));
				t_sample tmp_peek_177 = i;
				if ((is_hit && (tmp_peek_176 == ((int)0)))) {
					tap_hit_pulse = ((int)1);
					m_h_idx_18 = i;
					m_h_amp_17 = t_amp;
					
				};
				bool index_ignore_96 = ((i >= last_sync_state_dim) || (i < 0));
				if ((!index_ignore_96)) {
					m_last_sync_state_31.write(is_hit, i, 0);
					
				};
				// for loop increment;
				i = (i + ((int)1));
				
			};
			m_dL_40.write(((in1_c + ((__m_dcblock_98(tanh((sumL * ((t_sample)0.050000000000000003)))) * fb_amt) * duck)) * mute));
			m_dR_39.write(((in2_c + ((__m_dcblock_99(tanh((sumR * ((t_sample)0.050000000000000003)))) * fb_amt) * duck)) * mute));
			m_dS_38.write((ui_master_trig * mute));
			t_sample gn = (((m_s_gn_23 * duck) * wet_v) * mute);
			t_sample dry = (dry_v * mute);
			t_sample s_L = ((in1 * dry) + (__m_dcblock_100(tanh((sumL * ((t_sample)0.10000000000000001)))) * gn));
			t_sample s_R = ((in2 * dry) + (__m_dcblock_101(tanh((sumR * ((t_sample)0.10000000000000001)))) * gn));
			// for loop initializer;
			int n = ((int)0);
			// for loop condition;
			while ((n < ((int)16))) {
				// abort processing if an infinite loop is suspected;
				if (((__loopcount--) <= 0)) {
					__exception = GENLIB_ERR_LOOP_OVERFLOW;
					break ;
					
				};
				int mc_bus_dim = m_mc_bus_36.dim;
				int mc_bus_channels = m_mc_bus_36.channels;
				bool index_ignore_102 = ((n >= mc_bus_dim) || (n < 0));
				// samples mc_bus channel 1;
				t_sample tmp_peek_178 = (index_ignore_102 ? 0 : m_mc_bus_36.read(n, 0));
				t_sample tmp_peek_179 = n;
				t_sample raw_mc = tanh((tmp_peek_178 * ((t_sample)0.25)));
				int dc_in_dim = m_dc_in_34.dim;
				int dc_in_channels = m_dc_in_34.channels;
				bool index_ignore_103 = ((n >= dc_in_dim) || (n < 0));
				// samples dc_in channel 1;
				m_prev_in_30 = (index_ignore_103 ? 0 : m_dc_in_34.read(n, 0));
				int dc_out_dim = m_dc_out_33.dim;
				int dc_out_channels = m_dc_out_33.channels;
				bool index_ignore_104 = ((n >= dc_out_dim) || (n < 0));
				// samples dc_out channel 1;
				t_sample prev_out = (index_ignore_104 ? 0 : m_dc_out_33.read(n, 0));
				t_sample curr_dc = ((raw_mc - m_prev_in_30) + (((t_sample)0.995) * prev_out));
				bool index_ignore_105 = ((n >= dc_in_dim) || (n < 0));
				if ((!index_ignore_105)) {
					m_dc_in_34.write(raw_mc, n, 0);
					
				};
				bool index_ignore_106 = ((n >= dc_out_dim) || (n < 0));
				if ((!index_ignore_106)) {
					m_dc_out_33.write(curr_dc, n, 0);
					
				};
				t_sample mc = (curr_dc * gn);
				if ((n < ((int)2))) {
					int cond_107 = (n == ((int)0));
					mc = (mc + ((cond_107 ? in1 : in2) * dry));
					
				};
				int cond_108 = (n == ((int)0));
				int cond_109 = (n == ((int)1));
				t_sample iffalse_110 = (cond_109 ? s_R : ((int)0));
				t_sample tmp_switch_880 = (cond_108 ? s_L : iffalse_110);
				t_sample tmp_mix_879 = (tmp_switch_880 + (m_s_mode_28 * (mc - tmp_switch_880)));
				int out_table_dim = m_out_table_35.dim;
				int out_table_channels = m_out_table_35.channels;
				bool index_ignore_111 = ((n >= out_table_dim) || (n < 0));
				if ((!index_ignore_111)) {
					m_out_table_35.write(tmp_mix_879, n, 0);
					
				};
				// for loop increment;
				n = (n + ((int)1));
				
			};
			// samples out_table channel 1;
			t_sample tmp_expr_201 = m_out_table_35.read(0, 0);
			// samples out_table channel 1;
			t_sample tmp_expr_202 = (index_ignore_112 ? 0 : m_out_table_35.read(((int)1), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_203 = (index_ignore_113 ? 0 : m_out_table_35.read(((int)2), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_204 = (index_ignore_114 ? 0 : m_out_table_35.read(((int)3), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_205 = (index_ignore_115 ? 0 : m_out_table_35.read(((int)4), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_206 = (index_ignore_116 ? 0 : m_out_table_35.read(((int)5), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_207 = (index_ignore_117 ? 0 : m_out_table_35.read(((int)6), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_208 = (index_ignore_118 ? 0 : m_out_table_35.read(((int)7), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_209 = (index_ignore_119 ? 0 : m_out_table_35.read(((int)8), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_210 = (index_ignore_120 ? 0 : m_out_table_35.read(((int)9), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_211 = (index_ignore_121 ? 0 : m_out_table_35.read(((int)10), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_212 = (index_ignore_122 ? 0 : m_out_table_35.read(((int)11), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_213 = (index_ignore_123 ? 0 : m_out_table_35.read(((int)12), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_214 = (index_ignore_124 ? 0 : m_out_table_35.read(((int)13), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_215 = (index_ignore_125 ? 0 : m_out_table_35.read(((int)14), 0));
			// samples out_table channel 1;
			t_sample tmp_expr_216 = (index_ignore_126 ? 0 : m_out_table_35.read(((int)15), 0));
			int tmp_expr_217 = ui_master_trig;
			int tmp_expr_218 = tap_hit_pulse;
			t_sample tmp_expr_219 = m_h_idx_18;
			t_sample tmp_expr_220 = m_h_amp_17;
			t_sample out20 = tmp_expr_220;
			t_sample out19 = tmp_expr_219;
			t_sample out18 = tmp_expr_218;
			t_sample out17 = tmp_expr_217;
			t_sample out13 = tmp_expr_213;
			t_sample out16 = tmp_expr_216;
			t_sample out15 = tmp_expr_215;
			t_sample out14 = tmp_expr_214;
			t_sample out12 = tmp_expr_212;
			t_sample out11 = tmp_expr_211;
			t_sample out10 = tmp_expr_210;
			t_sample out9 = tmp_expr_209;
			t_sample out8 = tmp_expr_208;
			t_sample out7 = tmp_expr_207;
			t_sample out6 = tmp_expr_206;
			t_sample out5 = tmp_expr_205;
			t_sample out4 = tmp_expr_204;
			t_sample out3 = tmp_expr_203;
			t_sample out2 = tmp_expr_202;
			t_sample out1 = tmp_expr_201;
			m_dS_38.step();
			m_dR_39.step();
			m_dL_40.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			(*(__out4++)) = out4;
			(*(__out5++)) = out5;
			(*(__out6++)) = out6;
			(*(__out7++)) = out7;
			(*(__out8++)) = out8;
			(*(__out9++)) = out9;
			(*(__out10++)) = out10;
			(*(__out11++)) = out11;
			(*(__out12++)) = out12;
			(*(__out13++)) = out13;
			(*(__out14++)) = out14;
			(*(__out15++)) = out15;
			(*(__out16++)) = out16;
			(*(__out17++)) = out17;
			(*(__out18++)) = out18;
			(*(__out19++)) = out19;
			(*(__out20++)) = out20;
			
		};
		return __exception;
		
	};
	inline void set_res(t_param _value) {
		m_res_1 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_f_mix(t_param _value) {
		m_f_mix_2 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_feedback(t_param _value) {
		m_feedback_3 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_f_direction(t_param _value) {
		m_f_direction_4 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_f_end(t_param _value) {
		m_f_end_5 = (_value < 20 ? 20 : (_value > 20000 ? 20000 : _value));
	};
	inline void set_f_start(t_param _value) {
		m_f_start_6 = (_value < 20 ? 20 : (_value > 20000 ? 20000 : _value));
	};
	inline void set_f_type(t_param _value) {
		m_f_type_7 = (_value < 0 ? 0 : (_value > 2 ? 2 : _value));
	};
	inline void set_clear(t_param _value) {
		m_clear_8 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_smooth_time(t_param _value) {
		m_smooth_time_9 = (_value < 0 ? 0 : (_value > 0.999 ? 0.999 : _value));
	};
	inline void set_ducking(t_param _value) {
		m_ducking_10 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_offset(t_param _value) {
		m_offset_11 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_spread(t_param _value) {
		m_spread_12 = (_value < -100 ? -100 : (_value > 100 ? 100 : _value));
	};
	inline void set_gain(t_param _value) {
		m_gain_13 = (_value < 0 ? 0 : (_value > 5 ? 5 : _value));
	};
	inline void set_mc_mode(t_param _value) {
		m_mc_mode_14 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_mix(t_param _value) {
		m_mix_15 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_last_sync_state(void * _value) {
		m_last_sync_state_31.setbuffer(_value);
	};
	inline void set_smooth_ms(void * _value) {
		m_smooth_ms_32.setbuffer(_value);
	};
	inline void set_dc_out(void * _value) {
		m_dc_out_33.setbuffer(_value);
	};
	inline void set_dc_in(void * _value) {
		m_dc_in_34.setbuffer(_value);
	};
	inline void set_out_table(void * _value) {
		m_out_table_35.setbuffer(_value);
	};
	inline void set_mc_bus(void * _value) {
		m_mc_bus_36.setbuffer(_value);
	};
	inline void set_filt_mem(void * _value) {
		m_filt_mem_37.setbuffer(_value);
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 2;
int gen_kernel_numouts = 20;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 22; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "in left", "in right" };
const char *gen_kernel_outnames[] = { "out1", "out2", "out3", "out4", "out5", "out6", "out7", "out8", "out9", "out10", "out11", "out12", "out13", "out14", "out15", "out16", "mastertrig", "index", "taptrig", "amp" };

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
		case 1: self->set_dc_in(ref); break;
		case 2: self->set_dc_out(ref); break;
		case 3: self->set_ducking(value); break;
		case 4: self->set_f_direction(value); break;
		case 5: self->set_f_end(value); break;
		case 6: self->set_f_mix(value); break;
		case 7: self->set_f_start(value); break;
		case 8: self->set_f_type(value); break;
		case 9: self->set_feedback(value); break;
		case 10: self->set_filt_mem(ref); break;
		case 11: self->set_gain(value); break;
		case 12: self->set_last_sync_state(ref); break;
		case 13: self->set_mc_bus(ref); break;
		case 14: self->set_mc_mode(value); break;
		case 15: self->set_mix(value); break;
		case 16: self->set_offset(value); break;
		case 17: self->set_out_table(ref); break;
		case 18: self->set_res(value); break;
		case 19: self->set_smooth_ms(ref); break;
		case 20: self->set_smooth_time(value); break;
		case 21: self->set_spread(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_clear_8; break;
		
		
		case 3: *value = self->m_ducking_10; break;
		case 4: *value = self->m_f_direction_4; break;
		case 5: *value = self->m_f_end_5; break;
		case 6: *value = self->m_f_mix_2; break;
		case 7: *value = self->m_f_start_6; break;
		case 8: *value = self->m_f_type_7; break;
		case 9: *value = self->m_feedback_3; break;
		
		case 11: *value = self->m_gain_13; break;
		
		
		case 14: *value = self->m_mc_mode_14; break;
		case 15: *value = self->m_mix_15; break;
		case 16: *value = self->m_offset_11; break;
		
		case 18: *value = self->m_res_1; break;
		
		case 20: *value = self->m_smooth_time_9; break;
		case 21: *value = self->m_spread_12; break;
		
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
	// initialize parameter 0 ("m_clear_8")
	pi = self->__commonstate.params + 0;
	pi->name = "clear";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_clear_8;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_dc_in_34")
	pi = self->__commonstate.params + 1;
	pi->name = "dc_in";
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
	// initialize parameter 2 ("m_dc_out_33")
	pi = self->__commonstate.params + 2;
	pi->name = "dc_out";
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
	// initialize parameter 3 ("m_ducking_10")
	pi = self->__commonstate.params + 3;
	pi->name = "ducking";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_ducking_10;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_f_direction_4")
	pi = self->__commonstate.params + 4;
	pi->name = "f_direction";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_f_direction_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_f_end_5")
	pi = self->__commonstate.params + 5;
	pi->name = "f_end";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_f_end_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 20000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_f_mix_2")
	pi = self->__commonstate.params + 6;
	pi->name = "f_mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_f_mix_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_f_start_6")
	pi = self->__commonstate.params + 7;
	pi->name = "f_start";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_f_start_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 20000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_f_type_7")
	pi = self->__commonstate.params + 8;
	pi->name = "f_type";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_f_type_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 2;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_feedback_3")
	pi = self->__commonstate.params + 9;
	pi->name = "feedback";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_feedback_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_filt_mem_37")
	pi = self->__commonstate.params + 10;
	pi->name = "filt_mem";
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
	// initialize parameter 11 ("m_gain_13")
	pi = self->__commonstate.params + 11;
	pi->name = "gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_13;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 5;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 12 ("m_last_sync_state_31")
	pi = self->__commonstate.params + 12;
	pi->name = "last_sync_state";
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
	// initialize parameter 13 ("m_mc_bus_36")
	pi = self->__commonstate.params + 13;
	pi->name = "mc_bus";
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
	// initialize parameter 14 ("m_mc_mode_14")
	pi = self->__commonstate.params + 14;
	pi->name = "mc_mode";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mc_mode_14;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 15 ("m_mix_15")
	pi = self->__commonstate.params + 15;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_15;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 16 ("m_offset_11")
	pi = self->__commonstate.params + 16;
	pi->name = "offset";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_offset_11;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 17 ("m_out_table_35")
	pi = self->__commonstate.params + 17;
	pi->name = "out_table";
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
	// initialize parameter 18 ("m_res_1")
	pi = self->__commonstate.params + 18;
	pi->name = "res";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_res_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 19 ("m_smooth_ms_32")
	pi = self->__commonstate.params + 19;
	pi->name = "smooth_ms";
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
	// initialize parameter 20 ("m_smooth_time_9")
	pi = self->__commonstate.params + 20;
	pi->name = "smooth_time";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_smooth_time_9;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 0.999;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 21 ("m_spread_12")
	pi = self->__commonstate.params + 21;
	pi->name = "spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_spread_12;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -100;
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


} // delays_delays::
