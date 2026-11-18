#include "adm_panner.h"

namespace adm_panner {

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
	t_sample m_mode_6;
	t_sample m_width_5;
	t_sample mc_channelcount;
	t_sample mc_channel;
	t_sample __m_slide_7;
	t_sample m_sharpness_4;
	t_sample m_smooth_2;
	t_sample m_air_damp_3;
	t_sample samplerate;
	t_sample m_prev_filtered_1;
	t_sample __m_slide_10;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_prev_filtered_1 = ((int)0);
		m_smooth_2 = ((int)240);
		m_air_damp_3 = ((t_sample)0.65000000000000002);
		m_sharpness_4 = ((t_sample)2.5);
		m_width_5 = ((int)100);
		m_mode_6 = ((int)0);
		mc_channelcount = 1;
		mc_channel = 1;
		__m_slide_7 = 0;
		__m_slide_10 = 0;
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		const t_sample * __in3 = __ins[2];
		t_sample * __out1 = __outs[0];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__in3 == 0) || (__out1 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		int speakers = ((((int)2) < mc_channelcount) ? mc_channelcount : ((int)2));
		int ch_idx = (mc_channel - ((int)1));
		t_sample iup_8 = (1 / maximum(1, fabs(m_smooth_2)));
		t_sample idown_9 = (1 / maximum(1, fabs(m_smooth_2)));
		t_sample iup_11 = (1 / maximum(1, fabs(m_smooth_2)));
		t_sample idown_12 = (1 / maximum(1, fabs(m_smooth_2)));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			const t_sample in3 = (*(__in3++));
			__m_slide_7 = fixdenorm((__m_slide_7 + (((in2 > __m_slide_7) ? iup_8 : idown_9) * (in2 - __m_slide_7))));
			t_sample x_s = __m_slide_7;
			__m_slide_10 = fixdenorm((__m_slide_10 + (((in3 > __m_slide_10) ? iup_11 : idown_12) * (in3 - __m_slide_10))));
			t_sample y_s = __m_slide_10;
			t_sample gain_spatial = ((int)0);
			t_sample d = ((int)1);
			if ((m_mode_6 > ((t_sample)0.5))) {
				t_sample v_13 = ((x_s + ((int)1)) * ((t_sample)0.5));
				t_sample src_pos = ((v_13 <= ((int)0)) ? ((int)0) : ((v_13 >= ((int)1)) ? ((int)1) : v_13));
				t_sample spk_pos = safediv(ch_idx, (speakers - ((int)1)));
				t_sample lin_dist = fabs((src_pos - spk_pos));
				t_sample v_14 = (m_width_5 * ((t_sample)0.01));
				t_sample w_norm = ((v_14 <= ((t_sample)0.050000000000000003)) ? ((t_sample)0.050000000000000003) : ((v_14 >= ((int)2)) ? ((int)2) : v_14));
				t_sample beam = (safediv(((t_sample)1.5), (speakers - ((int)1))) * w_norm);
				if ((lin_dist < beam)) {
					t_sample cos_val = cos((safediv(lin_dist, beam) * ((t_sample)1.5707963267948966)));
					gain_spatial = safepow(cos_val, m_sharpness_4);
					
				};
				
			} else {
				t_sample tmp_cartopol_963 = sqrt(((y_s * y_s) + (x_s * x_s)));
				t_sample tmp_cartopol_964 = atan2(x_s, y_s);
				t_sample r = tmp_cartopol_963;
				t_sample rad = tmp_cartopol_964;
				d = ((r <= ((int)0)) ? ((int)0) : ((r >= ((int)1)) ? ((int)1) : r));
				t_sample teta_norm = wrap((rad * ((t_sample)0.15915494309189535)), ((int)0), ((int)1));
				t_sample speaker_pos = wrap(safediv((ch_idx - ((t_sample)0.5)), speakers), ((int)0), ((int)1));
				t_sample diff = fabs((teta_norm - speaker_pos));
				t_sample minb_15 = (((int)1) - diff);
				t_sample ang_dist = (((minb_15 < diff) ? minb_15 : diff) * ((int)2));
				t_sample v_16 = (m_width_5 * ((t_sample)0.01));
				t_sample w_norm = ((v_16 <= ((t_sample)0.050000000000000003)) ? ((t_sample)0.050000000000000003) : ((v_16 >= ((int)2)) ? ((int)2) : v_16));
				t_sample beam_limit = (safediv(((int)2), speakers) * w_norm);
				if ((ang_dist < beam_limit)) {
					t_sample cos_val = cos((safediv(ang_dist, beam_limit) * ((t_sample)1.5707963267948966)));
					gain_spatial = safepow(cos_val, m_sharpness_4);
					
				};
				gain_spatial = (gain_spatial * ((d * ((t_sample)0.69999999999999996)) + ((t_sample)0.29999999999999999)));
				
			};
			t_sample cutoff_target = (((int)20000) - (((d * d) * m_air_damp_3) * ((int)17500)));
			t_sample tmp_cutoff_target_35 = ((cutoff_target <= ((int)2500)) ? ((int)2500) : ((cutoff_target >= ((int)20000)) ? ((int)20000) : cutoff_target));
			t_sample w = safediv((((t_sample)6.2831853071795862) * tmp_cutoff_target_35), samplerate);
			t_sample v_17 = safediv(w, (w + ((int)1)));
			t_sample alpha = ((v_17 <= ((t_sample)0.001)) ? ((t_sample)0.001) : ((v_17 >= ((int)1)) ? ((int)1) : v_17));
			t_sample filtered = ((in1 * alpha) + (m_prev_filtered_1 * (((int)1) - alpha)));
			m_prev_filtered_1 = filtered;
			t_sample tmp_expr_36 = (filtered * gain_spatial);
			t_sample out1 = tmp_expr_36;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			
		};
		return __exception;
		
	};
	inline void set_smooth(t_param _value) {
		m_smooth_2 = (_value < 1 ? 1 : (_value > 1 ? 1 : _value));
	};
	inline void set_air_damp(t_param _value) {
		m_air_damp_3 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_sharpness(t_param _value) {
		m_sharpness_4 = (_value < 1 ? 1 : (_value > 8 ? 8 : _value));
	};
	inline void set_width(t_param _value) {
		m_width_5 = (_value < 1 ? 1 : (_value > 200 ? 200 : _value));
	};
	inline void set_mode(t_param _value) {
		m_mode_6 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_mc_channelcount(t_param _value) {
		mc_channelcount = _value;
	};
	inline void set_mc_channel(t_param _value) {
		mc_channel = _value;
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 3;
int gen_kernel_numouts = 1;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 7; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "audio in", "X (-1…1)", "Y (-1…1)" };
const char *gen_kernel_outnames[] = { "out1" };

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
		case 0: self->set_air_damp(value); break;
		case 1: self->set_mc_channel(value); break;
		case 2: self->set_mc_channelcount(value); break;
		case 3: self->set_mode(value); break;
		case 4: self->set_sharpness(value); break;
		case 5: self->set_smooth(value); break;
		case 6: self->set_width(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_air_damp_3; break;
		case 1: *value = self->mc_channel; break;
		case 2: *value = self->mc_channelcount; break;
		case 3: *value = self->m_mode_6; break;
		case 4: *value = self->m_sharpness_4; break;
		case 5: *value = self->m_smooth_2; break;
		case 6: *value = self->m_width_5; break;
		
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
	// initialize parameter 0 ("m_air_damp_3")
	pi = self->__commonstate.params + 0;
	pi->name = "air_damp";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_air_damp_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("mc_channel")
	pi = self->__commonstate.params + 1;
	pi->name = "mc_channel";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->mc_channel;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = false;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("mc_channelcount")
	pi = self->__commonstate.params + 2;
	pi->name = "mc_channelcount";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->mc_channelcount;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = false;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_mode_6")
	pi = self->__commonstate.params + 3;
	pi->name = "mode";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mode_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_sharpness_4")
	pi = self->__commonstate.params + 4;
	pi->name = "sharpness";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_sharpness_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 8;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_smooth_2")
	pi = self->__commonstate.params + 5;
	pi->name = "smooth";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_smooth_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_width_5")
	pi = self->__commonstate.params + 6;
	pi->name = "width";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_width_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 200;
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


} // adm_panner::
