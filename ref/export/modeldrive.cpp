#include "modeldrive.h"

namespace modeldrive {

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
	t_sample m_mix_7;
	t_sample m_gain_8;
	t_sample m_level_comp_9;
	t_sample m_tone_10;
	t_sample m_h_dc_x_L_6;
	t_sample m_model_11;
	t_sample m_h_dc_y_L_5;
	t_sample m_h_dc_y_R_3;
	t_sample samplerate;
	t_sample m_h_dc_x_R_4;
	t_sample m_h_tone_R_1;
	t_sample m_h_tone_L_2;
	t_sample m_drive_12;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_tone_R_1 = ((int)0);
		m_h_tone_L_2 = ((int)0);
		m_h_dc_y_R_3 = ((int)0);
		m_h_dc_x_R_4 = ((int)0);
		m_h_dc_y_L_5 = ((int)0);
		m_h_dc_x_L_6 = ((int)0);
		m_mix_7 = ((int)100);
		m_gain_8 = ((int)0);
		m_level_comp_9 = ((int)1);
		m_tone_10 = ((int)12000);
		m_model_11 = ((int)0);
		m_drive_12 = ((int)30);
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		const t_sample * __in3 = __ins[2];
		t_sample * __out1 = __outs[0];
		t_sample * __out2 = __outs[1];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__in3 == 0) || (__out1 == 0) || (__out2 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		int comp_active = (m_level_comp_9 > ((t_sample)0.5));
		t_sample v_14 = (m_model_11 * ((t_sample)0.029999999999999999));
		t_sample pos = ((v_14 <= ((int)0)) ? ((int)0) : ((v_14 >= ((int)3)) ? ((int)3) : v_14));
		t_sample idx = floor(pos);
		t_sample fr = (pos - idx);
		t_sample w0 = cos((fr * ((t_sample)1.5707963267948966)));
		t_sample w1 = sin((fr * ((t_sample)1.5707963267948966)));
		int cond_17 = (idx < ((int)1));
		int cond_19 = (idx < ((int)2));
		int cond_23 = (idx < ((int)1));
		int cond_25 = (idx < ((int)2));
		t_sample tone_fc = ((m_tone_10 <= ((int)100)) ? ((int)100) : ((m_tone_10 >= ((int)18000)) ? ((int)18000) : m_tone_10));
		t_sample tone_omega = (tone_fc * safediv(((t_sample)6.2831853071795862), samplerate));
		t_sample v_29 = safediv(tone_omega, (((int)1) + tone_omega));
		t_sample tone_coeff = ((v_29 <= ((t_sample)0.001)) ? ((t_sample)0.001) : ((v_29 >= ((t_sample)0.999)) ? ((t_sample)0.999) : v_29));
		t_sample make_up = dbtoa(m_gain_8);
		t_sample v_30 = (m_mix_7 * ((t_sample)0.01));
		t_sample eff_mix = ((v_30 <= ((int)0)) ? ((int)0) : ((v_30 >= ((int)1)) ? ((int)1) : v_30));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			const t_sample in3 = (*(__in3++));
			t_sample v_13 = ((m_drive_12 + (in3 * ((int)100))) * ((t_sample)0.01));
			t_sample eff_drive = ((v_13 <= ((int)0)) ? ((int)0) : ((v_13 >= ((int)1)) ? ((int)1) : v_13));
			t_sample scale_d1 = (((int)8) + (((int)27) * safepow(eff_drive, ((t_sample)0.29999999999999999))));
			t_sample lo_f = (((t_sample)-0.69999999999999996) + (((t_sample)0.39999999999999997) * safepow(eff_drive, ((t_sample)0.80000000000000004))));
			t_sample hi_f = (((t_sample)0.69999999999999996) + (((t_sample)-0.39999999999999997) * safepow(eff_drive, ((t_sample)0.80000000000000004))));
			t_sample maxb_15 = (hi_f - lo_f);
			t_sample span = ((((t_sample)0.001) < maxb_15) ? maxb_15 : ((t_sample)0.001));
			t_sample scale_f = (((int)1) + (((int)5) * safepow(eff_drive, ((t_sample)0.29999999999999999))));
			t_sample iftrue_16 = (safediv(((t_sample)0.69999999999999996), ((((t_sample)0.10000000000000001) < hi_f) ? hi_f : ((t_sample)0.10000000000000001))) * ((t_sample)1.8999999999999999));
			t_sample fold_comp = (comp_active ? iftrue_16 : ((int)1));
			t_sample scale_q = (((int)5) + (((t_sample)-3.9500000000000002) * safepow(eff_drive, ((t_sample)0.29999999999999999))));
			t_sample scale_w = (((int)1) + (((int)5) * safepow(eff_drive, ((t_sample)0.29999999999999999))));
			t_sample m1_L = (tanh(((in1 * ((int)2)) * scale_d1)) * (comp_active ? ((t_sample)0.35999999999999999) : ((t_sample)0.14999999999999999)));
			t_sample x_f_L = ((in1 * ((int)2)) * scale_f);
			t_sample fold_L = (lo_f + fabs((wrap(((x_f_L - lo_f) - span), ((int)0), (((int)2) * span)) - span)));
			t_sample m2_L = ((((fold_L <= ((int)-1)) ? ((int)-1) : ((fold_L >= ((int)1)) ? ((int)1) : fold_L)) * ((t_sample)0.45000000000000001)) * fold_comp);
			t_sample x_q_L = ((in1 * ((t_sample)0.59999999999999998)) * scale_q);
			t_sample q_L = safediv(((ceil(x_q_L) + floor((x_q_L + ((t_sample)0.5)))) - ((t_sample)0.5)), scale_q);
			t_sample dc_L = ((q_L - m_h_dc_x_L_6) + (((t_sample)0.995) * m_h_dc_y_L_5));
			m_h_dc_x_L_6 = q_L;
			m_h_dc_y_L_5 = dc_L;
			t_sample m3_L = ((dc_L * ((t_sample)0.25)) * (comp_active ? ((t_sample)2.2999999999999998) : ((int)1)));
			t_sample wrap_L = wrap(((in1 * ((int)12)) * scale_w), ((t_sample)-0.5), ((t_sample)0.5));
			t_sample m4_L = ((wrap_L * ((t_sample)0.80000000000000004)) * (comp_active ? ((t_sample)0.94999999999999996) : ((t_sample)1.28)));
			t_sample iftrue_18 = ((m1_L * w0) + (m2_L * w1));
			t_sample iftrue_20 = ((m2_L * w0) + (m3_L * w1));
			t_sample iffalse_21 = ((m3_L * w0) + (m4_L * w1));
			t_sample iffalse_22 = (cond_19 ? iftrue_20 : iffalse_21);
			t_sample dist_L = (cond_17 ? iftrue_18 : iffalse_22);
			t_sample m1_R = (tanh(((in2 * ((int)2)) * scale_d1)) * (comp_active ? ((t_sample)0.35999999999999999) : ((t_sample)0.14999999999999999)));
			t_sample x_f_R = ((in2 * ((int)2)) * scale_f);
			t_sample fold_R = (lo_f + fabs((wrap(((x_f_R - lo_f) - span), ((int)0), (((int)2) * span)) - span)));
			t_sample m2_R = ((((fold_R <= ((int)-1)) ? ((int)-1) : ((fold_R >= ((int)1)) ? ((int)1) : fold_R)) * ((t_sample)0.45000000000000001)) * fold_comp);
			t_sample x_q_R = ((in2 * ((t_sample)0.59999999999999998)) * scale_q);
			t_sample q_R = safediv(((ceil(x_q_R) + floor((x_q_R + ((t_sample)0.5)))) - ((t_sample)0.5)), scale_q);
			t_sample dc_R = ((q_R - m_h_dc_x_R_4) + (((t_sample)0.995) * m_h_dc_y_R_3));
			m_h_dc_x_R_4 = q_R;
			m_h_dc_y_R_3 = dc_R;
			t_sample m3_R = ((dc_R * ((t_sample)0.25)) * (comp_active ? ((t_sample)2.2999999999999998) : ((int)1)));
			t_sample wrap_R = wrap(((in2 * ((int)12)) * scale_w), ((t_sample)-0.5), ((t_sample)0.5));
			t_sample m4_R = ((wrap_R * ((t_sample)0.80000000000000004)) * (comp_active ? ((t_sample)0.94999999999999996) : ((t_sample)1.28)));
			t_sample iftrue_24 = ((m1_R * w0) + (m2_R * w1));
			t_sample iftrue_26 = ((m2_R * w0) + (m3_R * w1));
			t_sample iffalse_27 = ((m3_R * w0) + (m4_R * w1));
			t_sample iffalse_28 = (cond_25 ? iftrue_26 : iffalse_27);
			t_sample dist_R = (cond_23 ? iftrue_24 : iffalse_28);
			m_h_tone_L_2 = fixdenorm((m_h_tone_L_2 + (tone_coeff * (dist_L - m_h_tone_L_2))));
			m_h_tone_R_1 = fixdenorm((m_h_tone_R_1 + (tone_coeff * (dist_R - m_h_tone_R_1))));
			t_sample lim_L = (tanh((m_h_tone_L_2 * ((t_sample)1.1000000000000001))) * make_up);
			t_sample lim_R = (tanh((m_h_tone_R_1 * ((t_sample)1.1000000000000001))) * make_up);
			t_sample tmp_mix_737 = (in1 + (eff_mix * (lim_L - in1)));
			t_sample tmp_expr_413 = tmp_mix_737;
			t_sample tmp_mix_738 = (in2 + (eff_mix * (lim_R - in2)));
			t_sample tmp_expr_414 = tmp_mix_738;
			t_sample out1 = tmp_expr_413;
			t_sample out2 = tmp_expr_414;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_mix(t_param _value) {
		m_mix_7 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_gain(t_param _value) {
		m_gain_8 = (_value < -24 ? -24 : (_value > 12 ? 12 : _value));
	};
	inline void set_level_comp(t_param _value) {
		m_level_comp_9 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_tone(t_param _value) {
		m_tone_10 = (_value < 100 ? 100 : (_value > 18000 ? 18000 : _value));
	};
	inline void set_model(t_param _value) {
		m_model_11 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_drive(t_param _value) {
		m_drive_12 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 3;
int gen_kernel_numouts = 2;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 6; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio Left In", "Audio Right In", "Drive CV In" };
const char *gen_kernel_outnames[] = { "Processed Left (Dry/Wet)", "Processed Right (Dry/Wet)" };

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
		case 1: self->set_gain(value); break;
		case 2: self->set_level_comp(value); break;
		case 3: self->set_mix(value); break;
		case 4: self->set_model(value); break;
		case 5: self->set_tone(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_drive_12; break;
		case 1: *value = self->m_gain_8; break;
		case 2: *value = self->m_level_comp_9; break;
		case 3: *value = self->m_mix_7; break;
		case 4: *value = self->m_model_11; break;
		case 5: *value = self->m_tone_10; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(6 * sizeof(ParamInfo));
	self->__commonstate.numparams = 6;
	// initialize parameter 0 ("m_drive_12")
	pi = self->__commonstate.params + 0;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_12;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_gain_8")
	pi = self->__commonstate.params + 1;
	pi->name = "gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_8;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -24;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_level_comp_9")
	pi = self->__commonstate.params + 2;
	pi->name = "level_comp";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_level_comp_9;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_mix_7")
	pi = self->__commonstate.params + 3;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_model_11")
	pi = self->__commonstate.params + 4;
	pi->name = "model";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_model_11;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_tone_10")
	pi = self->__commonstate.params + 5;
	pi->name = "tone";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_tone_10;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 100;
	pi->outputmax = 18000;
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


} // modeldrive::
