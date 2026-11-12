#include "erbeverb_clone.h"

namespace erbeverb_clone {

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
	DCBlock __m_dcblock_34;
	DCBlock __m_dcblock_32;
	DCBlock __m_dcblock_31;
	DCBlock __m_dcblock_33;
	Delay m_d4_11;
	Delay m_ap1_10;
	Delay m_d2_13;
	Delay m_d1_14;
	Delay m_ap2_9;
	Delay m_pre_dly_8;
	Delay m_d3_12;
	int __exception;
	int vectorsize;
	t_sample m_decay_21;
	t_sample m_absorb_20;
	t_sample m_tilt_19;
	t_sample m_size_22;
	t_sample samplerate;
	t_sample __m_slide_23;
	t_sample m_h1_7;
	t_sample m_predelay_18;
	t_sample m_depth_16;
	t_sample m_h4_4;
	t_sample m_h3_5;
	t_sample m_speed_17;
	t_sample m_h_lpL_3;
	t_sample m_h_ph_1;
	t_sample m_h_lpR_2;
	t_sample m_mix_rev_15;
	t_sample m_h2_6;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_ph_1 = ((int)0);
		m_h_lpR_2 = ((int)0);
		m_h_lpL_3 = ((int)0);
		m_h4_4 = ((int)0);
		m_h3_5 = ((int)0);
		m_h2_6 = ((int)0);
		m_h1_7 = ((int)0);
		m_pre_dly_8.reset("m_pre_dly_8", ((int)9600));
		m_ap2_9.reset("m_ap2_9", ((int)2000));
		m_ap1_10.reset("m_ap1_10", ((int)2000));
		m_d4_11.reset("m_d4_11", ((int)15000));
		m_d3_12.reset("m_d3_12", ((int)15000));
		m_d2_13.reset("m_d2_13", ((int)15000));
		m_d1_14.reset("m_d1_14", ((int)15000));
		m_mix_rev_15 = ((int)50);
		m_depth_16 = ((int)2);
		m_speed_17 = ((int)1);
		m_predelay_18 = ((int)10);
		m_tilt_19 = ((int)0);
		m_absorb_20 = ((int)40);
		m_decay_21 = ((int)60);
		m_size_22 = ((int)50);
		__m_slide_23 = 0;
		__m_dcblock_31.reset();
		__m_dcblock_32.reset();
		__m_dcblock_33.reset();
		__m_dcblock_34.reset();
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
		t_sample slide_input_24 = (m_size_22 * ((t_sample)0.01));
		t_sample iup_25 = (1 / maximum(1, fabs(((int)2000))));
		t_sample idown_26 = (1 / maximum(1, fabs(((int)2000))));
		t_sample fb_amount = (m_decay_21 * ((t_sample)0.01));
		t_sample damp = (m_absorb_20 * ((t_sample)0.01));
		t_sample tmp_abs_995 = fabs(m_tilt_19);
		int cond_35 = (m_tilt_19 < ((int)0));
		t_sample tmp_abs_999 = fabs(m_tilt_19);
		int cond_36 = (m_tilt_19 < ((int)0));
		t_sample tmp_div_1003 = (m_mix_rev_15 * ((t_sample)0.01));
		t_sample tmp_div_1005 = (m_mix_rev_15 * ((t_sample)0.01));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			__m_slide_23 = fixdenorm((__m_slide_23 + (((slide_input_24 > __m_slide_23) ? iup_25 : idown_26) * (slide_input_24 - __m_slide_23))));
			t_sample s_size = __m_slide_23;
			m_h_ph_1 = wrap((m_h_ph_1 + safediv(m_speed_17, samplerate)), ((int)0), ((int)1));
			t_sample lfo = (sin((m_h_ph_1 * ((t_sample)6.2831853071795862))) * (m_depth_16 * ((int)5)));
			t_sample v_27 = ((((int)1531) * s_size) + lfo);
			t_sample t1 = ((v_27 <= ((int)10)) ? ((int)10) : ((v_27 >= ((int)14000)) ? ((int)14000) : v_27));
			t_sample v_28 = ((((int)2237) * s_size) - lfo);
			t_sample t2 = ((v_28 <= ((int)10)) ? ((int)10) : ((v_28 >= ((int)14000)) ? ((int)14000) : v_28));
			t_sample v_29 = ((((int)3163) * s_size) + lfo);
			t_sample t3 = ((v_29 <= ((int)10)) ? ((int)10) : ((v_29 >= ((int)14000)) ? ((int)14000) : v_29));
			t_sample v_30 = ((((int)4453) * s_size) - lfo);
			t_sample t4 = ((v_30 <= ((int)10)) ? ((int)10) : ((v_30 >= ((int)14000)) ? ((int)14000) : v_30));
			t_sample sig_in = ((in1 + in2) * ((t_sample)0.5));
			t_sample p_sig = m_pre_dly_8.read_linear((m_predelay_18 * (samplerate * 0.001)));
			m_pre_dly_8.write(sig_in);
			t_sample v_ap1 = (p_sig - (m_ap1_10.read_linear((((int)400) * s_size)) * ((t_sample)0.59999999999999998)));
			m_ap1_10.write(v_ap1);
			t_sample df1 = (m_ap1_10.read_linear((((int)400) * s_size)) + (v_ap1 * ((t_sample)0.59999999999999998)));
			t_sample v_ap2 = (df1 - (m_ap2_9.read_linear((((int)600) * s_size)) * ((t_sample)0.59999999999999998)));
			m_ap2_9.write(v_ap2);
			t_sample diff_in = (m_ap2_9.read_linear((((int)600) * s_size)) + (v_ap2 * ((t_sample)0.59999999999999998)));
			t_sample r1 = m_d1_14.read_linear(t1);
			t_sample r2 = m_d2_13.read_linear(t2);
			t_sample r3 = m_d3_12.read_linear(t3);
			t_sample r4 = m_d4_11.read_linear(t4);
			t_sample j1 = ((((r1 + r2) + r3) + r4) * ((t_sample)0.5));
			t_sample j2 = ((((r1 - r2) + r3) - r4) * ((t_sample)0.5));
			t_sample j3 = ((((r1 + r2) - r3) - r4) * ((t_sample)0.5));
			t_sample j4 = ((((r1 - r2) - r3) + r4) * ((t_sample)0.5));
			t_sample tmp_mix_988 = (j1 + (damp * (m_h1_7 - j1)));
			m_h1_7 = tmp_mix_988;
			t_sample tmp_mix_989 = (j2 + (damp * (m_h2_6 - j2)));
			m_h2_6 = tmp_mix_989;
			t_sample tmp_mix_990 = (j3 + (damp * (m_h3_5 - j3)));
			m_h3_5 = tmp_mix_990;
			t_sample tmp_mix_991 = (j4 + (damp * (m_h4_4 - j4)));
			m_h4_4 = tmp_mix_991;
			m_d1_14.write(fixdenorm(__m_dcblock_31((diff_in + tanh((m_h1_7 * fb_amount))))));
			m_d2_13.write(fixdenorm(__m_dcblock_32((diff_in + tanh((m_h2_6 * fb_amount))))));
			m_d3_12.write(fixdenorm(__m_dcblock_33((diff_in + tanh((m_h3_5 * fb_amount))))));
			m_d4_11.write(fixdenorm(__m_dcblock_34((diff_in + tanh((m_h4_4 * fb_amount))))));
			t_sample raw_L = ((r1 + r3) * ((t_sample)0.5));
			t_sample raw_R = ((r2 + r4) * ((t_sample)0.5));
			t_sample tmp_mix_992 = (raw_L + (((t_sample)0.10000000000000001) * (m_h_lpL_3 - raw_L)));
			t_sample t_lp_L = tmp_mix_992;
			m_h_lpL_3 = t_lp_L;
			t_sample tmp_mix_993 = (raw_R + (((t_sample)0.10000000000000001) * (m_h_lpR_2 - raw_R)));
			t_sample t_lp_R = tmp_mix_993;
			m_h_lpR_2 = t_lp_R;
			t_sample tmp_mix_994 = (raw_L + (tmp_abs_995 * (t_lp_L - raw_L)));
			t_sample tmp_sub_997 = (raw_L - t_lp_L);
			t_sample tmp_mix_996 = (raw_L + (m_tilt_19 * (tmp_sub_997 - raw_L)));
			t_sample res_L = (cond_35 ? tmp_mix_994 : tmp_mix_996);
			t_sample tmp_mix_998 = (raw_R + (tmp_abs_999 * (t_lp_R - raw_R)));
			t_sample tmp_sub_1001 = (raw_R - t_lp_R);
			t_sample tmp_mix_1000 = (raw_R + (m_tilt_19 * (tmp_sub_1001 - raw_R)));
			t_sample res_R = (cond_36 ? tmp_mix_998 : tmp_mix_1000);
			t_sample tmp_mix_1002 = (in1 + (tmp_div_1003 * (res_L - in1)));
			t_sample tmp_expr_203 = tanh(tmp_mix_1002);
			t_sample tmp_mix_1004 = (in2 + (tmp_div_1005 * (res_R - in2)));
			t_sample tmp_expr_204 = tanh(tmp_mix_1004);
			t_sample out2 = tmp_expr_204;
			t_sample out1 = tmp_expr_203;
			m_pre_dly_8.step();
			m_ap2_9.step();
			m_ap1_10.step();
			m_d4_11.step();
			m_d3_12.step();
			m_d2_13.step();
			m_d1_14.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_mix_rev(t_param _value) {
		m_mix_rev_15 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_depth(t_param _value) {
		m_depth_16 = (_value < 0 ? 0 : (_value > 20 ? 20 : _value));
	};
	inline void set_speed(t_param _value) {
		m_speed_17 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 10 ? 10 : _value));
	};
	inline void set_predelay(t_param _value) {
		m_predelay_18 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_tilt(t_param _value) {
		m_tilt_19 = (_value < -1 ? -1 : (_value > 1 ? 1 : _value));
	};
	inline void set_absorb(t_param _value) {
		m_absorb_20 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_decay(t_param _value) {
		m_decay_21 = (_value < 0 ? 0 : (_value > 110 ? 110 : _value));
	};
	inline void set_size(t_param _value) {
		m_size_22 = (_value < 0.5 ? 0.5 : (_value > 100 ? 100 : _value));
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
int num_params() { return 8; }

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
		case 0: self->set_absorb(value); break;
		case 1: self->set_decay(value); break;
		case 2: self->set_depth(value); break;
		case 3: self->set_mix_rev(value); break;
		case 4: self->set_predelay(value); break;
		case 5: self->set_size(value); break;
		case 6: self->set_speed(value); break;
		case 7: self->set_tilt(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_absorb_20; break;
		case 1: *value = self->m_decay_21; break;
		case 2: *value = self->m_depth_16; break;
		case 3: *value = self->m_mix_rev_15; break;
		case 4: *value = self->m_predelay_18; break;
		case 5: *value = self->m_size_22; break;
		case 6: *value = self->m_speed_17; break;
		case 7: *value = self->m_tilt_19; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(8 * sizeof(ParamInfo));
	self->__commonstate.numparams = 8;
	// initialize parameter 0 ("m_absorb_20")
	pi = self->__commonstate.params + 0;
	pi->name = "absorb";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_absorb_20;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_decay_21")
	pi = self->__commonstate.params + 1;
	pi->name = "decay";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_decay_21;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 110;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_depth_16")
	pi = self->__commonstate.params + 2;
	pi->name = "depth";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_depth_16;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 20;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_mix_rev_15")
	pi = self->__commonstate.params + 3;
	pi->name = "mix_rev";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_rev_15;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_predelay_18")
	pi = self->__commonstate.params + 4;
	pi->name = "predelay";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_predelay_18;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_size_22")
	pi = self->__commonstate.params + 5;
	pi->name = "size";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_size_22;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.5;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_speed_17")
	pi = self->__commonstate.params + 6;
	pi->name = "speed";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_speed_17;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 10;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_tilt_19")
	pi = self->__commonstate.params + 7;
	pi->name = "tilt";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_tilt_19;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -1;
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


} // erbeverb_clone::
