#include "tape_hysteresis.h"

namespace tape_hysteresis {

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
	t_sample m_h_prevR_11;
	t_sample m_h_prevL_10;
	t_sample m_h_lpfL_12;
	t_sample m_h_lpfR_13;
	t_sample m_h_dcInL_14;
	t_sample m_m_stateR_9;
	t_sample m_h_dcInR_15;
	t_sample m_m_stateL_8;
	t_sample m_gainout_7;
	t_sample m_mix_pct_6;
	t_sample m_drive_1;
	t_sample samplerate;
	t_sample m_h_dcOutL_16;
	t_sample m_bias_2;
	t_sample m_remanence_4;
	t_sample m_coercivity_3;
	t_sample m_speed_khz_5;
	t_sample m_h_dcOutR_17;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_drive_1 = ((int)40);
		m_bias_2 = ((int)50);
		m_coercivity_3 = ((t_sample)0.29999999999999999);
		m_remanence_4 = ((t_sample)0.25);
		m_speed_khz_5 = ((int)15);
		m_mix_pct_6 = ((int)100);
		m_gainout_7 = ((int)0);
		m_m_stateL_8 = ((int)0);
		m_m_stateR_9 = ((int)0);
		m_h_prevL_10 = ((int)0);
		m_h_prevR_11 = ((int)0);
		m_h_lpfL_12 = ((int)0);
		m_h_lpfR_13 = ((int)0);
		m_h_dcInL_14 = ((int)0);
		m_h_dcInR_15 = ((int)0);
		m_h_dcOutL_16 = ((int)0);
		m_h_dcOutR_17 = ((int)0);
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
		t_sample h_scale = (((int)1) + (m_drive_1 * ((t_sample)0.059999999999999998)));
		t_sample b_offset = ((m_bias_2 - ((int)50)) * ((t_sample)0.0050000000000000001));
		t_sample v_24 = (((int)1) - (safediv((m_speed_khz_5 * ((int)1000)), samplerate) * ((int)2)));
		t_sample lpf_alpha = ((v_24 <= ((t_sample)0.050000000000000003)) ? ((t_sample)0.050000000000000003) : ((v_24 >= ((t_sample)0.84999999999999998)) ? ((t_sample)0.84999999999999998) : v_24));
		t_sample out_gain = dbtoa(m_gainout_7);
		t_sample v_25 = (m_mix_pct_6 * ((t_sample)0.01));
		t_sample bal = ((v_25 <= ((int)0)) ? ((int)0) : ((v_25 >= ((int)1)) ? ((int)1) : v_25));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample h_inL = ((in1 * h_scale) + b_offset);
			t_sample h_inR = ((in2 * h_scale) + b_offset);
			t_sample magL = hysteresis_step_d_d_d_d_d(h_inL, m_h_prevL_10, m_m_stateL_8, m_coercivity_3, m_remanence_4);
			t_sample magR = hysteresis_step_d_d_d_d_d(h_inR, m_h_prevR_11, m_m_stateR_9, m_coercivity_3, m_remanence_4);
			m_m_stateL_8 = magL;
			m_m_stateR_9 = magR;
			m_h_prevL_10 = h_inL;
			m_h_prevR_11 = h_inR;
			t_sample head_L = ((magL * (((int)1) - lpf_alpha)) + (m_h_lpfL_12 * lpf_alpha));
			t_sample head_R = ((magR * (((int)1) - lpf_alpha)) + (m_h_lpfR_13 * lpf_alpha));
			m_h_lpfL_12 = head_L;
			m_h_lpfR_13 = head_R;
			t_sample dc_L = ((head_L - m_h_dcInL_14) + (((t_sample)0.99850000000000005) * m_h_dcOutL_16));
			t_sample dc_R = ((head_R - m_h_dcInR_15) + (((t_sample)0.99850000000000005) * m_h_dcOutR_17));
			m_h_dcInL_14 = head_L;
			m_h_dcInR_15 = head_R;
			m_h_dcOutL_16 = dc_L;
			m_h_dcOutR_17 = dc_R;
			t_sample wetL = (dc_L * out_gain);
			t_sample wetR = (dc_R * out_gain);
			t_sample tmp_expr_555 = fixdenorm(((in1 * (((int)1) - bal)) + (wetL * bal)));
			t_sample tmp_expr_556 = fixdenorm(((in2 * (((int)1) - bal)) + (wetR * bal)));
			t_sample out1 = tmp_expr_555;
			t_sample out2 = tmp_expr_556;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_drive(t_param _value) {
		m_drive_1 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_bias(t_param _value) {
		m_bias_2 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_coercivity(t_param _value) {
		m_coercivity_3 = (_value < 0.01 ? 0.01 : (_value > 1 ? 1 : _value));
	};
	inline void set_remanence(t_param _value) {
		m_remanence_4 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_speed_khz(t_param _value) {
		m_speed_khz_5 = (_value < 4 ? 4 : (_value > 20 ? 20 : _value));
	};
	inline void set_mix_pct(t_param _value) {
		m_mix_pct_6 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_gainout(t_param _value) {
		m_gainout_7 = (_value < -24 ? -24 : (_value > 12 ? 12 : _value));
	};
	inline t_sample hysteresis_step_d_d_d_d_d(t_sample in_sig, t_sample h_prev, t_sample m_prev, t_sample k_coerc, t_sample rem_val) {
		t_sample alpha_rem = (((rem_val <= ((int)0)) ? ((int)0) : ((rem_val >= ((int)1)) ? ((int)1) : rem_val)) * ((t_sample)0.45000000000000001));
		t_sample k_c = ((((t_sample)0.02) < k_coerc) ? k_coerc : ((t_sample)0.02));
		t_sample he = (in_sig + (alpha_rem * m_prev));
		t_sample man = tanh((he * ((t_sample)1.3999999999999999)));
		t_sample dh = (in_sig - h_prev);
		int cond_18 = (dh >= ((int)0));
		int iffalse_19 = (-((int)1));
		int del = (cond_18 ? ((int)1) : iffalse_19);
		t_sample diff_m = (man - m_prev);
		t_sample dm_irr = ((int)0);
		if (((del * diff_m) > ((int)0))) {
			t_sample maxa_20 = (k_c - ((del * alpha_rem) * diff_m));
			t_sample pin_denom = ((maxa_20 < ((t_sample)0.02)) ? ((t_sample)0.02) : maxa_20);
			dm_irr = (safediv((del * diff_m), pin_denom) * dh);
			
		};
		t_sample minb_21 = (fabs(dh) * ((int)4));
		t_sample dm_rev = ((((t_sample)0.22) * diff_m) * ((minb_21 < ((int)1)) ? minb_21 : ((int)1)));
		t_sample v_22 = ((m_prev + (dm_irr * ((t_sample)0.75))) + dm_rev);
		t_sample min_23 = (-((t_sample)1.2));
		t_sample m_new = ((v_22 <= min_23) ? min_23 : ((v_22 >= ((t_sample)1.2)) ? ((t_sample)1.2) : v_22));
		return m_new;
		
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
int num_params() { return 7; }

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
		case 0: self->set_bias(value); break;
		case 1: self->set_coercivity(value); break;
		case 2: self->set_drive(value); break;
		case 3: self->set_gainout(value); break;
		case 4: self->set_mix_pct(value); break;
		case 5: self->set_remanence(value); break;
		case 6: self->set_speed_khz(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_bias_2; break;
		case 1: *value = self->m_coercivity_3; break;
		case 2: *value = self->m_drive_1; break;
		case 3: *value = self->m_gainout_7; break;
		case 4: *value = self->m_mix_pct_6; break;
		case 5: *value = self->m_remanence_4; break;
		case 6: *value = self->m_speed_khz_5; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(7 * sizeof(ParamInfo));
	self->__commonstate.numparams = 7;
	// initialize parameter 0 ("m_bias_2")
	pi = self->__commonstate.params + 0;
	pi->name = "bias";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_bias_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_coercivity_3")
	pi = self->__commonstate.params + 1;
	pi->name = "coercivity";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_coercivity_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_drive_1")
	pi = self->__commonstate.params + 2;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_gainout_7")
	pi = self->__commonstate.params + 3;
	pi->name = "gainout";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gainout_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -24;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_mix_pct_6")
	pi = self->__commonstate.params + 4;
	pi->name = "mix_pct";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_pct_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_remanence_4")
	pi = self->__commonstate.params + 5;
	pi->name = "remanence";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_remanence_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_speed_khz_5")
	pi = self->__commonstate.params + 6;
	pi->name = "speed_khz";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_speed_khz_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 4;
	pi->outputmax = 20;
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


} // tape_hysteresis::
