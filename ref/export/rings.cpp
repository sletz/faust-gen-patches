#include "rings.h"

namespace rings {

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
	Data m_s1_12;
	Data m_s2_13;
	int __exception;
	int __loopcount;
	int vectorsize;
	t_sample m_h_strike_ph_17;
	t_sample m_h_prev_strum_16;
	t_sample m_h_prev_in3_15;
	t_sample m_h_exc_lp_14;
	t_sample m_h_noise_env_18;
	t_sample m_h_dc_x_L_20;
	t_sample m_h_strum_env_19;
	t_sample m_h_dc_x_R_22;
	t_sample m_h_dc_y_L_21;
	t_sample m_pitch_1;
	t_sample m_structure_2;
	t_sample m_h_dc_y_R_23;
	t_sample m_position_5;
	t_sample m_damping_4;
	t_sample m_brightness_3;
	t_sample samplerate;
	t_sample m_stereo_spread_6;
	t_sample m_drive_8;
	t_sample m_internal_exciter_7;
	t_sample m_mix_10;
	t_sample m_gain_9;
	t_sample m_strum_11;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_pitch_1 = ((int)48);
		m_structure_2 = ((t_sample)0.25);
		m_brightness_3 = ((t_sample)0.59999999999999998);
		m_damping_4 = ((t_sample)0.59999999999999998);
		m_position_5 = ((t_sample)0.25);
		m_stereo_spread_6 = ((int)80);
		m_internal_exciter_7 = ((int)80);
		m_drive_8 = ((int)20);
		m_gain_9 = ((int)0);
		m_mix_10 = ((int)100);
		m_strum_11 = ((int)0);
		m_s1_12.reset("s1", ((int)24), ((int)1));
		m_s2_13.reset("s2", ((int)24), ((int)1));
		m_h_exc_lp_14 = ((int)0);
		m_h_prev_in3_15 = ((int)0);
		m_h_prev_strum_16 = ((int)0);
		m_h_strike_ph_17 = (-((int)1));
		m_h_noise_env_18 = ((int)0);
		m_h_strum_env_19 = ((int)0);
		m_h_dc_x_L_20 = ((int)0);
		m_h_dc_y_L_21 = ((int)0);
		m_h_dc_x_R_22 = ((int)0);
		m_h_dc_y_R_23 = ((int)0);
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
		t_sample * __out3 = __outs[2];
		t_sample * __out4 = __outs[3];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__in3 == 0) || (__out1 == 0) || (__out2 == 0) || (__out3 == 0) || (__out4 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		t_sample v_25 = (m_internal_exciter_7 * ((t_sample)0.01));
		t_sample exc_level = ((v_25 <= ((int)0)) ? ((int)0) : ((v_25 >= ((int)1)) ? ((int)1) : v_25));
		t_sample in_drive = (((int)1) + ((m_drive_8 * ((t_sample)0.01)) * ((int)2)));
		t_sample eff_br = ((m_brightness_3 <= ((t_sample)0.01)) ? ((t_sample)0.01) : ((m_brightness_3 >= ((int)1)) ? ((int)1) : m_brightness_3));
		t_sample v_26 = (((int)40) * safepow(((int)450), eff_br));
		t_sample max_27 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample exc_cutoff = ((v_26 <= ((int)40)) ? ((int)40) : ((v_26 >= max_27) ? max_27 : v_26));
		t_sample exc_g = tan(safediv((((t_sample)3.1415926535897931) * exc_cutoff), samplerate));
		t_sample exc_alpha = safediv(exc_g, (((int)1) + exc_g));
		t_sample f0 = safediv((((int)440) * safepow(((int)2), ((m_pitch_1 - ((int)69)) * ((t_sample)0.083333333333333329)))), samplerate);
		t_sample min_28 = safediv(((int)20), samplerate);
		t_sample tmp_f0_474 = ((f0 <= min_28) ? min_28 : ((f0 >= ((t_sample)0.45000000000000001)) ? ((t_sample)0.45000000000000001) : f0));
		t_sample eff_damp = ((m_damping_4 <= ((int)0)) ? ((int)0) : ((m_damping_4 >= ((int)1)) ? ((int)1) : m_damping_4));
		t_sample q_base = (((int)500) * safepow(((int)10), (eff_damp * ((t_sample)3.5))));
		t_sample br_atten = (((int)1) - m_structure_2);
		t_sample tmp_br_atten_475 = safepow(br_atten, ((int)8));
		t_sample br = (eff_br * (((int)1) - (((t_sample)0.20000000000000001) * tmp_br_atten_475)));
		t_sample q_loss = (((br * (((int)2) - br)) * ((t_sample)0.84999999999999998)) + ((t_sample)0.14999999999999999));
		t_sample q_loss_damping_rate = ((m_structure_2 * (((int)2) - m_structure_2)) * ((t_sample)0.10000000000000001));
		__loopcount = (__n * GENLIB_LOOPCOUNT_BAIL);
		t_sample v_35 = (m_stereo_spread_6 * ((t_sample)0.01));
		t_sample sp = ((v_35 <= ((int)0)) ? ((int)0) : ((v_35 >= ((int)1)) ? ((int)1) : v_35));
		t_sample make_up = dbtoa(m_gain_9);
		t_sample v_36 = (m_mix_10 * ((t_sample)0.01));
		t_sample eff_mix = ((v_36 <= ((int)0)) ? ((int)0) : ((v_36 >= ((int)1)) ? ((int)1) : v_36));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			const t_sample in3 = (*(__in3++));
			int trig_in3 = ((in3 > ((t_sample)0.10000000000000001)) && (m_h_prev_in3_15 <= ((t_sample)0.10000000000000001)));
			m_h_prev_in3_15 = (in3 > ((t_sample)0.10000000000000001));
			int trig_param = ((m_strum_11 > ((int)0)) && (m_h_prev_strum_16 <= ((int)0)));
			m_h_prev_strum_16 = (m_strum_11 > ((int)0));
			int strum_hit = (trig_in3 || trig_param);
			if (strum_hit) {
				m_h_strike_ph_17 = ((int)0);
				m_h_noise_env_18 = ((int)1);
				m_h_strum_env_19 = ((int)1);
				
			} else {
				m_h_strum_env_19 = fixdenorm((m_h_strum_env_19 * ((t_sample)0.995)));
				
			};
			t_sample strike_pulse = ((int)0);
			if ((m_h_strike_ph_17 >= ((int)0))) {
				t_sample maxb_24 = (samplerate * ((t_sample)0.002));
				t_sample strike_samps = ((((int)16) < maxb_24) ? maxb_24 : ((int)16));
				strike_pulse = (((t_sample)0.5) - (((t_sample)0.5) * cos((((t_sample)6.2831853071795862) * safediv(m_h_strike_ph_17, strike_samps)))));
				m_h_strike_ph_17 = (m_h_strike_ph_17 + ((int)1));
				if ((m_h_strike_ph_17 >= strike_samps)) {
					m_h_strike_ph_17 = ((int)-1);
					
				};
				
			};
			m_h_noise_env_18 = fixdenorm((m_h_noise_env_18 * ((t_sample)0.98499999999999999)));
			t_sample pluck_noise = ((noise() * m_h_noise_env_18) * ((t_sample)0.40000000000000002));
			t_sample acoustic_exciter = (((strike_pulse * ((t_sample)1.6000000000000001)) + pluck_noise) * exc_level);
			t_sample audio_in = ((in1 + in2) * ((t_sample)0.5));
			t_sample raw_exc = (tanh((audio_in * in_drive)) + acoustic_exciter);
			t_sample exc_sig = (m_h_exc_lp_14 + (exc_alpha * (raw_exc - m_h_exc_lp_14)));
			m_h_exc_lp_14 = exc_sig;
			t_sample stiff = ((int)0);
			if ((m_structure_2 < ((t_sample)0.25))) {
				stiff = ((-(((t_sample)0.25) - m_structure_2)) * ((t_sample)0.25));
				
			} else {
				if ((m_structure_2 < ((t_sample)0.29999999999999999))) {
					stiff = ((int)0);
					
				} else {
					if ((m_structure_2 < ((t_sample)0.90000000000000002))) {
						t_sample g_s = ((m_structure_2 - ((t_sample)0.29999999999999999)) * ((t_sample)1.6666666666666667));
						stiff = ((((t_sample)0.01) * safepow(((int)10), (g_s * ((t_sample)2.0049999999999999)))) - ((t_sample)0.01));
						
					} else {
						t_sample g_s = ((m_structure_2 - ((t_sample)0.90000000000000002)) * ((t_sample)10));
						stiff = (((t_sample)1.5) - (cos(((g_s * g_s) * ((t_sample)3.1415926535897931))) * ((t_sample)0.5)));
						
					};
					
				};
				
			};
			t_sample sum_odd = ((int)0);
			t_sample sum_even = ((int)0);
			t_sample harmonic = tmp_f0_474;
			t_sample stretch = ((int)1);
			t_sample cur_stiff = stiff;
			t_sample cur_q = q_base;
			t_sample cur_qloss = q_loss;
			// for loop initializer;
			int i = ((int)0);
			// for loop condition;
			// abort processing if an infinite loop is suspected;
			if (((__loopcount--) <= 0)) {
				__exception = GENLIB_ERR_LOOP_OVERFLOW;
				break ;
				
			};
			while ((i < ((int)24))) {
				// abort processing if an infinite loop is suspected;
				if (((__loopcount--) <= 0)) {
					__exception = GENLIB_ERR_LOOP_OVERFLOW;
					break ;
					
				};
				t_sample v_29 = (harmonic * stretch);
				t_sample min_30 = safediv(((int)10), samplerate);
				t_sample pf = ((v_29 <= min_30) ? min_30 : ((v_29 >= ((t_sample)0.47999999999999998)) ? ((t_sample)0.47999999999999998) : v_29));
				t_sample res = (((int)1) + (pf * cur_q));
				t_sample g_m = tan((((t_sample)3.1415926535897931) * pf));
				t_sample r_m = safediv(((int)1), res);
				t_sample h_m = safediv(((int)1), ((((int)1) + (r_m * g_m)) + (g_m * g_m)));
				t_sample pos_angle = ((((t_sample)6.2831853071795862) * i) * m_position_5);
				t_sample amp = (((t_sample)0.5) + (((t_sample)0.5) * cos(pos_angle)));
				int s1_dim = m_s1_12.dim;
				int s1_channels = m_s1_12.channels;
				bool index_ignore_31 = ((i >= s1_dim) || (i < 0));
				// samples s1 channel 1;
				t_sample s1_val = (index_ignore_31 ? 0 : m_s1_12.read(i, 0));
				int s2_dim = m_s2_13.dim;
				int s2_channels = m_s2_13.channels;
				bool index_ignore_32 = ((i >= s2_dim) || (i < 0));
				// samples s2 channel 1;
				t_sample s2_val = (index_ignore_32 ? 0 : m_s2_13.read(i, 0));
				t_sample hp = (((exc_sig - ((r_m + g_m) * s1_val)) - s2_val) * h_m);
				t_sample v1 = (g_m * hp);
				t_sample bp = (v1 + s1_val);
				t_sample s1_next = ((((int)2) * v1) + s1_val);
				t_sample v2 = (g_m * bp);
				t_sample s2_next = ((((int)2) * v2) + s2_val);
				bool index_ignore_33 = ((i >= s1_dim) || (i < 0));
				if ((!index_ignore_33)) {
					m_s1_12.write(fixdenorm(s1_next), i, 0);
					
				};
				bool index_ignore_34 = ((i >= s2_dim) || (i < 0));
				if ((!index_ignore_34)) {
					m_s2_13.write(fixdenorm(s2_next), i, 0);
					
				};
				t_sample mode_out = (bp * amp);
				if ((safemod(i, ((int)2)) == ((int)0))) {
					sum_odd = (sum_odd + mode_out);
					
				} else {
					sum_even = (sum_even + mode_out);
					
				};
				stretch = (stretch + cur_stiff);
				cur_qloss = (cur_qloss + (q_loss_damping_rate * (((int)1) - cur_qloss)));
				harmonic = (harmonic + tmp_f0_474);
				cur_q = (cur_q * cur_qloss);
				// for loop increment;
				i = (i + ((int)1));
				
			};
			t_sample pan_L = ((sum_odd * (((int)1) + (sp * ((t_sample)0.5)))) + (sum_even * (((int)1) - (sp * ((t_sample)0.5)))));
			t_sample pan_R = ((sum_even * (((int)1) + (sp * ((t_sample)0.5)))) + (sum_odd * (((int)1) - (sp * ((t_sample)0.5)))));
			t_sample dc_L = ((pan_L - m_h_dc_x_L_20) + (((t_sample)0.995) * m_h_dc_y_L_21));
			m_h_dc_x_L_20 = pan_L;
			m_h_dc_y_L_21 = dc_L;
			t_sample dc_R = ((pan_R - m_h_dc_x_R_22) + (((t_sample)0.995) * m_h_dc_y_R_23));
			m_h_dc_x_R_22 = pan_R;
			m_h_dc_y_R_23 = dc_R;
			t_sample lim_L = ((tanh((dc_L * ((t_sample)0.5))) * ((t_sample)1.8)) * make_up);
			t_sample lim_R = ((tanh((dc_R * ((t_sample)0.5))) * ((t_sample)1.8)) * make_up);
			t_sample tmp_expr_477 = ((in1 * (((int)1) - eff_mix)) + (lim_L * eff_mix));
			t_sample tmp_expr_478 = ((in2 * (((int)1) - eff_mix)) + (lim_R * eff_mix));
			t_sample tmp_expr_479 = exc_sig;
			t_sample tmp_expr_480 = m_h_strum_env_19;
			t_sample out1 = tmp_expr_477;
			t_sample out2 = tmp_expr_478;
			t_sample out3 = tmp_expr_479;
			t_sample out4 = tmp_expr_480;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			(*(__out4++)) = out4;
			
		};
		return __exception;
		
	};
	inline void set_pitch(t_param _value) {
		m_pitch_1 = (_value < 12 ? 12 : (_value > 108 ? 108 : _value));
	};
	inline void set_structure(t_param _value) {
		m_structure_2 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_brightness(t_param _value) {
		m_brightness_3 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_damping(t_param _value) {
		m_damping_4 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_position(t_param _value) {
		m_position_5 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_stereo_spread(t_param _value) {
		m_stereo_spread_6 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_internal_exciter(t_param _value) {
		m_internal_exciter_7 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_drive(t_param _value) {
		m_drive_8 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_gain(t_param _value) {
		m_gain_9 = (_value < -24 ? -24 : (_value > 12 ? 12 : _value));
	};
	inline void set_mix(t_param _value) {
		m_mix_10 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_strum(t_param _value) {
		m_strum_11 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_s1(void * _value) {
		m_s1_12.setbuffer(_value);
	};
	inline void set_s2(void * _value) {
		m_s2_13.setbuffer(_value);
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 3;
int gen_kernel_numouts = 4;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 13; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio Left In", "Audio Right In", "Strum Trigger" };
const char *gen_kernel_outnames[] = { "Processed Left Out", "Processed Right Out", "Excitation Out", "Strum Env Out" };

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
		case 0: self->set_brightness(value); break;
		case 1: self->set_damping(value); break;
		case 2: self->set_drive(value); break;
		case 3: self->set_gain(value); break;
		case 4: self->set_internal_exciter(value); break;
		case 5: self->set_mix(value); break;
		case 6: self->set_pitch(value); break;
		case 7: self->set_position(value); break;
		case 8: self->set_s1(ref); break;
		case 9: self->set_s2(ref); break;
		case 10: self->set_stereo_spread(value); break;
		case 11: self->set_structure(value); break;
		case 12: self->set_strum(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_brightness_3; break;
		case 1: *value = self->m_damping_4; break;
		case 2: *value = self->m_drive_8; break;
		case 3: *value = self->m_gain_9; break;
		case 4: *value = self->m_internal_exciter_7; break;
		case 5: *value = self->m_mix_10; break;
		case 6: *value = self->m_pitch_1; break;
		case 7: *value = self->m_position_5; break;
		
		
		case 10: *value = self->m_stereo_spread_6; break;
		case 11: *value = self->m_structure_2; break;
		case 12: *value = self->m_strum_11; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(13 * sizeof(ParamInfo));
	self->__commonstate.numparams = 13;
	// initialize parameter 0 ("m_brightness_3")
	pi = self->__commonstate.params + 0;
	pi->name = "brightness";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_brightness_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_damping_4")
	pi = self->__commonstate.params + 1;
	pi->name = "damping";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_damping_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_drive_8")
	pi = self->__commonstate.params + 2;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_8;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_gain_9")
	pi = self->__commonstate.params + 3;
	pi->name = "gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_9;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -24;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_internal_exciter_7")
	pi = self->__commonstate.params + 4;
	pi->name = "internal_exciter";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_internal_exciter_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_mix_10")
	pi = self->__commonstate.params + 5;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_10;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_pitch_1")
	pi = self->__commonstate.params + 6;
	pi->name = "pitch";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_pitch_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 12;
	pi->outputmax = 108;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_position_5")
	pi = self->__commonstate.params + 7;
	pi->name = "position";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_position_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_s1_12")
	pi = self->__commonstate.params + 8;
	pi->name = "s1";
	pi->paramtype = GENLIB_PARAMTYPE_SYM;
	pi->defaultvalue = 0.;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = false;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_s2_13")
	pi = self->__commonstate.params + 9;
	pi->name = "s2";
	pi->paramtype = GENLIB_PARAMTYPE_SYM;
	pi->defaultvalue = 0.;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = false;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_stereo_spread_6")
	pi = self->__commonstate.params + 10;
	pi->name = "stereo_spread";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_stereo_spread_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 11 ("m_structure_2")
	pi = self->__commonstate.params + 11;
	pi->name = "structure";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_structure_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 12 ("m_strum_11")
	pi = self->__commonstate.params + 12;
	pi->name = "strum";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_strum_11;
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


} // rings::
