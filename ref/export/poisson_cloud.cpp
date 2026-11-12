#include "poisson_cloud.h"

namespace poisson_cloud {

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
	t_sample m_base_s_6;
	t_sample m_occurrences_5;
	t_sample m_current_dur_7;
	t_sample m_phase_8;
	t_sample m_count_9;
	t_sample m_interval_4;
	t_sample m_loop_2;
	t_sample m_width_3;
	t_sample samplerate;
	t_sample m_jitter_1;
	t_sample m_running_10;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_jitter_1 = ((int)0);
		m_loop_2 = ((int)0);
		m_width_3 = ((t_sample)0.5);
		m_interval_4 = ((int)250);
		m_occurrences_5 = ((int)16);
		m_base_s_6 = ((int)0);
		m_current_dur_7 = ((int)0);
		m_phase_8 = ((int)0);
		m_count_9 = ((int)0);
		m_running_10 = ((int)0);
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
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__out1 == 0) || (__out2 == 0) || (__out3 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			m_base_s_6 = ((m_interval_4 * samplerate) * ((t_sample)0.001));
			if ((in1 > ((t_sample)0.10000000000000001))) {
				m_running_10 = ((int)1);
				m_count_9 = ((int)1);
				m_phase_8 = ((int)0);
				t_sample maxa_11 = ((noise() + ((int)1)) * ((t_sample)0.5));
				t_sample r = ((maxa_11 < ((t_sample)0.001)) ? ((t_sample)0.001) : maxa_11);
				t_sample j_dist = (-log(r));
				t_sample tmp_mix_948 = (((int)1) + (m_jitter_1 * (j_dist - ((int)1))));
				t_sample maxb_12 = (m_base_s_6 * tmp_mix_948);
				m_current_dur_7 = ((((int)2) < maxb_12) ? maxb_12 : ((int)2));
				
			};
			if ((in2 > ((t_sample)0.10000000000000001))) {
				m_running_10 = ((int)0);
				m_count_9 = ((int)0);
				m_phase_8 = ((int)0);
				
			};
			int pulse_signal = ((int)0);
			if (m_running_10) {
				t_sample safe_dur = ((m_current_dur_7 < ((int)2)) ? ((int)2) : m_current_dur_7);
				t_sample p_inc = safediv(((int)1), safe_dur);
				if (((m_phase_8 < m_width_3) && (m_phase_8 < (((int)1) - p_inc)))) {
					pulse_signal = ((int)1);
					
				};
				m_phase_8 = (m_phase_8 + p_inc);
				if ((m_phase_8 >= ((int)1))) {
					m_phase_8 = ((int)0);
					if ((m_count_9 >= m_occurrences_5)) {
						if ((m_loop_2 > ((t_sample)0.5))) {
							m_count_9 = ((int)1);
							t_sample maxa_13 = ((noise() + ((int)1)) * ((t_sample)0.5));
							t_sample r_loop = ((maxa_13 < ((t_sample)0.001)) ? ((t_sample)0.001) : maxa_13);
							t_sample tmp_neg_950 = (-log(r_loop));
							t_sample tmp_mix_949 = (((int)1) + (m_jitter_1 * (tmp_neg_950 - ((int)1))));
							t_sample maxb_14 = (m_base_s_6 * tmp_mix_949);
							m_current_dur_7 = ((((int)2) < maxb_14) ? maxb_14 : ((int)2));
							
						} else {
							m_running_10 = ((int)0);
							
						};
						
					} else {
						m_count_9 = (m_count_9 + ((int)1));
						t_sample maxa_15 = ((noise() + ((int)1)) * ((t_sample)0.5));
						t_sample r_next = ((maxa_15 < ((t_sample)0.001)) ? ((t_sample)0.001) : maxa_15);
						t_sample tmp_neg_952 = (-log(r_next));
						t_sample tmp_mix_951 = (((int)1) + (m_jitter_1 * (tmp_neg_952 - ((int)1))));
						t_sample maxb_16 = (m_base_s_6 * tmp_mix_951);
						m_current_dur_7 = ((((int)2) < maxb_16) ? maxb_16 : ((int)2));
						
					};
					
				};
				
			};
			int tmp_expr_340 = pulse_signal;
			t_sample tmp_expr_341 = m_count_9;
			t_sample tmp_expr_342 = m_running_10;
			t_sample out3 = tmp_expr_342;
			t_sample out2 = tmp_expr_341;
			t_sample out1 = tmp_expr_340;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			
		};
		return __exception;
		
	};
	inline void set_jitter(t_param _value) {
		m_jitter_1 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_loop(t_param _value) {
		m_loop_2 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_width(t_param _value) {
		m_width_3 = (_value < 0.01 ? 0.01 : (_value > 0.98999999999999999 ? 0.98999999999999999 : _value));
	};
	inline void set_interval(t_param _value) {
		m_interval_4 = (_value < 1 ? 1 : (_value > 30000 ? 30000 : _value));
	};
	inline void set_occurrences(t_param _value) {
		m_occurrences_5 = (_value < 1 ? 1 : (_value > 1 ? 1 : _value));
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 2;
int gen_kernel_numouts = 3;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 5; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "in1", "in2" };
const char *gen_kernel_outnames[] = { "out1", "out2", "out3" };

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
		case 0: self->set_interval(value); break;
		case 1: self->set_jitter(value); break;
		case 2: self->set_loop(value); break;
		case 3: self->set_occurrences(value); break;
		case 4: self->set_width(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_interval_4; break;
		case 1: *value = self->m_jitter_1; break;
		case 2: *value = self->m_loop_2; break;
		case 3: *value = self->m_occurrences_5; break;
		case 4: *value = self->m_width_3; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(5 * sizeof(ParamInfo));
	self->__commonstate.numparams = 5;
	// initialize parameter 0 ("m_interval_4")
	pi = self->__commonstate.params + 0;
	pi->name = "interval";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_interval_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 30000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_jitter_1")
	pi = self->__commonstate.params + 1;
	pi->name = "jitter";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_jitter_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_loop_2")
	pi = self->__commonstate.params + 2;
	pi->name = "loop";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_loop_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_occurrences_5")
	pi = self->__commonstate.params + 3;
	pi->name = "occurrences";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_occurrences_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_width_3")
	pi = self->__commonstate.params + 4;
	pi->name = "width";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_width_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 0.98999999999999999;
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


} // poisson_cloud::
