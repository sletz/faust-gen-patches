#include "cswitch_tremolo.h"

namespace cswitch_tremolo {

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
	t_sample m_min_freq_15;
	t_sample m_filter_depth_16;
	t_sample m_max_freq_14;
	t_sample m_q_13;
	t_sample m_reset_12;
	t_sample m_rand_pan_17;
	t_sample m_slope_19;
	t_sample m_depth_18;
	t_sample m_time_rand_21;
	t_sample m_pwm_20;
	t_sample m_phase_11;
	t_sample m_last_trigger_10;
	t_sample m_noise_time_9;
	t_sample m_y2_r_2;
	t_sample m_y1_r_3;
	t_sample m_x2_r_1;
	t_sample samplerate;
	t_sample m_rate_22;
	t_sample m_x2_l_4;
	t_sample m_y1_l_6;
	t_sample m_y2_l_5;
	t_sample m_noise_pan_8;
	t_sample m_noise_filt_7;
	t_sample __m_slide_26;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_x2_r_1 = ((int)0);
		m_y2_r_2 = ((int)0);
		m_y1_r_3 = ((int)0);
		m_x2_l_4 = ((int)0);
		m_y2_l_5 = ((int)0);
		m_y1_l_6 = ((int)0);
		m_noise_filt_7 = ((int)0);
		m_noise_pan_8 = ((int)0);
		m_noise_time_9 = ((int)0);
		m_last_trigger_10 = ((int)0);
		m_phase_11 = ((int)0);
		m_reset_12 = ((int)0);
		m_q_13 = ((int)10);
		m_max_freq_14 = ((int)4000);
		m_min_freq_15 = ((int)200);
		m_filter_depth_16 = ((int)1);
		m_rand_pan_17 = ((int)1);
		m_depth_18 = ((int)1);
		m_slope_19 = ((int)2);
		m_pwm_20 = ((t_sample)0.5);
		m_time_rand_21 = ((int)0);
		m_rate_22 = ((int)10);
		__m_slide_26 = 0;
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
		t_sample smooth_freq_samps = (((t_sample)0.002) * samplerate);
		t_sample iup_27 = (1 / maximum(1, fabs(smooth_freq_samps)));
		t_sample idown_28 = (1 / maximum(1, fabs(smooth_freq_samps)));
		t_sample max_29 = (samplerate * ((t_sample)0.48999999999999999));
		t_sample effective_filter_depth = (m_filter_depth_16 * m_depth_18);
		t_sample effective_pan_amount = (m_rand_pan_17 * m_depth_18);
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			if ((m_reset_12 > ((int)0))) {
				m_phase_11 = ((int)0);
				m_last_trigger_10 = ((int)0);
				
			};
			t_sample tmp_pow_896 = safepow(((int)2), m_noise_time_9);
			t_sample tmp_mix_895 = (((int)1) + (m_time_rand_21 * (tmp_pow_896 - ((int)1))));
			t_sample time_mod = tmp_mix_895;
			t_sample effective_rate = safediv(m_rate_22, ((time_mod <= ((t_sample)0.050000000000000003)) ? ((t_sample)0.050000000000000003) : ((time_mod >= ((int)10)) ? ((int)10) : time_mod)));
			t_sample current_step = safediv(effective_rate, samplerate);
			m_phase_11 = fract((m_phase_11 + current_step));
			int trig = ((m_phase_11 < m_last_trigger_10) || (m_reset_12 > ((int)0)));
			m_last_trigger_10 = m_phase_11;
			if (trig) {
				m_noise_time_9 = noise();
				m_noise_pan_8 = noise();
				m_noise_filt_7 = noise();
				
			};
			t_sample grain_duration_sec = safediv(((int)1), (current_step * samplerate));
			t_sample v_23 = safediv((m_slope_19 * ((t_sample)0.001)), grain_duration_sec);
			t_sample fade_phase_length = ((v_23 <= ((t_sample)0.0001)) ? ((t_sample)0.0001) : ((v_23 >= ((t_sample)0.5)) ? ((t_sample)0.5) : v_23));
			t_sample v_24 = safediv(m_phase_11, fade_phase_length);
			t_sample attack_ramp = ((v_24 <= ((int)0)) ? ((int)0) : ((v_24 >= ((int)1)) ? ((int)1) : v_24));
			t_sample v_25 = safediv((m_pwm_20 - m_phase_11), fade_phase_length);
			t_sample decay_ramp = ((v_25 <= ((int)0)) ? ((int)0) : ((v_25 >= ((int)1)) ? ((int)1) : v_25));
			t_sample raw_envelope = ((decay_ramp < attack_ramp) ? decay_ramp : attack_ramp);
			t_sample mod_envelope = ((raw_envelope <= ((int)0)) ? ((int)0) : ((raw_envelope >= ((int)1)) ? ((int)1) : raw_envelope));
			t_sample random_01 = ((m_noise_filt_7 * ((t_sample)0.5)) + ((t_sample)0.5));
			t_sample tmp_mix_897 = (m_min_freq_15 + (random_01 * (m_max_freq_14 - m_min_freq_15)));
			t_sample target_freq = tmp_mix_897;
			__m_slide_26 = fixdenorm((__m_slide_26 + (((target_freq > __m_slide_26) ? iup_27 : idown_28) * (target_freq - __m_slide_26))));
			t_sample cf_smoothed = __m_slide_26;
			t_sample cf = ((cf_smoothed <= ((int)20)) ? ((int)20) : ((cf_smoothed >= max_29) ? max_29 : cf_smoothed));
			t_sample bw = safediv(cf, m_q_13);
			t_sample r = exp(safediv((((t_sample)-3.1415926535897931) * bw), samplerate));
			t_sample c = ((((int)2) * r) * cos(safediv((((t_sample)6.2831853071795862) * cf), samplerate)));
			t_sample g_bp = ((((int)1) - (r * r)) * ((t_sample)0.5));
			t_sample filtered_l = (((g_bp * (in1 - m_x2_l_4)) + (c * m_y1_l_6)) - ((r * r) * m_y2_l_5));
			m_x2_l_4 = in1;
			m_y2_l_5 = m_y1_l_6;
			m_y1_l_6 = filtered_l;
			t_sample filtered_r = (((g_bp * (in2 - m_x2_r_1)) + (c * m_y1_r_3)) - ((r * r) * m_y2_r_2));
			m_x2_r_1 = in2;
			m_y2_r_2 = m_y1_r_3;
			m_y1_r_3 = filtered_r;
			t_sample tmp_mix_898 = (in1 + (effective_filter_depth * (filtered_l - in1)));
			t_sample audio_filtered_l = tmp_mix_898;
			t_sample tmp_mix_899 = (in2 + (effective_filter_depth * (filtered_r - in2)));
			t_sample audio_filtered_r = tmp_mix_899;
			t_sample tmp_mix_900 = (((int)1) + (m_depth_18 * (mod_envelope - ((int)1))));
			t_sample mod_amp = tmp_mix_900;
			t_sample tmp_add_902 = ((m_noise_pan_8 * ((t_sample)0.5)) + ((t_sample)0.5));
			t_sample tmp_mix_901 = (((t_sample)0.5) + (effective_pan_amount * (tmp_add_902 - ((t_sample)0.5))));
			t_sample pan_pos = tmp_mix_901;
			t_sample pan_l = cos((pan_pos * ((t_sample)1.5707963267948966)));
			t_sample pan_r = sin((pan_pos * ((t_sample)1.5707963267948966)));
			t_sample tmp_expr_115 = ((audio_filtered_l * mod_amp) * pan_l);
			t_sample tmp_expr_116 = ((audio_filtered_r * mod_amp) * pan_r);
			int tmp_expr_117 = trig;
			t_sample tmp_expr_118 = mod_envelope;
			t_sample out4 = tmp_expr_118;
			t_sample out3 = tmp_expr_117;
			t_sample out2 = tmp_expr_116;
			t_sample out1 = tmp_expr_115;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			(*(__out4++)) = out4;
			
		};
		return __exception;
		
	};
	inline void set_reset(t_param _value) {
		m_reset_12 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_q(t_param _value) {
		m_q_13 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 50 ? 50 : _value));
	};
	inline void set_max_freq(t_param _value) {
		m_max_freq_14 = (_value < 20 ? 20 : (_value > 20000 ? 20000 : _value));
	};
	inline void set_min_freq(t_param _value) {
		m_min_freq_15 = (_value < 20 ? 20 : (_value > 20000 ? 20000 : _value));
	};
	inline void set_filter_depth(t_param _value) {
		m_filter_depth_16 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_rand_pan(t_param _value) {
		m_rand_pan_17 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_depth(t_param _value) {
		m_depth_18 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_slope(t_param _value) {
		m_slope_19 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_pwm(t_param _value) {
		m_pwm_20 = (_value < 0.01 ? 0.01 : (_value > 0.98999999999999999 ? 0.98999999999999999 : _value));
	};
	inline void set_time_rand(t_param _value) {
		m_time_rand_21 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_rate(t_param _value) {
		m_rate_22 = (_value < 0.01 ? 0.01 : (_value > 500 ? 500 : _value));
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
int num_params() { return 11; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "in1", "in2" };
const char *gen_kernel_outnames[] = { "audio L", "audio R", "trigger out", "scope out" };

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
		case 0: self->set_depth(value); break;
		case 1: self->set_filter_depth(value); break;
		case 2: self->set_max_freq(value); break;
		case 3: self->set_min_freq(value); break;
		case 4: self->set_pwm(value); break;
		case 5: self->set_q(value); break;
		case 6: self->set_rand_pan(value); break;
		case 7: self->set_rate(value); break;
		case 8: self->set_reset(value); break;
		case 9: self->set_slope(value); break;
		case 10: self->set_time_rand(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_depth_18; break;
		case 1: *value = self->m_filter_depth_16; break;
		case 2: *value = self->m_max_freq_14; break;
		case 3: *value = self->m_min_freq_15; break;
		case 4: *value = self->m_pwm_20; break;
		case 5: *value = self->m_q_13; break;
		case 6: *value = self->m_rand_pan_17; break;
		case 7: *value = self->m_rate_22; break;
		case 8: *value = self->m_reset_12; break;
		case 9: *value = self->m_slope_19; break;
		case 10: *value = self->m_time_rand_21; break;
		
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
	// initialize parameter 0 ("m_depth_18")
	pi = self->__commonstate.params + 0;
	pi->name = "depth";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_depth_18;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_filter_depth_16")
	pi = self->__commonstate.params + 1;
	pi->name = "filter_depth";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_filter_depth_16;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_max_freq_14")
	pi = self->__commonstate.params + 2;
	pi->name = "max_freq";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_max_freq_14;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 20000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_min_freq_15")
	pi = self->__commonstate.params + 3;
	pi->name = "min_freq";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_min_freq_15;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 20000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_pwm_20")
	pi = self->__commonstate.params + 4;
	pi->name = "pwm";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_pwm_20;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 0.98999999999999999;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_q_13")
	pi = self->__commonstate.params + 5;
	pi->name = "q";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_q_13;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 50;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_rand_pan_17")
	pi = self->__commonstate.params + 6;
	pi->name = "rand_pan";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rand_pan_17;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_rate_22")
	pi = self->__commonstate.params + 7;
	pi->name = "rate";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rate_22;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 500;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_reset_12")
	pi = self->__commonstate.params + 8;
	pi->name = "reset";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_reset_12;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_slope_19")
	pi = self->__commonstate.params + 9;
	pi->name = "slope";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_slope_19;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_time_rand_21")
	pi = self->__commonstate.params + 10;
	pi->name = "time_rand";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_time_rand_21;
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


} // cswitch_tremolo::
