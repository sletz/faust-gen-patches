#include "aether_drift.h"

namespace aether_drift {

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
	DCBlock __m_dcblock_48;
	DCBlock __m_dcblock_44;
	DCBlock __m_dcblock_43;
	DCBlock __m_dcblock_47;
	Delay m_ap6_17;
	Delay m_ap7_16;
	Delay m_ap8_15;
	Delay m_ap5_18;
	Delay m_ap4_19;
	Delay m_ap3_20;
	Delay m_ap2_21;
	Delay m_d1_14;
	Delay m_delay_L_26;
	Delay m_delay_R_25;
	Delay m_d2_13;
	Delay m_ap1_22;
	Delay m_d4_11;
	Delay m_apt4_7;
	Delay m_apt2_9;
	Delay m_apt3_8;
	Delay m_apt1_10;
	Delay m_d3_12;
	int vectorsize;
	int __exception;
	SineCycle __m_cycle_46;
	SineCycle __m_cycle_45;
	SineData __sinedata;
	t_sample m_del_vol_36;
	t_sample m_h_dc_out_L_3;
	t_sample m_gainout_37;
	t_sample m_mix_38;
	t_sample samplerate;
	t_sample m_del_time_35;
	t_sample __m_slide_39;
	t_sample m_h_rev_lp1_6;
	t_sample m_h_dc_L_4;
	t_sample m_del_fb_34;
	t_sample m_del_to_rev_32;
	t_sample m_h_dc_R_2;
	t_sample m_h_dc_out_R_1;
	t_sample m_h_del_lp_L_24;
	t_sample m_h_del_lp_R_23;
	t_sample m_del_damp_33;
	t_sample m_rev_mod_27;
	t_sample m_rev_diff_29;
	t_sample m_rev_damp_28;
	t_sample m_rev_vol_31;
	t_sample m_h_rev_lp2_5;
	t_sample m_rev_size_30;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_dc_out_R_1 = ((int)0);
		m_h_dc_R_2 = ((int)0);
		m_h_dc_out_L_3 = ((int)0);
		m_h_dc_L_4 = ((int)0);
		m_h_rev_lp2_5 = ((int)0);
		m_h_rev_lp1_6 = ((int)0);
		m_apt4_7.reset("m_apt4_7", ((int)613));
		m_apt3_8.reset("m_apt3_8", ((int)769));
		m_apt2_9.reset("m_apt2_9", ((int)503));
		m_apt1_10.reset("m_apt1_10", ((int)707));
		m_d4_11.reset("m_d4_11", ((int)4845));
		m_d3_12.reset("m_d3_12", ((int)3163));
		m_d2_13.reset("m_d2_13", ((int)4217));
		m_d1_14.reset("m_d1_14", ((int)4453));
		m_ap8_15.reset("m_ap8_15", ((int)1427));
		m_ap7_16.reset("m_ap7_16", ((int)1153));
		m_ap6_17.reset("m_ap6_17", ((int)997));
		m_ap5_18.reset("m_ap5_18", ((int)761));
		m_ap4_19.reset("m_ap4_19", ((int)563));
		m_ap3_20.reset("m_ap3_20", ((int)347));
		m_ap2_21.reset("m_ap2_21", ((int)233));
		m_ap1_22.reset("m_ap1_22", ((int)151));
		m_h_del_lp_R_23 = ((int)0);
		m_h_del_lp_L_24 = ((int)0);
		m_delay_R_25.reset("m_delay_R_25", (samplerate * ((int)2)));
		m_delay_L_26.reset("m_delay_L_26", (samplerate * ((int)2)));
		m_rev_mod_27 = ((int)40);
		m_rev_damp_28 = ((int)40);
		m_rev_diff_29 = ((int)85);
		m_rev_size_30 = ((int)85);
		m_rev_vol_31 = (-((int)6));
		m_del_to_rev_32 = ((int)50);
		m_del_damp_33 = ((int)30);
		m_del_fb_34 = ((int)60);
		m_del_time_35 = ((int)40);
		m_del_vol_36 = (-((int)6));
		m_gainout_37 = ((int)0);
		m_mix_38 = ((int)50);
		__m_slide_39 = 0;
		__m_dcblock_43.reset();
		__m_dcblock_44.reset();
		__m_cycle_45.reset(samplerate, 0);
		__m_cycle_46.reset(samplerate, 0);
		__m_dcblock_47.reset();
		__m_dcblock_48.reset();
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
		t_sample slide_input_40 = (m_del_time_35 * ((t_sample)0.01));
		t_sample iup_41 = (1 / maximum(1, fabs(((int)1000))));
		t_sample idown_42 = (1 / maximum(1, fabs(((int)1000))));
		t_sample tmp_div_1110 = (m_del_damp_33 * ((t_sample)0.01));
		t_sample tmp_div_1112 = (m_del_damp_33 * ((t_sample)0.01));
		t_sample d_c = (((t_sample)0.69999999999999996) * (m_rev_diff_29 * ((t_sample)0.01)));
		t_sample dec = (m_rev_size_30 * ((t_sample)0.01));
		t_sample damp = (m_rev_damp_28 * ((t_sample)0.01));
		t_sample tmp_div_1116 = (m_mix_38 * ((t_sample)0.01));
		t_sample tmp_div_1118 = (m_mix_38 * ((t_sample)0.01));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			__m_slide_39 = fixdenorm((__m_slide_39 + (((slide_input_40 > __m_slide_39) ? iup_41 : idown_42) * (slide_input_40 - __m_slide_39))));
			t_sample dt = (__m_slide_39 * ((int)2000));
			t_sample d_samps = (dt * (samplerate * 0.001));
			t_sample wet_del_L = m_delay_L_26.read_linear(d_samps);
			t_sample wet_del_R = m_delay_R_25.read_linear((d_samps + ((int)5)));
			t_sample tmp_mix_1109 = (wet_del_L + (tmp_div_1110 * (m_h_del_lp_L_24 - wet_del_L)));
			m_h_del_lp_L_24 = tmp_mix_1109;
			t_sample tmp_mix_1111 = (wet_del_R + (tmp_div_1112 * (m_h_del_lp_R_23 - wet_del_R)));
			m_h_del_lp_R_23 = tmp_mix_1111;
			m_delay_L_26.write(__m_dcblock_43((in1 + (m_h_del_lp_L_24 * (m_del_fb_34 * ((t_sample)0.01))))));
			m_delay_R_25.write(__m_dcblock_44((in2 + (m_h_del_lp_R_23 * (m_del_fb_34 * ((t_sample)0.01))))));
			t_sample sig_del_L = (wet_del_L * dbtoa(m_del_vol_36));
			t_sample sig_del_R = (wet_del_R * dbtoa(m_del_vol_36));
			t_sample rev_in = (((in1 + in2) * ((t_sample)0.5)) + (((wet_del_L + wet_del_R) * ((t_sample)0.5)) * (m_del_to_rev_32 * ((t_sample)0.01))));
			t_sample v1 = (rev_in - (m_ap1_22.read_step(((int)151)) * ((t_sample)0.75)));
			m_ap1_22.write(v1);
			t_sample i1 = (m_ap1_22.read_step(((int)151)) + (v1 * ((t_sample)0.75)));
			t_sample v2 = (i1 - (m_ap2_21.read_step(((int)233)) * ((t_sample)0.75)));
			m_ap2_21.write(v2);
			t_sample i2 = (m_ap2_21.read_step(((int)233)) + (v2 * ((t_sample)0.75)));
			t_sample v3 = (i2 - (m_ap3_20.read_step(((int)347)) * ((t_sample)0.75)));
			m_ap3_20.write(v3);
			t_sample i3 = (m_ap3_20.read_step(((int)347)) + (v3 * ((t_sample)0.75)));
			t_sample v4 = (i3 - (m_ap4_19.read_step(((int)563)) * ((t_sample)0.75)));
			m_ap4_19.write(v4);
			t_sample i4 = (m_ap4_19.read_step(((int)563)) + (v4 * ((t_sample)0.75)));
			t_sample v5 = (i4 - (m_ap5_18.read_step(((int)761)) * ((t_sample)0.75)));
			m_ap5_18.write(v5);
			t_sample i5 = (m_ap5_18.read_step(((int)761)) + (v5 * ((t_sample)0.75)));
			t_sample v6 = (i5 - (m_ap6_17.read_step(((int)997)) * ((t_sample)0.75)));
			m_ap6_17.write(v6);
			t_sample i6 = (m_ap6_17.read_step(((int)997)) + (v6 * ((t_sample)0.75)));
			t_sample v7 = (i6 - (m_ap7_16.read_step(((int)1153)) * ((t_sample)0.75)));
			m_ap7_16.write(v7);
			t_sample i7 = (m_ap7_16.read_step(((int)1153)) + (v7 * ((t_sample)0.75)));
			t_sample v8 = (i7 - (m_ap8_15.read_step(((int)1427)) * ((t_sample)0.75)));
			m_ap8_15.write(v8);
			t_sample diffused_in = (m_ap8_15.read_step(((int)1427)) + (v8 * ((t_sample)0.75)));
			__m_cycle_45.freq(((t_sample)0.070000000000000007));
			t_sample tmp_cycle_26 = __m_cycle_45(__sinedata);
			t_sample tmp_cycle_27 = __m_cycle_45.phase();
			t_sample lfo1 = ((tmp_cycle_26 * (m_rev_mod_27 * ((t_sample)0.20000000000000001))) * ((int)30));
			__m_cycle_46.freq(((t_sample)0.11));
			t_sample tmp_cycle_28 = __m_cycle_46(__sinedata);
			t_sample tmp_cycle_29 = __m_cycle_46.phase();
			t_sample lfo2 = ((tmp_cycle_28 * (m_rev_mod_27 * ((t_sample)0.20000000000000001))) * ((int)30));
			t_sample s_d2 = m_d2_13.read_linear((((int)4217) + lfo1));
			t_sample s_d4 = m_d4_11.read_linear((((int)4845) + lfo2));
			t_sample tmp_mix_1113 = (s_d2 + (damp * (m_h_rev_lp1_6 - s_d2)));
			m_h_rev_lp1_6 = tmp_mix_1113;
			t_sample tmp_mix_1114 = (s_d4 + (damp * (m_h_rev_lp2_5 - s_d4)));
			m_h_rev_lp2_5 = tmp_mix_1114;
			t_sample fbL = (diffused_in + (m_h_rev_lp2_5 * dec));
			t_sample v_at1 = (fbL - (m_apt1_10.read_step(((int)707)) * (-d_c)));
			m_apt1_10.write(v_at1);
			t_sample r_at1 = (m_apt1_10.read_step(((int)707)) + (v_at1 * (-d_c)));
			t_sample v_at2 = (r_at1 - (m_apt2_9.read_step(((int)503)) * d_c));
			m_apt2_9.write(v_at2);
			t_sample r_at2 = (m_apt2_9.read_step(((int)503)) + (v_at2 * d_c));
			m_d1_14.write(__m_dcblock_47(r_at2));
			t_sample fbR = (diffused_in + (m_h_rev_lp1_6 * dec));
			t_sample v_at3 = (fbR - (m_apt3_8.read_step(((int)769)) * (-d_c)));
			m_apt3_8.write(v_at3);
			t_sample r_at3 = (m_apt3_8.read_step(((int)769)) + (v_at3 * (-d_c)));
			t_sample v_at4 = (r_at3 - (m_apt4_7.read_step(((int)613)) * d_c));
			m_apt4_7.write(v_at4);
			t_sample r_at4 = (m_apt4_7.read_step(((int)613)) + (v_at4 * d_c));
			m_d3_12.write(__m_dcblock_48(r_at4));
			m_d2_13.write(m_d1_14.read_step(((int)4453)));
			m_d4_11.write(m_d3_12.read_step(((int)3163)));
			t_sample sig_rev_L = (((m_d1_14.read_step(((int)4453)) + r_at2) - r_at4) * dbtoa(m_rev_vol_31));
			t_sample sig_rev_R = (((m_d3_12.read_step(((int)3163)) + r_at4) - r_at2) * dbtoa(m_rev_vol_31));
			t_sample fx_L = (sig_del_L + sig_rev_L);
			t_sample fx_R = (sig_del_R + sig_rev_R);
			t_sample tmp_mix_1115 = (in1 + (tmp_div_1116 * (fx_L - in1)));
			t_sample mix_L = tmp_mix_1115;
			t_sample tmp_mix_1117 = (in2 + (tmp_div_1118 * (fx_R - in2)));
			t_sample mix_R = tmp_mix_1117;
			t_sample out_pre_L = tanh((mix_L * dbtoa(m_gainout_37)));
			t_sample out_pre_R = tanh((mix_R * dbtoa(m_gainout_37)));
			t_sample dcL = ((out_pre_L - m_h_dc_L_4) + (((t_sample)0.995) * m_h_dc_out_L_3));
			m_h_dc_L_4 = out_pre_L;
			m_h_dc_out_L_3 = dcL;
			t_sample tmp_expr_47 = dcL;
			t_sample dcR = ((out_pre_R - m_h_dc_R_2) + (((t_sample)0.995) * m_h_dc_out_R_1));
			m_h_dc_R_2 = out_pre_R;
			m_h_dc_out_R_1 = dcR;
			t_sample tmp_expr_48 = dcR;
			t_sample out2 = tmp_expr_48;
			t_sample out1 = tmp_expr_47;
			m_apt4_7.step();
			m_apt3_8.step();
			m_apt2_9.step();
			m_apt1_10.step();
			m_d4_11.step();
			m_d3_12.step();
			m_d2_13.step();
			m_d1_14.step();
			m_ap8_15.step();
			m_ap7_16.step();
			m_ap6_17.step();
			m_ap5_18.step();
			m_ap4_19.step();
			m_ap3_20.step();
			m_ap2_21.step();
			m_ap1_22.step();
			m_delay_R_25.step();
			m_delay_L_26.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_rev_mod(t_param _value) {
		m_rev_mod_27 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_rev_damp(t_param _value) {
		m_rev_damp_28 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_rev_diff(t_param _value) {
		m_rev_diff_29 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_rev_size(t_param _value) {
		m_rev_size_30 = (_value < 0 ? 0 : (_value > 99 ? 99 : _value));
	};
	inline void set_rev_vol(t_param _value) {
		m_rev_vol_31 = (_value < -60 ? -60 : (_value > 6 ? 6 : _value));
	};
	inline void set_del_to_rev(t_param _value) {
		m_del_to_rev_32 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_del_damp(t_param _value) {
		m_del_damp_33 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_del_fb(t_param _value) {
		m_del_fb_34 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_del_time(t_param _value) {
		m_del_time_35 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_del_vol(t_param _value) {
		m_del_vol_36 = (_value < -60 ? -60 : (_value > 6 ? 6 : _value));
	};
	inline void set_gainout(t_param _value) {
		m_gainout_37 = (_value < -60 ? -60 : (_value > 12 ? 12 : _value));
	};
	inline void set_mix(t_param _value) {
		m_mix_38 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
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
int num_params() { return 12; }

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
		case 0: self->set_del_damp(value); break;
		case 1: self->set_del_fb(value); break;
		case 2: self->set_del_time(value); break;
		case 3: self->set_del_to_rev(value); break;
		case 4: self->set_del_vol(value); break;
		case 5: self->set_gainout(value); break;
		case 6: self->set_mix(value); break;
		case 7: self->set_rev_damp(value); break;
		case 8: self->set_rev_diff(value); break;
		case 9: self->set_rev_mod(value); break;
		case 10: self->set_rev_size(value); break;
		case 11: self->set_rev_vol(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_del_damp_33; break;
		case 1: *value = self->m_del_fb_34; break;
		case 2: *value = self->m_del_time_35; break;
		case 3: *value = self->m_del_to_rev_32; break;
		case 4: *value = self->m_del_vol_36; break;
		case 5: *value = self->m_gainout_37; break;
		case 6: *value = self->m_mix_38; break;
		case 7: *value = self->m_rev_damp_28; break;
		case 8: *value = self->m_rev_diff_29; break;
		case 9: *value = self->m_rev_mod_27; break;
		case 10: *value = self->m_rev_size_30; break;
		case 11: *value = self->m_rev_vol_31; break;
		
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
	// initialize parameter 0 ("m_del_damp_33")
	pi = self->__commonstate.params + 0;
	pi->name = "del_damp";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_del_damp_33;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_del_fb_34")
	pi = self->__commonstate.params + 1;
	pi->name = "del_fb";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_del_fb_34;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_del_time_35")
	pi = self->__commonstate.params + 2;
	pi->name = "del_time";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_del_time_35;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_del_to_rev_32")
	pi = self->__commonstate.params + 3;
	pi->name = "del_to_rev";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_del_to_rev_32;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_del_vol_36")
	pi = self->__commonstate.params + 4;
	pi->name = "del_vol";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_del_vol_36;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -60;
	pi->outputmax = 6;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_gainout_37")
	pi = self->__commonstate.params + 5;
	pi->name = "gainout";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gainout_37;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -60;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_mix_38")
	pi = self->__commonstate.params + 6;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_38;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_rev_damp_28")
	pi = self->__commonstate.params + 7;
	pi->name = "rev_damp";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rev_damp_28;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_rev_diff_29")
	pi = self->__commonstate.params + 8;
	pi->name = "rev_diff";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rev_diff_29;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_rev_mod_27")
	pi = self->__commonstate.params + 9;
	pi->name = "rev_mod";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rev_mod_27;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_rev_size_30")
	pi = self->__commonstate.params + 10;
	pi->name = "rev_size";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rev_size_30;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 99;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 11 ("m_rev_vol_31")
	pi = self->__commonstate.params + 11;
	pi->name = "rev_vol";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_rev_vol_31;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -60;
	pi->outputmax = 6;
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


} // aether_drift::
