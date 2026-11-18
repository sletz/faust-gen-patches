#include "multiband_drive.h"

namespace multiband_drive {

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
	t_sample m_h_hp1b_y2_L_53;
	t_sample m_h_lp1_x1_R_52;
	t_sample m_h_hp1b_y1_L_54;
	t_sample m_h_lp1_x2_R_51;
	t_sample m_h_hp1b_x2_L_55;
	t_sample m_h_hp1_y2_L_57;
	t_sample m_h_hp1b_x1_L_56;
	t_sample m_h_hp1_y1_L_58;
	t_sample m_h_hp1_x2_L_59;
	t_sample m_h_lp1_y1_R_50;
	t_sample m_h_lp1b_x1_R_48;
	t_sample m_h_hp1_x2_R_43;
	t_sample m_h_hp1_y1_R_42;
	t_sample m_h_lp1_y2_R_49;
	t_sample m_h_hp1_x1_R_44;
	t_sample m_h_lp1b_y1_R_46;
	t_sample m_h_lp1b_y2_R_45;
	t_sample m_h_lp1b_x2_R_47;
	t_sample m_h_hp1_x1_L_60;
	t_sample m_h_lp1b_y2_L_61;
	t_sample m_h_lp1b_y1_L_62;
	t_sample m_mid_drive_mix_75;
	t_sample m_mid_model_choice_74;
	t_sample m_high_band_gain_73;
	t_sample m_high_drive_mix_72;
	t_sample m_mid_band_gain_76;
	t_sample m_low_drive_mix_78;
	t_sample m_low_model_choice_77;
	t_sample m_low_band_gain_79;
	t_sample m_h_hp1_y2_R_41;
	t_sample m_high_model_choice_71;
	t_sample m_mix_69;
	t_sample m_h_lp1b_x1_L_64;
	t_sample m_h_lp1b_x2_L_63;
	t_sample m_gain_70;
	t_sample m_h_lp1_y2_L_65;
	t_sample m_h_lp1_x2_L_67;
	t_sample m_h_lp1_y1_L_66;
	t_sample m_h_lp1_x1_L_68;
	t_sample m_h_hp1b_x1_R_40;
	t_sample m_h_hp1b_x2_R_39;
	t_sample m_h_hp1b_y1_R_38;
	t_sample m_h_hp2_x1_R_12;
	t_sample m_h_hp2_x2_R_11;
	t_sample m_h_hp2_y1_R_10;
	t_sample m_h_hp2_y2_R_9;
	t_sample m_h_lp2b_y2_R_13;
	t_sample m_h_lp2b_x2_R_15;
	t_sample m_h_lp2b_y1_R_14;
	t_sample m_h_lp2b_x1_R_16;
	t_sample m_h_lp2_y2_R_17;
	t_sample m_h_hp2b_x1_R_8;
	t_sample m_h_hp2b_y1_R_6;
	t_sample m_h_dc_y_R_1;
	t_sample samplerate;
	t_sample m_h_hp2b_x2_R_7;
	t_sample m_h_dc_x_R_2;
	t_sample m_h_dc_x_L_4;
	t_sample m_h_dc_y_L_3;
	t_sample m_h_hp2b_y2_R_5;
	t_sample m_crossover2_80;
	t_sample m_h_lp2_y1_R_18;
	t_sample m_h_lp2_x1_R_20;
	t_sample m_h_lp2_y2_L_33;
	t_sample m_h_lp2b_x1_L_32;
	t_sample m_h_lp2b_x2_L_31;
	t_sample m_h_lp2b_y1_L_30;
	t_sample m_h_lp2_y1_L_34;
	t_sample m_h_lp2_x1_L_36;
	t_sample m_h_lp2_x2_L_35;
	t_sample m_h_hp1b_y2_R_37;
	t_sample m_h_lp2_x2_R_19;
	t_sample m_h_lp2b_y2_L_29;
	t_sample m_h_hp2_x2_L_27;
	t_sample m_h_hp2b_y1_L_22;
	t_sample m_h_hp2b_y2_L_21;
	t_sample m_h_hp2_x1_L_28;
	t_sample m_h_hp2b_x2_L_23;
	t_sample m_h_hp2_y2_L_25;
	t_sample m_h_hp2b_x1_L_24;
	t_sample m_h_hp2_y1_L_26;
	t_sample m_crossover1_81;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_dc_y_R_1 = ((int)0);
		m_h_dc_x_R_2 = ((int)0);
		m_h_dc_y_L_3 = ((int)0);
		m_h_dc_x_L_4 = ((int)0);
		m_h_hp2b_y2_R_5 = ((int)0);
		m_h_hp2b_y1_R_6 = ((int)0);
		m_h_hp2b_x2_R_7 = ((int)0);
		m_h_hp2b_x1_R_8 = ((int)0);
		m_h_hp2_y2_R_9 = ((int)0);
		m_h_hp2_y1_R_10 = ((int)0);
		m_h_hp2_x2_R_11 = ((int)0);
		m_h_hp2_x1_R_12 = ((int)0);
		m_h_lp2b_y2_R_13 = ((int)0);
		m_h_lp2b_y1_R_14 = ((int)0);
		m_h_lp2b_x2_R_15 = ((int)0);
		m_h_lp2b_x1_R_16 = ((int)0);
		m_h_lp2_y2_R_17 = ((int)0);
		m_h_lp2_y1_R_18 = ((int)0);
		m_h_lp2_x2_R_19 = ((int)0);
		m_h_lp2_x1_R_20 = ((int)0);
		m_h_hp2b_y2_L_21 = ((int)0);
		m_h_hp2b_y1_L_22 = ((int)0);
		m_h_hp2b_x2_L_23 = ((int)0);
		m_h_hp2b_x1_L_24 = ((int)0);
		m_h_hp2_y2_L_25 = ((int)0);
		m_h_hp2_y1_L_26 = ((int)0);
		m_h_hp2_x2_L_27 = ((int)0);
		m_h_hp2_x1_L_28 = ((int)0);
		m_h_lp2b_y2_L_29 = ((int)0);
		m_h_lp2b_y1_L_30 = ((int)0);
		m_h_lp2b_x2_L_31 = ((int)0);
		m_h_lp2b_x1_L_32 = ((int)0);
		m_h_lp2_y2_L_33 = ((int)0);
		m_h_lp2_y1_L_34 = ((int)0);
		m_h_lp2_x2_L_35 = ((int)0);
		m_h_lp2_x1_L_36 = ((int)0);
		m_h_hp1b_y2_R_37 = ((int)0);
		m_h_hp1b_y1_R_38 = ((int)0);
		m_h_hp1b_x2_R_39 = ((int)0);
		m_h_hp1b_x1_R_40 = ((int)0);
		m_h_hp1_y2_R_41 = ((int)0);
		m_h_hp1_y1_R_42 = ((int)0);
		m_h_hp1_x2_R_43 = ((int)0);
		m_h_hp1_x1_R_44 = ((int)0);
		m_h_lp1b_y2_R_45 = ((int)0);
		m_h_lp1b_y1_R_46 = ((int)0);
		m_h_lp1b_x2_R_47 = ((int)0);
		m_h_lp1b_x1_R_48 = ((int)0);
		m_h_lp1_y2_R_49 = ((int)0);
		m_h_lp1_y1_R_50 = ((int)0);
		m_h_lp1_x2_R_51 = ((int)0);
		m_h_lp1_x1_R_52 = ((int)0);
		m_h_hp1b_y2_L_53 = ((int)0);
		m_h_hp1b_y1_L_54 = ((int)0);
		m_h_hp1b_x2_L_55 = ((int)0);
		m_h_hp1b_x1_L_56 = ((int)0);
		m_h_hp1_y2_L_57 = ((int)0);
		m_h_hp1_y1_L_58 = ((int)0);
		m_h_hp1_x2_L_59 = ((int)0);
		m_h_hp1_x1_L_60 = ((int)0);
		m_h_lp1b_y2_L_61 = ((int)0);
		m_h_lp1b_y1_L_62 = ((int)0);
		m_h_lp1b_x2_L_63 = ((int)0);
		m_h_lp1b_x1_L_64 = ((int)0);
		m_h_lp1_y2_L_65 = ((int)0);
		m_h_lp1_y1_L_66 = ((int)0);
		m_h_lp1_x2_L_67 = ((int)0);
		m_h_lp1_x1_L_68 = ((int)0);
		m_mix_69 = ((int)100);
		m_gain_70 = ((int)0);
		m_high_model_choice_71 = ((int)0);
		m_high_drive_mix_72 = ((int)50);
		m_high_band_gain_73 = ((int)0);
		m_mid_model_choice_74 = ((t_sample)33.299999999999997);
		m_mid_drive_mix_75 = ((int)50);
		m_mid_band_gain_76 = ((int)0);
		m_low_model_choice_77 = ((int)0);
		m_low_drive_mix_78 = ((int)50);
		m_low_band_gain_79 = ((int)0);
		m_crossover2_80 = ((int)3500);
		m_crossover1_81 = ((int)250);
		genlib_reset_complete(this);
		
	};
	// the signal processing routine;
	inline int perform(t_sample ** __ins, t_sample ** __outs, int __n) {
		vectorsize = __n;
		const t_sample * __in1 = __ins[0];
		const t_sample * __in2 = __ins[1];
		t_sample * __out1 = __outs[0];
		t_sample * __out2 = __outs[1];
		t_sample * __out3 = __outs[2];
		t_sample * __out4 = __outs[3];
		t_sample * __out5 = __outs[4];
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__out1 == 0) || (__out2 == 0) || (__out3 == 0) || (__out4 == 0) || (__out5 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		t_sample minb_82 = (m_crossover2_80 - ((int)40));
		t_sample v_83 = ((minb_82 < m_crossover1_81) ? minb_82 : m_crossover1_81);
		t_sample max_84 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f1 = ((v_83 <= ((int)20)) ? ((int)20) : ((v_83 >= max_84) ? max_84 : v_83));
		t_sample maxb_85 = (m_crossover1_81 + ((int)40));
		t_sample v_86 = ((m_crossover2_80 < maxb_85) ? maxb_85 : m_crossover2_80);
		t_sample max_87 = (samplerate * ((t_sample)0.45000000000000001));
		t_sample f2 = ((v_86 <= ((int)40)) ? ((int)40) : ((v_86 >= max_87) ? max_87 : v_86));
		t_sample w1 = safediv((((t_sample)6.2831853071795862) * f1), samplerate);
		t_sample cos_w1 = cos(w1);
		t_sample sin_w1 = sin(w1);
		t_sample alpha1 = (sin_w1 * ((t_sample)0.70710678118000003));
		t_sample a0_1 = (((int)1) + alpha1);
		t_sample b0_lp1 = safediv(((((int)1) - cos_w1) * ((t_sample)0.5)), a0_1);
		t_sample b1_lp1 = safediv((((int)1) - cos_w1), a0_1);
		t_sample b2_lp1 = b0_lp1;
		t_sample a1_1 = safediv((((int)-2) * cos_w1), a0_1);
		t_sample a2_1 = safediv((((int)1) - alpha1), a0_1);
		t_sample b0_hp1 = safediv(((((int)1) + cos_w1) * ((t_sample)0.5)), a0_1);
		t_sample b1_hp1 = safediv((-(((int)1) + cos_w1)), a0_1);
		t_sample b2_hp1 = b0_hp1;
		t_sample w2 = safediv((((t_sample)6.2831853071795862) * f2), samplerate);
		t_sample cos_w2 = cos(w2);
		t_sample sin_w2 = sin(w2);
		t_sample alpha2 = (sin_w2 * ((t_sample)0.70710678118000003));
		t_sample a0_2 = (((int)1) + alpha2);
		t_sample b0_lp2 = safediv(((((int)1) - cos_w2) * ((t_sample)0.5)), a0_2);
		t_sample b1_lp2 = safediv((((int)1) - cos_w2), a0_2);
		t_sample b2_lp2 = b0_lp2;
		t_sample a1_2 = safediv((((int)-2) * cos_w2), a0_2);
		t_sample a2_2 = safediv((((int)1) - alpha2), a0_2);
		t_sample b0_hp2 = safediv(((((int)1) + cos_w2) * ((t_sample)0.5)), a0_2);
		t_sample b1_hp2 = safediv((-(((int)1) + cos_w2)), a0_2);
		t_sample b2_hp2 = b0_hp2;
		t_sample v_88 = (m_low_model_choice_77 * ((t_sample)0.029999999999999999));
		t_sample m_pos_low = ((v_88 <= ((int)0)) ? ((int)0) : ((v_88 >= ((int)3)) ? ((int)3) : v_88));
		int cond_97 = (m_low_band_gain_79 <= ((int)-40));
		t_sample iffalse_98 = dbtoa(m_low_band_gain_79);
		t_sample gain_low = (cond_97 ? ((int)0) : iffalse_98);
		t_sample tmp_mul_724 = (m_low_drive_mix_78 * ((t_sample)0.01));
		t_sample tmp_mul_726 = (m_low_drive_mix_78 * ((t_sample)0.01));
		t_sample v_99 = (m_mid_model_choice_74 * ((t_sample)0.029999999999999999));
		t_sample m_pos_mid = ((v_99 <= ((int)0)) ? ((int)0) : ((v_99 >= ((int)3)) ? ((int)3) : v_99));
		int cond_100 = (m_mid_band_gain_76 <= ((int)-40));
		t_sample iffalse_101 = dbtoa(m_mid_band_gain_76);
		t_sample gain_mid = (cond_100 ? ((int)0) : iffalse_101);
		t_sample tmp_mul_728 = (m_mid_drive_mix_75 * ((t_sample)0.01));
		t_sample tmp_mul_730 = (m_mid_drive_mix_75 * ((t_sample)0.01));
		t_sample v_102 = (m_high_model_choice_71 * ((t_sample)0.029999999999999999));
		t_sample m_pos_high = ((v_102 <= ((int)0)) ? ((int)0) : ((v_102 >= ((int)3)) ? ((int)3) : v_102));
		int cond_103 = (m_high_band_gain_73 <= ((int)-40));
		t_sample iffalse_104 = dbtoa(m_high_band_gain_73);
		t_sample gain_high = (cond_103 ? ((int)0) : iffalse_104);
		t_sample tmp_mul_732 = (m_high_drive_mix_72 * ((t_sample)0.01));
		t_sample tmp_mul_734 = (m_high_drive_mix_72 * ((t_sample)0.01));
		t_sample make_up = dbtoa(m_gain_70);
		t_sample v_105 = (m_mix_69 * ((t_sample)0.01));
		t_sample eff_mix = ((v_105 <= ((int)0)) ? ((int)0) : ((v_105 >= ((int)1)) ? ((int)1) : v_105));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample y_lp1_1_L = (((((b0_lp1 * in1) + (b1_lp1 * m_h_lp1_x1_L_68)) + (b2_lp1 * m_h_lp1_x2_L_67)) - (a1_1 * m_h_lp1_y1_L_66)) - (a2_1 * m_h_lp1_y2_L_65));
			m_h_lp1_x2_L_67 = m_h_lp1_x1_L_68;
			m_h_lp1_x1_L_68 = in1;
			m_h_lp1_y2_L_65 = m_h_lp1_y1_L_66;
			m_h_lp1_y1_L_66 = y_lp1_1_L;
			t_sample low_L = (((((b0_lp1 * y_lp1_1_L) + (b1_lp1 * m_h_lp1b_x1_L_64)) + (b2_lp1 * m_h_lp1b_x2_L_63)) - (a1_1 * m_h_lp1b_y1_L_62)) - (a2_1 * m_h_lp1b_y2_L_61));
			m_h_lp1b_x2_L_63 = m_h_lp1b_x1_L_64;
			m_h_lp1b_x1_L_64 = y_lp1_1_L;
			m_h_lp1b_y2_L_61 = m_h_lp1b_y1_L_62;
			m_h_lp1b_y1_L_62 = low_L;
			t_sample y_hp1_1_L = (((((b0_hp1 * in1) + (b1_hp1 * m_h_hp1_x1_L_60)) + (b2_hp1 * m_h_hp1_x2_L_59)) - (a1_1 * m_h_hp1_y1_L_58)) - (a2_1 * m_h_hp1_y2_L_57));
			m_h_hp1_x2_L_59 = m_h_hp1_x1_L_60;
			m_h_hp1_x1_L_60 = in1;
			m_h_hp1_y2_L_57 = m_h_hp1_y1_L_58;
			m_h_hp1_y1_L_58 = y_hp1_1_L;
			t_sample rest_L = (((((b0_hp1 * y_hp1_1_L) + (b1_hp1 * m_h_hp1b_x1_L_56)) + (b2_hp1 * m_h_hp1b_x2_L_55)) - (a1_1 * m_h_hp1b_y1_L_54)) - (a2_1 * m_h_hp1b_y2_L_53));
			m_h_hp1b_x2_L_55 = m_h_hp1b_x1_L_56;
			m_h_hp1b_x1_L_56 = y_hp1_1_L;
			m_h_hp1b_y2_L_53 = m_h_hp1b_y1_L_54;
			m_h_hp1b_y1_L_54 = rest_L;
			t_sample y_lp2_1_L = (((((b0_lp2 * rest_L) + (b1_lp2 * m_h_lp2_x1_L_36)) + (b2_lp2 * m_h_lp2_x2_L_35)) - (a1_2 * m_h_lp2_y1_L_34)) - (a2_2 * m_h_lp2_y2_L_33));
			m_h_lp2_x2_L_35 = m_h_lp2_x1_L_36;
			m_h_lp2_x1_L_36 = rest_L;
			m_h_lp2_y2_L_33 = m_h_lp2_y1_L_34;
			m_h_lp2_y1_L_34 = y_lp2_1_L;
			t_sample mid_L = (((((b0_lp2 * y_lp2_1_L) + (b1_lp2 * m_h_lp2b_x1_L_32)) + (b2_lp2 * m_h_lp2b_x2_L_31)) - (a1_2 * m_h_lp2b_y1_L_30)) - (a2_2 * m_h_lp2b_y2_L_29));
			m_h_lp2b_x2_L_31 = m_h_lp2b_x1_L_32;
			m_h_lp2b_x1_L_32 = y_lp2_1_L;
			m_h_lp2b_y2_L_29 = m_h_lp2b_y1_L_30;
			m_h_lp2b_y1_L_30 = mid_L;
			t_sample y_hp2_1_L = (((((b0_hp2 * rest_L) + (b1_hp2 * m_h_hp2_x1_L_28)) + (b2_hp2 * m_h_hp2_x2_L_27)) - (a1_2 * m_h_hp2_y1_L_26)) - (a2_2 * m_h_hp2_y2_L_25));
			m_h_hp2_x2_L_27 = m_h_hp2_x1_L_28;
			m_h_hp2_x1_L_28 = rest_L;
			m_h_hp2_y2_L_25 = m_h_hp2_y1_L_26;
			m_h_hp2_y1_L_26 = y_hp2_1_L;
			t_sample high_L = (((((b0_hp2 * y_hp2_1_L) + (b1_hp2 * m_h_hp2b_x1_L_24)) + (b2_hp2 * m_h_hp2b_x2_L_23)) - (a1_2 * m_h_hp2b_y1_L_22)) - (a2_2 * m_h_hp2b_y2_L_21));
			m_h_hp2b_x2_L_23 = m_h_hp2b_x1_L_24;
			m_h_hp2b_x1_L_24 = y_hp2_1_L;
			m_h_hp2b_y2_L_21 = m_h_hp2b_y1_L_22;
			m_h_hp2b_y1_L_22 = high_L;
			t_sample y_lp1_1_R = (((((b0_lp1 * in2) + (b1_lp1 * m_h_lp1_x1_R_52)) + (b2_lp1 * m_h_lp1_x2_R_51)) - (a1_1 * m_h_lp1_y1_R_50)) - (a2_1 * m_h_lp1_y2_R_49));
			m_h_lp1_x2_R_51 = m_h_lp1_x1_R_52;
			m_h_lp1_x1_R_52 = in2;
			m_h_lp1_y2_R_49 = m_h_lp1_y1_R_50;
			m_h_lp1_y1_R_50 = y_lp1_1_R;
			t_sample low_R = (((((b0_lp1 * y_lp1_1_R) + (b1_lp1 * m_h_lp1b_x1_R_48)) + (b2_lp1 * m_h_lp1b_x2_R_47)) - (a1_1 * m_h_lp1b_y1_R_46)) - (a2_1 * m_h_lp1b_y2_R_45));
			m_h_lp1b_x2_R_47 = m_h_lp1b_x1_R_48;
			m_h_lp1b_x1_R_48 = y_lp1_1_R;
			m_h_lp1b_y2_R_45 = m_h_lp1b_y1_R_46;
			m_h_lp1b_y1_R_46 = low_R;
			t_sample y_hp1_1_R = (((((b0_hp1 * in2) + (b1_hp1 * m_h_hp1_x1_R_44)) + (b2_hp1 * m_h_hp1_x2_R_43)) - (a1_1 * m_h_hp1_y1_R_42)) - (a2_1 * m_h_hp1_y2_R_41));
			m_h_hp1_x2_R_43 = m_h_hp1_x1_R_44;
			m_h_hp1_x1_R_44 = in2;
			m_h_hp1_y2_R_41 = m_h_hp1_y1_R_42;
			m_h_hp1_y1_R_42 = y_hp1_1_R;
			t_sample rest_R = (((((b0_hp1 * y_hp1_1_R) + (b1_hp1 * m_h_hp1b_x1_R_40)) + (b2_hp1 * m_h_hp1b_x2_R_39)) - (a1_1 * m_h_hp1b_y1_R_38)) - (a2_1 * m_h_hp1b_y2_R_37));
			m_h_hp1b_x2_R_39 = m_h_hp1b_x1_R_40;
			m_h_hp1b_x1_R_40 = y_hp1_1_R;
			m_h_hp1b_y2_R_37 = m_h_hp1b_y1_R_38;
			m_h_hp1b_y1_R_38 = rest_R;
			t_sample y_lp2_1_R = (((((b0_lp2 * rest_R) + (b1_lp2 * m_h_lp2_x1_R_20)) + (b2_lp2 * m_h_lp2_x2_R_19)) - (a1_2 * m_h_lp2_y1_R_18)) - (a2_2 * m_h_lp2_y2_R_17));
			m_h_lp2_x2_R_19 = m_h_lp2_x1_R_20;
			m_h_lp2_x1_R_20 = rest_R;
			m_h_lp2_y2_R_17 = m_h_lp2_y1_R_18;
			m_h_lp2_y1_R_18 = y_lp2_1_R;
			t_sample mid_R = (((((b0_lp2 * y_lp2_1_R) + (b1_lp2 * m_h_lp2b_x1_R_16)) + (b2_lp2 * m_h_lp2b_x2_R_15)) - (a1_2 * m_h_lp2b_y1_R_14)) - (a2_2 * m_h_lp2b_y2_R_13));
			m_h_lp2b_x2_R_15 = m_h_lp2b_x1_R_16;
			m_h_lp2b_x1_R_16 = y_lp2_1_R;
			m_h_lp2b_y2_R_13 = m_h_lp2b_y1_R_14;
			m_h_lp2b_y1_R_14 = mid_R;
			t_sample y_hp2_1_R = (((((b0_hp2 * rest_R) + (b1_hp2 * m_h_hp2_x1_R_12)) + (b2_hp2 * m_h_hp2_x2_R_11)) - (a1_2 * m_h_hp2_y1_R_10)) - (a2_2 * m_h_hp2_y2_R_9));
			m_h_hp2_x2_R_11 = m_h_hp2_x1_R_12;
			m_h_hp2_x1_R_12 = rest_R;
			m_h_hp2_y2_R_9 = m_h_hp2_y1_R_10;
			m_h_hp2_y1_R_10 = y_hp2_1_R;
			t_sample high_R = (((((b0_hp2 * y_hp2_1_R) + (b1_hp2 * m_h_hp2b_x1_R_8)) + (b2_hp2 * m_h_hp2b_x2_R_7)) - (a1_2 * m_h_hp2b_y1_R_6)) - (a2_2 * m_h_hp2b_y2_R_5));
			m_h_hp2b_x2_R_7 = m_h_hp2b_x1_R_8;
			m_h_hp2b_x1_R_8 = y_hp2_1_R;
			m_h_hp2b_y2_R_5 = m_h_hp2b_y1_R_6;
			m_h_hp2b_y1_R_6 = high_R;
			t_sample d_low_L = distort_sample_d_d_d(low_L, (m_low_drive_mix_78 * ((t_sample)0.01)), m_pos_low);
			t_sample d_low_R = distort_sample_d_d_d(low_R, (m_low_drive_mix_78 * ((t_sample)0.01)), m_pos_low);
			t_sample tmp_mix_723 = (low_L + (tmp_mul_724 * (d_low_L - low_L)));
			t_sample proc_low_L = (tmp_mix_723 * gain_low);
			t_sample tmp_mix_725 = (low_R + (tmp_mul_726 * (d_low_R - low_R)));
			t_sample proc_low_R = (tmp_mix_725 * gain_low);
			t_sample d_mid_L = distort_sample_d_d_d(mid_L, (m_mid_drive_mix_75 * ((t_sample)0.01)), m_pos_mid);
			t_sample d_mid_R = distort_sample_d_d_d(mid_R, (m_mid_drive_mix_75 * ((t_sample)0.01)), m_pos_mid);
			t_sample tmp_mix_727 = (mid_L + (tmp_mul_728 * (d_mid_L - mid_L)));
			t_sample proc_mid_L = (tmp_mix_727 * gain_mid);
			t_sample tmp_mix_729 = (mid_R + (tmp_mul_730 * (d_mid_R - mid_R)));
			t_sample proc_mid_R = (tmp_mix_729 * gain_mid);
			t_sample d_high_L = distort_sample_d_d_d(high_L, (m_high_drive_mix_72 * ((t_sample)0.01)), m_pos_high);
			t_sample d_high_R = distort_sample_d_d_d(high_R, (m_high_drive_mix_72 * ((t_sample)0.01)), m_pos_high);
			t_sample tmp_mix_731 = (high_L + (tmp_mul_732 * (d_high_L - high_L)));
			t_sample proc_high_L = (tmp_mix_731 * gain_high);
			t_sample tmp_mix_733 = (high_R + (tmp_mul_734 * (d_high_R - high_R)));
			t_sample proc_high_R = (tmp_mix_733 * gain_high);
			t_sample sum_raw_L = ((proc_low_L + proc_mid_L) + proc_high_L);
			t_sample sum_raw_R = ((proc_low_R + proc_mid_R) + proc_high_R);
			t_sample dc_L = ((sum_raw_L - m_h_dc_x_L_4) + (((t_sample)0.995) * m_h_dc_y_L_3));
			m_h_dc_x_L_4 = sum_raw_L;
			m_h_dc_y_L_3 = dc_L;
			t_sample dc_R = ((sum_raw_R - m_h_dc_x_R_2) + (((t_sample)0.995) * m_h_dc_y_R_1));
			m_h_dc_x_R_2 = sum_raw_R;
			m_h_dc_y_R_1 = dc_R;
			t_sample lim_L = (tanh((dc_L * ((t_sample)1.05))) * make_up);
			t_sample lim_R = (tanh((dc_R * ((t_sample)1.05))) * make_up);
			t_sample tmp_mix_735 = (in1 + (eff_mix * (lim_L - in1)));
			t_sample tmp_expr_420 = tmp_mix_735;
			t_sample tmp_mix_736 = (in2 + (eff_mix * (lim_R - in2)));
			t_sample tmp_expr_421 = tmp_mix_736;
			t_sample tmp_expr_422 = ((proc_low_L + proc_low_R) * ((t_sample)0.5));
			t_sample tmp_expr_423 = ((proc_mid_L + proc_mid_R) * ((t_sample)0.5));
			t_sample tmp_expr_424 = ((proc_high_L + proc_high_R) * ((t_sample)0.5));
			t_sample out1 = tmp_expr_420;
			t_sample out2 = tmp_expr_421;
			t_sample out3 = tmp_expr_422;
			t_sample out4 = tmp_expr_423;
			t_sample out5 = tmp_expr_424;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			(*(__out4++)) = out4;
			(*(__out5++)) = out5;
			
		};
		return __exception;
		
	};
	inline void set_mix(t_param _value) {
		m_mix_69 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_gain(t_param _value) {
		m_gain_70 = (_value < -24 ? -24 : (_value > 12 ? 12 : _value));
	};
	inline void set_high_model_choice(t_param _value) {
		m_high_model_choice_71 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_high_drive_mix(t_param _value) {
		m_high_drive_mix_72 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_high_band_gain(t_param _value) {
		m_high_band_gain_73 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_mid_model_choice(t_param _value) {
		m_mid_model_choice_74 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_mid_drive_mix(t_param _value) {
		m_mid_drive_mix_75 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_mid_band_gain(t_param _value) {
		m_mid_band_gain_76 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_low_model_choice(t_param _value) {
		m_low_model_choice_77 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_low_drive_mix(t_param _value) {
		m_low_drive_mix_78 = (_value < 0 ? 0 : (_value > 100 ? 100 : _value));
	};
	inline void set_low_band_gain(t_param _value) {
		m_low_band_gain_79 = (_value < -48 ? -48 : (_value > 12 ? 12 : _value));
	};
	inline void set_crossover2(t_param _value) {
		m_crossover2_80 = (_value < 200 ? 200 : (_value > 18000 ? 18000 : _value));
	};
	inline void set_crossover1(t_param _value) {
		m_crossover1_81 = (_value < 20 ? 20 : (_value > 2000 ? 2000 : _value));
	};
	inline t_sample distort_sample_d_d_d(t_sample x_in, t_sample d_norm, t_sample m_pos) {
		t_sample scale_d1 = (((int)8) + ((((int)35) - ((int)8)) * safepow(d_norm, ((t_sample)0.29999999999999999))));
		t_sample m1 = (tanh(((x_in * ((int)2)) * scale_d1)) * ((t_sample)0.35999999999999999));
		t_sample lo_f = ((-((t_sample)0.69999999999999996)) + (((-((t_sample)0.29999999999999999)) - (-((t_sample)0.69999999999999996))) * safepow(d_norm, ((t_sample)0.80000000000000004))));
		t_sample hi_f = (((t_sample)0.69999999999999996) + ((((t_sample)0.29999999999999999) - ((t_sample)0.69999999999999996)) * safepow(d_norm, ((t_sample)0.80000000000000004))));
		t_sample scale_f = (((int)1) + ((((int)6) - ((int)1)) * safepow(d_norm, ((t_sample)0.29999999999999999))));
		t_sample x_f = ((x_in * ((int)2)) * scale_f);
		t_sample maxb_89 = (hi_f - lo_f);
		t_sample span = ((((t_sample)0.001) < maxb_89) ? maxb_89 : ((t_sample)0.001));
		t_sample fold_raw = (lo_f + fabs((wrap(((x_f - lo_f) - span), ((int)0), (((int)2) * span)) - span)));
		int min_90 = (-((int)1));
		t_sample clamp_f = ((fold_raw <= min_90) ? min_90 : ((fold_raw >= ((int)1)) ? ((int)1) : fold_raw));
		t_sample fold_comp = (safediv(((t_sample)0.69999999999999996), ((((t_sample)0.10000000000000001) < hi_f) ? hi_f : ((t_sample)0.10000000000000001))) * ((t_sample)1.8999999999999999));
		t_sample m2 = ((clamp_f * ((t_sample)0.45000000000000001)) * fold_comp);
		t_sample scale_q = (((int)5) + ((((t_sample)1.05) - ((int)5)) * safepow(d_norm, ((t_sample)0.29999999999999999))));
		t_sample x_q = ((x_in * ((t_sample)0.59999999999999998)) * scale_q);
		t_sample q_sum = safediv(((ceil(x_q) + floor((x_q + ((t_sample)0.5)))) - ((t_sample)0.5)), scale_q);
		t_sample m3 = ((q_sum * ((t_sample)0.25)) * ((t_sample)2.2999999999999998));
		t_sample scale_w = (((int)1) + ((((int)6) - ((int)1)) * safepow(d_norm, ((t_sample)0.29999999999999999))));
		t_sample wrap_raw = wrap(((x_in * ((int)12)) * scale_w), (-((t_sample)0.5)), ((t_sample)0.5));
		t_sample m4 = ((wrap_raw * ((t_sample)0.80000000000000004)) * ((t_sample)0.94999999999999996));
		t_sample idx = floor(m_pos);
		t_sample fr = (m_pos - idx);
		t_sample w0 = cos((fr * ((t_sample)1.5707963267948966)));
		t_sample w1 = sin((fr * ((t_sample)1.5707963267948966)));
		int cond_91 = (idx < ((int)1));
		t_sample iftrue_92 = ((m1 * w0) + (m2 * w1));
		int cond_93 = (idx < ((int)2));
		t_sample iftrue_94 = ((m2 * w0) + (m3 * w1));
		t_sample iffalse_95 = ((m3 * w0) + (m4 * w1));
		t_sample iffalse_96 = (cond_93 ? iftrue_94 : iffalse_95);
		t_sample out_s = (cond_91 ? iftrue_92 : iffalse_96);
		return out_s;
		
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 2;
int gen_kernel_numouts = 5;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 13; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio Left In", "Audio Right In" };
const char *gen_kernel_outnames[] = { "Processed Left Out", "Processed Right Out", "Low Monitor", "Mid Monitor", "High Monitor" };

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
		case 0: self->set_crossover1(value); break;
		case 1: self->set_crossover2(value); break;
		case 2: self->set_gain(value); break;
		case 3: self->set_high_band_gain(value); break;
		case 4: self->set_high_drive_mix(value); break;
		case 5: self->set_high_model_choice(value); break;
		case 6: self->set_low_band_gain(value); break;
		case 7: self->set_low_drive_mix(value); break;
		case 8: self->set_low_model_choice(value); break;
		case 9: self->set_mid_band_gain(value); break;
		case 10: self->set_mid_drive_mix(value); break;
		case 11: self->set_mid_model_choice(value); break;
		case 12: self->set_mix(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_crossover1_81; break;
		case 1: *value = self->m_crossover2_80; break;
		case 2: *value = self->m_gain_70; break;
		case 3: *value = self->m_high_band_gain_73; break;
		case 4: *value = self->m_high_drive_mix_72; break;
		case 5: *value = self->m_high_model_choice_71; break;
		case 6: *value = self->m_low_band_gain_79; break;
		case 7: *value = self->m_low_drive_mix_78; break;
		case 8: *value = self->m_low_model_choice_77; break;
		case 9: *value = self->m_mid_band_gain_76; break;
		case 10: *value = self->m_mid_drive_mix_75; break;
		case 11: *value = self->m_mid_model_choice_74; break;
		case 12: *value = self->m_mix_69; break;
		
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
	// initialize parameter 0 ("m_crossover1_81")
	pi = self->__commonstate.params + 0;
	pi->name = "crossover1";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_crossover1_81;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 20;
	pi->outputmax = 2000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_crossover2_80")
	pi = self->__commonstate.params + 1;
	pi->name = "crossover2";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_crossover2_80;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 200;
	pi->outputmax = 18000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_gain_70")
	pi = self->__commonstate.params + 2;
	pi->name = "gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_gain_70;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -24;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_high_band_gain_73")
	pi = self->__commonstate.params + 3;
	pi->name = "high_band_gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_high_band_gain_73;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_high_drive_mix_72")
	pi = self->__commonstate.params + 4;
	pi->name = "high_drive_mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_high_drive_mix_72;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 5 ("m_high_model_choice_71")
	pi = self->__commonstate.params + 5;
	pi->name = "high_model_choice";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_high_model_choice_71;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 6 ("m_low_band_gain_79")
	pi = self->__commonstate.params + 6;
	pi->name = "low_band_gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_low_band_gain_79;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 7 ("m_low_drive_mix_78")
	pi = self->__commonstate.params + 7;
	pi->name = "low_drive_mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_low_drive_mix_78;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 8 ("m_low_model_choice_77")
	pi = self->__commonstate.params + 8;
	pi->name = "low_model_choice";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_low_model_choice_77;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 9 ("m_mid_band_gain_76")
	pi = self->__commonstate.params + 9;
	pi->name = "mid_band_gain";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mid_band_gain_76;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = -48;
	pi->outputmax = 12;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 10 ("m_mid_drive_mix_75")
	pi = self->__commonstate.params + 10;
	pi->name = "mid_drive_mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mid_drive_mix_75;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 11 ("m_mid_model_choice_74")
	pi = self->__commonstate.params + 11;
	pi->name = "mid_model_choice";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mid_model_choice_74;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 100;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 12 ("m_mix_69")
	pi = self->__commonstate.params + 12;
	pi->name = "mix";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_mix_69;
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


} // multiband_drive::
