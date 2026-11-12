#include "ufo_core.h"

namespace ufo_core {

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
	Delta __m_delta_22;
	Delta __m_delta_15;
	Delta __m_delta_20;
	Delta __m_delta_21;
	int __exception;
	int vectorsize;
	PlusEquals __m_pluseq_16;
	Sah __m_sah_19;
	t_sample m_expc_3;
	t_sample m_stepcounter_13;
	t_sample m_increment_14;
	t_sample samplerate;
	t_sample m_dirflag_12;
	t_sample m_exp1_2;
	t_sample m_last_11;
	t_sample m_lfosel_1;
	t_sample m_oneshot_5;
	t_sample m_shotnumbers_4;
	t_sample m_unipolar_10;
	t_sample m_gain_6;
	t_sample m_invert_8;
	t_sample m_offset_7;
	t_sample m_exp2_9;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_lfosel_1 = ((int)0);
		m_exp1_2 = ((int)1);
		m_expc_3 = ((int)1);
		m_shotnumbers_4 = ((int)1);
		m_oneshot_5 = ((int)0);
		m_gain_6 = ((int)1);
		m_offset_7 = ((int)0);
		m_invert_8 = ((int)0);
		m_exp2_9 = ((int)1);
		m_unipolar_10 = ((int)0);
		m_last_11 = ((int)0);
		m_dirflag_12 = ((int)0);
		m_stepcounter_13 = ((int)0);
		m_increment_14 = ((int)0);
		__m_delta_15.reset(0);
		__m_pluseq_16.reset(0);
		__m_sah_19.reset(0);
		__m_delta_20.reset(0);
		__m_delta_21.reset(0);
		__m_delta_22.reset(0);
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		const t_sample * __in3 = __ins[2];
		const t_sample * __in4 = __ins[3];
		const t_sample * __in5 = __ins[4];
		const t_sample * __in6 = __ins[5];
		const t_sample * __in7 = __ins[6];
		const t_sample * __in8 = __ins[7];
		const t_sample * __in9 = __ins[8];
		const t_sample * __in10 = __ins[9];
		const t_sample * __in11 = __ins[10];
		const t_sample * __in12 = __ins[11];
		t_sample * __out1 = __outs[0];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__in3 == 0) || (__in4 == 0) || (__in5 == 0) || (__in6 == 0) || (__in7 == 0) || (__in8 == 0) || (__in9 == 0) || (__in10 == 0) || (__in11 == 0) || (__in12 == 0) || (__out1 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		int min_24 = (-1);
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			const t_sample in3 = (*(__in3++));
			const t_sample in4 = (*(__in4++));
			const t_sample in5 = (*(__in5++));
			const t_sample in6 = (*(__in6++));
			const t_sample in7 = (*(__in7++));
			const t_sample in8 = (*(__in8++));
			const t_sample in9 = (*(__in9++));
			const t_sample in10 = (*(__in10++));
			const t_sample in11 = (*(__in11++));
			const t_sample in12 = (*(__in12++));
			t_sample tmp_clamp_485 = ((in1 <= ((t_sample)0.0001)) ? ((t_sample)0.0001) : ((in1 >= ((int)1000)) ? ((int)1000) : in1));
			t_sample tmp_expr_487 = safediv((((int)1) * samplerate), ((tmp_clamp_485 < ((t_sample)0.0001)) ? ((t_sample)0.0001) : tmp_clamp_485));
			t_sample tmp_noise_441 = noise();
			t_sample tmp_add_458 = ((in11 + m_unipolar_10) + ((int)1));
			t_sample tmp_add_460 = ((in10 + m_invert_8) + ((int)1));
			t_sample tmp_add_448 = ((in2 + m_lfosel_1) + ((int)1));
			t_sample tmp_div_457 = ((in9 + m_offset_7) * ((t_sample)0.01));
			t_sample tmp_rsub_455 = (((int)0) - tmp_div_457);
			t_sample tmp_add_461 = ((in6 + m_oneshot_5) + ((int)1));
			t_sample tmp_div_484 = safediv(tmp_clamp_485, samplerate);
			int tmp_gt_472 = (in12 > ((t_sample)0.5));
			int tmp_delta_471 = __m_delta_15(tmp_gt_472);
			int tmp_clamp_470 = ((tmp_delta_471 <= ((int)0)) ? ((int)0) : ((tmp_delta_471 >= ((int)1)) ? ((int)1) : tmp_delta_471));
			t_sample tmp_plusequals_483 = __m_pluseq_16.post(tmp_div_484, tmp_clamp_470, 0);
			t_sample max_17 = (in7 + m_shotnumbers_4);
			t_sample tmp_clamp_477 = ((tmp_plusequals_483 <= ((int)0)) ? ((int)0) : ((tmp_plusequals_483 >= max_17) ? max_17 : tmp_plusequals_483));
			t_sample tmp_rsub_456 = (((int)0) - tmp_clamp_477);
			t_sample choice_18 = int(tmp_add_461);
			t_sample tmp_selector_478 = ((choice_18 >= 2) ? tmp_rsub_456 : ((choice_18 >= 1) ? tmp_plusequals_483 : 0));
			t_sample tmp_wrap_480 = wrap(tmp_selector_478, ((int)0), ((int)1));
			t_sample tmp_mul_479 = (tmp_wrap_480 * (in4 + m_expc_3));
			t_sample tmp_pow_481 = safepow(tmp_mul_479, (m_exp1_2 + in3));
			t_sample tmp_wrap_482 = wrap(tmp_pow_481, ((int)0), ((int)1));
			t_sample tmp_wrap_450 = wrap(tmp_wrap_482, ((int)0), ((int)1));
			t_sample tmp_expr_489 = ((tmp_wrap_450 * ((int)2)) - ((int)1));
			t_sample tmp_triangle_452 = triangle(tmp_wrap_482, ((t_sample)0.5));
			t_sample tmp_expr_490 = ((tmp_triangle_452 * ((int)2)) - ((int)1));
			t_sample tmp_wrap_442 = wrap(tmp_wrap_482, ((int)0), ((int)1));
			t_sample tmp_sah_443 = __m_sah_19(tmp_noise_441, tmp_wrap_442, ((t_sample)0.5));
			t_sample insig = tmp_sah_443;
			t_sample rampup = ((tmp_expr_487 < ((int)1)) ? ((int)1) : tmp_expr_487);
			t_sample rampdown = ((tmp_expr_487 < ((int)1)) ? ((int)1) : tmp_expr_487);
			t_sample outsig = m_last_11;
			if ((((__m_delta_20(insig) == ((int)0)) && (__m_delta_21(rampup) == ((int)0))) && (__m_delta_22(rampdown) == ((int)0)))) {
				if ((m_dirflag_12 > ((int)0))) {
					if ((m_stepcounter_13 < rampup)) {
						outsig = (outsig + m_increment_14);
						m_stepcounter_13 = (m_stepcounter_13 + ((int)1));
						
					} else {
						outsig = insig;
						
					};
					
				} else {
					if ((m_stepcounter_13 < rampdown)) {
						outsig = (outsig + m_increment_14);
						m_stepcounter_13 = (m_stepcounter_13 + ((int)1));
						
					} else {
						outsig = insig;
						
					};
					
				};
				
			} else {
				t_sample deltavar = (insig - outsig);
				if ((deltavar > ((int)0))) {
					m_increment_14 = safediv(deltavar, rampup);
					outsig = (outsig + m_increment_14);
					m_stepcounter_13 = ((int)1);
					m_dirflag_12 = ((int)1);
					
				} else {
					m_increment_14 = safediv(deltavar, rampdown);
					outsig = (outsig + m_increment_14);
					m_stepcounter_13 = ((int)1);
					m_dirflag_12 = ((int)-1);
					
				};
				
			};
			m_last_11 = outsig;
			t_sample tmp_expr_486 = outsig;
			t_sample tmp_wrap_446 = wrap(tmp_wrap_482, ((int)0), ((int)1));
			int tmp_lt_445 = (tmp_wrap_446 < ((t_sample)0.5));
			int tmp_expr_488 = ((tmp_lt_445 * ((int)2)) - ((int)1));
			t_sample tmp_mul_453 = (tmp_wrap_482 * ((t_sample)6.2831853071795862));
			t_sample tmp_cos_454 = cos(tmp_mul_453);
			t_sample choice_23 = int(tmp_add_448);
			t_sample tmp_selector_449 = ((choice_23 >= 6) ? tmp_expr_486 : ((choice_23 >= 5) ? tmp_sah_443 : ((choice_23 >= 4) ? tmp_expr_488 : ((choice_23 >= 3) ? tmp_expr_489 : ((choice_23 >= 2) ? tmp_expr_490 : ((choice_23 >= 1) ? tmp_cos_454 : 0))))));
			t_sample tmp_mul_465 = (tmp_selector_449 * ((t_sample)0.5));
			t_sample tmp_add_464 = (tmp_mul_465 + ((t_sample)0.5));
			t_sample tmp_pow_463 = safepow(tmp_add_464, (in5 + m_exp2_9));
			t_sample tmp_expr_491 = ((tmp_pow_463 * ((int)2)) - ((int)1));
			t_sample tmp_mul_475 = (tmp_expr_491 * (in8 + m_gain_6));
			t_sample tmp_add_474 = (tmp_mul_475 + tmp_rsub_455);
			t_sample tmp_clamp_473 = ((tmp_add_474 <= min_24) ? min_24 : ((tmp_add_474 >= ((int)1)) ? ((int)1) : tmp_add_474));
			t_sample tmp_rsub_469 = (((int)0) - tmp_clamp_473);
			t_sample choice_25 = int(tmp_add_460);
			t_sample tmp_selector_468 = ((choice_25 >= 2) ? tmp_rsub_469 : ((choice_25 >= 1) ? tmp_clamp_473 : 0));
			t_sample tmp_mul_467 = (tmp_selector_468 * ((t_sample)0.5));
			t_sample tmp_add_466 = (tmp_mul_467 + ((t_sample)0.5));
			t_sample choice_26 = int(tmp_add_458);
			t_sample tmp_selector_459 = ((choice_26 >= 2) ? tmp_add_466 : ((choice_26 >= 1) ? tmp_selector_468 : 0));
			t_sample out1 = tmp_selector_459;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			
		};
		return __exception;
		
	};
	inline void set_lfosel(t_param _value) {
		m_lfosel_1 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_exp1(t_param _value) {
		m_exp1_2 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_expc(t_param _value) {
		m_expc_3 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_shotnumbers(t_param _value) {
		m_shotnumbers_4 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_oneshot(t_param _value) {
		m_oneshot_5 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_gain(t_param _value) {
		m_gain_6 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_offset(t_param _value) {
		m_offset_7 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_invert(t_param _value) {
		m_invert_8 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_exp2(t_param _value) {
		m_exp2_9 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_unipolar(t_param _value) {
		m_unipolar_10 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 12;
int gen_kernel_numouts = 1;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 10; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "frequency in Hz (0.0001.. 1000)", "in2", "in3", "in4", "in5", "in6", "in7", "in8", "in9", "in10", "in11", "Trigg IN (audio) : reset or restart cycle in mode one shoot" };
const char *gen_kernel_outnames[] = { "bipolar" };

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
		case 0: self->set_exp1(value); break;
		case 1: self->set_exp2(value); break;
		case 2: self->set_expc(value); break;
		case 3: self->set_gain(value); break;
		case 4: self->set_invert(value); break;
		case 5: self->set_lfosel(value); break;
		case 6: self->set_offset(value); break;
		case 7: self->set_oneshot(value); break;
		case 8: self->set_shotnumbers(value); break;
		case 9: self->set_unipolar(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_exp1_2; break;
		case 1: *value = self->m_exp2_9; break;
		case 2: *value = self->m_expc_3; break;
		case 3: *value = self->m_gain_6; break;
		case 4: *value = self->m_invert_8; break;
		case 5: *value = self->m_lfosel_1; break;
		case 6: *value = self->m_offset_7; break;
		case 7: *value = self->m_oneshot_5; break;
		case 8: *value = self->m_shotnumbers_4; break;
		case 9: *value = self->m_unipolar_10; break;
		
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
	// initialize parameter 0 ("m_exp1_2")
	pi = self->__commonstate.params + 0;
	pi->name = "exp1";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_exp1_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_exp2_9")
	pi = self->__commonstate.params + 1;
	pi->name = "exp2";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_exp2_9;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_expc_3")
	pi = self->__commonstate.params + 2;
	pi->name = "expc";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_expc_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_gain_6")
	pi = self->__commonstate.params + 3;
	pi->name = "gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_invert_8")
	pi = self->__commonstate.params + 4;
	pi->name = "invert";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_invert_8;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_lfosel_1")
	pi = self->__commonstate.params + 5;
	pi->name = "lfosel";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_lfosel_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_offset_7")
	pi = self->__commonstate.params + 6;
	pi->name = "offset";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_offset_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_oneshot_5")
	pi = self->__commonstate.params + 7;
	pi->name = "oneshot";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_oneshot_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_shotnumbers_4")
	pi = self->__commonstate.params + 8;
	pi->name = "shotnumbers";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_shotnumbers_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_unipolar_10")
	pi = self->__commonstate.params + 9;
	pi->name = "unipolar";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_unipolar_10;
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


} // ufo_core::
