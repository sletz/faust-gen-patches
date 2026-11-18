#include "zdf_diode_ladder.h"

namespace zdf_diode_ladder {

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
	t_sample m_s2R_11;
	t_sample m_s1R_10;
	t_sample m_s3R_12;
	t_sample m_s4L_9;
	t_sample m_s4R_13;
	t_sample m_h_hpf_outL_15;
	t_sample m_h_hpf_inL_14;
	t_sample m_h_hpf_inR_16;
	t_sample m_h_hpf_outR_17;
	t_sample m_s3L_8;
	t_sample m_s1L_6;
	t_sample m_cutoff_1;
	t_sample samplerate;
	t_sample m_s2L_7;
	t_sample m_resonance_2;
	t_sample m_env_mod_4;
	t_sample m_drive_3;
	t_sample m_accent_5;
	t_sample m_h_env_18;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_cutoff_1 = ((int)1200);
		m_resonance_2 = ((t_sample)0.75);
		m_drive_3 = ((int)20);
		m_env_mod_4 = ((int)0);
		m_accent_5 = ((int)0);
		m_s1L_6 = ((int)0);
		m_s2L_7 = ((int)0);
		m_s3L_8 = ((int)0);
		m_s4L_9 = ((int)0);
		m_s1R_10 = ((int)0);
		m_s2R_11 = ((int)0);
		m_s3R_12 = ((int)0);
		m_s4R_13 = ((int)0);
		m_h_hpf_inL_14 = ((int)0);
		m_h_hpf_outL_15 = ((int)0);
		m_h_hpf_inR_16 = ((int)0);
		m_h_hpf_outR_17 = ((int)0);
		m_h_env_18 = ((int)0);
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
		t_sample atk_c = (((int)1) - exp(safediv(((int)-1), (((t_sample)0.0015) * samplerate))));
		t_sample rel_c = (((int)1) - exp(safediv(((int)-1), (((t_sample)0.055) * samplerate))));
		t_sample drive_gain = ((((int)1) + (m_drive_3 * ((t_sample)0.080000000000000002))) + (m_accent_5 * ((t_sample)0.029999999999999999)));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample maxa_19 = fabs(in1);
			t_sample maxb_20 = fabs(in2);
			t_sample env_in = ((maxa_19 < maxb_20) ? maxb_20 : maxa_19);
			int cond_21 = (env_in > m_h_env_18);
			t_sample env_c = (cond_21 ? atk_c : rel_c);
			m_h_env_18 = (m_h_env_18 + (env_c * (env_in - m_h_env_18)));
			t_sample v_22 = safepow((m_h_env_18 * ((int)2)), ((t_sample)0.80000000000000004));
			t_sample env_norm = ((v_22 <= ((int)0)) ? ((int)0) : ((v_22 >= ((int)1)) ? ((int)1) : v_22));
			t_sample acc_dyn = ((m_accent_5 * ((t_sample)0.01)) * env_norm);
			t_sample mod_oct = ((((m_env_mod_4 * ((t_sample)0.01)) * ((int)5)) * env_norm) + (acc_dyn * ((t_sample)1.2)));
			t_sample v_23 = (m_cutoff_1 * safepow(((int)2), mod_oct));
			t_sample mod_cutoff = ((v_23 <= ((int)20)) ? ((int)20) : ((v_23 >= ((int)20000)) ? ((int)20000) : v_23));
			t_sample norm_f = (safediv(mod_cutoff, samplerate) * ((t_sample)3.1415926535897931));
			t_sample g = tan(((norm_f <= ((t_sample)0.0001)) ? ((t_sample)0.0001) : ((norm_f >= ((t_sample)1.5)) ? ((t_sample)1.5) : norm_f)));
			t_sample G = safediv(g, (((int)1) + g));
			t_sample g0 = G;
			t_sample g1 = (G * ((t_sample)0.90000000000000002));
			t_sample g2 = (G * ((t_sample)0.80000000000000004));
			t_sample g3 = (G * ((t_sample)0.69999999999999996));
			t_sample v_24 = ((m_resonance_2 + (acc_dyn * ((t_sample)0.22))) * ((t_sample)4.2000000000000002));
			t_sample k = ((v_24 <= ((int)0)) ? ((int)0) : ((v_24 >= ((t_sample)4.9000000000000004)) ? ((t_sample)4.9000000000000004) : v_24));
			t_sample return_25;
			t_sample return_26;
			t_sample return_27;
			t_sample return_28;
			t_sample return_29;
			t_sample return_30;
			t_sample return_31;
			diode_ladder_step_d_d_d_d_d_d_d_d_d_d_d_d_d_d(in1, g0, g1, g2, g3, k, drive_gain, m_accent_5, m_s1L_6, m_s2L_7, m_s3L_8, m_s4L_9, m_h_hpf_inL_14, m_h_hpf_outL_15, return_25, return_26, return_27, return_28, return_29, return_30, return_31);
			t_sample outL = return_25;
			m_s1L_6 = return_26;
			m_s2L_7 = return_27;
			m_s3L_8 = return_28;
			m_s4L_9 = return_29;
			m_h_hpf_inL_14 = return_30;
			m_h_hpf_outL_15 = return_31;
			t_sample return_32;
			t_sample return_33;
			t_sample return_34;
			t_sample return_35;
			t_sample return_36;
			t_sample return_37;
			t_sample return_38;
			diode_ladder_step_d_d_d_d_d_d_d_d_d_d_d_d_d_d(in2, g0, g1, g2, g3, k, drive_gain, m_accent_5, m_s1R_10, m_s2R_11, m_s3R_12, m_s4R_13, m_h_hpf_inR_16, m_h_hpf_outR_17, return_32, return_33, return_34, return_35, return_36, return_37, return_38);
			t_sample outR = return_32;
			m_s1R_10 = return_33;
			m_s2R_11 = return_34;
			m_s3R_12 = return_35;
			m_s4R_13 = return_36;
			m_h_hpf_inR_16 = return_37;
			m_h_hpf_outR_17 = return_38;
			t_sample tmp_expr_591 = fixdenorm(outL);
			t_sample tmp_expr_592 = fixdenorm(outR);
			t_sample out1 = tmp_expr_591;
			t_sample out2 = tmp_expr_592;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_cutoff(t_param _value) {
		m_cutoff_1 = (_value < 20 ? 20 : (_value > 20000 ? 20000 : _value));
	};
	inline void set_resonance(t_param _value) {
		m_resonance_2 = (_value < 0 ? 0 : (_value > 1.2 ? 1.2 : _value));
	};
	inline void set_drive(t_param _value) {
		m_drive_3 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_env_mod(t_param _value) {
		m_env_mod_4 = (_value < -100 ? -100 : (_value > 100 ? 100 : _value));
	};
	inline void set_accent(t_param _value) {
		m_accent_5 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void diode_ladder_step_d_d_d_d_d_d_d_d_d_d_d_d_d_d(t_sample in_sig, t_sample g0, t_sample g1, t_sample g2, t_sample g3, t_sample k, t_sample drive_gain, t_sample accent_amt, t_sample s1, t_sample s2, t_sample s3, t_sample s4, t_sample h_in, t_sample h_out, t_sample& out1, t_sample& out2, t_sample& out3, t_sample& out4, t_sample& out5, t_sample& out6, t_sample& out7) {
		t_sample in_sat = tanh((in_sig * drive_gain));
		t_sample S_total = (g3 * (s3 + (g2 * (s2 + (g1 * (s1 + (g0 * in_sat)))))));
		t_sample denom = (((int)1) + (k * (((g0 * g1) * g2) * g3)));
		t_sample u = safediv((in_sat - (k * (s4 + S_total))), denom);
		t_sample u_sat = tanh((u * (((int)1) + (accent_amt * ((t_sample)0.02)))));
		t_sample v0 = ((u_sat - s1) * g0);
		t_sample y1 = (v0 + s1);
		t_sample ns1 = (y1 + v0);
		t_sample v1 = ((y1 - s2) * g1);
		t_sample y2 = (v1 + s2);
		t_sample ns2 = (y2 + v1);
		t_sample v2 = ((y2 - s3) * g2);
		t_sample y3 = (v2 + s3);
		t_sample ns3 = (y3 + v2);
		t_sample v3 = ((y3 - s4) * g3);
		t_sample y4 = (v3 + s4);
		t_sample ns4 = (y4 + v3);
		t_sample out_hpf = ((y4 - h_in) + (((t_sample)0.995) * h_out));
		out1 = out_hpf;
		out2 = ns1;
		out3 = ns2;
		out4 = ns3;
		out5 = ns4;
		out6 = y4;
		out7 = out_hpf;
		
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
int num_params() { return 5; }

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
		case 0: self->set_accent(value); break;
		case 1: self->set_cutoff(value); break;
		case 2: self->set_drive(value); break;
		case 3: self->set_env_mod(value); break;
		case 4: self->set_resonance(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_accent_5; break;
		case 1: *value = self->m_cutoff_1; break;
		case 2: *value = self->m_drive_3; break;
		case 3: *value = self->m_env_mod_4; break;
		case 4: *value = self->m_resonance_2; break;
		
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
	// initialize parameter 0 ("m_accent_5")
	pi = self->__commonstate.params + 0;
	pi->name = "accent";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_accent_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_cutoff_1")
	pi = self->__commonstate.params + 1;
	pi->name = "cutoff";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_cutoff_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 20000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_drive_3")
	pi = self->__commonstate.params + 2;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_env_mod_4")
	pi = self->__commonstate.params + 3;
	pi->name = "env_mod";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_env_mod_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -100;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_resonance_2")
	pi = self->__commonstate.params + 4;
	pi->name = "resonance";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_resonance_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1.2;
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


} // zdf_diode_ladder::
