#include "frost_machine.h"

namespace frost_machine {

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
	Delay m_loopL1_9;
	Delay m_pre1R_5;
	Delay m_pre4L_4;
	Delay m_pre2R_6;
	Delay m_pre3R_7;
	Delay m_pre4R_8;
	Delay m_pre3L_3;
	Delay m_pre1L_1;
	Delay m_pre2L_2;
	Delay m_loopR2_12;
	Delay m_loopR1_11;
	Delay m_loopL2_10;
	int __exception;
	int vectorsize;
	t_sample m_hR_f_29;
	t_sample m_hL_d_24;
	t_sample m_p_mix_pct_23;
	t_sample m_hR_d_25;
	t_sample m_hL_fb_26;
	t_sample m_hR_fb_27;
	t_sample m_p_gain_wet_db_22;
	t_sample m_hL_f_28;
	t_sample m_p_release_ms_21;
	t_sample m_p_decay_pct_14;
	t_sample m_p_fuzz_hz_19;
	t_sample m_h_env_30;
	t_sample m_p_size_13;
	t_sample samplerate;
	t_sample m_p_pump_db_20;
	t_sample m_p_damp_hz_15;
	t_sample m_p_mod_hz_17;
	t_sample m_p_mod_ms_16;
	t_sample m_p_fuzz_db_18;
	t_sample m_ph_31;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_pre1L_1.reset("m_pre1L_1", ((int)512));
		m_pre2L_2.reset("m_pre2L_2", ((int)773));
		m_pre3L_3.reset("m_pre3L_3", ((int)1131));
		m_pre4L_4.reset("m_pre4L_4", ((int)1571));
		m_pre1R_5.reset("m_pre1R_5", ((int)523));
		m_pre2R_6.reset("m_pre2R_6", ((int)761));
		m_pre3R_7.reset("m_pre3R_7", ((int)1153));
		m_pre4R_8.reset("m_pre4R_8", ((int)1549));
		m_loopL1_9.reset("m_loopL1_9", ((int)12000));
		m_loopL2_10.reset("m_loopL2_10", ((int)18000));
		m_loopR1_11.reset("m_loopR1_11", ((int)12000));
		m_loopR2_12.reset("m_loopR2_12", ((int)18000));
		m_p_size_13 = ((t_sample)0.59999999999999998);
		m_p_decay_pct_14 = ((int)94);
		m_p_damp_hz_15 = ((int)3000);
		m_p_mod_ms_16 = ((int)6);
		m_p_mod_hz_17 = ((t_sample)0.20000000000000001);
		m_p_fuzz_db_18 = ((int)35);
		m_p_fuzz_hz_19 = ((int)800);
		m_p_pump_db_20 = (-((int)30));
		m_p_release_ms_21 = ((int)2000);
		m_p_gain_wet_db_22 = ((int)0);
		m_p_mix_pct_23 = ((int)50);
		m_hL_d_24 = ((int)0);
		m_hR_d_25 = ((int)0);
		m_hL_fb_26 = ((int)0);
		m_hR_fb_27 = ((int)0);
		m_hL_f_28 = ((int)0);
		m_hR_f_29 = ((int)0);
		m_h_env_30 = ((int)0);
		m_ph_31 = ((int)0);
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
		t_sample cd = exp(safediv((((t_sample)-6.2831853071795862) * m_p_damp_hz_15), samplerate));
		t_sample v_32 = (m_p_decay_pct_14 * ((t_sample)0.01));
		t_sample v_decay = ((v_32 <= ((int)0)) ? ((int)0) : ((v_32 >= ((t_sample)0.97999999999999998)) ? ((t_sample)0.97999999999999998) : v_32));
		t_sample m_depth = (m_p_mod_ms_16 * (samplerate * 0.001));
		t_sample s_base = ((((int)50) + (m_p_size_13 * ((int)400))) * (samplerate * 0.001));
		t_sample f_gain = safepow(((int)10), (m_p_fuzz_db_18 * ((t_sample)0.050000000000000003)));
		t_sample cf_f = exp(safediv((((t_sample)-6.2831853071795862) * m_p_fuzz_hz_19), samplerate));
		t_sample c_atk = exp(safediv(((int)-1), (samplerate * ((t_sample)0.0050000000000000001))));
		t_sample c_rel = exp(safediv(((int)-1), (samplerate * (m_p_release_ms_21 * ((t_sample)0.001)))));
		t_sample v_thresh = safepow(((int)10), (m_p_pump_db_20 * ((t_sample)0.050000000000000003)));
		t_sample v_gain_wet = safepow(((int)10), (m_p_gain_wet_db_22 * ((t_sample)0.050000000000000003)));
		t_sample v_mix = (m_p_mix_pct_23 * ((t_sample)0.01));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			m_ph_31 = wrap((m_ph_31 + safediv(m_p_mod_hz_17, samplerate)), ((int)0), ((int)1));
			t_sample lfoL = sin(((m_ph_31 * ((int)2)) * ((t_sample)3.1415926535897931)));
			t_sample lfoR = cos(((m_ph_31 * ((int)2)) * ((t_sample)3.1415926535897931)));
			t_sample inL = fixdenorm(((in1 * (((int)1) - cd)) + (m_hL_d_24 * cd)));
			t_sample inR = fixdenorm(((in2 * (((int)1) - cd)) + (m_hR_d_25 * cd)));
			m_hL_d_24 = inL;
			m_hR_d_25 = inR;
			t_sample xL = inL;
			t_sample xR = inR;
			t_sample r1 = m_pre1L_1.read_step(((int)512));
			m_pre1L_1.write((xL + (((t_sample)0.69999999999999996) * r1)));
			t_sample tmp_xL_300 = ((((t_sample)-0.69999999999999996) * xL) + r1);
			t_sample r2 = m_pre2L_2.read_step(((int)773));
			m_pre2L_2.write((tmp_xL_300 + (((t_sample)0.59999999999999998) * r2)));
			t_sample tmp_tmp_xL_302 = ((((t_sample)-0.59999999999999998) * tmp_xL_300) + r2);
			t_sample r3 = m_pre3L_3.read_step(((int)1131));
			m_pre3L_3.write((tmp_tmp_xL_302 + (((t_sample)0.5) * r3)));
			t_sample tmp_tmp_tmp_xL_304 = ((((t_sample)-0.5) * tmp_tmp_xL_302) + r3);
			t_sample r4 = m_pre4L_4.read_step(((int)1571));
			m_pre4L_4.write((tmp_tmp_tmp_xL_304 + (((t_sample)0.40000000000000002) * r4)));
			t_sample tmp_tmp_tmp_tmp_xL_306 = ((((t_sample)-0.40000000000000002) * tmp_tmp_tmp_xL_304) + r4);
			t_sample rR1 = m_pre1R_5.read_step(((int)523));
			m_pre1R_5.write((xR + (((t_sample)0.69999999999999996) * rR1)));
			t_sample tmp_xR_308 = ((((t_sample)-0.69999999999999996) * xR) + rR1);
			t_sample rR2 = m_pre2R_6.read_step(((int)761));
			m_pre2R_6.write((tmp_xR_308 + (((t_sample)0.59999999999999998) * rR2)));
			t_sample tmp_tmp_xR_310 = ((((t_sample)-0.59999999999999998) * tmp_xR_308) + rR2);
			t_sample rR3 = m_pre3R_7.read_step(((int)1153));
			m_pre3R_7.write((tmp_tmp_xR_310 + (((t_sample)0.5) * rR3)));
			t_sample tmp_tmp_tmp_xR_312 = ((((t_sample)-0.5) * tmp_tmp_xR_310) + rR3);
			t_sample rR4 = m_pre4R_8.read_step(((int)1549));
			m_pre4R_8.write((tmp_tmp_tmp_xR_312 + (((t_sample)0.40000000000000002) * rR4)));
			t_sample tmp_tmp_tmp_tmp_xR_314 = ((((t_sample)-0.40000000000000002) * tmp_tmp_tmp_xR_312) + rR4);
			t_sample nL = (tmp_tmp_tmp_tmp_xL_306 + (m_hR_fb_27 * v_decay));
			t_sample sL1 = ((s_base * ((t_sample)0.40999999999999998)) + (lfoL * m_depth));
			t_sample rL1 = m_loopL1_9.read_linear(sL1);
			t_sample vL1 = ((((t_sample)-0.69999999999999996) * nL) + rL1);
			m_loopL1_9.write((nL + (((t_sample)0.69999999999999996) * vL1)));
			t_sample sL2 = ((s_base * ((t_sample)0.89000000000000001)) + (lfoR * m_depth));
			t_sample rL2 = m_loopL2_10.read_linear(sL2);
			t_sample vL2 = ((((t_sample)-0.59999999999999998) * vL1) + rL2);
			m_loopL2_10.write((vL1 + (((t_sample)0.59999999999999998) * vL2)));
			m_hL_fb_26 = fixdenorm(vL2);
			t_sample nR = (tmp_tmp_tmp_tmp_xR_314 + (m_hL_fb_26 * v_decay));
			t_sample sR1 = ((s_base * ((t_sample)0.46999999999999997)) + (lfoR * m_depth));
			t_sample tmp_rR1_317 = m_loopR1_11.read_linear(sR1);
			t_sample vR1 = ((((t_sample)-0.69999999999999996) * nR) + tmp_rR1_317);
			m_loopR1_11.write((nR + (((t_sample)0.69999999999999996) * vR1)));
			t_sample sR2 = ((s_base * ((t_sample)0.82999999999999996)) + (lfoL * m_depth));
			t_sample tmp_rR2_319 = m_loopR2_12.read_linear(sR2);
			t_sample vR2 = ((((t_sample)-0.59999999999999998) * vR1) + tmp_rR2_319);
			m_loopR2_12.write((vR1 + (((t_sample)0.59999999999999998) * vR2)));
			m_hR_fb_27 = fixdenorm(vR2);
			t_sample v_33 = (vL2 * f_gain);
			t_sample fL_r = ((v_33 <= ((t_sample)-1.1000000000000001)) ? ((t_sample)-1.1000000000000001) : ((v_33 >= ((t_sample)0.80000000000000004)) ? ((t_sample)0.80000000000000004) : v_33));
			t_sample v_34 = (vR2 * f_gain);
			t_sample fR_r = ((v_34 <= ((t_sample)-1.1000000000000001)) ? ((t_sample)-1.1000000000000001) : ((v_34 >= ((t_sample)0.80000000000000004)) ? ((t_sample)0.80000000000000004) : v_34));
			t_sample fL = ((fL_r * (((int)1) - cf_f)) + (m_hL_f_28 * cf_f));
			m_hL_f_28 = fixdenorm(fL);
			t_sample fR = ((fR_r * (((int)1) - cf_f)) + (m_hR_f_29 * cf_f));
			m_hR_f_29 = fixdenorm(fR);
			t_sample abs_dry = ((fabs(in1) + fabs(in2)) * ((t_sample)0.5));
			if ((abs_dry > m_h_env_30)) {
				m_h_env_30 = (abs_dry + (c_atk * (m_h_env_30 - abs_dry)));
				
			} else {
				m_h_env_30 = (abs_dry + (c_rel * (m_h_env_30 - abs_dry)));
				
			};
			int cond_35 = (m_h_env_30 > v_thresh);
			t_sample iftrue_36 = safepow(safediv(v_thresh, m_h_env_30), ((t_sample)2.5));
			t_sample gain_vague = (cond_35 ? iftrue_36 : ((int)1));
			t_sample wetL_final = (((fL * gain_vague) * v_gain_wet) * ((int)2));
			t_sample wetR_final = (((fR * gain_vague) * v_gain_wet) * ((int)2));
			t_sample tmp_expr_321 = ((in1 * (((int)1) - v_mix)) + (wetL_final * v_mix));
			t_sample tmp_expr_322 = ((in2 * (((int)1) - v_mix)) + (wetR_final * v_mix));
			t_sample out2 = tmp_expr_322;
			t_sample out1 = tmp_expr_321;
			m_pre1L_1.step();
			m_pre2L_2.step();
			m_pre3L_3.step();
			m_pre4L_4.step();
			m_pre1R_5.step();
			m_pre2R_6.step();
			m_pre3R_7.step();
			m_pre4R_8.step();
			m_loopL1_9.step();
			m_loopL2_10.step();
			m_loopR1_11.step();
			m_loopR2_12.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_p_size(t_param _value) {
		m_p_size_13 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_p_decay_pct(t_param _value) {
		m_p_decay_pct_14 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_p_damp_hz(t_param _value) {
		m_p_damp_hz_15 = (_value < 100 ? 100 : (_value > 16000 ? 16000 : _value));
	};
	inline void set_p_mod_ms(t_param _value) {
		m_p_mod_ms_16 = (_value < 0 ? 0 : (_value > 20 ? 20 : _value));
	};
	inline void set_p_mod_hz(t_param _value) {
		m_p_mod_hz_17 = (_value < 0 ? 0 : (_value > 5 ? 5 : _value));
	};
	inline void set_p_fuzz_db(t_param _value) {
		m_p_fuzz_db_18 = (_value < 0 ? 0 : (_value > 60 ? 60 : _value));
	};
	inline void set_p_fuzz_hz(t_param _value) {
		m_p_fuzz_hz_19 = (_value < 100 ? 100 : (_value > 8000 ? 8000 : _value));
	};
	inline void set_p_pump_db(t_param _value) {
		m_p_pump_db_20 = (_value < -60 ? -60 : (_value > 0 ? 0 : _value));
	};
	inline void set_p_release_ms(t_param _value) {
		m_p_release_ms_21 = (_value < 10 ? 10 : (_value > 5000 ? 5000 : _value));
	};
	inline void set_p_gain_wet_db(t_param _value) {
		m_p_gain_wet_db_22 = (_value < -60 ? -60 : (_value > 24 ? 24 : _value));
	};
	inline void set_p_mix_pct(t_param _value) {
		m_p_mix_pct_23 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
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
int num_params() { return 11; }

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
		case 0: self->set_p_damp_hz(value); break;
		case 1: self->set_p_decay_pct(value); break;
		case 2: self->set_p_fuzz_db(value); break;
		case 3: self->set_p_fuzz_hz(value); break;
		case 4: self->set_p_gain_wet_db(value); break;
		case 5: self->set_p_mix_pct(value); break;
		case 6: self->set_p_mod_hz(value); break;
		case 7: self->set_p_mod_ms(value); break;
		case 8: self->set_p_pump_db(value); break;
		case 9: self->set_p_release_ms(value); break;
		case 10: self->set_p_size(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_p_damp_hz_15; break;
		case 1: *value = self->m_p_decay_pct_14; break;
		case 2: *value = self->m_p_fuzz_db_18; break;
		case 3: *value = self->m_p_fuzz_hz_19; break;
		case 4: *value = self->m_p_gain_wet_db_22; break;
		case 5: *value = self->m_p_mix_pct_23; break;
		case 6: *value = self->m_p_mod_hz_17; break;
		case 7: *value = self->m_p_mod_ms_16; break;
		case 8: *value = self->m_p_pump_db_20; break;
		case 9: *value = self->m_p_release_ms_21; break;
		case 10: *value = self->m_p_size_13; break;
		
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
	// initialize parameter 0 ("m_p_damp_hz_15")
	pi = self->__commonstate.params + 0;
	pi->name = "p_damp_hz";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_damp_hz_15;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 100;
	pi->outputmax = 16000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_p_decay_pct_14")
	pi = self->__commonstate.params + 1;
	pi->name = "p_decay_pct";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_decay_pct_14;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_p_fuzz_db_18")
	pi = self->__commonstate.params + 2;
	pi->name = "p_fuzz_db";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_fuzz_db_18;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 60;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_p_fuzz_hz_19")
	pi = self->__commonstate.params + 3;
	pi->name = "p_fuzz_hz";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_fuzz_hz_19;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 100;
	pi->outputmax = 8000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_p_gain_wet_db_22")
	pi = self->__commonstate.params + 4;
	pi->name = "p_gain_wet_db";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_gain_wet_db_22;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -60;
	pi->outputmax = 24;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_p_mix_pct_23")
	pi = self->__commonstate.params + 5;
	pi->name = "p_mix_pct";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_mix_pct_23;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_p_mod_hz_17")
	pi = self->__commonstate.params + 6;
	pi->name = "p_mod_hz";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_mod_hz_17;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 5;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_p_mod_ms_16")
	pi = self->__commonstate.params + 7;
	pi->name = "p_mod_ms";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_mod_ms_16;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 20;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_p_pump_db_20")
	pi = self->__commonstate.params + 8;
	pi->name = "p_pump_db";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_pump_db_20;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -60;
	pi->outputmax = 0;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_p_release_ms_21")
	pi = self->__commonstate.params + 9;
	pi->name = "p_release_ms";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_release_ms_21;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 10;
	pi->outputmax = 5000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_p_size_13")
	pi = self->__commonstate.params + 10;
	pi->name = "p_size";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_p_size_13;
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


} // frost_machine::
