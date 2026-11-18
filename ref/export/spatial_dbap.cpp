#include "spatial_dbap.h"

namespace spatial_dbap {

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
	Data m_dists_11;
	int __exception;
	int __loopcount;
	int vectorsize;
	t_sample mc_channelcount;
	t_sample m_num_speakers_1;
	t_sample m_prev_filtered_10;
	t_sample mc_channel;
	t_sample __m_slide_19;
	t_sample __m_slide_16;
	t_sample samplerate;
	t_sample m_air_damp_9;
	t_sample __m_slide_22;
	t_sample m_blur_3;
	t_sample m_rolloff_2;
	t_sample m_sharpness_8;
	t_sample m_focus_4;
	t_sample m_smooth_6;
	t_sample m_room_scale_5;
	t_sample m_width_7;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_num_speakers_1 = ((int)0);
		m_rolloff_2 = ((int)1);
		m_blur_3 = ((t_sample)0.25);
		m_focus_4 = ((int)0);
		m_room_scale_5 = ((int)2);
		m_smooth_6 = ((int)240);
		m_width_7 = ((int)100);
		m_sharpness_8 = ((int)1);
		m_air_damp_9 = ((int)0);
		m_prev_filtered_10 = ((int)0);
		m_dists_11.reset("dists", ((int)32), ((int)1));
		mc_channelcount = 1;
		mc_channel = 1;
		__m_slide_16 = 0;
		__m_slide_19 = 0;
		__m_slide_22 = 0;
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		const t_sample * __in3 = __ins[2];
		const t_sample * __in4 = __ins[3];
		t_sample * __out1 = __outs[0];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__in3 == 0) || (__in4 == 0) || (__out1 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		int cond_12 = (m_num_speakers_1 > ((int)0));
		t_sample v_13 = floor(m_num_speakers_1);
		t_sample iftrue_14 = ((v_13 <= ((int)1)) ? ((int)1) : ((v_13 >= ((int)32)) ? ((int)32) : v_13));
		int iffalse_15 = ((((int)2) < mc_channelcount) ? mc_channelcount : ((int)2));
		t_sample total_spk = (cond_12 ? iftrue_14 : iffalse_15);
		int my_idx = (mc_channel - ((int)1));
		t_sample iup_17 = (1 / maximum(1, fabs(m_smooth_6)));
		t_sample idown_18 = (1 / maximum(1, fabs(m_smooth_6)));
		t_sample iup_20 = (1 / maximum(1, fabs(m_smooth_6)));
		t_sample idown_21 = (1 / maximum(1, fabs(m_smooth_6)));
		t_sample iup_23 = (1 / maximum(1, fabs(m_smooth_6)));
		t_sample idown_24 = (1 / maximum(1, fabs(m_smooth_6)));
		t_sample v_25 = (m_width_7 * ((t_sample)0.01));
		t_sample w_factor = ((v_25 <= ((t_sample)0.050000000000000003)) ? ((t_sample)0.050000000000000003) : ((v_25 >= ((int)2)) ? ((int)2) : v_25));
		t_sample eff_blur = (m_blur_3 * w_factor);
		t_sample eff_roll = (m_rolloff_2 * m_sharpness_8);
		int spk_pos_dim = spk_pos.dim;
		int spk_pos_channels = spk_pos.channels;
		int has_buf = (spk_pos_dim >= total_spk);
		__loopcount = (__n * GENLIB_LOOPCOUNT_BAIL);
		int cond_35 = (my_idx < total_spk);
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			const t_sample in3 = (*(__in3++));
			const t_sample in4 = (*(__in4++));
			t_sample tmp_expr_552 = ((int)0);
			__m_slide_16 = fixdenorm((__m_slide_16 + (((in2 > __m_slide_16) ? iup_17 : idown_18) * (in2 - __m_slide_16))));
			t_sample x_s = __m_slide_16;
			__m_slide_19 = fixdenorm((__m_slide_19 + (((in3 > __m_slide_19) ? iup_20 : idown_21) * (in3 - __m_slide_19))));
			t_sample y_s = __m_slide_19;
			__m_slide_22 = fixdenorm((__m_slide_22 + (((in4 > __m_slide_22) ? iup_23 : idown_24) * (in4 - __m_slide_22))));
			t_sample z_s = __m_slide_22;
			t_sample src_x = (x_s * m_room_scale_5);
			t_sample src_y = (y_s * m_room_scale_5);
			t_sample src_z = (z_s * m_room_scale_5);
			t_sample min_d = ((int)10000);
			t_sample max_d = ((t_sample)0.0001);
			t_sample my_d = ((int)10000);
			t_sample sx = ((int)0);
			t_sample sy = ((int)0);
			t_sample sz = ((int)0);
			// for loop initializer;
			int k = ((int)0);
			// for loop condition;
			// abort processing if an infinite loop is suspected;
			if (((__loopcount--) <= 0)) {
				__exception = GENLIB_ERR_LOOP_OVERFLOW;
				break ;
				
			};
			while ((k < total_spk)) {
				// abort processing if an infinite loop is suspected;
				if (((__loopcount--) <= 0)) {
					__exception = GENLIB_ERR_LOOP_OVERFLOW;
					break ;
					
				};
				t_sample fb_ang = (k * safediv(((t_sample)6.2831853071795862), total_spk));
				t_sample fb_x = (((int)2) * sin(fb_ang));
				t_sample fb_y = (((int)2) * cos(fb_ang));
				bool index_ignore_26 = ((k >= spk_pos_dim) || (k < 0));
				// samples spk_pos channel 1;
				t_sample tmp_peek_546 = (index_ignore_26 ? 0 : spk_pos.read(k, 0));
				t_sample tmp_peek_547 = k;
				sx = (has_buf ? tmp_peek_546 : fb_x);
				bool index_ignore_27 = ((k >= spk_pos_dim) || (k < 0));
				// samples spk_pos channel 1;
				bool chan_ignore_28 = ((1 < 0) || (1 >= spk_pos_channels));
				t_sample tmp_peek_548 = ((chan_ignore_28 || index_ignore_27) ? 0 : spk_pos.read(k, 1));
				t_sample tmp_peek_549 = k;
				sy = (has_buf ? tmp_peek_548 : fb_y);
				bool index_ignore_29 = ((k >= spk_pos_dim) || (k < 0));
				// samples spk_pos channel 1;
				bool chan_ignore_30 = ((2 < 0) || (2 >= spk_pos_channels));
				t_sample tmp_peek_550 = ((chan_ignore_30 || index_ignore_29) ? 0 : spk_pos.read(k, 2));
				t_sample tmp_peek_551 = k;
				sz = (has_buf ? tmp_peek_550 : ((int)0));
				t_sample dx = (src_x - sx);
				t_sample dy = (src_y - sy);
				t_sample dz = (src_z - sz);
				t_sample d = sqrt(((((dx * dx) + (dy * dy)) + (dz * dz)) + (eff_blur * eff_blur)));
				int dists_dim = m_dists_11.dim;
				int dists_channels = m_dists_11.channels;
				bool index_ignore_31 = ((k >= dists_dim) || (k < 0));
				if ((!index_ignore_31)) {
					m_dists_11.write(d, k, 0);
					
				};
				min_d = ((d < min_d) ? d : min_d);
				max_d = ((max_d < d) ? d : max_d);
				if ((k == my_idx)) {
					my_d = d;
					
				};
				// for loop increment;
				k = (k + ((int)1));
				
			};
			t_sample maxa_32 = (max_d - min_d);
			t_sample span = ((maxa_32 < ((t_sample)0.0001)) ? ((t_sample)0.0001) : maxa_32);
			t_sample energy = ((int)0);
			t_sample my_w = ((int)0);
			// for loop initializer;
			k = ((int)0);
			// for loop condition;
			while ((k < total_spk)) {
				// abort processing if an infinite loop is suspected;
				if (((__loopcount--) <= 0)) {
					__exception = GENLIB_ERR_LOOP_OVERFLOW;
					break ;
					
				};
				int dists_dim = m_dists_11.dim;
				int dists_channels = m_dists_11.channels;
				bool index_ignore_33 = ((k >= dists_dim) || (k < 0));
				// samples dists channel 1;
				t_sample d = (index_ignore_33 ? 0 : m_dists_11.read(k, 0));
				t_sample w = safepow(d, (-eff_roll));
				if ((m_focus_4 > ((int)0))) {
					t_sample rel_d = safediv((d - min_d), span);
					t_sample v_34 = (((int)1) - ((m_focus_4 * rel_d) * ((t_sample)1.5)));
					t_sample taper = ((v_34 <= ((int)0)) ? ((int)0) : ((v_34 >= ((int)1)) ? ((int)1) : v_34));
					w = (w * taper);
					
				};
				if ((k == my_idx)) {
					my_w = w;
					
				};
				energy = (energy + (w * w));
				// for loop increment;
				k = (k + ((int)1));
				
			};
			t_sample norm_factor = safediv(((int)1), sqrt(((energy < ((t_sample)9.9999999999999998e-13)) ? ((t_sample)9.9999999999999998e-13) : energy)));
			t_sample iftrue_36 = (my_w * norm_factor);
			t_sample gain_target = (cond_35 ? iftrue_36 : ((int)0));
			t_sample audio_out = (in1 * gain_target);
			if ((m_air_damp_9 > ((int)0))) {
				t_sample v_37 = safediv(my_d, ((m_room_scale_5 < ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : m_room_scale_5));
				t_sample d_norm = ((v_37 <= ((int)0)) ? ((int)0) : ((v_37 >= ((int)2)) ? ((int)2) : v_37));
				t_sample v_38 = (((int)20000) - (((d_norm * d_norm) * m_air_damp_9) * ((int)17500)));
				t_sample cutoff_target = ((v_38 <= ((int)2500)) ? ((int)2500) : ((v_38 >= ((int)20000)) ? ((int)20000) : v_38));
				t_sample w_rad = safediv((((t_sample)6.2831853071795862) * cutoff_target), samplerate);
				t_sample v_39 = safediv(w_rad, (w_rad + ((int)1)));
				t_sample alpha = ((v_39 <= ((t_sample)0.001)) ? ((t_sample)0.001) : ((v_39 >= ((int)1)) ? ((int)1) : v_39));
				t_sample filtered = ((audio_out * alpha) + (m_prev_filtered_10 * (((int)1) - alpha)));
				m_prev_filtered_10 = filtered;
				tmp_expr_552 = filtered;
				
			} else {
				tmp_expr_552 = audio_out;
				
			};
			t_sample out1 = tmp_expr_552;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			
		};
		return __exception;
		
	};
	inline void set_num_speakers(t_param _value) {
		m_num_speakers_1 = (_value < 0 ? 0 : (_value > 32 ? 32 : _value));
	};
	inline void set_rolloff(t_param _value) {
		m_rolloff_2 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 4 ? 4 : _value));
	};
	inline void set_blur(t_param _value) {
		m_blur_3 = (_value < 0.01 ? 0.01 : (_value > 2 ? 2 : _value));
	};
	inline void set_focus(t_param _value) {
		m_focus_4 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_room_scale(t_param _value) {
		m_room_scale_5 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 20 ? 20 : _value));
	};
	inline void set_smooth(t_param _value) {
		m_smooth_6 = (_value < 1 ? 1 : (_value > 1 ? 1 : _value));
	};
	inline void set_width(t_param _value) {
		m_width_7 = (_value < 1 ? 1 : (_value > 200 ? 200 : _value));
	};
	inline void set_sharpness(t_param _value) {
		m_sharpness_8 = (_value < 0.5 ? 0.5 : (_value > 4 ? 4 : _value));
	};
	inline void set_air_damp(t_param _value) {
		m_air_damp_9 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_dists(void * _value) {
		m_dists_11.setbuffer(_value);
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

int gen_kernel_numins = 4;
int gen_kernel_numouts = 1;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 12; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio Input (Mono Signal)", "Source X Position (-1..1)", "Source Y Position (-1..1)", "Source Z Position (-1..1)" };
const char *gen_kernel_outnames[] = { "Spatialized MC Output for current speaker channel" };

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
		case 1: self->set_blur(value); break;
		case 2: self->set_dists(ref); break;
		case 3: self->set_focus(value); break;
		case 4: self->set_mc_channel(value); break;
		case 5: self->set_mc_channelcount(value); break;
		case 6: self->set_num_speakers(value); break;
		case 7: self->set_rolloff(value); break;
		case 8: self->set_room_scale(value); break;
		case 9: self->set_sharpness(value); break;
		case 10: self->set_smooth(value); break;
		case 11: self->set_width(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_air_damp_9; break;
		case 1: *value = self->m_blur_3; break;
		
		case 3: *value = self->m_focus_4; break;
		case 4: *value = self->mc_channel; break;
		case 5: *value = self->mc_channelcount; break;
		case 6: *value = self->m_num_speakers_1; break;
		case 7: *value = self->m_rolloff_2; break;
		case 8: *value = self->m_room_scale_5; break;
		case 9: *value = self->m_sharpness_8; break;
		case 10: *value = self->m_smooth_6; break;
		case 11: *value = self->m_width_7; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(12 * sizeof(ParamInfo));
	self->__commonstate.numparams = 12;
	// initialize parameter 0 ("m_air_damp_9")
	pi = self->__commonstate.params + 0;
	pi->name = "air_damp";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_air_damp_9;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_blur_3")
	pi = self->__commonstate.params + 1;
	pi->name = "blur";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_blur_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 2;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_dists_11")
	pi = self->__commonstate.params + 2;
	pi->name = "dists";
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
	// initialize parameter 3 ("m_focus_4")
	pi = self->__commonstate.params + 3;
	pi->name = "focus";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_focus_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("mc_channel")
	pi = self->__commonstate.params + 4;
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
	// initialize parameter 5 ("mc_channelcount")
	pi = self->__commonstate.params + 5;
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
	// initialize parameter 6 ("m_num_speakers_1")
	pi = self->__commonstate.params + 6;
	pi->name = "num_speakers";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_num_speakers_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 32;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_rolloff_2")
	pi = self->__commonstate.params + 7;
	pi->name = "rolloff";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rolloff_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 4;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_room_scale_5")
	pi = self->__commonstate.params + 8;
	pi->name = "room_scale";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_room_scale_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 20;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_sharpness_8")
	pi = self->__commonstate.params + 9;
	pi->name = "sharpness";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_sharpness_8;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.5;
	pi->outputmax = 4;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_smooth_6")
	pi = self->__commonstate.params + 10;
	pi->name = "smooth";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_smooth_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 1;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 11 ("m_width_7")
	pi = self->__commonstate.params + 11;
	pi->name = "width";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_width_7;
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


} // spatial_dbap::
