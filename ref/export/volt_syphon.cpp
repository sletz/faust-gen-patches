#include "volt_syphon.h"

namespace volt_syphon {

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
	t_sample m_selfmod_19;
	t_sample m_compression_20;
	t_sample m_instability_21;
	t_sample m_gainout_18;
	t_sample m_fall_16;
	t_sample m_rise_17;
	t_sample m_gate_gainin_15;
	t_sample m_tone_22;
	t_sample m_gate_24;
	t_sample m_freq_min_28;
	t_sample m_sag_23;
	t_sample m_freq_max_27;
	t_sample m_mix_25;
	t_sample m_autofollow_26;
	t_sample m_freq_main_amp_29;
	t_sample m_h_phase_main_14;
	t_sample m_h_pitch_env_12;
	t_sample m_h_dc_out_L_3;
	t_sample m_h_dc_in_L_4;
	t_sample m_h_dc_in_R_2;
	t_sample samplerate;
	t_sample m_h_dc_out_R_1;
	t_sample m_h_phase_sweep_13;
	t_sample m_h_comp_R_5;
	t_sample m_h_drift_7;
	t_sample m_h_env_L_11;
	t_sample m_h_comp_L_6;
	t_sample m_h_env_R_10;
	t_sample m_h_lp_R_8;
	t_sample m_h_lp_L_9;
	t_sample m_freq_main_30;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_dc_out_R_1 = ((int)0);
		m_h_dc_in_R_2 = ((int)0);
		m_h_dc_out_L_3 = ((int)0);
		m_h_dc_in_L_4 = ((int)0);
		m_h_comp_R_5 = ((int)0);
		m_h_comp_L_6 = ((int)0);
		m_h_drift_7 = ((int)0);
		m_h_lp_R_8 = ((int)0);
		m_h_lp_L_9 = ((int)0);
		m_h_env_R_10 = ((int)0);
		m_h_env_L_11 = ((int)0);
		m_h_pitch_env_12 = ((int)0);
		m_h_phase_sweep_13 = ((int)0);
		m_h_phase_main_14 = ((int)0);
		m_gate_gainin_15 = ((int)3);
		m_fall_16 = ((int)500);
		m_rise_17 = ((int)2);
		m_gainout_18 = ((int)0);
		m_selfmod_19 = ((int)0);
		m_compression_20 = ((int)50);
		m_instability_21 = ((int)20);
		m_tone_22 = ((int)50);
		m_sag_23 = ((int)0);
		m_gate_24 = ((int)0);
		m_mix_25 = ((int)100);
		m_autofollow_26 = ((int)0);
		m_freq_max_27 = ((int)800);
		m_freq_min_28 = ((int)80);
		m_freq_main_amp_29 = ((t_sample)0.050000000000000003);
		m_freq_main_30 = ((int)800);
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
		t_sample ratio = safediv(m_freq_max_27, ((m_freq_min_28 < ((int)1)) ? ((int)1) : m_freq_min_28));
		t_sample tmp_div_860 = (m_autofollow_26 * ((t_sample)0.01));
		t_sample g_val = (m_gate_24 * ((t_sample)0.01));
		int cond_32 = (m_gate_24 <= ((int)0));
		t_sample v_scale = (cond_32 ? ((t_sample)3.2999999999999998) : ((t_sample)0.59999999999999998));
		t_sample tmp_div_864 = (m_selfmod_19 * ((t_sample)0.01));
		t_sample tmp_div_866 = (m_selfmod_19 * ((t_sample)0.01));
		t_sample tmp_div_869 = (m_sag_23 * ((t_sample)0.01));
		t_sample tmp_div_876 = (m_sag_23 * ((t_sample)0.01));
		t_sample comp_val = (m_compression_20 * ((t_sample)0.01));
		t_sample out_amp = dbtoa(m_gainout_18);
		t_sample tmp_div_886 = (m_mix_25 * ((t_sample)0.01));
		t_sample tmp_div_888 = (m_mix_25 * ((t_sample)0.01));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			m_h_phase_main_14 = (m_h_phase_main_14 + safediv(m_freq_main_30, samplerate));
			if ((m_h_phase_main_14 > ((int)1))) {
				m_h_phase_main_14 = (m_h_phase_main_14 - ((int)1));
				
			};
			t_sample main_sine = (sin((m_h_phase_main_14 * ((t_sample)6.2831853071795862))) * m_freq_main_amp_29);
			t_sample tmp_mul_858 = (fabs(in1) * m_gate_gainin_15);
			t_sample tmp_mix_857 = (tmp_mul_858 + (((t_sample)0.995) * (m_h_pitch_env_12 - tmp_mul_858)));
			m_h_pitch_env_12 = tmp_mix_857;
			t_sample p_norm = ((m_h_pitch_env_12 <= ((int)0)) ? ((int)0) : ((m_h_pitch_env_12 >= ((int)1)) ? ((int)1) : m_h_pitch_env_12));
			t_sample sweep_f = (m_freq_min_28 * safepow(ratio, p_norm));
			m_h_phase_sweep_13 = (m_h_phase_sweep_13 + safediv(sweep_f, samplerate));
			if ((m_h_phase_sweep_13 > ((int)1))) {
				m_h_phase_sweep_13 = (m_h_phase_sweep_13 - ((int)1));
				
			};
			t_sample sweep_sine = (sin((m_h_phase_sweep_13 * ((t_sample)6.2831853071795862))) * ((t_sample)0.40000000000000002));
			int input_presence = (fabs(in1) > ((t_sample)0.0001));
			t_sample tmp_mix_859 = (main_sine + (tmp_div_860 * (sweep_sine - main_sine)));
			t_sample carrier_base = (tmp_mix_859 * (input_presence ? ((int)1) : ((int)0)));
			t_sample tmp_mul_862 = ((noise() * (m_instability_21 * ((t_sample)0.01))) * ((t_sample)0.01));
			t_sample tmp_mix_861 = (tmp_mul_862 + (((t_sample)0.999) * (m_h_drift_7 - tmp_mul_862)));
			m_h_drift_7 = tmp_mix_861;
			t_sample v_31 = (g_val + m_h_drift_7);
			t_sample d_gate = ((v_31 <= ((int)0)) ? ((int)0) : ((v_31 >= ((int)1)) ? ((int)1) : v_31));
			t_sample tmp_mix_863 = (carrier_base + (tmp_div_864 * (in1 - carrier_base)));
			t_sample carrier_L = tmp_mix_863;
			t_sample tmp_mix_865 = (carrier_base + (tmp_div_866 * (in2 - carrier_base)));
			t_sample carrier_R = tmp_mix_865;
			t_sample src_L = (in1 * m_gate_gainin_15);
			int is_above_L = ((fabs(src_L) > d_gate) && input_presence);
			t_sample tmp_tanh_868 = tanh((src_L - d_gate));
			t_sample tmp_mix_867 = (((int)1) + (tmp_div_869 * (tmp_tanh_868 - ((int)1))));
			t_sample t_L = (is_above_L ? tmp_mix_867 : ((int)0));
			int cond_33 = (t_L > m_h_env_L_11);
			t_sample maxa_34 = (cond_33 ? m_rise_17 : m_fall_16);
			t_sample v_35 = exp(safediv(-6.9077552789821368, (((maxa_34 < ((int)1)) ? ((int)1) : maxa_34) * (samplerate * 0.001))));
			t_sample tmp_clamp_871 = ((v_35 <= ((int)0)) ? ((int)0) : ((v_35 >= ((int)1)) ? ((int)1) : v_35));
			t_sample tmp_mix_870 = (t_L + (tmp_clamp_871 * (m_h_env_L_11 - t_L)));
			m_h_env_L_11 = fixdenorm(tmp_mix_870);
			t_sample v_36 = (((int)1) - ((m_tone_22 * ((t_sample)0.01)) * (((int)1) - m_h_env_L_11)));
			t_sample tmp_clamp_873 = ((v_36 <= ((t_sample)0.01)) ? ((t_sample)0.01) : ((v_36 >= ((int)1)) ? ((int)1) : v_36));
			t_sample tmp_mix_872 = (m_h_env_L_11 + (tmp_clamp_873 * (m_h_lp_L_9 - m_h_env_L_11)));
			m_h_lp_L_9 = tmp_mix_872;
			t_sample src_R = (in2 * m_gate_gainin_15);
			int is_above_R = ((fabs(src_R) > d_gate) && input_presence);
			t_sample tmp_tanh_875 = tanh((src_R - d_gate));
			t_sample tmp_mix_874 = (((int)1) + (tmp_div_876 * (tmp_tanh_875 - ((int)1))));
			t_sample t_R = (is_above_R ? tmp_mix_874 : ((int)0));
			int cond_37 = (t_R > m_h_env_R_10);
			t_sample maxa_38 = (cond_37 ? m_rise_17 : m_fall_16);
			t_sample v_39 = exp(safediv(-6.9077552789821368, (((maxa_38 < ((int)1)) ? ((int)1) : maxa_38) * (samplerate * 0.001))));
			t_sample tmp_clamp_878 = ((v_39 <= ((int)0)) ? ((int)0) : ((v_39 >= ((int)1)) ? ((int)1) : v_39));
			t_sample tmp_mix_877 = (t_R + (tmp_clamp_878 * (m_h_env_R_10 - t_R)));
			m_h_env_R_10 = fixdenorm(tmp_mix_877);
			t_sample v_40 = (((int)1) - ((m_tone_22 * ((t_sample)0.01)) * (((int)1) - m_h_env_R_10)));
			t_sample tmp_clamp_880 = ((v_40 <= ((t_sample)0.01)) ? ((t_sample)0.01) : ((v_40 >= ((int)1)) ? ((int)1) : v_40));
			t_sample tmp_mix_879 = (m_h_env_R_10 + (tmp_clamp_880 * (m_h_lp_R_8 - m_h_env_R_10)));
			m_h_lp_R_8 = tmp_mix_879;
			t_sample mod_L = ((carrier_L * m_h_lp_L_9) * v_scale);
			t_sample mod_R = ((carrier_R * m_h_lp_R_8) * v_scale);
			t_sample tmp_abs_882 = fabs(mod_L);
			t_sample tmp_mix_881 = (tmp_abs_882 + (((t_sample)0.98999999999999999) * (m_h_comp_L_6 - tmp_abs_882)));
			m_h_comp_L_6 = tmp_mix_881;
			t_sample tmp_abs_884 = fabs(mod_R);
			t_sample tmp_mix_883 = (tmp_abs_884 + (((t_sample)0.98999999999999999) * (m_h_comp_R_5 - tmp_abs_884)));
			m_h_comp_R_5 = tmp_mix_883;
			t_sample wet_L = (safediv(mod_L, (((int)1) + ((m_h_comp_L_6 * comp_val) * ((int)10)))) * (((int)1) + (comp_val * ((int)4))));
			t_sample wet_R = (safediv(mod_R, (((int)1) + ((m_h_comp_R_5 * comp_val) * ((int)10)))) * (((int)1) + (comp_val * ((int)4))));
			t_sample sig_L = tanh((wet_L * out_amp));
			t_sample sig_R = tanh((wet_R * out_amp));
			t_sample dc_L = ((sig_L - m_h_dc_in_L_4) + (((t_sample)0.995) * m_h_dc_out_L_3));
			m_h_dc_in_L_4 = sig_L;
			m_h_dc_out_L_3 = dc_L;
			t_sample dc_R = ((sig_R - m_h_dc_in_R_2) + (((t_sample)0.995) * m_h_dc_out_R_1));
			m_h_dc_in_R_2 = sig_R;
			m_h_dc_out_R_1 = dc_R;
			t_sample tmp_mix_885 = (in1 + (tmp_div_886 * (dc_L - in1)));
			t_sample tmp_expr_524 = tmp_mix_885;
			t_sample tmp_mix_887 = (in2 + (tmp_div_888 * (dc_R - in2)));
			t_sample tmp_expr_525 = tmp_mix_887;
			t_sample out2 = tmp_expr_525;
			t_sample out1 = tmp_expr_524;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_gate_gainin(t_param _value) {
		m_gate_gainin_15 = (_value < 0 ? 0 : (_value > 15 ? 15 : _value));
	};
	inline void set_fall(t_param _value) {
		m_fall_16 = (_value < 2 ? 2 : (_value > 2000 ? 2000 : _value));
	};
	inline void set_rise(t_param _value) {
		m_rise_17 = (_value < 2 ? 2 : (_value > 2000 ? 2000 : _value));
	};
	inline void set_gainout(t_param _value) {
		m_gainout_18 = (_value < -60 ? -60 : (_value > 12 ? 12 : _value));
	};
	inline void set_selfmod(t_param _value) {
		m_selfmod_19 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_compression(t_param _value) {
		m_compression_20 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_instability(t_param _value) {
		m_instability_21 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_tone(t_param _value) {
		m_tone_22 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_sag(t_param _value) {
		m_sag_23 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_gate(t_param _value) {
		m_gate_24 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_mix(t_param _value) {
		m_mix_25 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_autofollow(t_param _value) {
		m_autofollow_26 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_freq_max(t_param _value) {
		m_freq_max_27 = (_value < 20 ? 20 : (_value > 5000 ? 5000 : _value));
	};
	inline void set_freq_min(t_param _value) {
		m_freq_min_28 = (_value < 20 ? 20 : (_value > 2000 ? 2000 : _value));
	};
	inline void set_freq_main_amp(t_param _value) {
		m_freq_main_amp_29 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_freq_main(t_param _value) {
		m_freq_main_30 = (_value < 20 ? 20 : (_value > 5000 ? 5000 : _value));
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
int num_params() { return 16; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "audioin-L", "audioin-R" };
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
		case 0: self->set_autofollow(value); break;
		case 1: self->set_compression(value); break;
		case 2: self->set_fall(value); break;
		case 3: self->set_freq_main(value); break;
		case 4: self->set_freq_main_amp(value); break;
		case 5: self->set_freq_max(value); break;
		case 6: self->set_freq_min(value); break;
		case 7: self->set_gainout(value); break;
		case 8: self->set_gate(value); break;
		case 9: self->set_gate_gainin(value); break;
		case 10: self->set_instability(value); break;
		case 11: self->set_mix(value); break;
		case 12: self->set_rise(value); break;
		case 13: self->set_sag(value); break;
		case 14: self->set_selfmod(value); break;
		case 15: self->set_tone(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_autofollow_26; break;
		case 1: *value = self->m_compression_20; break;
		case 2: *value = self->m_fall_16; break;
		case 3: *value = self->m_freq_main_30; break;
		case 4: *value = self->m_freq_main_amp_29; break;
		case 5: *value = self->m_freq_max_27; break;
		case 6: *value = self->m_freq_min_28; break;
		case 7: *value = self->m_gainout_18; break;
		case 8: *value = self->m_gate_24; break;
		case 9: *value = self->m_gate_gainin_15; break;
		case 10: *value = self->m_instability_21; break;
		case 11: *value = self->m_mix_25; break;
		case 12: *value = self->m_rise_17; break;
		case 13: *value = self->m_sag_23; break;
		case 14: *value = self->m_selfmod_19; break;
		case 15: *value = self->m_tone_22; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(16 * sizeof(ParamInfo));
	self->__commonstate.numparams = 16;
	// initialize parameter 0 ("m_autofollow_26")
	pi = self->__commonstate.params + 0;
	pi->name = "autofollow";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_autofollow_26;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_compression_20")
	pi = self->__commonstate.params + 1;
	pi->name = "compression";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_compression_20;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_fall_16")
	pi = self->__commonstate.params + 2;
	pi->name = "fall";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_fall_16;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 2;
	pi->outputmax = 2000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_freq_main_30")
	pi = self->__commonstate.params + 3;
	pi->name = "freq_main";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_main_30;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 5000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_freq_main_amp_29")
	pi = self->__commonstate.params + 4;
	pi->name = "freq_main_amp";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_main_amp_29;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_freq_max_27")
	pi = self->__commonstate.params + 5;
	pi->name = "freq_max";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_max_27;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 5000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_freq_min_28")
	pi = self->__commonstate.params + 6;
	pi->name = "freq_min";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_min_28;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 2000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_gainout_18")
	pi = self->__commonstate.params + 7;
	pi->name = "gainout";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gainout_18;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -60;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_gate_24")
	pi = self->__commonstate.params + 8;
	pi->name = "gate";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gate_24;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_gate_gainin_15")
	pi = self->__commonstate.params + 9;
	pi->name = "gate_gainin";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gate_gainin_15;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 15;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_instability_21")
	pi = self->__commonstate.params + 10;
	pi->name = "instability";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_instability_21;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 11 ("m_mix_25")
	pi = self->__commonstate.params + 11;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_25;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 12 ("m_rise_17")
	pi = self->__commonstate.params + 12;
	pi->name = "rise";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rise_17;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 2;
	pi->outputmax = 2000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 13 ("m_sag_23")
	pi = self->__commonstate.params + 13;
	pi->name = "sag";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_sag_23;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 14 ("m_selfmod_19")
	pi = self->__commonstate.params + 14;
	pi->name = "selfmod";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_selfmod_19;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 15 ("m_tone_22")
	pi = self->__commonstate.params + 15;
	pi->name = "tone";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_tone_22;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
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


} // volt_syphon::
