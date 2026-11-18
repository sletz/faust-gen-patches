#include "fhickup.h"

namespace fhickup {

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
	t_sample m_mix_16;
	t_sample m_stereo_spread_17;
	t_sample m_h_env_15;
	t_sample m_h_ph_L_14;
	t_sample m_ringmod_18;
	t_sample m_hickmix_19;
	t_sample m_hickclick_20;
	t_sample m_filter_morph_23;
	t_sample m_h_ph_R_13;
	t_sample m_env_to_filt_22;
	t_sample m_hickfreq_21;
	t_sample m_h_rnd_L_12;
	t_sample m_h_rnd_R_11;
	t_sample m_h_gate_L_10;
	t_sample m_h_dc_x_R_2;
	t_sample m_h_dc_y_L_3;
	t_sample m_h_dc_y_R_1;
	t_sample samplerate;
	t_sample m_freq_24;
	t_sample m_h_dc_x_L_4;
	t_sample m_h_svf_s1_R_6;
	t_sample m_h_gate_R_9;
	t_sample m_h_svf_s2_R_5;
	t_sample m_h_svf_s1_L_8;
	t_sample m_h_svf_s2_L_7;
	t_sample m_drive_25;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_dc_y_R_1 = ((int)0);
		m_h_dc_x_R_2 = ((int)0);
		m_h_dc_y_L_3 = ((int)0);
		m_h_dc_x_L_4 = ((int)0);
		m_h_svf_s2_R_5 = ((int)0);
		m_h_svf_s1_R_6 = ((int)0);
		m_h_svf_s2_L_7 = ((int)0);
		m_h_svf_s1_L_8 = ((int)0);
		m_h_gate_R_9 = ((int)1);
		m_h_gate_L_10 = ((int)1);
		m_h_rnd_R_11 = ((int)0);
		m_h_rnd_L_12 = ((int)0);
		m_h_ph_R_13 = ((int)0);
		m_h_ph_L_14 = ((int)0);
		m_h_env_15 = ((int)0);
		m_mix_16 = ((int)100);
		m_stereo_spread_17 = ((int)40);
		m_ringmod_18 = ((int)0);
		m_hickmix_19 = ((int)60);
		m_hickclick_20 = ((int)15);
		m_hickfreq_21 = ((int)8);
		m_env_to_filt_22 = ((int)0);
		m_filter_morph_23 = ((int)50);
		m_freq_24 = ((int)1200);
		m_drive_25 = ((int)15);
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
		t_sample maxb_28 = (((int)5) * (samplerate * 0.001));
		t_sample env_att = safediv(((int)1), ((((int)1) < maxb_28) ? maxb_28 : ((int)1)));
		t_sample maxb_29 = (((int)60) * (samplerate * 0.001));
		t_sample env_rel = safediv(((int)1), ((((int)1) < maxb_29) ? maxb_29 : ((int)1)));
		t_sample inc = safediv((((m_hickfreq_21 <= ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : ((m_hickfreq_21 >= ((int)1000)) ? ((int)1000) : m_hickfreq_21)) * ((t_sample)6.2831853071795862)), samplerate);
		t_sample maxb_34 = (((m_hickclick_20 <= ((t_sample)0.5)) ? ((t_sample)0.5) : ((m_hickclick_20 >= ((int)100)) ? ((int)100) : m_hickclick_20)) * (samplerate * 0.001));
		t_sample slew_samps = ((((int)1) < maxb_34) ? maxb_34 : ((int)1));
		t_sample slew_alpha = safediv(((int)1), slew_samps);
		t_sample v_35 = (m_ringmod_18 * ((t_sample)0.01));
		t_sample rm_amt = ((v_35 <= ((int)0)) ? ((int)0) : ((v_35 >= ((int)1)) ? ((int)1) : v_35));
		t_sample max_37 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample v_38 = (m_filter_morph_23 * ((t_sample)0.01));
		t_sample morph_pos = ((v_38 <= ((int)0)) ? ((int)0) : ((v_38 >= ((int)1)) ? ((int)1) : v_38));
		t_sample tmp_mul_784 = (morph_pos * ((int)2));
		t_sample tmp_mul_786 = ((morph_pos - ((t_sample)0.5)) * ((int)2));
		int cond_39 = (morph_pos < ((t_sample)0.5));
		t_sample tmp_mul_788 = (morph_pos * ((int)2));
		t_sample tmp_mul_790 = ((morph_pos - ((t_sample)0.5)) * ((int)2));
		int cond_40 = (morph_pos < ((t_sample)0.5));
		t_sample v_41 = (m_mix_16 * ((t_sample)0.01));
		t_sample mix_val = ((v_41 <= ((int)0)) ? ((int)0) : ((v_41 >= ((int)1)) ? ((int)1) : v_41));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			const t_sample in3 = (*(__in3++));
			const t_sample in4 = (*(__in4++));
			t_sample maxa_26 = fabs(in1);
			t_sample maxb_27 = fabs(in2);
			t_sample in_mag = ((maxa_26 < maxb_27) ? maxb_27 : maxa_26);
			int cond_30 = (in_mag > m_h_env_15);
			t_sample env_alpha = (cond_30 ? env_att : env_rel);
			m_h_env_15 = fixdenorm((m_h_env_15 + ((in_mag - m_h_env_15) * env_alpha)));
			t_sample v_31 = (m_drive_25 + in3);
			t_sample eff_drive = ((v_31 <= ((int)0)) ? ((int)0) : ((v_31 >= ((int)100)) ? ((int)100) : v_31));
			t_sample gain = (((int)1) + (safepow((eff_drive * ((t_sample)0.01)), ((t_sample)3.6640000000000001)) * ((int)1255)));
			t_sample atan_g = atan(gain);
			t_sample comp = (((int)1) - (((atan_g - ((t_sample)0.78539800000000004)) * ((t_sample)1.2732398096251836)) * ((t_sample)0.82000000000000006)));
			t_sample drv_scale = (((int)1) - ((eff_drive * ((t_sample)0.01)) * ((t_sample)0.80000000000000004)));
			t_sample sat_L = ((atan((in1 * gain)) * comp) * drv_scale);
			t_sample sat_R = ((atan((in2 * gain)) * comp) * drv_scale);
			t_sample new_ph_L = wrap((m_h_ph_L_14 + inc), ((int)0), ((t_sample)6.2831853071795862));
			t_sample new_ph_R = wrap((m_h_ph_R_13 + inc), ((int)0), ((t_sample)6.2831853071795862));
			if ((new_ph_L < m_h_ph_L_14)) {
				m_h_rnd_L_12 = noise();
				
			};
			if ((new_ph_R < m_h_ph_R_13)) {
				m_h_rnd_R_11 = noise();
				
			};
			m_h_ph_L_14 = new_ph_L;
			m_h_ph_R_13 = new_ph_R;
			int cond_32 = (m_h_rnd_L_12 < ((int)0));
			int raw_gate_L = (cond_32 ? ((int)1) : ((int)0));
			int cond_33 = (m_h_rnd_R_11 < ((int)0));
			int raw_gate_R = (cond_33 ? ((int)1) : ((int)0));
			m_h_gate_L_10 = fixdenorm((m_h_gate_L_10 + ((raw_gate_L - m_h_gate_L_10) * slew_alpha)));
			m_h_gate_R_9 = fixdenorm((m_h_gate_R_9 + ((raw_gate_R - m_h_gate_R_9) * slew_alpha)));
			t_sample bipolar_gate_L = ((m_h_gate_L_10 * ((int)2)) - ((int)1));
			t_sample bipolar_gate_R = ((m_h_gate_R_9 * ((int)2)) - ((int)1));
			t_sample tmp_mix_777 = (m_h_gate_L_10 + (rm_amt * (bipolar_gate_L - m_h_gate_L_10)));
			t_sample eff_gate_L = tmp_mix_777;
			t_sample tmp_mix_778 = (m_h_gate_R_9 + (rm_amt * (bipolar_gate_R - m_h_gate_R_9)));
			t_sample eff_gate_R = tmp_mix_778;
			t_sample v_36 = ((m_hickmix_19 * ((t_sample)0.01)) + (in4 * ((t_sample)0.01)));
			t_sample eff_hickmix = ((v_36 <= ((int)0)) ? ((int)0) : ((v_36 >= ((int)1)) ? ((int)1) : v_36));
			t_sample tmp_mul_780 = (sat_L * eff_gate_L);
			t_sample tmp_mix_779 = (sat_L + (eff_hickmix * (tmp_mul_780 - sat_L)));
			t_sample hick_sig_L = tmp_mix_779;
			t_sample tmp_mul_782 = (sat_R * eff_gate_R);
			t_sample tmp_mix_781 = (sat_R + (eff_hickmix * (tmp_mul_782 - sat_R)));
			t_sample hick_sig_R = tmp_mix_781;
			t_sample dc_L = ((hick_sig_L - m_h_dc_x_L_4) + (((t_sample)0.995) * m_h_dc_y_L_3));
			m_h_dc_x_L_4 = fixdenorm(hick_sig_L);
			m_h_dc_y_L_3 = fixdenorm(dc_L);
			t_sample dc_R = ((hick_sig_R - m_h_dc_x_R_2) + (((t_sample)0.995) * m_h_dc_y_R_1));
			m_h_dc_x_R_2 = fixdenorm(hick_sig_R);
			m_h_dc_y_R_1 = fixdenorm(dc_R);
			t_sample oct_shift = (((m_env_to_filt_22 * ((t_sample)0.01)) * m_h_env_15) * ((int)3));
			t_sample f_mod = (m_freq_24 * safepow(((int)2), oct_shift));
			t_sample f_clamped = ((f_mod <= ((int)50)) ? ((int)50) : ((f_mod >= max_37) ? max_37 : f_mod));
			t_sample g = tan(safediv((((t_sample)3.1415926535897931) * f_clamped), samplerate));
			t_sample hp_L = safediv(((dc_L - ((((t_sample)1.4144271570014144) + g) * m_h_svf_s1_L_8)) - m_h_svf_s2_L_7), ((((int)1) + (((t_sample)1.4144271570014144) * g)) + (g * g)));
			t_sample bp_L = ((g * hp_L) + m_h_svf_s1_L_8);
			t_sample lp_L = ((g * bp_L) + m_h_svf_s2_L_7);
			m_h_svf_s1_L_8 = fixdenorm(((g * hp_L) + bp_L));
			m_h_svf_s2_L_7 = fixdenorm(((g * bp_L) + lp_L));
			t_sample hp_R = safediv(((dc_R - ((((t_sample)1.4144271570014144) + g) * m_h_svf_s1_R_6)) - m_h_svf_s2_R_5), ((((int)1) + (((t_sample)1.4144271570014144) * g)) + (g * g)));
			t_sample bp_R = ((g * hp_R) + m_h_svf_s1_R_6);
			t_sample lp_R = ((g * bp_R) + m_h_svf_s2_R_5);
			m_h_svf_s1_R_6 = fixdenorm(((g * hp_R) + bp_R));
			m_h_svf_s2_R_5 = fixdenorm(((g * bp_R) + lp_R));
			t_sample tmp_mix_783 = (lp_L + (tmp_mul_784 * (bp_L - lp_L)));
			t_sample tmp_mix_785 = (bp_L + (tmp_mul_786 * (hp_L - bp_L)));
			t_sample filt_L = (cond_39 ? tmp_mix_783 : tmp_mix_785);
			t_sample tmp_mix_787 = (lp_R + (tmp_mul_788 * (bp_R - lp_R)));
			t_sample tmp_mix_789 = (bp_R + (tmp_mul_790 * (hp_R - bp_R)));
			t_sample filt_R = (cond_40 ? tmp_mix_787 : tmp_mix_789);
			t_sample wet_L = (tanh((filt_L * ((t_sample)1.2))) * ((t_sample)0.94999999999999996));
			t_sample wet_R = (tanh((filt_R * ((t_sample)1.2))) * ((t_sample)0.94999999999999996));
			t_sample tmp_mix_791 = (in1 + (mix_val * (wet_L - in1)));
			t_sample tmp_expr_261 = tmp_mix_791;
			t_sample tmp_mix_792 = (in2 + (mix_val * (wet_R - in2)));
			t_sample tmp_expr_262 = tmp_mix_792;
			t_sample out1 = tmp_expr_261;
			t_sample out2 = tmp_expr_262;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_mix(t_param _value) {
		m_mix_16 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_stereo_spread(t_param _value) {
		m_stereo_spread_17 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_ringmod(t_param _value) {
		m_ringmod_18 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_hickmix(t_param _value) {
		m_hickmix_19 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_hickclick(t_param _value) {
		m_hickclick_20 = (_value < 0.5 ? 0.5 : (_value > 100 ? 100 : _value));
	};
	inline void set_hickfreq(t_param _value) {
		m_hickfreq_21 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 1000 ? 1000 : _value));
	};
	inline void set_env_to_filt(t_param _value) {
		m_env_to_filt_22 = (_value < -100 ? -100 : (_value > 100 ? 100 : _value));
	};
	inline void set_filter_morph(t_param _value) {
		m_filter_morph_23 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_freq(t_param _value) {
		m_freq_24 = (_value < 50 ? 50 : (_value > 8000 ? 8000 : _value));
	};
	inline void set_drive(t_param _value) {
		m_drive_25 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
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

const char *gen_kernel_innames[] = { "Audio Left In", "Audio Right In", "Drive CV (0..100)", "Hickmix CV (0..100)" };
const char *gen_kernel_outnames[] = { "Processed Left", "Processed Right" };

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
		case 1: self->set_env_to_filt(value); break;
		case 2: self->set_filter_morph(value); break;
		case 3: self->set_freq(value); break;
		case 4: self->set_hickclick(value); break;
		case 5: self->set_hickfreq(value); break;
		case 6: self->set_hickmix(value); break;
		case 7: self->set_mix(value); break;
		case 8: self->set_ringmod(value); break;
		case 9: self->set_stereo_spread(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_drive_25; break;
		case 1: *value = self->m_env_to_filt_22; break;
		case 2: *value = self->m_filter_morph_23; break;
		case 3: *value = self->m_freq_24; break;
		case 4: *value = self->m_hickclick_20; break;
		case 5: *value = self->m_hickfreq_21; break;
		case 6: *value = self->m_hickmix_19; break;
		case 7: *value = self->m_mix_16; break;
		case 8: *value = self->m_ringmod_18; break;
		case 9: *value = self->m_stereo_spread_17; break;
		
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
	// initialize parameter 0 ("m_drive_25")
	pi = self->__commonstate.params + 0;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_25;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_env_to_filt_22")
	pi = self->__commonstate.params + 1;
	pi->name = "env_to_filt";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_env_to_filt_22;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -100;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_filter_morph_23")
	pi = self->__commonstate.params + 2;
	pi->name = "filter_morph";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_filter_morph_23;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_freq_24")
	pi = self->__commonstate.params + 3;
	pi->name = "freq";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_24;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 50;
	pi->outputmax = 8000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_hickclick_20")
	pi = self->__commonstate.params + 4;
	pi->name = "hickclick";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_hickclick_20;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.5;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_hickfreq_21")
	pi = self->__commonstate.params + 5;
	pi->name = "hickfreq";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_hickfreq_21;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 1000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_hickmix_19")
	pi = self->__commonstate.params + 6;
	pi->name = "hickmix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_hickmix_19;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_mix_16")
	pi = self->__commonstate.params + 7;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_16;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_ringmod_18")
	pi = self->__commonstate.params + 8;
	pi->name = "ringmod";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_ringmod_18;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_stereo_spread_17")
	pi = self->__commonstate.params + 9;
	pi->name = "stereo_spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_stereo_spread_17;
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


} // fhickup::
