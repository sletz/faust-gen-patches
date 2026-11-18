#include "ufo.h"

namespace ufo {

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
	Delta __m_delta_28;
	Delta __m_delta_26;
	Delta __m_delta_27;
	int __exception;
	int vectorsize;
	t_sample m_exp1_2;
	t_sample m_h_sh_val_14;
	t_sample m_h_prev_ph_13;
	t_sample m_h_rs_last_15;
	t_sample m_h_rs_dir_16;
	t_sample m_h_rs_step_17;
	t_sample m_h_prev_trig_12;
	t_sample m_h_rs_inc_18;
	t_sample m_lfosel_1;
	t_sample m_h_phase_acc_11;
	t_sample samplerate;
	t_sample m_exp2_4;
	t_sample m_expc_3;
	t_sample m_unipolar_10;
	t_sample m_oneshot_5;
	t_sample m_gain_7;
	t_sample m_shotnumbers_6;
	t_sample m_offset_8;
	t_sample m_invert_9;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_lfosel_1 = ((int)0);
		m_exp1_2 = ((int)1);
		m_expc_3 = ((int)1);
		m_exp2_4 = ((int)1);
		m_oneshot_5 = ((int)0);
		m_shotnumbers_6 = ((int)1);
		m_gain_7 = ((int)1);
		m_offset_8 = ((int)0);
		m_invert_9 = ((int)0);
		m_unipolar_10 = ((int)0);
		m_h_phase_acc_11 = ((int)0);
		m_h_prev_trig_12 = ((int)0);
		m_h_prev_ph_13 = ((int)0);
		m_h_sh_val_14 = ((int)0);
		m_h_rs_last_15 = ((int)0);
		m_h_rs_dir_16 = ((int)0);
		m_h_rs_step_17 = ((int)0);
		m_h_rs_inc_18 = ((int)0);
		__m_delta_26.reset(0);
		__m_delta_27.reset(0);
		__m_delta_28.reset(0);
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		t_sample * __out1 = __outs[0];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__out1 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		int cond_19 = (m_oneshot_5 > ((t_sample)0.5));
		int cond_29 = (m_lfosel_1 < ((t_sample)0.5));
		int cond_30 = (m_lfosel_1 < ((t_sample)1.5));
		int cond_31 = (m_lfosel_1 < ((t_sample)2.5));
		int cond_32 = (m_lfosel_1 < ((t_sample)3.5));
		int cond_33 = (m_lfosel_1 < ((t_sample)4.5));
		int cond_39 = (m_invert_9 > ((t_sample)0.5));
		int cond_41 = (m_unipolar_10 > ((t_sample)0.5));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample fc = ((in1 <= ((t_sample)0.0001)) ? ((t_sample)0.0001) : ((in1 >= ((int)1000)) ? ((int)1000) : in1));
			int trig_high = (in2 > ((t_sample)0.5));
			int is_trig = (trig_high && (!m_h_prev_trig_12));
			m_h_prev_trig_12 = trig_high;
			if (is_trig) {
				m_h_phase_acc_11 = ((int)0);
				
			} else {
				m_h_phase_acc_11 = (m_h_phase_acc_11 + safediv(fc, samplerate));
				
			};
			t_sample iftrue_20 = (((int)0) - ((m_h_phase_acc_11 <= ((int)0)) ? ((int)0) : ((m_h_phase_acc_11 >= m_shotnumbers_6) ? m_shotnumbers_6 : m_h_phase_acc_11)));
			t_sample raw_acc = (cond_19 ? iftrue_20 : m_h_phase_acc_11);
			t_sample w_base = wrap(raw_acc, ((int)0), ((int)1));
			t_sample ph_scaled = (w_base * m_expc_3);
			t_sample ph_curv = safepow(ph_scaled, m_exp1_2);
			t_sample ph = wrap(ph_curv, ((int)0), ((int)1));
			t_sample cos_out = cos((ph * ((t_sample)6.2831853071795862)));
			int cond_21 = (ph < ((t_sample)0.5));
			t_sample iftrue_22 = ((ph * ((int)4)) - ((int)1));
			t_sample iffalse_23 = (((int)3) - (ph * ((int)4)));
			t_sample tri_out = (cond_21 ? iftrue_22 : iffalse_23);
			t_sample saw_out = ((ph * ((int)2)) - ((int)1));
			int cond_24 = (ph < ((t_sample)0.5));
			int sq_out = (cond_24 ? ((int)1) : ((int)-1));
			int is_sh_cross = ((ph >= ((t_sample)0.5)) && (m_h_prev_ph_13 < ((t_sample)0.5)));
			m_h_prev_ph_13 = ph;
			if (is_sh_cross) {
				m_h_sh_val_14 = noise();
				
			};
			t_sample sh_out = m_h_sh_val_14;
			t_sample maxb_25 = safediv(samplerate, ((fc < ((t_sample)0.0001)) ? ((t_sample)0.0001) : fc));
			t_sample ramp_samps = ((((int)1) < maxb_25) ? maxb_25 : ((int)1));
			t_sample rampup = ramp_samps;
			t_sample rampdown = ramp_samps;
			t_sample rs_out = m_h_rs_last_15;
			if ((((__m_delta_26(sh_out) == ((int)0)) && (__m_delta_27(rampup) == ((int)0))) && (__m_delta_28(rampdown) == ((int)0)))) {
				if ((m_h_rs_dir_16 > ((int)0))) {
					if ((m_h_rs_step_17 < rampup)) {
						rs_out = (rs_out + m_h_rs_inc_18);
						m_h_rs_step_17 = (m_h_rs_step_17 + ((int)1));
						
					} else {
						rs_out = sh_out;
						
					};
					
				} else {
					if ((m_h_rs_step_17 < rampdown)) {
						rs_out = (rs_out + m_h_rs_inc_18);
						m_h_rs_step_17 = (m_h_rs_step_17 + ((int)1));
						
					} else {
						rs_out = sh_out;
						
					};
					
				};
				
			} else {
				t_sample deltavar = (sh_out - rs_out);
				if ((deltavar > ((int)0))) {
					m_h_rs_inc_18 = safediv(deltavar, rampup);
					rs_out = (rs_out + m_h_rs_inc_18);
					m_h_rs_step_17 = ((int)1);
					m_h_rs_dir_16 = ((int)1);
					
				} else {
					m_h_rs_inc_18 = safediv(deltavar, rampdown);
					rs_out = (rs_out + m_h_rs_inc_18);
					m_h_rs_step_17 = ((int)1);
					m_h_rs_dir_16 = ((int)-1);
					
				};
				
			};
			m_h_rs_last_15 = rs_out;
			t_sample iffalse_34 = (cond_33 ? sh_out : rs_out);
			t_sample iffalse_35 = (cond_32 ? sq_out : iffalse_34);
			t_sample iffalse_36 = (cond_31 ? saw_out : iffalse_35);
			t_sample iffalse_37 = (cond_30 ? tri_out : iffalse_36);
			t_sample raw_lfo = (cond_29 ? cos_out : iffalse_37);
			t_sample v_38 = ((raw_lfo * ((t_sample)0.5)) + ((t_sample)0.5));
			t_sample u_norm = ((v_38 <= ((int)0)) ? ((int)0) : ((v_38 >= ((int)1)) ? ((int)1) : v_38));
			t_sample u_curv = safepow(u_norm, m_exp2_4);
			t_sample b_curv = ((u_curv * ((int)2)) - ((int)1));
			t_sample b_scaled = ((b_curv * m_gain_7) - (m_offset_8 * ((t_sample)0.01)));
			t_sample b_clipped = ((b_scaled <= ((int)-1)) ? ((int)-1) : ((b_scaled >= ((int)1)) ? ((int)1) : b_scaled));
			t_sample iftrue_40 = (((int)0) - b_clipped);
			t_sample b_inv = (cond_39 ? iftrue_40 : b_clipped);
			t_sample iftrue_42 = ((b_inv * ((t_sample)0.5)) + ((t_sample)0.5));
			t_sample tmp_expr_558 = (cond_41 ? iftrue_42 : b_inv);
			t_sample out1 = tmp_expr_558;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			
		};
		return __exception;
		
	};
	inline void set_lfosel(t_param _value) {
		m_lfosel_1 = (_value < 0 ? 0 : (_value > 5 ? 5 : _value));
	};
	inline void set_exp1(t_param _value) {
		m_exp1_2 = (_value < 0.050000000000000003 ? 0.050000000000000003 : (_value > 20 ? 20 : _value));
	};
	inline void set_expc(t_param _value) {
		m_expc_3 = (_value < 0 ? 0 : (_value > 8 ? 8 : _value));
	};
	inline void set_exp2(t_param _value) {
		m_exp2_4 = (_value < 0.050000000000000003 ? 0.050000000000000003 : (_value > 20 ? 20 : _value));
	};
	inline void set_oneshot(t_param _value) {
		m_oneshot_5 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_shotnumbers(t_param _value) {
		m_shotnumbers_6 = (_value < 0 ? 0 : (_value > 128 ? 128 : _value));
	};
	inline void set_gain(t_param _value) {
		m_gain_7 = (_value < 0 ? 0 : (_value > 10 ? 10 : _value));
	};
	inline void set_offset(t_param _value) {
		m_offset_8 = (_value < -100 ? -100 : (_value > 100 ? 100 : _value));
	};
	inline void set_invert(t_param _value) {
		m_invert_9 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_unipolar(t_param _value) {
		m_unipolar_10 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 2;
int gen_kernel_numouts = 1;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 10; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "frequency in Hz (0.0001..1000)", "Trigger / Reset (audio)" };
const char *gen_kernel_outnames[] = { "LFO Output" };

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
		case 1: *value = self->m_exp2_4; break;
		case 2: *value = self->m_expc_3; break;
		case 3: *value = self->m_gain_7; break;
		case 4: *value = self->m_invert_9; break;
		case 5: *value = self->m_lfosel_1; break;
		case 6: *value = self->m_offset_8; break;
		case 7: *value = self->m_oneshot_5; break;
		case 8: *value = self->m_shotnumbers_6; break;
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
	pi->outputmin = 0.050000000000000003;
	pi->outputmax = 20;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_exp2_4")
	pi = self->__commonstate.params + 1;
	pi->name = "exp2";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_exp2_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.050000000000000003;
	pi->outputmax = 20;
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
	pi->outputmax = 8;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_gain_7")
	pi = self->__commonstate.params + 3;
	pi->name = "gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 10;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_invert_9")
	pi = self->__commonstate.params + 4;
	pi->name = "invert";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_invert_9;
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
	pi->outputmax = 5;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_offset_8")
	pi = self->__commonstate.params + 6;
	pi->name = "offset";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_offset_8;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -100;
	pi->outputmax = 100;
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
	// initialize parameter 8 ("m_shotnumbers_6")
	pi = self->__commonstate.params + 8;
	pi->name = "shotnumbers";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_shotnumbers_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 128;
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


} // ufo::
