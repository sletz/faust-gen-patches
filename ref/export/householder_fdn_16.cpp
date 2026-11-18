#include "householder_fdn_16.h"

namespace householder_fdn_16 {

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
	Delay m_d11_18;
	Delay m_d1_8;
	Delay m_d0_7;
	Delay m_d7_14;
	Delay m_d2_9;
	Delay m_d4_11;
	Delay m_d3_10;
	Delay m_d5_12;
	Delay m_d8_15;
	Delay m_d10_17;
	Delay m_d15_22;
	Delay m_d9_16;
	Delay m_d14_21;
	Delay m_d12_19;
	Delay m_d13_20;
	Delay m_d6_13;
	int __exception;
	int vectorsize;
	t_sample m_h8_31;
	t_sample m_mod_rate_5;
	t_sample m_h7_30;
	t_sample m_h6_29;
	t_sample m_h5_28;
	t_sample m_h9_32;
	t_sample m_h11_34;
	t_sample m_h14_37;
	t_sample m_h10_33;
	t_sample m_h13_36;
	t_sample m_h12_35;
	t_sample m_mix_6;
	t_sample m_h4_27;
	t_sample m_h2_25;
	t_sample m_h15_38;
	t_sample m_damping_3;
	t_sample m_mod_amt_4;
	t_sample m_h3_26;
	t_sample m_decay_2;
	t_sample samplerate;
	t_sample m_size_1;
	t_sample m_h1_24;
	t_sample m_h0_23;
	t_sample m_h_lfo_ph_39;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_size_1 = ((int)1);
		m_decay_2 = ((t_sample)4.5);
		m_damping_3 = ((t_sample)0.34999999999999998);
		m_mod_amt_4 = ((int)3);
		m_mod_rate_5 = ((t_sample)0.69999999999999996);
		m_mix_6 = ((int)50);
		m_d0_7.reset("m_d0_7", ((int)16000));
		m_d1_8.reset("m_d1_8", ((int)16000));
		m_d2_9.reset("m_d2_9", ((int)16000));
		m_d3_10.reset("m_d3_10", ((int)16000));
		m_d4_11.reset("m_d4_11", ((int)16000));
		m_d5_12.reset("m_d5_12", ((int)16000));
		m_d6_13.reset("m_d6_13", ((int)16000));
		m_d7_14.reset("m_d7_14", ((int)16000));
		m_d8_15.reset("m_d8_15", ((int)16000));
		m_d9_16.reset("m_d9_16", ((int)16000));
		m_d10_17.reset("m_d10_17", ((int)16000));
		m_d11_18.reset("m_d11_18", ((int)16000));
		m_d12_19.reset("m_d12_19", ((int)16000));
		m_d13_20.reset("m_d13_20", ((int)16000));
		m_d14_21.reset("m_d14_21", ((int)16000));
		m_d15_22.reset("m_d15_22", ((int)16000));
		m_h0_23 = ((int)0);
		m_h1_24 = ((int)0);
		m_h2_25 = ((int)0);
		m_h3_26 = ((int)0);
		m_h4_27 = ((int)0);
		m_h5_28 = ((int)0);
		m_h6_29 = ((int)0);
		m_h7_30 = ((int)0);
		m_h8_31 = ((int)0);
		m_h9_32 = ((int)0);
		m_h10_33 = ((int)0);
		m_h11_34 = ((int)0);
		m_h12_35 = ((int)0);
		m_h13_36 = ((int)0);
		m_h14_37 = ((int)0);
		m_h15_38 = ((int)0);
		m_h_lfo_ph_39 = ((int)0);
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
		t_sample sz = ((m_size_1 <= ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : ((m_size_1 >= ((t_sample)2.5)) ? ((t_sample)2.5) : m_size_1));
		t_sample v_56 = (m_damping_3 * ((t_sample)0.69999999999999996));
		t_sample d_alpha = ((v_56 <= ((int)0)) ? ((int)0) : ((v_56 >= ((t_sample)0.94999999999999996)) ? ((t_sample)0.94999999999999996) : v_56));
		t_sample t60_samps = (((m_decay_2 < ((t_sample)0.10000000000000001)) ? ((t_sample)0.10000000000000001) : m_decay_2) * samplerate);
		t_sample alpha_t60 = safediv(((t_sample)-6.9077552789821368), t60_samps);
		t_sample bal = (m_mix_6 * ((t_sample)0.01));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			m_h_lfo_ph_39 = wrap((m_h_lfo_ph_39 + safediv(m_mod_rate_5, samplerate)), ((int)0), ((int)1));
			t_sample lfo_sin = (sin((m_h_lfo_ph_39 * ((t_sample)6.2831853071795862))) * m_mod_amt_4);
			t_sample lfo_cos = (cos((m_h_lfo_ph_39 * ((t_sample)6.2831853071795862))) * m_mod_amt_4);
			t_sample v_40 = ((((int)509) * sz) + lfo_sin);
			t_sample len0 = ((v_40 <= ((int)10)) ? ((int)10) : ((v_40 >= ((int)15000)) ? ((int)15000) : v_40));
			t_sample v_41 = ((((int)631) * sz) - lfo_cos);
			t_sample len1 = ((v_41 <= ((int)10)) ? ((int)10) : ((v_41 >= ((int)15000)) ? ((int)15000) : v_41));
			t_sample v_42 = ((((int)769) * sz) + lfo_cos);
			t_sample len2 = ((v_42 <= ((int)10)) ? ((int)10) : ((v_42 >= ((int)15000)) ? ((int)15000) : v_42));
			t_sample v_43 = ((((int)919) * sz) - lfo_sin);
			t_sample len3 = ((v_43 <= ((int)10)) ? ((int)10) : ((v_43 >= ((int)15000)) ? ((int)15000) : v_43));
			t_sample v_44 = ((((int)1087) * sz) + (lfo_sin * ((t_sample)0.69999999999999996)));
			t_sample len4 = ((v_44 <= ((int)10)) ? ((int)10) : ((v_44 >= ((int)15000)) ? ((int)15000) : v_44));
			t_sample v_45 = ((((int)1277) * sz) - (lfo_cos * ((t_sample)0.69999999999999996)));
			t_sample len5 = ((v_45 <= ((int)10)) ? ((int)10) : ((v_45 >= ((int)15000)) ? ((int)15000) : v_45));
			t_sample v_46 = ((((int)1487) * sz) + (lfo_cos * ((t_sample)0.80000000000000004)));
			t_sample len6 = ((v_46 <= ((int)10)) ? ((int)10) : ((v_46 >= ((int)15000)) ? ((int)15000) : v_46));
			t_sample v_47 = ((((int)1709) * sz) - (lfo_sin * ((t_sample)0.80000000000000004)));
			t_sample len7 = ((v_47 <= ((int)10)) ? ((int)10) : ((v_47 >= ((int)15000)) ? ((int)15000) : v_47));
			t_sample v_48 = ((((int)1973) * sz) + (lfo_sin * ((t_sample)0.90000000000000002)));
			t_sample len8 = ((v_48 <= ((int)10)) ? ((int)10) : ((v_48 >= ((int)15000)) ? ((int)15000) : v_48));
			t_sample v_49 = ((((int)2251) * sz) - (lfo_cos * ((t_sample)0.90000000000000002)));
			t_sample len9 = ((v_49 <= ((int)10)) ? ((int)10) : ((v_49 >= ((int)15000)) ? ((int)15000) : v_49));
			t_sample v_50 = ((((int)2557) * sz) + lfo_cos);
			t_sample len10 = ((v_50 <= ((int)10)) ? ((int)10) : ((v_50 >= ((int)15000)) ? ((int)15000) : v_50));
			t_sample v_51 = ((((int)2879) * sz) - lfo_sin);
			t_sample len11 = ((v_51 <= ((int)10)) ? ((int)10) : ((v_51 >= ((int)15000)) ? ((int)15000) : v_51));
			t_sample v_52 = ((((int)3221) * sz) + (lfo_sin * ((t_sample)1.1000000000000001)));
			t_sample len12 = ((v_52 <= ((int)10)) ? ((int)10) : ((v_52 >= ((int)15000)) ? ((int)15000) : v_52));
			t_sample v_53 = ((((int)3593) * sz) - (lfo_cos * ((t_sample)1.1000000000000001)));
			t_sample len13 = ((v_53 <= ((int)10)) ? ((int)10) : ((v_53 >= ((int)15000)) ? ((int)15000) : v_53));
			t_sample v_54 = ((((int)3989) * sz) + (lfo_cos * ((t_sample)1.2)));
			t_sample len14 = ((v_54 <= ((int)10)) ? ((int)10) : ((v_54 >= ((int)15000)) ? ((int)15000) : v_54));
			t_sample v_55 = ((((int)4409) * sz) - (lfo_sin * ((t_sample)1.2)));
			t_sample len15 = ((v_55 <= ((int)10)) ? ((int)10) : ((v_55 >= ((int)15000)) ? ((int)15000) : v_55));
			t_sample t0 = m_d0_7.read_linear(len0);
			t_sample t1 = m_d1_8.read_linear(len1);
			t_sample t2 = m_d2_9.read_linear(len2);
			t_sample t3 = m_d3_10.read_linear(len3);
			t_sample t4 = m_d4_11.read_linear(len4);
			t_sample t5 = m_d5_12.read_linear(len5);
			t_sample t6 = m_d6_13.read_linear(len6);
			t_sample t7 = m_d7_14.read_linear(len7);
			t_sample t8 = m_d8_15.read_linear(len8);
			t_sample t9 = m_d9_16.read_linear(len9);
			t_sample t10 = m_d10_17.read_linear(len10);
			t_sample t11 = m_d11_18.read_linear(len11);
			t_sample t12 = m_d12_19.read_linear(len12);
			t_sample t13 = m_d13_20.read_linear(len13);
			t_sample t14 = m_d14_21.read_linear(len14);
			t_sample t15 = m_d15_22.read_linear(len15);
			t_sample tmp_t0_366 = ((t0 * (((int)1) - d_alpha)) + (m_h0_23 * d_alpha));
			m_h0_23 = tmp_t0_366;
			t_sample tmp_t1_367 = ((t1 * (((int)1) - d_alpha)) + (m_h1_24 * d_alpha));
			m_h1_24 = tmp_t1_367;
			t_sample tmp_t2_368 = ((t2 * (((int)1) - d_alpha)) + (m_h2_25 * d_alpha));
			m_h2_25 = tmp_t2_368;
			t_sample tmp_t3_369 = ((t3 * (((int)1) - d_alpha)) + (m_h3_26 * d_alpha));
			m_h3_26 = tmp_t3_369;
			t_sample tmp_t4_370 = ((t4 * (((int)1) - d_alpha)) + (m_h4_27 * d_alpha));
			m_h4_27 = tmp_t4_370;
			t_sample tmp_t5_371 = ((t5 * (((int)1) - d_alpha)) + (m_h5_28 * d_alpha));
			m_h5_28 = tmp_t5_371;
			t_sample tmp_t6_372 = ((t6 * (((int)1) - d_alpha)) + (m_h6_29 * d_alpha));
			m_h6_29 = tmp_t6_372;
			t_sample tmp_t7_373 = ((t7 * (((int)1) - d_alpha)) + (m_h7_30 * d_alpha));
			m_h7_30 = tmp_t7_373;
			t_sample tmp_t8_374 = ((t8 * (((int)1) - d_alpha)) + (m_h8_31 * d_alpha));
			m_h8_31 = tmp_t8_374;
			t_sample tmp_t9_375 = ((t9 * (((int)1) - d_alpha)) + (m_h9_32 * d_alpha));
			m_h9_32 = tmp_t9_375;
			t_sample tmp_t10_376 = ((t10 * (((int)1) - d_alpha)) + (m_h10_33 * d_alpha));
			m_h10_33 = tmp_t10_376;
			t_sample tmp_t11_377 = ((t11 * (((int)1) - d_alpha)) + (m_h11_34 * d_alpha));
			m_h11_34 = tmp_t11_377;
			t_sample tmp_t12_378 = ((t12 * (((int)1) - d_alpha)) + (m_h12_35 * d_alpha));
			m_h12_35 = tmp_t12_378;
			t_sample tmp_t13_379 = ((t13 * (((int)1) - d_alpha)) + (m_h13_36 * d_alpha));
			m_h13_36 = tmp_t13_379;
			t_sample tmp_t14_380 = ((t14 * (((int)1) - d_alpha)) + (m_h14_37 * d_alpha));
			m_h14_37 = tmp_t14_380;
			t_sample tmp_t15_381 = ((t15 * (((int)1) - d_alpha)) + (m_h15_38 * d_alpha));
			m_h15_38 = tmp_t15_381;
			t_sample g0 = exp((alpha_t60 * len0));
			t_sample g1 = exp((alpha_t60 * len1));
			t_sample g2 = exp((alpha_t60 * len2));
			t_sample g3 = exp((alpha_t60 * len3));
			t_sample g4 = exp((alpha_t60 * len4));
			t_sample g5 = exp((alpha_t60 * len5));
			t_sample g6 = exp((alpha_t60 * len6));
			t_sample g7 = exp((alpha_t60 * len7));
			t_sample g8 = exp((alpha_t60 * len8));
			t_sample g9 = exp((alpha_t60 * len9));
			t_sample g10 = exp((alpha_t60 * len10));
			t_sample g11 = exp((alpha_t60 * len11));
			t_sample g12 = exp((alpha_t60 * len12));
			t_sample g13 = exp((alpha_t60 * len13));
			t_sample g14 = exp((alpha_t60 * len14));
			t_sample g15 = exp((alpha_t60 * len15));
			t_sample sum16 = (((((((((((((((tmp_t0_366 + tmp_t1_367) + tmp_t2_368) + tmp_t3_369) + tmp_t4_370) + tmp_t5_371) + tmp_t6_372) + tmp_t7_373) + tmp_t8_374) + tmp_t9_375) + tmp_t10_376) + tmp_t11_377) + tmp_t12_378) + tmp_t13_379) + tmp_t14_380) + tmp_t15_381);
			t_sample scale_sum = (sum16 * ((t_sample)0.125));
			t_sample inL = (in1 * ((t_sample)0.25));
			t_sample inR = (in2 * ((t_sample)0.25));
			m_d0_7.write(tanh((((tmp_t0_366 - scale_sum) + inL) * g0)));
			m_d1_8.write(tanh((((tmp_t1_367 - scale_sum) + inR) * g1)));
			m_d2_9.write(tanh((((tmp_t2_368 - scale_sum) - inL) * g2)));
			m_d3_10.write(tanh((((tmp_t3_369 - scale_sum) - inR) * g3)));
			m_d4_11.write(tanh((((tmp_t4_370 - scale_sum) + inL) * g4)));
			m_d5_12.write(tanh((((tmp_t5_371 - scale_sum) + inR) * g5)));
			m_d6_13.write(tanh((((tmp_t6_372 - scale_sum) - inL) * g6)));
			m_d7_14.write(tanh((((tmp_t7_373 - scale_sum) - inR) * g7)));
			m_d8_15.write(tanh((((tmp_t8_374 - scale_sum) + inL) * g8)));
			m_d9_16.write(tanh((((tmp_t9_375 - scale_sum) + inR) * g9)));
			m_d10_17.write(tanh((((tmp_t10_376 - scale_sum) - inL) * g10)));
			m_d11_18.write(tanh((((tmp_t11_377 - scale_sum) - inR) * g11)));
			m_d12_19.write(tanh((((tmp_t12_378 - scale_sum) + inL) * g12)));
			m_d13_20.write(tanh((((tmp_t13_379 - scale_sum) + inR) * g13)));
			m_d14_21.write(tanh((((tmp_t14_380 - scale_sum) - inL) * g14)));
			m_d15_22.write(tanh((((tmp_t15_381 - scale_sum) - inR) * g15)));
			t_sample wetL = ((((((((tmp_t0_366 - tmp_t2_368) + tmp_t4_370) - tmp_t6_372) + tmp_t8_374) - tmp_t10_376) + tmp_t12_378) - tmp_t14_380) * ((t_sample)0.34999999999999998));
			t_sample wetR = ((((((((tmp_t1_367 - tmp_t3_369) + tmp_t5_371) - tmp_t7_373) + tmp_t9_375) - tmp_t11_377) + tmp_t13_379) - tmp_t15_381) * ((t_sample)0.34999999999999998));
			t_sample tmp_expr_397 = ((in1 * (((int)1) - bal)) + (wetL * bal));
			t_sample tmp_expr_398 = ((in2 * (((int)1) - bal)) + (wetR * bal));
			t_sample out1 = tmp_expr_397;
			t_sample out2 = tmp_expr_398;
			m_d0_7.step();
			m_d1_8.step();
			m_d2_9.step();
			m_d3_10.step();
			m_d4_11.step();
			m_d5_12.step();
			m_d6_13.step();
			m_d7_14.step();
			m_d8_15.step();
			m_d9_16.step();
			m_d10_17.step();
			m_d11_18.step();
			m_d12_19.step();
			m_d13_20.step();
			m_d14_21.step();
			m_d15_22.step();
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			
		};
		return __exception;
		
	};
	inline void set_size(t_param _value) {
		m_size_1 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 2 ? 2 : _value));
	};
	inline void set_decay(t_param _value) {
		m_decay_2 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 30 ? 30 : _value));
	};
	inline void set_damping(t_param _value) {
		m_damping_3 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_mod_amt(t_param _value) {
		m_mod_amt_4 = (_value < 0 ? 0 : (_value > 20 ? 20 : _value));
	};
	inline void set_mod_rate(t_param _value) {
		m_mod_rate_5 = (_value < 0.10000000000000001 ? 0.10000000000000001 : (_value > 5 ? 5 : _value));
	};
	inline void set_mix(t_param _value) {
		m_mix_6 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
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
int num_params() { return 6; }

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
		case 1: self->set_decay(value); break;
		case 2: self->set_mix(value); break;
		case 3: self->set_mod_amt(value); break;
		case 4: self->set_mod_rate(value); break;
		case 5: self->set_size(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_damping_3; break;
		case 1: *value = self->m_decay_2; break;
		case 2: *value = self->m_mix_6; break;
		case 3: *value = self->m_mod_amt_4; break;
		case 4: *value = self->m_mod_rate_5; break;
		case 5: *value = self->m_size_1; break;
		
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
	// initialize parameter 0 ("m_damping_3")
	pi = self->__commonstate.params + 0;
	pi->name = "damping";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_damping_3;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_decay_2")
	pi = self->__commonstate.params + 1;
	pi->name = "decay";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_decay_2;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 30;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_mix_6")
	pi = self->__commonstate.params + 2;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_mod_amt_4")
	pi = self->__commonstate.params + 3;
	pi->name = "mod_amt";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mod_amt_4;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 20;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_mod_rate_5")
	pi = self->__commonstate.params + 4;
	pi->name = "mod_rate";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mod_rate_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 5;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_size_1")
	pi = self->__commonstate.params + 5;
	pi->name = "size";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_size_1;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.10000000000000001;
	pi->outputmax = 2;
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


} // householder_fdn_16::
