#include "offset_spline_random.h"

namespace offset_spline_random {

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
	Delay m_delay_fb_9;
	Delta __m_delta_16;
	int __exception;
	int vectorsize;
	Phasor __m_phasor_15;
	t_sample m_range_11;
	t_sample m_mode_10;
	t_sample m_frequency_12;
	t_sample m_amp_14;
	t_sample m_trigmode_13;
	t_sample samples_to_seconds;
	t_sample samplerate;
	t_sample m_p5_1;
	t_sample m_p0_6;
	t_sample m_p4_2;
	t_sample m_h_phase_8;
	t_sample m_p3_3;
	t_sample m_p1_5;
	t_sample m_p2_4;
	t_sample m_h_rand_walk_7;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_p5_1 = ((int)0);
		m_p4_2 = ((int)0);
		m_p3_3 = ((int)0);
		m_p2_4 = ((int)0);
		m_p1_5 = ((int)0);
		m_p0_6 = ((int)0);
		m_h_rand_walk_7 = ((int)0);
		m_h_phase_8 = ((int)0);
		m_delay_fb_9.reset("m_delay_fb_9", ((int)120));
		m_mode_10 = 1;
		m_range_11 = ((int)50);
		m_frequency_12 = ((int)20);
		m_trigmode_13 = 0;
		m_amp_14 = ((t_sample)0.20000000000000001);
		samples_to_seconds = (1 / samplerate);
		__m_phasor_15.reset(0);
		__m_delta_16.reset(0);
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
		samples_to_seconds = (1 / samplerate);
		t_sample tmp_sub1_721 = (m_range_11 - ((int)0));
		t_sample tmp_scale_718 = ((safepow((tmp_sub1_721 * ((t_sample)0.01)), ((int)1)) * ((int)4)) + ((int)0));
		t_sample scale_amt = tmp_scale_718;
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample phasor_int = __m_phasor_15(m_frequency_12, samples_to_seconds);
			t_sample phase = (m_trigmode_13 ? in2 : phasor_int);
			int trig = (fabs(__m_delta_16(phase)) > ((t_sample)0.5));
			t_sample n1 = noise();
			t_sample n2 = noise();
			t_sample u1 = fabs(n1);
			t_sample u2 = (n2 * ((t_sample)3.1415926535897931));
			t_sample gen_noise = (sqrt((log(((u1 < ((t_sample)9.9999999999999995e-07)) ? ((t_sample)9.9999999999999995e-07) : u1)) * ((int)-2))) * cos(u2));
			t_sample m_step_18 = (gen_noise * scale_amt);
			m_h_rand_walk_7 = fold((m_h_rand_walk_7 + (trig ? m_step_18 : ((int)0))), ((int)-1), ((int)1));
			if (trig) {
				m_p5_1 = m_p4_2;
				m_p4_2 = m_p3_3;
				m_p3_3 = m_p2_4;
				m_p2_4 = m_p1_5;
				m_p1_5 = m_p0_6;
				m_p0_6 = m_h_rand_walk_7;
				
			};
			t_sample sig_spline = spline6_interp(phase, m_p5_1, m_p4_2, m_p3_3, m_p2_4, m_p1_5, m_p0_6);
			t_sample sig_stepped = m_p0_6;
			t_sample sig_final = (m_mode_10 ? sig_spline : sig_stepped);
			t_sample audio_out = fixdenorm((sig_final * m_amp_14));
			t_sample tap_fb = m_delay_fb_9.read_step(((int)120));
			t_sample tmp_mix_722 = (in1 + (((t_sample)0.5) * (tap_fb - in1)));
			t_sample mixed_input = tmp_mix_722;
			m_delay_fb_9.write(mixed_input);
			t_sample tmp_expr_429 = fold((mixed_input + audio_out), ((int)-1), ((int)1));
			int tmp_expr_430 = trig;
			t_sample tmp_expr_431 = sig_spline;
			t_sample tmp_expr_432 = sig_stepped;
			t_sample out4 = tmp_expr_432;
			t_sample out3 = tmp_expr_431;
			t_sample out2 = tmp_expr_430;
			t_sample out1 = tmp_expr_429;
			m_delay_fb_9.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			(*(__out4++)) = out4;
			
		};
		return __exception;
		
	};
	inline void set_mode(t_param _value) {
		m_mode_10 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_range(t_param _value) {
		m_range_11 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_frequency(t_param _value) {
		m_frequency_12 = (_value < 0.01 ? 0.01 : (_value > 500 ? 500 : _value));
	};
	inline void set_trigmode(t_param _value) {
		m_trigmode_13 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_amp(t_param _value) {
		m_amp_14 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
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
int num_params() { return 5; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "value in", "external clock (phasor)" };
const char *gen_kernel_outnames[] = { "result out", "pre-amp freq pulse", "pre-amp smooth random walk", "pre-amp stepped random walk" };

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
		case 0: self->set_amp(value); break;
		case 1: self->set_frequency(value); break;
		case 2: self->set_mode(value); break;
		case 3: self->set_range(value); break;
		case 4: self->set_trigmode(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_amp_14; break;
		case 1: *value = self->m_frequency_12; break;
		case 2: *value = self->m_mode_10; break;
		case 3: *value = self->m_range_11; break;
		case 4: *value = self->m_trigmode_13; break;
		
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
	// initialize parameter 0 ("m_amp_14")
	pi = self->__commonstate.params + 0;
	pi->name = "amp";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_amp_14;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_frequency_12")
	pi = self->__commonstate.params + 1;
	pi->name = "frequency";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_frequency_12;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 500;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_mode_10")
	pi = self->__commonstate.params + 2;
	pi->name = "mode";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mode_10;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_range_11")
	pi = self->__commonstate.params + 3;
	pi->name = "range";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_range_11;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_trigmode_13")
	pi = self->__commonstate.params + 4;
	pi->name = "trigmode";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_trigmode_13;
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


} // offset_spline_random::
