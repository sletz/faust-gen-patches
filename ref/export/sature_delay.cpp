#include "sature_delay.h"

namespace sature_delay {

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
	Delay m_apR1_21;
	Delay m_apR2_20;
	Delay m_delayL_25;
	Delay m_apL1_23;
	Delay m_delayR_24;
	Delay m_apL2_22;
	int __exception;
	int vectorsize;
	t_sample m_h_smTime_19;
	t_sample m_h_tL_18;
	t_sample m_mix_bal_26;
	t_sample m_mode_28;
	t_sample m_tilt_32;
	t_sample m_fb_33;
	t_sample m_pingpong_27;
	t_sample m_freq_31;
	t_sample m_crush_29;
	t_sample m_diff_30;
	t_sample m_h_tR_17;
	t_sample m_h_noise_16;
	t_sample m_h_sag_15;
	t_sample m_h_dcRo_4;
	t_sample m_h_dcRi_5;
	t_sample m_h_dcLo_6;
	t_sample m_h_cnt_3;
	t_sample m_h_hR_1;
	t_sample m_h_hL_2;
	t_sample samplerate;
	t_sample m_time_34;
	t_sample m_h_dcLi_7;
	t_sample m_h_hR1_9;
	t_sample m_h_batLpR_13;
	t_sample m_h_batLpL_14;
	t_sample m_h_hR2_8;
	t_sample m_h_fb_env_12;
	t_sample m_h_hL2_10;
	t_sample m_h_hL1_11;
	t_sample __m_slide_37;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_hR_1 = ((int)0);
		m_h_hL_2 = ((int)0);
		m_h_cnt_3 = ((int)0);
		m_h_dcRo_4 = ((int)0);
		m_h_dcRi_5 = ((int)0);
		m_h_dcLo_6 = ((int)0);
		m_h_dcLi_7 = ((int)0);
		m_h_hR2_8 = ((int)0);
		m_h_hR1_9 = ((int)0);
		m_h_hL2_10 = ((int)0);
		m_h_hL1_11 = ((int)0);
		m_h_fb_env_12 = ((int)0);
		m_h_batLpR_13 = ((int)0);
		m_h_batLpL_14 = ((int)0);
		m_h_sag_15 = ((int)1);
		m_h_noise_16 = ((int)0);
		m_h_tR_17 = ((int)0);
		m_h_tL_18 = ((int)0);
		m_h_smTime_19 = ((int)0);
		m_apR2_20.reset("m_apR2_20", ((int)16000));
		m_apR1_21.reset("m_apR1_21", ((int)16000));
		m_apL2_22.reset("m_apL2_22", ((int)16000));
		m_apL1_23.reset("m_apL1_23", ((int)16000));
		m_delayR_24.reset("m_delayR_24", (samplerate * ((int)2)));
		m_delayL_25.reset("m_delayL_25", (samplerate * ((int)2)));
		m_mix_bal_26 = ((t_sample)0.5);
		m_pingpong_27 = ((int)0);
		m_mode_28 = ((int)0);
		m_crush_29 = ((int)0);
		m_diff_30 = ((int)0);
		m_freq_31 = ((int)1000);
		m_tilt_32 = ((int)0);
		m_fb_33 = ((t_sample)0.5);
		m_time_34 = ((int)250);
		__m_slide_37 = 0;
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
		int cond_35 = (m_mode_28 >= ((t_sample)0.5));
		t_sample iup_39 = (1 / maximum(1, fabs(((int)15000))));
		t_sample idown_40 = (1 / maximum(1, fabs(((int)15000))));
		t_sample diff_c = ((m_diff_30 <= ((int)0)) ? ((int)0) : ((m_diff_30 >= ((int)1)) ? ((int)1) : m_diff_30));
		t_sample v_dg = (diff_c * ((t_sample)0.81999999999999995));
		t_sample fb_raw = (((m_fb_33 <= ((int)0)) ? ((int)0) : ((m_fb_33 >= ((t_sample)1.2)) ? ((t_sample)1.2) : m_fb_33)) * ((t_sample)1.04));
		t_sample pp = ((m_pingpong_27 <= ((int)0)) ? ((int)0) : ((m_pingpong_27 >= ((int)1)) ? ((int)1) : m_pingpong_27));
		t_sample tmp_clamp_705 = ((m_mix_bal_26 <= ((int)0)) ? ((int)0) : ((m_mix_bal_26 >= ((int)1)) ? ((int)1) : m_mix_bal_26));
		t_sample tmp_clamp_707 = ((m_mix_bal_26 <= ((int)0)) ? ((int)0) : ((m_mix_bal_26 >= ((int)1)) ? ((int)1) : m_mix_bal_26));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample v_degL = ((int)0);
			t_sample v_degR = ((int)0);
			t_sample iftrue_36 = (((((int)1) - m_h_sag_15) * m_crush_29) * ((int)35));
			t_sample sag_droop = (cond_35 ? iftrue_36 : ((int)0));
			t_sample slide_input_38 = (((m_time_34 * (samplerate * 0.001)) + (noise() * ((t_sample)0.34999999999999998))) + sag_droop);
			__m_slide_37 = fixdenorm((__m_slide_37 + (((slide_input_38 > __m_slide_37) ? iup_39 : idown_40) * (slide_input_38 - __m_slide_37))));
			m_h_smTime_19 = __m_slide_37;
			t_sample v_tapL = m_delayL_25.read_cubic(m_h_smTime_19);
			t_sample v_tapR = m_delayR_24.read_cubic(m_h_smTime_19);
			if ((m_mode_28 < ((t_sample)0.5))) {
				t_sample return_41;
				t_sample return_42;
				t_sample return_43;
				t_sample return_44;
				t_sample return_45;
				digital_fx_d_d_d_d_d_d(v_tapL, v_tapR, m_crush_29, m_h_cnt_3, m_h_hL_2, m_h_hR_1, return_41, return_42, return_43, return_44, return_45);
				v_degL = return_41;
				v_degR = return_42;
				m_h_cnt_3 = return_43;
				m_h_hL_2 = return_44;
				m_h_hR_1 = return_45;
				m_h_sag_15 = (m_h_sag_15 + (((t_sample)0.001) * (((int)1) - m_h_sag_15)));
				
			} else {
				t_sample return_61;
				t_sample return_62;
				t_sample return_63;
				t_sample return_64;
				t_sample return_65;
				t_sample return_66;
				analog_fx_d_d_d_d_d_d_d(v_tapL, v_tapR, m_crush_29, m_h_sag_15, m_h_batLpL_14, m_h_batLpR_13, m_h_noise_16, return_61, return_62, return_63, return_64, return_65, return_66);
				v_degL = return_61;
				v_degR = return_62;
				m_h_sag_15 = return_63;
				m_h_batLpL_14 = return_64;
				m_h_batLpR_13 = return_65;
				m_h_noise_16 = return_66;
				
			};
			t_sample return_67;
			t_sample return_68;
			t_sample return_69;
			hpf40_clean_d_d_d(v_degL, m_h_hL1_11, m_h_hL2_10, return_67, return_68, return_69);
			t_sample v_hpL = return_67;
			m_h_hL1_11 = return_68;
			m_h_hL2_10 = return_69;
			t_sample return_70;
			t_sample return_71;
			t_sample return_72;
			hpf40_clean_d_d_d(v_degR, m_h_hR1_9, m_h_hR2_8, return_70, return_71, return_72);
			t_sample v_hpR = return_70;
			m_h_hR1_9 = return_71;
			m_h_hR2_8 = return_72;
			t_sample return_77;
			t_sample return_78;
			tilt_process_d_d_d_d(v_hpL, m_tilt_32, m_freq_31, m_h_tL_18, return_77, return_78);
			t_sample v_tiL = return_77;
			m_h_tL_18 = return_78;
			t_sample return_79;
			t_sample return_80;
			tilt_process_d_d_d_d(v_hpR, m_tilt_32, m_freq_31, m_h_tR_17, return_79, return_80);
			t_sample v_tiR = return_79;
			m_h_tR_17 = return_80;
			t_sample v_dfL = allpass_fx_d_d_del_i(allpass_fx_d_d_del_i(v_tiL, v_dg, m_apL1_23, ((int)23)), v_dg, m_apL2_22, ((int)51));
			t_sample v_dfR = allpass_fx_d_d_del_i(allpass_fx_d_d_del_i(v_tiR, v_dg, m_apR1_21, ((int)29)), v_dg, m_apR2_20, ((int)57));
			t_sample tmp_mix_698 = (v_tiL + (diff_c * (v_dfL - v_tiL)));
			t_sample v_procL = tmp_mix_698;
			t_sample tmp_mix_699 = (v_tiR + (diff_c * (v_dfR - v_tiR)));
			t_sample v_procR = tmp_mix_699;
			t_sample return_81;
			t_sample return_82;
			t_sample return_83;
			dcblock_clean_d_d_d(v_procL, m_h_dcLi_7, m_h_dcLo_6, return_81, return_82, return_83);
			t_sample v_cleanL = return_81;
			m_h_dcLi_7 = return_82;
			m_h_dcLo_6 = return_83;
			t_sample return_84;
			t_sample return_85;
			t_sample return_86;
			dcblock_clean_d_d_d(v_procR, m_h_dcRi_5, m_h_dcRo_4, return_84, return_85, return_86);
			t_sample v_cleanR = return_84;
			m_h_dcRi_5 = return_85;
			m_h_dcRo_4 = return_86;
			t_sample v_87 = tanh(v_cleanL);
			t_sample v_finalL = ((v_87 <= ((int)-1)) ? ((int)-1) : ((v_87 >= ((int)1)) ? ((int)1) : v_87));
			t_sample v_88 = tanh(v_cleanR);
			t_sample v_finalR = ((v_88 <= ((int)-1)) ? ((int)-1) : ((v_88 >= ((int)1)) ? ((int)1) : v_88));
			t_sample maxa_89 = fabs(v_finalL);
			t_sample maxb_90 = fabs(v_finalR);
			t_sample peak_env = ((maxa_89 < maxb_90) ? maxb_90 : maxa_89);
			m_h_fb_env_12 = (m_h_fb_env_12 + (((t_sample)0.0050000000000000001) * (peak_env - m_h_fb_env_12)));
			t_sample maxb_91 = (m_h_fb_env_12 - ((t_sample)0.34999999999999998));
			t_sample agc_duck = safediv(((int)1), (((int)1) + (((((int)0) < maxb_91) ? maxb_91 : ((int)0)) * ((t_sample)1.6000000000000001))));
			t_sample minb_92 = (fb_raw * agc_duck);
			t_sample v_fb_eff = ((minb_92 < ((t_sample)1.04)) ? minb_92 : ((t_sample)1.04));
			t_sample pp_in = ((in1 + in2) * ((t_sample)0.5));
			t_sample tmp_mix_700 = (in1 + (pp * (pp_in - in1)));
			t_sample tmp_mix_701 = (v_finalL + (pp * (v_finalR - v_finalL)));
			t_sample tmp_v_feedL_486 = (tmp_mix_700 + (tmp_mix_701 * v_fb_eff));
			t_sample tmp_mix_702 = (in2 + (pp * (((int)0) - in2)));
			t_sample tmp_mix_703 = (v_finalR + (pp * (v_finalL - v_finalR)));
			t_sample tmp_v_feedR_487 = (tmp_mix_702 + (tmp_mix_703 * v_fb_eff));
			m_delayL_25.write(fixdenorm(tmp_v_feedL_486));
			m_delayR_24.write(fixdenorm(tmp_v_feedR_487));
			t_sample tmp_mix_704 = (in1 + (tmp_clamp_705 * (v_finalL - in1)));
			t_sample tmp_expr_489 = tmp_mix_704;
			t_sample tmp_mix_706 = (in2 + (tmp_clamp_707 * (v_finalR - in2)));
			t_sample tmp_expr_490 = tmp_mix_706;
			t_sample out2 = tmp_expr_490;
			t_sample out1 = tmp_expr_489;
			m_apR2_20.step();
			m_apR1_21.step();
			m_apL2_22.step();
			m_apL1_23.step();
			m_delayR_24.step();
			m_delayL_25.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_mix_bal(t_param _value) {
		m_mix_bal_26 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_pingpong(t_param _value) {
		m_pingpong_27 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_mode(t_param _value) {
		m_mode_28 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_crush(t_param _value) {
		m_crush_29 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_diff(t_param _value) {
		m_diff_30 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_freq(t_param _value) {
		m_freq_31 = (_value < 40 ? 40 : (_value > 15000 ? 15000 : _value));
	};
	inline void set_tilt(t_param _value) {
		m_tilt_32 = (_value < -1 ? -1 : (_value > 1 ? 1 : _value));
	};
	inline void set_fb(t_param _value) {
		m_fb_33 = (_value < 0 ? 0 : (_value > 1.2 ? 1.2 : _value));
	};
	inline void set_time(t_param _value) {
		m_time_34 = (_value < 1 ? 1 : (_value > 2000 ? 2000 : _value));
	};
	inline void digital_fx_d_d_d_d_d_d(t_sample sigL, t_sample sigR, t_sample amt, t_sample count, t_sample hL, t_sample hR, t_sample& out1, t_sample& out2, t_sample& out3, t_sample& out4, t_sample& out5) {
		t_sample c_log = (((int)1) - safepow((((int)1) - amt), ((int)3)));
		t_sample tmp_pow_683 = safepow(c_log, ((int)2));
		t_sample tmp_mix_682 = (((int)1) + (tmp_pow_683 * (((int)32) - ((int)1))));
		t_sample period = floor(tmp_mix_682);
		t_sample cnt = (count + ((int)1));
		t_sample newL = hL;
		t_sample newR = hR;
		if ((cnt >= period)) {
			newL = sigL;
			newR = sigR;
			cnt = ((int)0);
			
		};
		t_sample tmp_mix_684 = (((int)24) + (c_log * (((t_sample)4.5) - ((int)24))));
		t_sample st = safepow(((int)2), tmp_mix_684);
		t_sample yL = (safediv(floor(((fabs(newL) * st) + ((t_sample)0.5))), st) * ((newL > 0) ? 1 : ((newL < 0) ? -1 : 0)));
		t_sample yR = (safediv(floor(((fabs(newR) * st) + ((t_sample)0.5))), st) * ((newR > 0) ? 1 : ((newR < 0) ? -1 : 0)));
		out1 = (yL * ((t_sample)0.97999999999999998));
		out2 = (yR * ((t_sample)0.97999999999999998));
		out3 = cnt;
		out4 = newL;
		out5 = newR;
		
	};
	inline void analog_fx_d_d_d_d_d_d_d(t_sample sigL, t_sample sigR, t_sample amt, t_sample m_h_sag_15, t_sample h_lpfL, t_sample h_lpfR, t_sample m_h_noise_16, t_sample& out1, t_sample& out2, t_sample& out3, t_sample& out4, t_sample& out5, t_sample& out6) {
		t_sample maxa_46 = fabs(sigL);
		t_sample maxb_47 = fabs(sigR);
		t_sample draw = ((maxa_46 < maxb_47) ? maxb_47 : maxa_46);
		t_sample tmp_pow_686 = safepow(amt, ((t_sample)0.84999999999999998));
		t_sample tmp_mix_685 = (((int)1) + (tmp_pow_686 * (((t_sample)0.28000000000000003) - ((int)1))));
		t_sample v_nom = tmp_mix_685;
		t_sample maxb_48 = safediv(v_nom, (((int)1) + ((draw * amt) * ((t_sample)3.5))));
		t_sample v_target = ((((t_sample)0.12) < maxb_48) ? maxb_48 : ((t_sample)0.12));
		int cond_49 = (v_target < m_h_sag_15);
		t_sample iftrue_50 = (((int)1) - exp(safediv((-((int)1)), (((t_sample)0.002) * samplerate))));
		t_sample iffalse_51 = (((int)1) - exp(safediv((-((int)1)), (((t_sample)0.12) * samplerate))));
		t_sample rc_coeff = (cond_49 ? iftrue_50 : iffalse_51);
		t_sample new_sag = (m_h_sag_15 + (rc_coeff * (v_target - m_h_sag_15)));
		t_sample minb_52 = (draw * ((int)50));
		t_sample presence = ((minb_52 < ((int)1)) ? minb_52 : ((int)1));
		t_sample tmp_noise_688 = noise();
		t_sample tmp_mix_687 = (m_h_noise_16 + (((t_sample)0.34999999999999998) * (tmp_noise_688 - m_h_noise_16)));
		t_sample new_noise = tmp_mix_687;
		t_sample crackle = (((new_noise * safepow(amt, ((t_sample)1.3999999999999999))) * ((t_sample)0.012)) * presence);
		t_sample thresh = ((safepow(amt, ((t_sample)1.6000000000000001)) * ((t_sample)0.029999999999999999)) * (((t_sample)1.2) - new_sag));
		t_sample yL = battery_stage_d_d_d_d_d(sigL, amt, new_sag, thresh, crackle);
		t_sample yR = battery_stage_d_d_d_d_d(sigR, amt, new_sag, thresh, crackle);
		t_sample v_60 = (((t_sample)0.45000000000000001) + (new_sag * ((t_sample)0.55000000000000004)));
		t_sample lp_cut = ((v_60 <= ((t_sample)0.45000000000000001)) ? ((t_sample)0.45000000000000001) : ((v_60 >= ((int)1)) ? ((int)1) : v_60));
		t_sample tmp_mix_689 = (h_lpfL + (lp_cut * (yL - h_lpfL)));
		t_sample fL = tmp_mix_689;
		t_sample tmp_mix_690 = (h_lpfR + (lp_cut * (yR - h_lpfR)));
		t_sample fR = tmp_mix_690;
		out1 = fL;
		out2 = fR;
		out3 = new_sag;
		out4 = fL;
		out5 = fR;
		out6 = new_noise;
		
	};
	inline t_sample battery_stage_d_d_d_d_d(t_sample x, t_sample amt, t_sample v_sag, t_sample thresh, t_sample crackle) {
		t_sample res = (x * ((t_sample)0.97999999999999998));
		if ((amt > ((t_sample)0.0001))) {
			t_sample ax = fabs(x);
			t_sample maxb_53 = (amt * ((t_sample)0.02));
			t_sample gate_w = ((((t_sample)0.002) < maxb_53) ? maxb_53 : ((t_sample)0.002));
			t_sample v_54 = safediv(((ax + crackle) - thresh), gate_w);
			t_sample cond_raw = ((v_54 <= ((int)0)) ? ((int)0) : ((v_54 >= ((int)1)) ? ((int)1) : v_54));
			t_sample cond = ((cond_raw * cond_raw) * (((int)3) - (((int)2) * cond_raw)));
			t_sample rail_pos = ((((t_sample)0.20000000000000001) < v_sag) ? v_sag : ((t_sample)0.20000000000000001));
			t_sample maxb_55 = (v_sag * ((t_sample)0.47999999999999998));
			t_sample rail_neg = ((((t_sample)0.10000000000000001) < maxb_55) ? maxb_55 : ((t_sample)0.10000000000000001));
			t_sample bias_shift = ((amt * ((t_sample)0.14000000000000001)) * rail_pos);
			t_sample driven = ((x * (((int)1) + (amt * ((t_sample)1.3999999999999999)))) + bias_shift);
			int cond_56 = (driven >= ((int)0));
			t_sample iftrue_57 = (rail_pos * tanh(safediv(driven, rail_pos)));
			t_sample iffalse_58 = (rail_neg * tanh(safediv(driven, rail_neg)));
			t_sample sat = (cond_56 ? iftrue_57 : iffalse_58);
			t_sample dc_bias = (rail_pos * tanh(safediv(bias_shift, rail_pos)));
			t_sample trim = safediv(((t_sample)0.97999999999999998), (((int)1) + (amt * ((t_sample)0.45000000000000001))));
			t_sample y = (((sat - dc_bias) * cond) * trim);
			t_sample min_59 = (-((t_sample)0.84999999999999998));
			res = ((y <= min_59) ? min_59 : ((y >= ((t_sample)0.84999999999999998)) ? ((t_sample)0.84999999999999998) : y));
			
		};
		return res;
		
	};
	inline void hpf40_clean_d_d_d(t_sample sig, t_sample s1, t_sample s2, t_sample& out1, t_sample& out2, t_sample& out3) {
		t_sample f_hpf = safediv(((int)40), samplerate);
		t_sample r_hpf = ((t_sample)0.70699999999999996);
		t_sample c_hpf = tan((((t_sample)3.1415899999999999) * f_hpf));
		t_sample a1_h = safediv(((int)1), ((((int)1) + (r_hpf * c_hpf)) + (c_hpf * c_hpf)));
		t_sample a2_h = ((-((int)2)) * a1_h);
		t_sample a3_h = a1_h;
		t_sample b1_h = ((((int)2) * a1_h) * ((c_hpf * c_hpf) - ((int)1)));
		t_sample b2_h = (a1_h * ((((int)1) - (r_hpf * c_hpf)) + (c_hpf * c_hpf)));
		t_sample y_hpf = ((a1_h * sig) + s1);
		t_sample new_s1 = (((a2_h * sig) - (b1_h * y_hpf)) + s2);
		t_sample new_s2 = ((a3_h * sig) - (b2_h * y_hpf));
		out1 = y_hpf;
		out2 = new_s1;
		out3 = new_s2;
		
	};
	inline void tilt_process_d_d_d_d(t_sample sig, t_sample t_val, t_sample f_hinge, t_sample h_lp, t_sample& out1, t_sample& out2) {
		t_sample f_hz = ((f_hinge <= ((int)40)) ? ((int)40) : ((f_hinge >= ((int)18000)) ? ((int)18000) : f_hinge));
		t_sample v_73 = (((int)1) - exp(safediv(((-((t_sample)6.2831853071795862)) * f_hz), samplerate)));
		t_sample f_norm = ((v_73 <= ((t_sample)0.002)) ? ((t_sample)0.002) : ((v_73 >= ((t_sample)0.92000000000000004)) ? ((t_sample)0.92000000000000004) : v_73));
		t_sample tmp_mix_691 = (h_lp + (f_norm * (sig - h_lp)));
		t_sample lows = tmp_mix_691;
		t_sample highs = (sig - lows);
		int min_74 = (-((int)1));
		t_sample t_c = ((t_val <= min_74) ? min_74 : ((t_val >= ((int)1)) ? ((int)1) : t_val));
		t_sample tmp_mix_692 = (((int)1) + (t_c * (((t_sample)0.10000000000000001) - ((int)1))));
		t_sample tmp_neg_694 = (-t_c);
		t_sample tmp_mix_693 = (((int)1) + (tmp_neg_694 * (((t_sample)1.3) - ((int)1))));
		int cond_75 = (t_c >= ((int)0));
		t_sample g_low = (cond_75 ? tmp_mix_692 : tmp_mix_693);
		t_sample tmp_mix_695 = (((int)1) + (t_c * (((t_sample)1.3) - ((int)1))));
		t_sample tmp_neg_697 = (-t_c);
		t_sample tmp_mix_696 = (((int)1) + (tmp_neg_697 * (((t_sample)0.10000000000000001) - ((int)1))));
		int cond_76 = (t_c >= ((int)0));
		t_sample g_high = (cond_76 ? tmp_mix_695 : tmp_mix_696);
		t_sample y_tilt = ((lows * g_low) + (highs * g_high));
		out1 = y_tilt;
		out2 = lows;
		
	};
	inline t_sample allpass_fx_d_d_del_i(t_sample sig, t_sample g, Delay& dly, int sz_ms) {
		t_sample s_read = dly.read_linear((sz_ms * (samplerate * 0.001)));
		t_sample v_ap = (sig - (s_read * g));
		dly.write(v_ap);
		return (s_read + (v_ap * g));
		
	};
	inline void dcblock_clean_d_d_d(t_sample sig, t_sample p_in, t_sample p_out, t_sample& out1, t_sample& out2, t_sample& out3) {
		t_sample y_dc = ((sig - p_in) + (((t_sample)0.99970000000000003) * p_out));
		out1 = y_dc;
		out2 = sig;
		out3 = y_dc;
		
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
int num_params() { return 9; }

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
		case 0: self->set_crush(value); break;
		case 1: self->set_diff(value); break;
		case 2: self->set_fb(value); break;
		case 3: self->set_freq(value); break;
		case 4: self->set_mix_bal(value); break;
		case 5: self->set_mode(value); break;
		case 6: self->set_pingpong(value); break;
		case 7: self->set_tilt(value); break;
		case 8: self->set_time(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_crush_29; break;
		case 1: *value = self->m_diff_30; break;
		case 2: *value = self->m_fb_33; break;
		case 3: *value = self->m_freq_31; break;
		case 4: *value = self->m_mix_bal_26; break;
		case 5: *value = self->m_mode_28; break;
		case 6: *value = self->m_pingpong_27; break;
		case 7: *value = self->m_tilt_32; break;
		case 8: *value = self->m_time_34; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(9 * sizeof(ParamInfo));
	self->__commonstate.numparams = 9;
	// initialize parameter 0 ("m_crush_29")
	pi = self->__commonstate.params + 0;
	pi->name = "crush";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_crush_29;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_diff_30")
	pi = self->__commonstate.params + 1;
	pi->name = "diff";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_diff_30;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_fb_33")
	pi = self->__commonstate.params + 2;
	pi->name = "fb";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_fb_33;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1.2;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_freq_31")
	pi = self->__commonstate.params + 3;
	pi->name = "freq";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_31;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 40;
	pi->outputmax = 15000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_mix_bal_26")
	pi = self->__commonstate.params + 4;
	pi->name = "mix_bal";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_bal_26;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_mode_28")
	pi = self->__commonstate.params + 5;
	pi->name = "mode";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mode_28;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_pingpong_27")
	pi = self->__commonstate.params + 6;
	pi->name = "pingpong";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_pingpong_27;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_tilt_32")
	pi = self->__commonstate.params + 7;
	pi->name = "tilt";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_tilt_32;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -1;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_time_34")
	pi = self->__commonstate.params + 8;
	pi->name = "time";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_time_34;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 2000;
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


} // sature_delay::
