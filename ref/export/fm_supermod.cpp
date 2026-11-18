#include "fm_supermod.h"

namespace fm_supermod {

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
	Delay m_dly_L_2;
	Delay m_dly_R_1;
	int __exception;
	int vectorsize;
	t_sample m_mix_17;
	t_sample m_h_ph_car_R_15;
	t_sample m_h_ph_car_L_16;
	t_sample m_filter_lp_18;
	t_sample m_use_note_in_19;
	t_sample m_feedback_21;
	t_sample m_h_ph_mod_L_14;
	t_sample m_ratio_24;
	t_sample m_stereo_spread_20;
	t_sample m_quantize_23;
	t_sample m_fm_index_22;
	t_sample m_h_ph_mod_R_13;
	t_sample m_h_mod_L_12;
	t_sample m_h_mod_R_11;
	t_sample m_h_y1_R_4;
	t_sample m_h_x2_R_5;
	t_sample m_h_y2_R_3;
	t_sample samplerate;
	t_sample m_freq_25;
	t_sample m_h_x1_R_6;
	t_sample m_h_y1_L_8;
	t_sample m_h_y2_L_7;
	t_sample m_h_x1_L_10;
	t_sample m_h_x2_L_9;
	t_sample m_mode_26;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_dly_R_1.reset("m_dly_R_1", ((int)4800));
		m_dly_L_2.reset("m_dly_L_2", ((int)4800));
		m_h_y2_R_3 = ((int)0);
		m_h_y1_R_4 = ((int)0);
		m_h_x2_R_5 = ((int)0);
		m_h_x1_R_6 = ((int)0);
		m_h_y2_L_7 = ((int)0);
		m_h_y1_L_8 = ((int)0);
		m_h_x2_L_9 = ((int)0);
		m_h_x1_L_10 = ((int)0);
		m_h_mod_R_11 = ((int)0);
		m_h_mod_L_12 = ((int)0);
		m_h_ph_mod_R_13 = ((int)0);
		m_h_ph_mod_L_14 = ((int)0);
		m_h_ph_car_R_15 = ((int)0);
		m_h_ph_car_L_16 = ((int)0);
		m_mix_17 = ((int)100);
		m_filter_lp_18 = ((int)0);
		m_use_note_in_19 = ((int)0);
		m_stereo_spread_20 = ((int)50);
		m_feedback_21 = ((t_sample)0.25);
		m_fm_index_22 = ((t_sample)1.8);
		m_quantize_23 = ((int)0);
		m_ratio_24 = ((t_sample)1.4139999999999999);
		m_freq_25 = ((int)220);
		m_mode_26 = ((int)1);
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
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__in3 == 0) || (__in4 == 0) || (__out1 == 0) || (__out2 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		int cond_27 = (m_use_note_in_19 > ((t_sample)0.5));
		t_sample iffalse_29 = ((m_freq_25 < ((int)10)) ? ((int)10) : m_freq_25);
		t_sample spr = (m_stereo_spread_20 * ((t_sample)0.01));
		int cond_51 = (m_quantize_23 < ((t_sample)0.5));
		int cond_52 = (m_quantize_23 < ((t_sample)1.5));
		int cond_56 = (m_quantize_23 >= ((t_sample)1.5));
		t_sample risset_beat = (cond_56 ? ((t_sample)1.2) : ((int)0));
		int cond_60 = (m_use_note_in_19 > ((t_sample)0.5));
		int cond_62 = (m_mode_26 >= ((t_sample)2.5));
		t_sample spatial_offset = ((spr * ((t_sample)1.5707963267948966)) * ((t_sample)0.5));
		int cond_74 = (m_filter_lp_18 > ((t_sample)0.5));
		int cond_75 = (m_filter_lp_18 > ((t_sample)0.5));
		int cond_76 = (m_use_note_in_19 > ((t_sample)0.5));
		int cond_77 = (m_use_note_in_19 > ((t_sample)0.5));
		int cond_83 = (m_mode_26 < ((t_sample)1.5));
		int cond_84 = (m_mode_26 < ((t_sample)2.5));
		int cond_86 = (m_mode_26 < ((t_sample)1.5));
		int cond_87 = (m_mode_26 < ((t_sample)2.5));
		t_sample v_89 = (m_mix_17 * ((t_sample)0.01));
		t_sample mix_val = ((v_89 <= ((int)0)) ? ((int)0) : ((v_89 >= ((int)1)) ? ((int)1) : v_89));
		int is_active = (m_mode_26 >= ((t_sample)0.5));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			const t_sample in3 = (*(__in3++));
			const t_sample in4 = (*(__in4++));
			t_sample eff_note = ((in1 <= ((int)0)) ? ((int)0) : ((in1 >= ((int)128)) ? ((int)128) : in1));
			t_sample iftrue_28 = mtof(eff_note, ((int)440));
			t_sample f_base = (cond_27 ? iftrue_28 : iffalse_29);
			t_sample f_car_L = (f_base * (((int)1) - (spr * ((t_sample)0.0030000000000000001))));
			t_sample f_car_R = (f_base * (((int)1) + (spr * ((t_sample)0.0030000000000000001))));
			t_sample v_30 = (m_ratio_24 + (in2 * ((t_sample)0.050000000000000003)));
			t_sample raw_ratio = ((v_30 <= ((t_sample)0.01)) ? ((t_sample)0.01) : ((v_30 >= ((int)30)) ? ((int)30) : v_30));
			int cond_31 = (raw_ratio < ((t_sample)0.73999999999999999));
			int cond_32 = (raw_ratio < ((t_sample)1.05));
			int cond_33 = (raw_ratio < ((t_sample)1.3));
			int cond_34 = (raw_ratio < ((t_sample)1.55));
			int cond_35 = (raw_ratio < ((t_sample)1.8500000000000001));
			int cond_36 = (raw_ratio < ((t_sample)2.3700000000000001));
			int cond_37 = (raw_ratio < ((t_sample)2.8700000000000001));
			int cond_38 = (raw_ratio < ((t_sample)3.3799999999999999));
			int cond_39 = (raw_ratio < ((t_sample)3.9100000000000001));
			int cond_40 = (raw_ratio < ((t_sample)4.5));
			t_sample iffalse_41 = ((floor(raw_ratio) * ((t_sample)1.1899999999999999)) - ((t_sample)0.10000000000000001));
			t_sample iffalse_42 = (cond_40 ? ((t_sample)4.0700000000000003) : iffalse_41);
			t_sample iffalse_43 = (cond_39 ? ((t_sample)3.7599999999999998) : iffalse_42);
			t_sample iffalse_44 = (cond_38 ? ((int)3) : iffalse_43);
			t_sample iffalse_45 = (cond_37 ? ((t_sample)2.7400000000000002) : iffalse_44);
			t_sample iffalse_46 = (cond_36 ? ((int)2) : iffalse_45);
			t_sample iffalse_47 = (cond_35 ? ((t_sample)1.7) : iffalse_46);
			t_sample iffalse_48 = (cond_34 ? ((t_sample)1.4139999999999999) : iffalse_47);
			t_sample iffalse_49 = (cond_33 ? ((t_sample)1.1899999999999999) : iffalse_48);
			t_sample iffalse_50 = (cond_32 ? ((t_sample)0.92000000000000004) : iffalse_49);
			t_sample risset_ratio = (cond_31 ? ((t_sample)0.56000000000000005) : iffalse_50);
			t_sample maxb_53 = floor((raw_ratio + ((t_sample)0.5)));
			t_sample iftrue_54 = ((((int)1) < maxb_53) ? maxb_53 : ((int)1));
			t_sample iffalse_55 = (cond_52 ? iftrue_54 : risset_ratio);
			t_sample eff_ratio = (cond_51 ? raw_ratio : iffalse_55);
			t_sample f_mod_L = (f_car_L * eff_ratio);
			t_sample f_mod_R = (((f_car_R * eff_ratio) * (((int)1) + (spr * ((t_sample)0.002)))) + risset_beat);
			t_sample v_57 = (m_fm_index_22 + in3);
			t_sample eff_index = ((v_57 <= ((int)0)) ? ((int)0) : ((v_57 >= ((int)50)) ? ((int)50) : v_57));
			t_sample v_58 = (m_feedback_21 + in4);
			t_sample eff_fb = ((v_58 <= ((int)0)) ? ((int)0) : ((v_58 >= ((int)2)) ? ((int)2) : v_58));
			t_sample inc_mod_L = safediv((f_mod_L * ((t_sample)6.2831853071795862)), samplerate);
			t_sample inc_mod_R = safediv((f_mod_R * ((t_sample)6.2831853071795862)), samplerate);
			m_h_ph_mod_L_14 = wrap((m_h_ph_mod_L_14 + inc_mod_L), ((int)0), ((t_sample)6.2831853071795862));
			m_h_ph_mod_R_13 = wrap((m_h_ph_mod_R_13 + inc_mod_R), ((int)0), ((t_sample)6.2831853071795862));
			t_sample audio_in_L = in1;
			int cond_59 = (in2 != ((int)0));
			t_sample audio_in_R = (cond_59 ? in2 : in1);
			t_sample iffalse_61 = ((audio_in_L * ((t_sample)0.5)) + (audio_in_R * ((t_sample)0.5)));
			t_sample clean_audio_in = (cond_60 ? ((int)0) : iffalse_61);
			t_sample iftrue_63 = ((clean_audio_in * eff_index) * ((t_sample)0.5));
			t_sample audio_inject = (cond_62 ? iftrue_63 : ((int)0));
			t_sample raw_mod_L = sin(((m_h_ph_mod_L_14 + (m_h_mod_L_12 * eff_fb)) + audio_inject));
			t_sample raw_mod_R = sin(((m_h_ph_mod_R_13 + (m_h_mod_R_11 * eff_fb)) + audio_inject));
			m_h_mod_L_12 = fixdenorm(raw_mod_L);
			m_h_mod_R_11 = fixdenorm(raw_mod_R);
			t_sample inc_car_L = safediv((f_car_L * ((t_sample)6.2831853071795862)), samplerate);
			t_sample inc_car_R = safediv((f_car_R * ((t_sample)6.2831853071795862)), samplerate);
			m_h_ph_car_L_16 = wrap((m_h_ph_car_L_16 + inc_car_L), ((int)0), ((t_sample)6.2831853071795862));
			m_h_ph_car_R_15 = wrap((m_h_ph_car_R_15 + inc_car_R), ((int)0), ((t_sample)6.2831853071795862));
			t_sample bell_car_L = sin((m_h_ph_car_L_16 + (raw_mod_L * eff_index)));
			t_sample bell_car_R = sin(((m_h_ph_car_R_15 + spatial_offset) + (raw_mod_R * eff_index)));
			t_sample return_64;
			t_sample return_65;
			t_sample return_66;
			t_sample return_67;
			t_sample return_68;
			biquad_lp_d_d_d_d_d(bell_car_L, m_h_x1_L_10, m_h_x2_L_9, m_h_y1_L_8, m_h_y2_L_7, return_64, return_65, return_66, return_67, return_68);
			t_sample lp_s = return_64;
			m_h_x1_L_10 = return_65;
			m_h_x2_L_9 = return_66;
			m_h_y1_L_8 = return_67;
			m_h_y2_L_7 = return_68;
			t_sample return_69;
			t_sample return_70;
			t_sample return_71;
			t_sample return_72;
			t_sample return_73;
			biquad_lp_d_d_d_d_d(bell_car_R, m_h_x1_R_6, m_h_x2_R_5, m_h_y1_R_4, m_h_y2_R_3, return_69, return_70, return_71, return_72, return_73);
			t_sample lp_c = return_69;
			m_h_x1_R_6 = return_70;
			m_h_x2_R_5 = return_71;
			m_h_y1_R_4 = return_72;
			m_h_y2_R_3 = return_73;
			t_sample filt_car_L = (cond_74 ? lp_s : bell_car_L);
			t_sample filt_car_R = (cond_75 ? lp_c : bell_car_R);
			t_sample dry_L = (cond_76 ? ((int)0) : audio_in_L);
			t_sample dry_R = (cond_77 ? ((int)0) : audio_in_R);
			m_dly_L_2.write(dry_L);
			m_dly_R_1.write(dry_R);
			int has_audio = (((fabs(in1) > ((t_sample)0.0001)) || (fabs(in2) > ((t_sample)0.0001))) && (m_use_note_in_19 < ((t_sample)0.5)));
			t_sample iftrue_78 = ((dry_L * filt_car_L) * ((t_sample)1.5));
			t_sample iffalse_79 = (filt_car_L * ((t_sample)0.40000000000000002));
			t_sample m1_L = (has_audio ? iftrue_78 : iffalse_79);
			t_sample iftrue_80 = ((dry_R * filt_car_R) * ((t_sample)1.5));
			t_sample iffalse_81 = (filt_car_R * ((t_sample)0.40000000000000002));
			t_sample m1_R = (has_audio ? iftrue_80 : iffalse_81);
			t_sample minb_82 = ((eff_index * ((t_sample)0.080000000000000002)) + ((t_sample)0.10000000000000001));
			t_sample span_ms = ((minb_82 < ((t_sample)3.7999999999999998)) ? minb_82 : ((t_sample)3.7999999999999998));
			t_sample mod_time_L = ((((int)4) + (filt_car_L * span_ms)) * (samplerate * 0.001));
			t_sample mod_time_R = ((((int)4) + (filt_car_R * span_ms)) * (samplerate * 0.001));
			t_sample m2_L = m_dly_L_2.read_cubic(mod_time_L);
			t_sample m2_R = m_dly_R_1.read_cubic(mod_time_R);
			t_sample m3_L = (filt_car_L * ((t_sample)0.40000000000000002));
			t_sample m3_R = (filt_car_R * ((t_sample)0.40000000000000002));
			t_sample iffalse_85 = (cond_84 ? m2_L : m3_L);
			t_sample raw_wet_L = (cond_83 ? m1_L : iffalse_85);
			t_sample iffalse_88 = (cond_87 ? m2_R : m3_R);
			t_sample raw_wet_R = (cond_86 ? m1_R : iffalse_88);
			t_sample sat_wet_L = saturate_hot_d(raw_wet_L);
			t_sample sat_wet_R = saturate_hot_d(raw_wet_R);
			t_sample tmp_mix_772 = (dry_L + (mix_val * (sat_wet_L - dry_L)));
			t_sample active_out_L = tmp_mix_772;
			t_sample tmp_mix_773 = (dry_R + (mix_val * (sat_wet_R - dry_R)));
			t_sample active_out_R = tmp_mix_773;
			t_sample tmp_expr_275 = (is_active ? active_out_L : ((int)0));
			t_sample tmp_expr_276 = (is_active ? active_out_R : ((int)0));
			t_sample out1 = tmp_expr_275;
			t_sample out2 = tmp_expr_276;
			m_dly_R_1.step();
			m_dly_L_2.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_mix(t_param _value) {
		m_mix_17 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_filter_lp(t_param _value) {
		m_filter_lp_18 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_use_note_in(t_param _value) {
		m_use_note_in_19 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_stereo_spread(t_param _value) {
		m_stereo_spread_20 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_feedback(t_param _value) {
		m_feedback_21 = (_value < 0 ? 0 : (_value > 2 ? 2 : _value));
	};
	inline void set_fm_index(t_param _value) {
		m_fm_index_22 = (_value < 0 ? 0 : (_value > 50 ? 50 : _value));
	};
	inline void set_quantize(t_param _value) {
		m_quantize_23 = (_value < 0 ? 0 : (_value > 2 ? 2 : _value));
	};
	inline void set_ratio(t_param _value) {
		m_ratio_24 = (_value < 0.01 ? 0.01 : (_value > 30 ? 30 : _value));
	};
	inline void set_freq(t_param _value) {
		m_freq_25 = (_value < 20 ? 20 : (_value > 10000 ? 10000 : _value));
	};
	inline void set_mode(t_param _value) {
		m_mode_26 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void biquad_lp_d_d_d_d_d(t_sample sig, t_sample x1, t_sample x2, t_sample y1, t_sample y2, t_sample& out1, t_sample& out2, t_sample& out3, t_sample& out4, t_sample& out5) {
		t_sample y = (((((sig * ((t_sample)0.46899999999999997)) + (x1 * ((t_sample)0.93799999999999994))) + (x2 * ((t_sample)0.46899999999999997))) - (y1 * ((t_sample)0.73999999999999999))) - (y2 * ((t_sample)0.13700000000000001)));
		out1 = y;
		out2 = sig;
		out3 = x1;
		out4 = y;
		out5 = y1;
		
	};
	inline t_sample saturate_hot_d(t_sample x) {
		t_sample b = (x + (((t_sample)0.080000000000000002) * (x * fabs(x))));
		return (tanh((b * ((t_sample)1.25))) * ((t_sample)0.94999999999999996));
		
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 4;
int gen_kernel_numouts = 2;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 10; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio L / Note IN", "Audio R / Ratio Mod IN", "FM Index CV (0..100)", "Feedback Depth CV (-2..2)" };
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
		case 0: self->set_feedback(value); break;
		case 1: self->set_filter_lp(value); break;
		case 2: self->set_fm_index(value); break;
		case 3: self->set_freq(value); break;
		case 4: self->set_mix(value); break;
		case 5: self->set_mode(value); break;
		case 6: self->set_quantize(value); break;
		case 7: self->set_ratio(value); break;
		case 8: self->set_stereo_spread(value); break;
		case 9: self->set_use_note_in(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_feedback_21; break;
		case 1: *value = self->m_filter_lp_18; break;
		case 2: *value = self->m_fm_index_22; break;
		case 3: *value = self->m_freq_25; break;
		case 4: *value = self->m_mix_17; break;
		case 5: *value = self->m_mode_26; break;
		case 6: *value = self->m_quantize_23; break;
		case 7: *value = self->m_ratio_24; break;
		case 8: *value = self->m_stereo_spread_20; break;
		case 9: *value = self->m_use_note_in_19; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(10 * sizeof(ParamInfo));
	self->__commonstate.numparams = 10;
	// initialize parameter 0 ("m_feedback_21")
	pi = self->__commonstate.params + 0;
	pi->name = "feedback";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_feedback_21;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 2;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_filter_lp_18")
	pi = self->__commonstate.params + 1;
	pi->name = "filter_lp";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_filter_lp_18;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_fm_index_22")
	pi = self->__commonstate.params + 2;
	pi->name = "fm_index";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_fm_index_22;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 50;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_freq_25")
	pi = self->__commonstate.params + 3;
	pi->name = "freq";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_25;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 10000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_mix_17")
	pi = self->__commonstate.params + 4;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_17;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_mode_26")
	pi = self->__commonstate.params + 5;
	pi->name = "mode";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mode_26;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_quantize_23")
	pi = self->__commonstate.params + 6;
	pi->name = "quantize";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_quantize_23;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 2;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_ratio_24")
	pi = self->__commonstate.params + 7;
	pi->name = "ratio";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_ratio_24;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 30;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_stereo_spread_20")
	pi = self->__commonstate.params + 8;
	pi->name = "stereo_spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_stereo_spread_20;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_use_note_in_19")
	pi = self->__commonstate.params + 9;
	pi->name = "use_note_in";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_use_note_in_19;
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


} // fm_supermod::
