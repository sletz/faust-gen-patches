#include "fdn_multireverb.h"

namespace fdn_multireverb {

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
	DCBlock __m_dcblock_35;
	DCBlock __m_dcblock_36;
	DCBlock __m_dcblock_33;
	Delay m_ap2_8;
	Delay m_d4_10;
	Delay m_d3_11;
	Delay m_d1_13;
	Delay m_pre_dly_7;
	Delay m_d2_12;
	Delay m_ap1_9;
	int __exception;
	int vectorsize;
	t_sample m_decay_21;
	t_sample m_spread_20;
	t_sample m_absorb_19;
	t_sample m_size_22;
	t_sample mc_channel;
	t_sample __m_slide_25;
	t_sample mc_channelcount;
	t_sample m_tilt_18;
	t_sample m_mix_rev_14;
	t_sample m_speed_16;
	t_sample m_h_lp_2;
	t_sample m_h_ph_1;
	t_sample samplerate;
	t_sample m_predelay_17;
	t_sample m_h4_3;
	t_sample m_h2_5;
	t_sample m_h3_4;
	t_sample m_depth_15;
	t_sample m_h1_6;
	t_sample __m_slide_38;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_ph_1 = ((int)0);
		m_h_lp_2 = ((int)0);
		m_h4_3 = ((int)0);
		m_h3_4 = ((int)0);
		m_h2_5 = ((int)0);
		m_h1_6 = ((int)0);
		m_pre_dly_7.reset("m_pre_dly_7", ((int)9600));
		m_ap2_8.reset("m_ap2_8", ((int)2000));
		m_ap1_9.reset("m_ap1_9", ((int)2000));
		m_d4_10.reset("m_d4_10", ((int)15000));
		m_d3_11.reset("m_d3_11", ((int)15000));
		m_d2_12.reset("m_d2_12", ((int)15000));
		m_d1_13.reset("m_d1_13", ((int)15000));
		m_mix_rev_14 = ((int)25);
		m_depth_15 = ((int)5);
		m_speed_16 = ((int)1);
		m_predelay_17 = ((int)10);
		m_tilt_18 = (-((t_sample)0.10000000000000001));
		m_absorb_19 = ((int)10);
		m_spread_20 = ((int)90);
		m_decay_21 = ((int)82);
		m_size_22 = ((int)90);
		mc_channelcount = 1;
		mc_channel = 1;
		__m_slide_25 = 0;
		__m_dcblock_33.reset();
		__m_dcblock_34.reset();
		__m_dcblock_35.reset();
		__m_dcblock_36.reset();
		__m_slide_38 = 0;
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		t_sample * __out1 = __outs[0];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__out1 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		int n_chans = ((((int)1) < mc_channelcount) ? mc_channelcount : ((int)1));
		int ch_idx = (mc_channel - ((int)1));
		int cond_23 = (n_chans > ((int)1));
		t_sample iftrue_24 = safediv(ch_idx, n_chans);
		t_sample ch_pos = (cond_23 ? iftrue_24 : ((int)0));
		t_sample s_spread = (m_spread_20 * ((t_sample)0.01));
		t_sample ch_detune = ((sin(((ch_idx + ((int)1)) * ((t_sample)1.6180339886999999))) * ((t_sample)0.059999999999999998)) * s_spread);
		t_sample slide_input_26 = (m_size_22 * ((t_sample)0.01));
		t_sample iup_27 = (1 / maximum(1, fabs(((int)2000))));
		t_sample idown_28 = (1 / maximum(1, fabs(((int)2000))));
		t_sample fb_amount = (m_decay_21 * ((t_sample)0.01));
		t_sample damp = (m_absorb_19 * ((t_sample)0.01));
		t_sample tap = safemod(ch_idx, ((int)4));
		t_sample tmp_abs_799 = fabs(m_tilt_18);
		int cond_37 = (m_tilt_18 < ((int)0));
		t_sample v_39 = (m_mix_rev_14 * ((t_sample)0.01));
		t_sample slide_input_40 = ((v_39 <= ((int)0)) ? ((int)0) : ((v_39 >= ((int)1)) ? ((int)1) : v_39));
		t_sample iup_41 = (1 / maximum(1, fabs(((int)240))));
		t_sample idown_42 = (1 / maximum(1, fabs(((int)240))));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			__m_slide_25 = fixdenorm((__m_slide_25 + (((slide_input_26 > __m_slide_25) ? iup_27 : idown_28) * (slide_input_26 - __m_slide_25))));
			t_sample s_size = __m_slide_25;
			m_h_ph_1 = wrap((m_h_ph_1 + safediv(m_speed_16, samplerate)), ((int)0), ((int)1));
			t_sample lfo_ph = wrap((m_h_ph_1 + (ch_pos * s_spread)), ((int)0), ((int)1));
			t_sample lfo = (sin((lfo_ph * ((t_sample)6.2831853071795862))) * (m_depth_15 * ((int)5)));
			t_sample scale_ch = (s_size * (((int)1) + ch_detune));
			t_sample v_29 = ((((int)1531) * scale_ch) + lfo);
			t_sample t1 = ((v_29 <= ((int)10)) ? ((int)10) : ((v_29 >= ((int)14000)) ? ((int)14000) : v_29));
			t_sample v_30 = ((((int)2237) * scale_ch) - lfo);
			t_sample t2 = ((v_30 <= ((int)10)) ? ((int)10) : ((v_30 >= ((int)14000)) ? ((int)14000) : v_30));
			t_sample v_31 = ((((int)3163) * scale_ch) + lfo);
			t_sample t3 = ((v_31 <= ((int)10)) ? ((int)10) : ((v_31 >= ((int)14000)) ? ((int)14000) : v_31));
			t_sample v_32 = ((((int)4453) * scale_ch) - lfo);
			t_sample t4 = ((v_32 <= ((int)10)) ? ((int)10) : ((v_32 >= ((int)14000)) ? ((int)14000) : v_32));
			t_sample sig_in = in1;
			t_sample p_sig = m_pre_dly_7.read_linear((m_predelay_17 * (samplerate * 0.001)));
			m_pre_dly_7.write(sig_in);
			t_sample ap1_time = ((((int)400) * s_size) * (((int)1) + (ch_detune * ((t_sample)0.5))));
			t_sample ap2_time = ((((int)600) * s_size) * (((int)1) - (ch_detune * ((t_sample)0.5))));
			t_sample v_ap1 = (p_sig - (m_ap1_9.read_linear(ap1_time) * ((t_sample)0.59999999999999998)));
			m_ap1_9.write(v_ap1);
			t_sample df1 = (m_ap1_9.read_linear(ap1_time) + (v_ap1 * ((t_sample)0.59999999999999998)));
			t_sample v_ap2 = (df1 - (m_ap2_8.read_linear(ap2_time) * ((t_sample)0.59999999999999998)));
			m_ap2_8.write(v_ap2);
			t_sample diff_in = (m_ap2_8.read_linear(ap2_time) + (v_ap2 * ((t_sample)0.59999999999999998)));
			t_sample r1 = m_d1_13.read_linear(t1);
			t_sample r2 = m_d2_12.read_linear(t2);
			t_sample r3 = m_d3_11.read_linear(t3);
			t_sample r4 = m_d4_10.read_linear(t4);
			t_sample j1 = ((((r1 + r2) + r3) + r4) * ((t_sample)0.5));
			t_sample j2 = ((((r1 - r2) + r3) - r4) * ((t_sample)0.5));
			t_sample j3 = ((((r1 + r2) - r3) - r4) * ((t_sample)0.5));
			t_sample j4 = ((((r1 - r2) - r3) + r4) * ((t_sample)0.5));
			t_sample tmp_mix_793 = (j1 + (damp * (m_h1_6 - j1)));
			m_h1_6 = tmp_mix_793;
			t_sample tmp_mix_794 = (j2 + (damp * (m_h2_5 - j2)));
			m_h2_5 = tmp_mix_794;
			t_sample tmp_mix_795 = (j3 + (damp * (m_h3_4 - j3)));
			m_h3_4 = tmp_mix_795;
			t_sample tmp_mix_796 = (j4 + (damp * (m_h4_3 - j4)));
			m_h4_3 = tmp_mix_796;
			m_d1_13.write(fixdenorm(__m_dcblock_33((diff_in + tanh((m_h1_6 * fb_amount))))));
			m_d2_12.write(fixdenorm(__m_dcblock_34((diff_in + tanh((m_h2_5 * fb_amount))))));
			m_d3_11.write(fixdenorm(__m_dcblock_35((diff_in + tanh((m_h3_4 * fb_amount))))));
			m_d4_10.write(fixdenorm(__m_dcblock_36((diff_in + tanh((m_h4_3 * fb_amount))))));
			t_sample raw = ((r1 + r3) * ((t_sample)0.5));
			if ((tap == ((int)1))) {
				raw = ((r2 + r4) * ((t_sample)0.5));
				
			} else {
				if ((tap == ((int)2))) {
					raw = ((r1 - r4) * ((t_sample)0.5));
					
				} else {
					if ((tap == ((int)3))) {
						raw = ((r2 - r3) * ((t_sample)0.5));
						
					};
					
				};
				
			};
			t_sample tmp_mix_797 = (raw + (((t_sample)0.10000000000000001) * (m_h_lp_2 - raw)));
			t_sample t_lp = tmp_mix_797;
			m_h_lp_2 = t_lp;
			t_sample tmp_mix_798 = (raw + (tmp_abs_799 * (t_lp - raw)));
			t_sample tmp_sub_801 = (raw - t_lp);
			t_sample tmp_mix_800 = (raw + (m_tilt_18 * (tmp_sub_801 - raw)));
			t_sample res = (cond_37 ? tmp_mix_798 : tmp_mix_800);
			__m_slide_38 = fixdenorm((__m_slide_38 + (((slide_input_40 > __m_slide_38) ? iup_41 : idown_42) * (slide_input_40 - __m_slide_38))));
			t_sample s_mix = __m_slide_38;
			t_sample tmp_mix_802 = (in1 + (s_mix * (res - in1)));
			t_sample tmp_expr_258 = tanh(tmp_mix_802);
			t_sample out1 = tmp_expr_258;
			m_pre_dly_7.step();
			m_ap2_8.step();
			m_ap1_9.step();
			m_d4_10.step();
			m_d3_11.step();
			m_d2_12.step();
			m_d1_13.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			
		};
		return __exception;
		
	};
	inline void set_mix_rev(t_param _value) {
		m_mix_rev_14 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_depth(t_param _value) {
		m_depth_15 = (_value < 0 ? 0 : (_value > 20 ? 20 : _value));
	};
	inline void set_speed(t_param _value) {
		m_speed_16 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 10 ? 10 : _value));
	};
	inline void set_predelay(t_param _value) {
		m_predelay_17 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_tilt(t_param _value) {
		m_tilt_18 = (_value < -1 ? -1 : (_value > 1 ? 1 : _value));
	};
	inline void set_absorb(t_param _value) {
		m_absorb_19 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_spread(t_param _value) {
		m_spread_20 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_decay(t_param _value) {
		m_decay_21 = (_value < 0 ? 0 : (_value > 110 ? 110 : _value));
	};
	inline void set_size(t_param _value) {
		m_size_22 = (_value < 0.5 ? 0.5 : (_value > 100 ? 100 : _value));
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

int gen_kernel_numins = 1;
int gen_kernel_numouts = 1;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 11; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio In (MC)" };
const char *gen_kernel_outnames[] = { "Audio Out (MC)" };

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
		case 3: self->set_mc_channel(value); break;
		case 4: self->set_mc_channelcount(value); break;
		case 5: self->set_mix_rev(value); break;
		case 6: self->set_predelay(value); break;
		case 7: self->set_size(value); break;
		case 8: self->set_speed(value); break;
		case 9: self->set_spread(value); break;
		case 10: self->set_tilt(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_absorb_19; break;
		case 1: *value = self->m_decay_21; break;
		case 2: *value = self->m_depth_15; break;
		case 3: *value = self->mc_channel; break;
		case 4: *value = self->mc_channelcount; break;
		case 5: *value = self->m_mix_rev_14; break;
		case 6: *value = self->m_predelay_17; break;
		case 7: *value = self->m_size_22; break;
		case 8: *value = self->m_speed_16; break;
		case 9: *value = self->m_spread_20; break;
		case 10: *value = self->m_tilt_18; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(11 * sizeof(ParamInfo));
	self->__commonstate.numparams = 11;
	// initialize parameter 0 ("m_absorb_19")
	pi = self->__commonstate.params + 0;
	pi->name = "absorb";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_absorb_19;
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
	// initialize parameter 2 ("m_depth_15")
	pi = self->__commonstate.params + 2;
	pi->name = "depth";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_depth_15;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 20;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("mc_channel")
	pi = self->__commonstate.params + 3;
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
	// initialize parameter 4 ("mc_channelcount")
	pi = self->__commonstate.params + 4;
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
	// initialize parameter 5 ("m_mix_rev_14")
	pi = self->__commonstate.params + 5;
	pi->name = "mix_rev";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_rev_14;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_predelay_17")
	pi = self->__commonstate.params + 6;
	pi->name = "predelay";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_predelay_17;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_size_22")
	pi = self->__commonstate.params + 7;
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
	// initialize parameter 8 ("m_speed_16")
	pi = self->__commonstate.params + 8;
	pi->name = "speed";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_speed_16;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 10;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_spread_20")
	pi = self->__commonstate.params + 9;
	pi->name = "spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_spread_20;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_tilt_18")
	pi = self->__commonstate.params + 10;
	pi->name = "tilt";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_tilt_18;
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


} // fdn_multireverb::
