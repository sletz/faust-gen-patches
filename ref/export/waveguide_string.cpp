#include "waveguide_string.h"

namespace waveguide_string {

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
	Delay m_str3_19;
	Delay m_str4_18;
	Delay m_pick_del_17;
	Delay m_str1_21;
	Delay m_str2_20;
	int __exception;
	int vectorsize;
	t_sample m_mix_pct_22;
	t_sample m_h_damp1_16;
	t_sample m_trig_23;
	t_sample m_strike_res_25;
	t_sample m_decay_time_29;
	t_sample m_nl_bridge_24;
	t_sample m_damping_28;
	t_sample m_pick_pos_26;
	t_sample m_stiffness_27;
	t_sample m_h_damp2_15;
	t_sample m_h_damp3_14;
	t_sample m_h_damp4_13;
	t_sample m_h_burst_cnt_3;
	t_sample m_h_trig_4;
	t_sample m_h_ap_out4_5;
	t_sample m_h_pick_ph1_2;
	t_sample samplerate;
	t_sample m_h_pick_ph2_1;
	t_sample m_detune_30;
	t_sample m_h_ap_in4_6;
	t_sample m_h_ap_in3_8;
	t_sample m_h_ap_in1_12;
	t_sample m_h_ap_out3_7;
	t_sample m_h_ap_out1_11;
	t_sample m_h_ap_out2_9;
	t_sample m_h_ap_in2_10;
	t_sample m_freq_31;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_pick_ph2_1 = ((int)0);
		m_h_pick_ph1_2 = ((int)0);
		m_h_burst_cnt_3 = ((int)0);
		m_h_trig_4 = ((int)0);
		m_h_ap_out4_5 = ((int)0);
		m_h_ap_in4_6 = ((int)0);
		m_h_ap_out3_7 = ((int)0);
		m_h_ap_in3_8 = ((int)0);
		m_h_ap_out2_9 = ((int)0);
		m_h_ap_in2_10 = ((int)0);
		m_h_ap_out1_11 = ((int)0);
		m_h_ap_in1_12 = ((int)0);
		m_h_damp4_13 = ((int)0);
		m_h_damp3_14 = ((int)0);
		m_h_damp2_15 = ((int)0);
		m_h_damp1_16 = ((int)0);
		m_pick_del_17.reset("m_pick_del_17", ((int)4096));
		m_str4_18.reset("m_str4_18", (samplerate * ((int)2)));
		m_str3_19.reset("m_str3_19", (samplerate * ((int)2)));
		m_str2_20.reset("m_str2_20", (samplerate * ((int)2)));
		m_str1_21.reset("m_str1_21", (samplerate * ((int)2)));
		m_mix_pct_22 = ((int)100);
		m_trig_23 = ((int)0);
		m_nl_bridge_24 = ((t_sample)0.25);
		m_strike_res_25 = ((t_sample)0.5);
		m_pick_pos_26 = ((t_sample)0.22);
		m_stiffness_27 = ((t_sample)0.14999999999999999);
		m_damping_28 = ((t_sample)0.29999999999999999);
		m_decay_time_29 = ((t_sample)3.5);
		m_detune_30 = ((int)5);
		m_freq_31 = ((int)110);
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
		t_sample max_35 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample detune_norm = (m_detune_30 * ((t_sample)0.01));
		t_sample fine_hz = (detune_norm * ((t_sample)4.5));
		t_sample wide_oct = (safepow(detune_norm, ((t_sample)1.7)) * ((t_sample)2.5));
		t_sample max_38 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample max_40 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample max_42 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample max_44 = (samplerate * ((t_sample)0.45000000000000001));
		int max_46 = (samplerate - ((int)10));
		int max_48 = (samplerate - ((int)10));
		int max_50 = (samplerate - ((int)10));
		int max_52 = (samplerate - ((int)10));
		t_sample tmp_sub1_846 = (m_stiffness_27 - ((int)0));
		t_sample tmp_scale_843 = ((safepow((tmp_sub1_846 * ((t_sample)1)), ((int)1)) * ((t_sample)0.71999999999999997)) + ((int)0));
		t_sample ap_coeff = tmp_scale_843;
		t_sample tmp_sub1_850 = (m_damping_28 - ((int)0));
		t_sample tmp_scale_847 = ((safepow((tmp_sub1_850 * ((t_sample)1)), ((int)1)) * ((t_sample)-0.91999999999999993)) + ((t_sample)0.95999999999999996));
		t_sample damp_alpha = tmp_scale_847;
		t_sample drive_term = (((int)1) + (m_nl_bridge_24 * ((int)3)));
		t_sample v_57 = (m_mix_pct_22 * ((t_sample)0.01));
		t_sample bal = ((v_57 <= ((int)0)) ? ((int)0) : ((v_57 >= ((int)1)) ? ((int)1) : v_57));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			int ext_trig = ((in1 > ((t_sample)0.10000000000000001)) && (m_h_trig_4 <= ((t_sample)0.10000000000000001)));
			m_h_trig_4 = in1;
			int is_trig = (ext_trig || (m_trig_23 > ((int)0)));
			if (is_trig) {
				t_sample tmp_sub1_842 = (m_strike_res_25 - ((int)0));
				t_sample tmp_scale_839 = ((safepow((tmp_sub1_842 * ((t_sample)1)), ((int)1)) * ((t_sample)7.5)) + ((t_sample)0.5));
				t_sample v_32 = (tmp_scale_839 * (samplerate * 0.001));
				m_h_burst_cnt_3 = ((v_32 <= ((int)4)) ? ((int)4) : ((v_32 >= ((int)1200)) ? ((int)1200) : v_32));
				
			};
			t_sample exc_noise = ((int)0);
			if ((m_h_burst_cnt_3 > ((int)0))) {
				exc_noise = (noise() * (m_h_burst_cnt_3 * ((t_sample)0.00083333333333333339)));
				m_h_burst_cnt_3 = (m_h_burst_cnt_3 - ((int)1));
				
			};
			t_sample raw_exc = ((in1 * ((t_sample)0.5)) + (exc_noise * ((t_sample)0.80000000000000004)));
			m_h_pick_ph1_2 = wrap((m_h_pick_ph1_2 + safediv(((t_sample)0.13), samplerate)), ((int)0), ((int)1));
			m_h_pick_ph2_1 = wrap((m_h_pick_ph2_1 + safediv(((t_sample)0.20999999999999999), samplerate)), ((int)0), ((int)1));
			t_sample pick_lfo = ((((t_sample)0.65000000000000002) * sin((m_h_pick_ph1_2 * ((t_sample)6.2831853071795862)))) + (((t_sample)0.34999999999999998) * sin((m_h_pick_ph2_1 * ((t_sample)6.2831853071795862)))));
			t_sample v_33 = (m_pick_pos_26 + (pick_lfo * ((t_sample)0.050000000000000003)));
			t_sample eff_pick_pos = ((v_33 <= ((t_sample)0.01)) ? ((t_sample)0.01) : ((v_33 >= ((t_sample)0.98999999999999999)) ? ((t_sample)0.98999999999999999) : v_33));
			t_sample v_34 = (m_freq_31 + in2);
			t_sample base_f = ((v_34 <= ((int)10)) ? ((int)10) : ((v_34 >= max_35) ? max_35 : v_34));
			t_sample v_36 = (eff_pick_pos * safediv(samplerate, base_f));
			t_sample pick_samps = ((v_36 <= ((int)1)) ? ((int)1) : ((v_36 >= ((int)4000)) ? ((int)4000) : v_36));
			t_sample pick_sig = (raw_exc - m_pick_del_17.read_cubic(pick_samps));
			m_pick_del_17.write(raw_exc);
			t_sample v_37 = ((base_f - fine_hz) * safepow(((int)2), ((-wide_oct) * ((int)1))));
			t_sample f1 = ((v_37 <= ((int)10)) ? ((int)10) : ((v_37 >= max_38) ? max_38 : v_37));
			t_sample v_39 = ((base_f - (fine_hz * ((t_sample)0.33000000000000002))) * safepow(((int)2), ((-wide_oct) * ((t_sample)0.34999999999999998))));
			t_sample f2 = ((v_39 <= ((int)10)) ? ((int)10) : ((v_39 >= max_40) ? max_40 : v_39));
			t_sample v_41 = ((base_f + (fine_hz * ((t_sample)0.33000000000000002))) * safepow(((int)2), (wide_oct * ((t_sample)0.34999999999999998))));
			t_sample f3 = ((v_41 <= ((int)10)) ? ((int)10) : ((v_41 >= max_42) ? max_42 : v_41));
			t_sample v_43 = ((base_f + fine_hz) * safepow(((int)2), (wide_oct * ((int)1))));
			t_sample f4 = ((v_43 <= ((int)10)) ? ((int)10) : ((v_43 >= max_44) ? max_44 : v_43));
			t_sample v_45 = (safediv(samplerate, f1) - ((int)2));
			t_sample d1_samps = ((v_45 <= ((int)2)) ? ((int)2) : ((v_45 >= max_46) ? max_46 : v_45));
			t_sample v_47 = (safediv(samplerate, f2) - ((int)2));
			t_sample d2_samps = ((v_47 <= ((int)2)) ? ((int)2) : ((v_47 >= max_48) ? max_48 : v_47));
			t_sample v_49 = (safediv(samplerate, f3) - ((int)2));
			t_sample d3_samps = ((v_49 <= ((int)2)) ? ((int)2) : ((v_49 >= max_50) ? max_50 : v_49));
			t_sample v_51 = (safediv(samplerate, f4) - ((int)2));
			t_sample d4_samps = ((v_51 <= ((int)2)) ? ((int)2) : ((v_51 >= max_52) ? max_52 : v_51));
			t_sample sig1 = m_str1_21.read_linear(d1_samps);
			t_sample sig2 = m_str2_20.read_linear(d2_samps);
			t_sample sig3 = m_str3_19.read_linear(d3_samps);
			t_sample sig4 = m_str4_18.read_linear(d4_samps);
			t_sample disp1 = (((sig1 * (-ap_coeff)) + m_h_ap_in1_12) + (m_h_ap_out1_11 * ap_coeff));
			m_h_ap_in1_12 = sig1;
			m_h_ap_out1_11 = disp1;
			t_sample disp2 = (((sig2 * (-ap_coeff)) + m_h_ap_in2_10) + (m_h_ap_out2_9 * ap_coeff));
			m_h_ap_in2_10 = sig2;
			m_h_ap_out2_9 = disp2;
			t_sample disp3 = (((sig3 * (-ap_coeff)) + m_h_ap_in3_8) + (m_h_ap_out3_7 * ap_coeff));
			m_h_ap_in3_8 = sig3;
			m_h_ap_out3_7 = disp3;
			t_sample disp4 = (((sig4 * (-ap_coeff)) + m_h_ap_in4_6) + (m_h_ap_out4_5 * ap_coeff));
			m_h_ap_in4_6 = sig4;
			m_h_ap_out4_5 = disp4;
			t_sample damp1 = ((disp1 * (((int)1) - damp_alpha)) + (m_h_damp1_16 * damp_alpha));
			m_h_damp1_16 = damp1;
			t_sample damp2 = ((disp2 * (((int)1) - damp_alpha)) + (m_h_damp2_15 * damp_alpha));
			m_h_damp2_15 = damp2;
			t_sample damp3 = ((disp3 * (((int)1) - damp_alpha)) + (m_h_damp3_14 * damp_alpha));
			m_h_damp3_14 = damp3;
			t_sample damp4 = ((disp4 * (((int)1) - damp_alpha)) + (m_h_damp4_13 * damp_alpha));
			m_h_damp4_13 = damp4;
			t_sample maxa_53 = (m_decay_time_29 * f1);
			t_sample gain1 = safepow(((t_sample)0.001), safediv(((int)1), ((maxa_53 < ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : maxa_53)));
			t_sample maxa_54 = (m_decay_time_29 * f2);
			t_sample gain2 = safepow(((t_sample)0.001), safediv(((int)1), ((maxa_54 < ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : maxa_54)));
			t_sample maxa_55 = (m_decay_time_29 * f3);
			t_sample gain3 = safepow(((t_sample)0.001), safediv(((int)1), ((maxa_55 < ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : maxa_55)));
			t_sample maxa_56 = (m_decay_time_29 * f4);
			t_sample gain4 = safepow(((t_sample)0.001), safediv(((int)1), ((maxa_56 < ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : maxa_56)));
			t_sample sat1 = safediv(tanh(((damp1 * gain1) * drive_term)), drive_term);
			t_sample sat2 = safediv(tanh(((damp2 * gain2) * drive_term)), drive_term);
			t_sample sat3 = safediv(tanh(((damp3 * gain3) * drive_term)), drive_term);
			t_sample sat4 = safediv(tanh(((damp4 * gain4) * drive_term)), drive_term);
			m_str1_21.write((pick_sig + sat1));
			m_str2_20.write((pick_sig + sat2));
			m_str3_19.write((pick_sig + sat3));
			m_str4_18.write((pick_sig + sat4));
			t_sample outL = ((((sat1 * ((t_sample)0.34999999999999998)) + (sat2 * ((t_sample)0.14999999999999999))) + (sat3 * ((t_sample)0.28000000000000003))) + (sat4 * ((t_sample)0.12)));
			t_sample outR = ((((sat1 * ((t_sample)0.12)) + (sat2 * ((t_sample)0.28000000000000003))) + (sat3 * ((t_sample)0.14999999999999999))) + (sat4 * ((t_sample)0.34999999999999998)));
			t_sample wetL = tanh((outL * ((t_sample)1.2)));
			t_sample wetR = tanh((outR * ((t_sample)1.2)));
			t_sample tmp_mix_851 = (in1 + (bal * (wetL - in1)));
			t_sample tmp_expr_536 = tmp_mix_851;
			t_sample tmp_mix_852 = (in1 + (bal * (wetR - in1)));
			t_sample tmp_expr_537 = tmp_mix_852;
			t_sample out1 = tmp_expr_536;
			t_sample out2 = tmp_expr_537;
			m_pick_del_17.step();
			m_str4_18.step();
			m_str3_19.step();
			m_str2_20.step();
			m_str1_21.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_mix_pct(t_param _value) {
		m_mix_pct_22 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_trig(t_param _value) {
		m_trig_23 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_nl_bridge(t_param _value) {
		m_nl_bridge_24 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_strike_res(t_param _value) {
		m_strike_res_25 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_pick_pos(t_param _value) {
		m_pick_pos_26 = (_value < 0.01 ? 0.01 : (_value > 0.98999999999999999 ? 0.98999999999999999 : _value));
	};
	inline void set_stiffness(t_param _value) {
		m_stiffness_27 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_damping(t_param _value) {
		m_damping_28 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_decay_time(t_param _value) {
		m_decay_time_29 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 20 ? 20 : _value));
	};
	inline void set_detune(t_param _value) {
		m_detune_30 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_freq(t_param _value) {
		m_freq_31 = (_value < 20 ? 20 : (_value > 2000 ? 2000 : _value));
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
int num_params() { return 10; }

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
		case 0: self->set_damping(value); break;
		case 1: self->set_decay_time(value); break;
		case 2: self->set_detune(value); break;
		case 3: self->set_freq(value); break;
		case 4: self->set_mix_pct(value); break;
		case 5: self->set_nl_bridge(value); break;
		case 6: self->set_pick_pos(value); break;
		case 7: self->set_stiffness(value); break;
		case 8: self->set_strike_res(value); break;
		case 9: self->set_trig(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_damping_28; break;
		case 1: *value = self->m_decay_time_29; break;
		case 2: *value = self->m_detune_30; break;
		case 3: *value = self->m_freq_31; break;
		case 4: *value = self->m_mix_pct_22; break;
		case 5: *value = self->m_nl_bridge_24; break;
		case 6: *value = self->m_pick_pos_26; break;
		case 7: *value = self->m_stiffness_27; break;
		case 8: *value = self->m_strike_res_25; break;
		case 9: *value = self->m_trig_23; break;
		
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
	// initialize parameter 0 ("m_damping_28")
	pi = self->__commonstate.params + 0;
	pi->name = "damping";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_damping_28;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_decay_time_29")
	pi = self->__commonstate.params + 1;
	pi->name = "decay_time";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_decay_time_29;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 20;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_detune_30")
	pi = self->__commonstate.params + 2;
	pi->name = "detune";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_detune_30;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_freq_31")
	pi = self->__commonstate.params + 3;
	pi->name = "freq";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_freq_31;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 2000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_mix_pct_22")
	pi = self->__commonstate.params + 4;
	pi->name = "mix_pct";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_pct_22;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_nl_bridge_24")
	pi = self->__commonstate.params + 5;
	pi->name = "nl_bridge";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_nl_bridge_24;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_pick_pos_26")
	pi = self->__commonstate.params + 6;
	pi->name = "pick_pos";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_pick_pos_26;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 0.98999999999999999;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_stiffness_27")
	pi = self->__commonstate.params + 7;
	pi->name = "stiffness";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_stiffness_27;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_strike_res_25")
	pi = self->__commonstate.params + 8;
	pi->name = "strike_res";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_strike_res_25;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_trig_23")
	pi = self->__commonstate.params + 9;
	pi->name = "trig";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_trig_23;
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


} // waveguide_string::
