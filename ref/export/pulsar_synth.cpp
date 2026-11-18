#include "pulsar_synth.h"

namespace pulsar_synth {

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
	t_sample m_pan_spread_7;
	t_sample m_masking_6;
	t_sample m_h_phase_f0_8;
	t_sample m_h_pulsar_active_9;
	t_sample m_win_type_5;
	t_sample m_wave_shape_4;
	t_sample m_duty_ratio_3;
	t_sample samplerate;
	t_sample m_h_pulse_count_10;
	t_sample m_f0_1;
	t_sample m_formant_f_2;
	t_sample m_h_prev_in1_11;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_f0_1 = ((int)25);
		m_formant_f_2 = ((int)650);
		m_duty_ratio_3 = ((t_sample)0.29999999999999999);
		m_wave_shape_4 = ((int)0);
		m_win_type_5 = ((int)1);
		m_masking_6 = ((int)0);
		m_pan_spread_7 = ((t_sample)0.5);
		m_h_phase_f0_8 = ((int)0);
		m_h_pulsar_active_9 = ((int)1);
		m_h_pulse_count_10 = ((int)0);
		m_h_prev_in1_11 = ((int)0);
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
		t_sample f0_step = safediv(((m_f0_1 <= ((t_sample)0.050000000000000003)) ? ((t_sample)0.050000000000000003) : ((m_f0_1 >= ((int)500)) ? ((int)500) : m_f0_1)), samplerate);
		t_sample d_ratio = ((m_duty_ratio_3 <= ((t_sample)0.0050000000000000001)) ? ((t_sample)0.0050000000000000001) : ((m_duty_ratio_3 >= ((t_sample)0.999)) ? ((t_sample)0.999) : m_duty_ratio_3));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			int trig_sync = ((in1 > ((t_sample)0.5)) && (m_h_prev_in1_11 <= ((t_sample)0.5)));
			m_h_prev_in1_11 = in1;
			int new_cycle = (((m_h_phase_f0_8 + f0_step) >= ((int)1)) || trig_sync);
			t_sample iffalse_12 = wrap((m_h_phase_f0_8 + f0_step), ((int)0), ((int)1));
			t_sample phase_f0 = (trig_sync ? ((int)0) : iffalse_12);
			m_h_phase_f0_8 = phase_f0;
			if (new_cycle) {
				t_sample rand_val = fabs(noise());
				m_h_pulsar_active_9 = (rand_val > m_masking_6);
				m_h_pulse_count_10 = (m_h_pulse_count_10 + ((int)1));
				
			};
			int in_pulsaret = (phase_f0 < d_ratio);
			t_sample sig = ((int)0);
			if ((in_pulsaret && m_h_pulsar_active_9)) {
				t_sample p_norm = safediv(phase_f0, d_ratio);
				t_sample w = ((int)1);
				if ((m_win_type_5 == ((int)0))) {
					w = ((int)1);
					
				} else {
					if ((m_win_type_5 == ((int)1))) {
						w = (((t_sample)0.5) * (((int)1) - cos((p_norm * ((t_sample)6.2831853071795862)))));
						
					} else {
						if ((m_win_type_5 == ((int)2))) {
							t_sample xg = ((p_norm - ((t_sample)0.5)) * ((int)5));
							w = exp(((((t_sample)-0.5) * xg) * xg));
							
						} else {
							w = exp(((-p_norm) * ((int)4)));
							
						};
						
					};
					
				};
				t_sample v_13 = (m_formant_f_2 + in2);
				t_sample eff_formant = ((v_13 <= ((int)20)) ? ((int)20) : ((v_13 >= ((int)12000)) ? ((int)12000) : v_13));
				t_sample pulsar_cycles = (eff_formant * safediv(d_ratio, ((m_f0_1 < ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : m_f0_1)));
				t_sample p_wave_phase = wrap((p_norm * pulsar_cycles), ((int)0), ((int)1));
				t_sample osc = ((int)0);
				if ((m_wave_shape_4 == ((int)0))) {
					osc = sin((p_wave_phase * ((t_sample)6.2831853071795862)));
					
				} else {
					if ((m_wave_shape_4 == ((int)1))) {
						osc = ((fabs((p_wave_phase - ((t_sample)0.5))) * ((int)4)) - ((int)1));
						
					} else {
						if ((m_wave_shape_4 == ((int)2))) {
							t_sample chirp_ph = (p_wave_phase * (((int)1) + (p_norm * ((int)2))));
							osc = sin((wrap(chirp_ph, ((int)0), ((int)1)) * ((t_sample)6.2831853071795862)));
							
						} else {
							osc = ((sin((p_wave_phase * ((t_sample)6.2831853071795862))) * ((t_sample)0.69999999999999996)) + (sin(((p_wave_phase * ((int)4)) * ((t_sample)3.1415926535897931))) * ((t_sample)0.29999999999999999)));
							
						};
						
					};
					
				};
				sig = (osc * w);
				
			};
			t_sample cond_14 = safemod(m_h_pulse_count_10, ((int)2));
			int pan_dir = (cond_14 ? ((int)1) : ((int)-1));
			t_sample pan_pos = (((t_sample)0.5) + ((pan_dir * m_pan_spread_7) * ((t_sample)0.45000000000000001)));
			t_sample pan_L = cos((pan_pos * ((t_sample)1.5707963267948966)));
			t_sample pan_R = sin((pan_pos * ((t_sample)1.5707963267948966)));
			t_sample tmp_expr_465 = (sig * pan_L);
			t_sample tmp_expr_466 = (sig * pan_R);
			t_sample out1 = tmp_expr_465;
			t_sample out2 = tmp_expr_466;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_f0(t_param _value) {
		m_f0_1 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 500 ? 500 : _value));
	};
	inline void set_formant_f(t_param _value) {
		m_formant_f_2 = (_value < 20 ? 20 : (_value > 8000 ? 8000 : _value));
	};
	inline void set_duty_ratio(t_param _value) {
		m_duty_ratio_3 = (_value < 0.01 ? 0.01 : (_value > 1 ? 1 : _value));
	};
	inline void set_wave_shape(t_param _value) {
		m_wave_shape_4 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_win_type(t_param _value) {
		m_win_type_5 = (_value < 0 ? 0 : (_value > 3 ? 3 : _value));
	};
	inline void set_masking(t_param _value) {
		m_masking_6 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_pan_spread(t_param _value) {
		m_pan_spread_7 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
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
		case 0: self->set_duty_ratio(value); break;
		case 1: self->set_f0(value); break;
		case 2: self->set_formant_f(value); break;
		case 3: self->set_masking(value); break;
		case 4: self->set_pan_spread(value); break;
		case 5: self->set_wave_shape(value); break;
		case 6: self->set_win_type(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_duty_ratio_3; break;
		case 1: *value = self->m_f0_1; break;
		case 2: *value = self->m_formant_f_2; break;
		case 3: *value = self->m_masking_6; break;
		case 4: *value = self->m_pan_spread_7; break;
		case 5: *value = self->m_wave_shape_4; break;
		case 6: *value = self->m_win_type_5; break;
		
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
	// initialize parameter 0 ("m_duty_ratio_3")
	pi = self->__commonstate.params + 0;
	pi->name = "duty_ratio";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_duty_ratio_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_f0_1")
	pi = self->__commonstate.params + 1;
	pi->name = "f0";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_f0_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 500;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_formant_f_2")
	pi = self->__commonstate.params + 2;
	pi->name = "formant_f";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_formant_f_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 8000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_masking_6")
	pi = self->__commonstate.params + 3;
	pi->name = "masking";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_masking_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_pan_spread_7")
	pi = self->__commonstate.params + 4;
	pi->name = "pan_spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_pan_spread_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_wave_shape_4")
	pi = self->__commonstate.params + 5;
	pi->name = "wave_shape";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_wave_shape_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_win_type_5")
	pi = self->__commonstate.params + 6;
	pi->name = "win_type";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_win_type_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 3;
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


} // pulsar_synth::
