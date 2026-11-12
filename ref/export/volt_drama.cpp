#include "volt_drama.h"

namespace volt_drama {

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
	DCBlock __m_dcblock_51;
	DCBlock __m_dcblock_50;
	Delay m_uni_d4_12;
	Delay m_uni_d3_13;
	Delay m_uni_d2_14;
	Delay m_uni_d1_15;
	Delay m_delayL_7;
	Delay m_delayR_6;
	int __exception;
	int vectorsize;
	t_sample m_mix_global_28;
	t_sample m_cutoff_29;
	t_sample m_spread_30;
	t_sample m_h_dc_L_4;
	t_sample m_uni_mix_26;
	t_sample m_gainout_27;
	t_sample m_uni_detune_25;
	t_sample m_time_31;
	t_sample m_shape_33;
	t_sample __m_slide_41;
	t_sample __m_slide_44;
	t_sample m_feedback_32;
	t_sample __m_slide_38;
	t_sample m_drive_34;
	t_sample __m_slide_35;
	t_sample m_uni_width_24;
	t_sample m_h_lp1_L_23;
	t_sample m_h_lp2_L_22;
	t_sample m_h_ph1_11;
	t_sample m_h_dc_out_L_3;
	t_sample m_h_dc_R_2;
	t_sample m_h_ph2_10;
	t_sample m_h_ph4_8;
	t_sample m_h_ph3_9;
	t_sample m_h_env_5;
	t_sample m_h_dc_out_R_1;
	t_sample m_h_lp4_R_16;
	t_sample m_h_lp3_L_21;
	t_sample samplerate;
	t_sample m_h_lp4_L_20;
	t_sample m_h_lp3_R_17;
	t_sample m_h_lp2_R_18;
	t_sample m_h_lp1_R_19;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_dc_out_R_1 = ((int)0);
		m_h_dc_R_2 = ((int)0);
		m_h_dc_out_L_3 = ((int)0);
		m_h_dc_L_4 = ((int)0);
		m_h_env_5 = ((int)0);
		m_delayR_6.reset("m_delayR_6", ((int)48000));
		m_delayL_7.reset("m_delayL_7", ((int)48000));
		m_h_ph4_8 = ((int)0);
		m_h_ph3_9 = ((int)0);
		m_h_ph2_10 = ((int)0);
		m_h_ph1_11 = ((int)0);
		m_uni_d4_12.reset("m_uni_d4_12", ((int)2400));
		m_uni_d3_13.reset("m_uni_d3_13", ((int)2400));
		m_uni_d2_14.reset("m_uni_d2_14", ((int)2400));
		m_uni_d1_15.reset("m_uni_d1_15", ((int)2400));
		m_h_lp4_R_16 = ((int)0);
		m_h_lp3_R_17 = ((int)0);
		m_h_lp2_R_18 = ((int)0);
		m_h_lp1_R_19 = ((int)0);
		m_h_lp4_L_20 = ((int)0);
		m_h_lp3_L_21 = ((int)0);
		m_h_lp2_L_22 = ((int)0);
		m_h_lp1_L_23 = ((int)0);
		m_uni_width_24 = ((int)100);
		m_uni_detune_25 = ((int)30);
		m_uni_mix_26 = ((int)50);
		m_gainout_27 = ((int)0);
		m_mix_global_28 = ((int)50);
		m_cutoff_29 = ((int)20000);
		m_spread_30 = ((int)10);
		m_time_31 = ((int)250);
		m_feedback_32 = ((t_sample)0.40000000000000002);
		m_shape_33 = ((t_sample)0.5);
		m_drive_34 = ((t_sample)0.29999999999999999);
		__m_slide_35 = 0;
		__m_slide_38 = 0;
		__m_slide_41 = 0;
		__m_slide_44 = 0;
		__m_dcblock_50.reset();
		__m_dcblock_51.reset();
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
		t_sample iup_36 = (1 / maximum(1, fabs(((int)2000))));
		t_sample idown_37 = (1 / maximum(1, fabs(((int)2000))));
		t_sample iup_39 = (1 / maximum(1, fabs(((int)2000))));
		t_sample idown_40 = (1 / maximum(1, fabs(((int)2000))));
		t_sample iup_42 = (1 / maximum(1, fabs(((int)2000))));
		t_sample idown_43 = (1 / maximum(1, fabs(((int)2000))));
		t_sample iup_45 = (1 / maximum(1, fabs(((int)3000))));
		t_sample idown_46 = (1 / maximum(1, fabs(((int)3000))));
		t_sample v_48 = (((int)1) - exp(safediv((((t_sample)-6.2831853071795862) * m_cutoff_29), samplerate)));
		t_sample alpha = ((v_48 <= ((t_sample)0.0001)) ? ((t_sample)0.0001) : ((v_48 >= ((int)1)) ? ((int)1) : v_48));
		t_sample final_amp = dbtoa(m_gainout_27);
		t_sample d_val = (m_drive_34 * ((int)8));
		t_sample u_width = (m_uni_width_24 * ((t_sample)0.01));
		t_sample tmp_div_908 = (m_uni_mix_26 * ((t_sample)0.01));
		t_sample tmp_div_910 = (m_uni_mix_26 * ((t_sample)0.01));
		t_sample m_val = (m_mix_global_28 * ((t_sample)0.01));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			__m_slide_35 = fixdenorm((__m_slide_35 + (((m_time_31 > __m_slide_35) ? iup_36 : idown_37) * (m_time_31 - __m_slide_35))));
			t_sample s_time = __m_slide_35;
			__m_slide_38 = fixdenorm((__m_slide_38 + (((m_spread_30 > __m_slide_38) ? iup_39 : idown_40) * (m_spread_30 - __m_slide_38))));
			t_sample s_spread = __m_slide_38;
			__m_slide_41 = fixdenorm((__m_slide_41 + (((m_uni_detune_25 > __m_slide_41) ? iup_42 : idown_43) * (m_uni_detune_25 - __m_slide_41))));
			t_sample s_detune = __m_slide_41;
			__m_slide_44 = fixdenorm((__m_slide_44 + (((m_feedback_32 > __m_slide_44) ? iup_45 : idown_46) * (m_feedback_32 - __m_slide_44))));
			t_sample s_fb = __m_slide_44;
			t_sample fb_amount = (safepow(s_fb, ((int)2)) * ((t_sample)1.1499999999999999));
			t_sample v_47 = (((int)1) - (s_fb * ((t_sample)1.5)));
			t_sample ghost_amt = ((v_47 <= ((int)0)) ? ((int)0) : ((v_47 >= ((t_sample)0.40000000000000002)) ? ((t_sample)0.40000000000000002) : v_47));
			t_sample d_samps = (s_time * (samplerate * 0.001));
			t_sample spr_samps = (s_spread * (samplerate * 0.001));
			t_sample tapL_main = m_delayL_7.read_linear(d_samps);
			t_sample tapR_main = m_delayR_6.read_linear((d_samps + spr_samps));
			t_sample tapL_ghost = m_delayL_7.read_linear((d_samps * ((t_sample)0.61799999999999999)));
			t_sample tapR_ghost = m_delayR_6.read_linear(((d_samps + spr_samps) * ((t_sample)0.61799999999999999)));
			t_sample tmp_mix_889 = (tapL_main + (ghost_amt * (tapL_ghost - tapL_main)));
			t_sample tapL_sum = tmp_mix_889;
			t_sample tmp_mix_890 = (tapR_main + (ghost_amt * (tapR_ghost - tapR_main)));
			t_sample tapR_sum = tmp_mix_890;
			t_sample tmp_mul_892 = (fabs((in1 + in2)) * ((t_sample)0.5));
			t_sample tmp_mix_891 = (tmp_mul_892 + (((t_sample)0.10000000000000001) * (m_h_env_5 - tmp_mul_892)));
			m_h_env_5 = tmp_mix_891;
			int cond_49 = (m_h_env_5 > ((t_sample)0.59999999999999998));
			t_sample duck_f = (cond_49 ? ((t_sample)0.20000000000000001) : ((int)1));
			t_sample final_fb_gain = (fb_amount * duck_f);
			t_sample procL = (in1 + tapL_sum);
			t_sample procR = (in2 + tapR_sum);
			t_sample tmp_poly_shaper_894 = poly_shaper_d_d(procL, d_val);
			t_sample tmp_tarrabia_shaper_895 = tarrabia_shaper_d_d(procL, d_val);
			t_sample tmp_mix_893 = (tmp_poly_shaper_894 + (m_shape_33 * (tmp_tarrabia_shaper_895 - tmp_poly_shaper_894)));
			t_sample sigL = tmp_mix_893;
			t_sample tmp_poly_shaper_897 = poly_shaper_d_d(procR, d_val);
			t_sample tmp_tarrabia_shaper_898 = tarrabia_shaper_d_d(procR, d_val);
			t_sample tmp_mix_896 = (tmp_poly_shaper_897 + (m_shape_33 * (tmp_tarrabia_shaper_898 - tmp_poly_shaper_897)));
			t_sample sigR = tmp_mix_896;
			t_sample cleanL = (__m_dcblock_50(sigL) * ((t_sample)0.35481338923357547));
			t_sample cleanR = (__m_dcblock_51(sigR) * ((t_sample)0.35481338923357547));
			t_sample tmp_mix_899 = (m_h_lp1_L_23 + (alpha * (cleanL - m_h_lp1_L_23)));
			t_sample lp1_L = tmp_mix_899;
			m_h_lp1_L_23 = fixdenorm(lp1_L);
			t_sample tmp_mix_900 = (m_h_lp2_L_22 + (alpha * (lp1_L - m_h_lp2_L_22)));
			t_sample lp2_L = tmp_mix_900;
			m_h_lp2_L_22 = fixdenorm(lp2_L);
			t_sample tmp_mix_901 = (m_h_lp3_L_21 + (alpha * (lp2_L - m_h_lp3_L_21)));
			t_sample lp3_L = tmp_mix_901;
			m_h_lp3_L_21 = fixdenorm(lp3_L);
			t_sample tmp_mix_902 = (m_h_lp4_L_20 + (alpha * (lp3_L - m_h_lp4_L_20)));
			t_sample filt_L = tmp_mix_902;
			m_h_lp4_L_20 = fixdenorm(filt_L);
			t_sample tmp_mix_903 = (m_h_lp1_R_19 + (alpha * (cleanR - m_h_lp1_R_19)));
			t_sample lp1_R = tmp_mix_903;
			m_h_lp1_R_19 = fixdenorm(lp1_R);
			t_sample tmp_mix_904 = (m_h_lp2_R_18 + (alpha * (lp1_R - m_h_lp2_R_18)));
			t_sample lp2_R = tmp_mix_904;
			m_h_lp2_R_18 = fixdenorm(lp2_R);
			t_sample tmp_mix_905 = (m_h_lp3_R_17 + (alpha * (lp2_R - m_h_lp3_R_17)));
			t_sample lp3_R = tmp_mix_905;
			m_h_lp3_R_17 = fixdenorm(lp3_R);
			t_sample tmp_mix_906 = (m_h_lp4_R_16 + (alpha * (lp3_R - m_h_lp4_R_16)));
			t_sample filt_R = tmp_mix_906;
			m_h_lp4_R_16 = fixdenorm(filt_R);
			m_h_ph1_11 = wrap((m_h_ph1_11 + safediv(((t_sample)0.13), samplerate)), ((int)0), ((int)1));
			m_h_ph2_10 = wrap((m_h_ph2_10 + safediv(((t_sample)0.20999999999999999), samplerate)), ((int)0), ((int)1));
			m_h_ph3_9 = wrap((m_h_ph3_9 + safediv(((t_sample)0.37), samplerate)), ((int)0), ((int)1));
			m_h_ph4_8 = wrap((m_h_ph4_8 + safediv(((t_sample)0.48999999999999999), samplerate)), ((int)0), ((int)1));
			t_sample u_depth = ((s_detune * ((t_sample)0.20000000000000001)) * (samplerate * 0.001));
			t_sample mono_in = ((filt_L + filt_R) * ((t_sample)0.5));
			m_uni_d1_15.write(mono_in);
			m_uni_d2_14.write(mono_in);
			m_uni_d3_13.write(mono_in);
			m_uni_d4_12.write(mono_in);
			t_sample v1 = m_uni_d1_15.read_linear(((((int)10) * (samplerate * 0.001)) + (sin((m_h_ph1_11 * ((t_sample)6.2831853071795862))) * u_depth)));
			t_sample v2 = m_uni_d2_14.read_linear(((((int)15) * (samplerate * 0.001)) + (sin((m_h_ph2_10 * ((t_sample)6.2831853071795862))) * u_depth)));
			t_sample v3 = m_uni_d3_13.read_linear(((((int)12) * (samplerate * 0.001)) + (sin((m_h_ph3_9 * ((t_sample)6.2831853071795862))) * u_depth)));
			t_sample v4 = m_uni_d4_12.read_linear(((((int)18) * (samplerate * 0.001)) + (sin((m_h_ph4_8 * ((t_sample)6.2831853071795862))) * u_depth)));
			t_sample u_L = ((v1 + (v2 * ((t_sample)0.5))) + ((v3 * (((int)1) - u_width)) * ((t_sample)0.5)));
			t_sample u_R = ((v4 + (v3 * ((t_sample)0.5))) + ((v2 * (((int)1) - u_width)) * ((t_sample)0.5)));
			t_sample tmp_mix_907 = (filt_L + (tmp_div_908 * (u_L - filt_L)));
			t_sample wet_final_L = tmp_mix_907;
			t_sample tmp_mix_909 = (filt_R + (tmp_div_910 * (u_R - filt_R)));
			t_sample wet_final_R = tmp_mix_909;
			m_delayL_7.write(fixdenorm(tanh((filt_L * final_fb_gain))));
			m_delayR_6.write(fixdenorm(tanh((filt_R * final_fb_gain))));
			t_sample tmp_mix_911 = (in1 + (m_val * (wet_final_L - in1)));
			t_sample out_pre_L = tanh((tmp_mix_911 * final_amp));
			t_sample tmp_mix_912 = (in2 + (m_val * (wet_final_R - in2)));
			t_sample out_pre_R = tanh((tmp_mix_912 * final_amp));
			t_sample dcL = ((out_pre_L - m_h_dc_L_4) + (((t_sample)0.995) * m_h_dc_out_L_3));
			m_h_dc_L_4 = out_pre_L;
			m_h_dc_out_L_3 = dcL;
			t_sample tmp_expr_520 = dcL;
			t_sample dcR = ((out_pre_R - m_h_dc_R_2) + (((t_sample)0.995) * m_h_dc_out_R_1));
			m_h_dc_R_2 = out_pre_R;
			m_h_dc_out_R_1 = dcR;
			t_sample tmp_expr_521 = dcR;
			t_sample out2 = tmp_expr_521;
			t_sample out1 = tmp_expr_520;
			m_delayR_6.step();
			m_delayL_7.step();
			m_uni_d4_12.step();
			m_uni_d3_13.step();
			m_uni_d2_14.step();
			m_uni_d1_15.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_uni_width(t_param _value) {
		m_uni_width_24 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_uni_detune(t_param _value) {
		m_uni_detune_25 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_uni_mix(t_param _value) {
		m_uni_mix_26 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_gainout(t_param _value) {
		m_gainout_27 = (_value < -60 ? -60 : (_value > 12 ? 12 : _value));
	};
	inline void set_mix_global(t_param _value) {
		m_mix_global_28 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_cutoff(t_param _value) {
		m_cutoff_29 = (_value < 50 ? 50 : (_value > 20000 ? 20000 : _value));
	};
	inline void set_spread(t_param _value) {
		m_spread_30 = (_value < 0 ? 0 : (_value > 50 ? 50 : _value));
	};
	inline void set_time(t_param _value) {
		m_time_31 = (_value < 1 ? 1 : (_value > 1000 ? 1000 : _value));
	};
	inline void set_feedback(t_param _value) {
		m_feedback_32 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_shape(t_param _value) {
		m_shape_33 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_drive(t_param _value) {
		m_drive_34 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline t_sample poly_shaper_d_d(t_sample x, t_sample drive_val) {
		t_sample m = (x * drive_val);
		t_sample b = ((m * m) * ((t_sample)0.28000000000000003));
		return (safediv(m, (b + ((int)1))) * ((int)2));
		
	};
	inline t_sample tarrabia_shaper_d_d(t_sample x, t_sample drive_val) {
		t_sample d = ((((t_sample)0.94999999999999996) < drive_val) ? ((t_sample)0.94999999999999996) : drive_val);
		t_sample k = safediv((((int)2) * d), (((int)1) - d));
		return (safediv(((((int)1) + k) * x), (((int)1) + (k * fabs(x)))) * ((t_sample)0.78000000000000003));
		
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
int num_params() { return 11; }

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
		case 0: self->set_cutoff(value); break;
		case 1: self->set_drive(value); break;
		case 2: self->set_feedback(value); break;
		case 3: self->set_gainout(value); break;
		case 4: self->set_mix_global(value); break;
		case 5: self->set_shape(value); break;
		case 6: self->set_spread(value); break;
		case 7: self->set_time(value); break;
		case 8: self->set_uni_detune(value); break;
		case 9: self->set_uni_mix(value); break;
		case 10: self->set_uni_width(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_cutoff_29; break;
		case 1: *value = self->m_drive_34; break;
		case 2: *value = self->m_feedback_32; break;
		case 3: *value = self->m_gainout_27; break;
		case 4: *value = self->m_mix_global_28; break;
		case 5: *value = self->m_shape_33; break;
		case 6: *value = self->m_spread_30; break;
		case 7: *value = self->m_time_31; break;
		case 8: *value = self->m_uni_detune_25; break;
		case 9: *value = self->m_uni_mix_26; break;
		case 10: *value = self->m_uni_width_24; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(11 * sizeof(ParamInfo));
	self->__commonstate.numparams = 11;
	// initialize parameter 0 ("m_cutoff_29")
	pi = self->__commonstate.params + 0;
	pi->name = "cutoff";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_cutoff_29;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 50;
	pi->outputmax = 20000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_drive_34")
	pi = self->__commonstate.params + 1;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_34;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_feedback_32")
	pi = self->__commonstate.params + 2;
	pi->name = "feedback";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_feedback_32;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_gainout_27")
	pi = self->__commonstate.params + 3;
	pi->name = "gainout";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gainout_27;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -60;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_mix_global_28")
	pi = self->__commonstate.params + 4;
	pi->name = "mix_global";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_global_28;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_shape_33")
	pi = self->__commonstate.params + 5;
	pi->name = "shape";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_shape_33;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_spread_30")
	pi = self->__commonstate.params + 6;
	pi->name = "spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_spread_30;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 50;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_time_31")
	pi = self->__commonstate.params + 7;
	pi->name = "time";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_time_31;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 1000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_uni_detune_25")
	pi = self->__commonstate.params + 8;
	pi->name = "uni_detune";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_uni_detune_25;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_uni_mix_26")
	pi = self->__commonstate.params + 9;
	pi->name = "uni_mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_uni_mix_26;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_uni_width_24")
	pi = self->__commonstate.params + 10;
	pi->name = "uni_width";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_uni_width_24;
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


} // volt_drama::
