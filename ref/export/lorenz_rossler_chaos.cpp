#include "lorenz_rossler_chaos.h"

namespace lorenz_rossler_chaos {

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
	t_sample m_param_rho_6;
	t_sample m_drive_7;
	t_sample m_inject_5;
	t_sample m_x_4;
	t_sample m_y_3;
	t_sample m_z_2;
	t_sample m_speed_8;
	t_sample samplerate;
	t_sample m_h_last_x_1;
	t_sample m_system_9;
	// re-initialize all member variables;
	inline void reset(t_param __sr, int __vs) {
		__exception = 0;
		vectorsize = __vs;
		samplerate = __sr;
		m_h_last_x_1 = ((int)0);
		m_z_2 = ((t_sample)0.20000000000000001);
		m_y_3 = ((int)0);
		m_x_4 = ((int)4);
		m_inject_5 = ((int)0);
		m_param_rho_6 = ((int)30);
		m_drive_7 = ((int)1);
		m_speed_8 = ((int)2);
		m_system_9 = ((int)1);
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
		if (__exception) {
			return __exception;
			
		} else if (( (__in1 == 0) || (__in2 == 0) || (__out1 == 0) || (__out2 == 0) || (__out3 == 0) || (__out4 == 0) )) {
			__exception = GENLIB_ERR_NULL_BUFFER;
			return __exception;
			
		};
		t_sample sig_param = (((int)10) * ((m_drive_7 < ((t_sample)0.050000000000000003)) ? ((t_sample)0.050000000000000003) : m_drive_7));
		t_sample rho_param = m_param_rho_6;
		t_sample tmp_sub1_742 = (m_param_rho_6 - ((int)10));
		t_sample tmp_scale_739 = ((safepow((tmp_sub1_742 * ((t_sample)0.02)), ((int)1)) * ((int)5)) + ((int)4));
		t_sample c_param = tmp_scale_739;
		int cond_12 = (m_system_9 < ((t_sample)0.5));
		int cond_16 = (m_system_9 < ((t_sample)0.5));
		int cond_20 = (m_system_9 < ((t_sample)0.5));
		// the main sample loop;
		while ((__n--)) {
			const t_sample in1 = (*(__in1++));
			const t_sample in2 = (*(__in2++));
			t_sample v_10 = (m_speed_8 + (in2 * ((int)200)));
			t_sample eff_speed = ((v_10 <= ((t_sample)0.01)) ? ((t_sample)0.01) : ((v_10 >= ((int)1000)) ? ((int)1000) : v_10));
			t_sample mina_11 = (safediv(eff_speed, samplerate) * ((t_sample)1.2));
			t_sample dt = ((((t_sample)0.024) < mina_11) ? ((t_sample)0.024) : mina_11);
			t_sample x_in = (m_x_4 + ((in1 * m_inject_5) * ((t_sample)0.20000000000000001)));
			if ((m_system_9 < ((t_sample)0.5))) {
				t_sample k1x = lorenz_dx_d_d_d_d(x_in, m_y_3, m_z_2, sig_param);
				t_sample k1y = lorenz_dy_d_d_d_d(x_in, m_y_3, m_z_2, rho_param);
				t_sample k1z = lorenz_dz_d_d_d_d(x_in, m_y_3, m_z_2, ((t_sample)2.6666666666666665));
				t_sample k2x = lorenz_dx_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k1x)), (m_y_3 + ((((t_sample)0.5) * dt) * k1y)), (m_z_2 + ((((t_sample)0.5) * dt) * k1z)), sig_param);
				t_sample k2y = lorenz_dy_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k1x)), (m_y_3 + ((((t_sample)0.5) * dt) * k1y)), (m_z_2 + ((((t_sample)0.5) * dt) * k1z)), rho_param);
				t_sample k2z = lorenz_dz_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k1x)), (m_y_3 + ((((t_sample)0.5) * dt) * k1y)), (m_z_2 + ((((t_sample)0.5) * dt) * k1z)), ((t_sample)2.6666666666666665));
				t_sample k3x = lorenz_dx_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k2x)), (m_y_3 + ((((t_sample)0.5) * dt) * k2y)), (m_z_2 + ((((t_sample)0.5) * dt) * k2z)), sig_param);
				t_sample k3y = lorenz_dy_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k2x)), (m_y_3 + ((((t_sample)0.5) * dt) * k2y)), (m_z_2 + ((((t_sample)0.5) * dt) * k2z)), rho_param);
				t_sample k3z = lorenz_dz_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k2x)), (m_y_3 + ((((t_sample)0.5) * dt) * k2y)), (m_z_2 + ((((t_sample)0.5) * dt) * k2z)), ((t_sample)2.6666666666666665));
				t_sample k4x = lorenz_dx_d_d_d_d((x_in + (dt * k3x)), (m_y_3 + (dt * k3y)), (m_z_2 + (dt * k3z)), sig_param);
				t_sample k4y = lorenz_dy_d_d_d_d((x_in + (dt * k3x)), (m_y_3 + (dt * k3y)), (m_z_2 + (dt * k3z)), rho_param);
				t_sample k4z = lorenz_dz_d_d_d_d((x_in + (dt * k3x)), (m_y_3 + (dt * k3y)), (m_z_2 + (dt * k3z)), ((t_sample)2.6666666666666665));
				m_x_4 = (m_x_4 + ((dt * ((t_sample)0.16666666666666666)) * (((k1x + (((int)2) * k2x)) + (((int)2) * k3x)) + k4x)));
				m_y_3 = (m_y_3 + ((dt * ((t_sample)0.16666666666666666)) * (((k1y + (((int)2) * k2y)) + (((int)2) * k3y)) + k4y)));
				m_z_2 = (m_z_2 + ((dt * ((t_sample)0.16666666666666666)) * (((k1z + (((int)2) * k2z)) + (((int)2) * k3z)) + k4z)));
				
			} else {
				t_sample k1x = rossler_dx_d_d_d(x_in, m_y_3, m_z_2);
				t_sample k1y = rossler_dy_d_d_d_d(x_in, m_y_3, m_z_2, ((t_sample)0.20000000000000001));
				t_sample k1z = rossler_dz_d_d_d_d_d(x_in, m_y_3, m_z_2, ((t_sample)0.20000000000000001), c_param);
				t_sample k2x = rossler_dx_d_d_d((x_in + ((((t_sample)0.5) * dt) * k1x)), (m_y_3 + ((((t_sample)0.5) * dt) * k1y)), (m_z_2 + ((((t_sample)0.5) * dt) * k1z)));
				t_sample k2y = rossler_dy_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k1x)), (m_y_3 + ((((t_sample)0.5) * dt) * k1y)), (m_z_2 + ((((t_sample)0.5) * dt) * k1z)), ((t_sample)0.20000000000000001));
				t_sample k2z = rossler_dz_d_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k1x)), (m_y_3 + ((((t_sample)0.5) * dt) * k1y)), (m_z_2 + ((((t_sample)0.5) * dt) * k1z)), ((t_sample)0.20000000000000001), c_param);
				t_sample k3x = rossler_dx_d_d_d((x_in + ((((t_sample)0.5) * dt) * k2x)), (m_y_3 + ((((t_sample)0.5) * dt) * k2y)), (m_z_2 + ((((t_sample)0.5) * dt) * k2z)));
				t_sample k3y = rossler_dy_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k2x)), (m_y_3 + ((((t_sample)0.5) * dt) * k2y)), (m_z_2 + ((((t_sample)0.5) * dt) * k2z)), ((t_sample)0.20000000000000001));
				t_sample k3z = rossler_dz_d_d_d_d_d((x_in + ((((t_sample)0.5) * dt) * k2x)), (m_y_3 + ((((t_sample)0.5) * dt) * k2y)), (m_z_2 + ((((t_sample)0.5) * dt) * k2z)), ((t_sample)0.20000000000000001), c_param);
				t_sample k4x = rossler_dx_d_d_d((x_in + (dt * k3x)), (m_y_3 + (dt * k3y)), (m_z_2 + (dt * k3z)));
				t_sample k4y = rossler_dy_d_d_d_d((x_in + (dt * k3x)), (m_y_3 + (dt * k3y)), (m_z_2 + (dt * k3z)), ((t_sample)0.20000000000000001));
				t_sample k4z = rossler_dz_d_d_d_d_d((x_in + (dt * k3x)), (m_y_3 + (dt * k3y)), (m_z_2 + (dt * k3z)), ((t_sample)0.20000000000000001), c_param);
				m_x_4 = (m_x_4 + ((dt * ((t_sample)0.16666666666666666)) * (((k1x + (((int)2) * k2x)) + (((int)2) * k3x)) + k4x)));
				m_y_3 = (m_y_3 + ((dt * ((t_sample)0.16666666666666666)) * (((k1y + (((int)2) * k2y)) + (((int)2) * k3y)) + k4y)));
				m_z_2 = (m_z_2 + ((dt * ((t_sample)0.16666666666666666)) * (((k1z + (((int)2) * k2z)) + (((int)2) * k3z)) + k4z)));
				
			};
			if (((((((fabs(m_x_4) > ((int)300)) || (fabs(m_y_3) > ((int)300))) || (fabs(m_z_2) > ((int)300))) || genlib_isnan(m_x_4)) || genlib_isnan(m_y_3)) || genlib_isnan(m_z_2))) {
				m_x_4 = ((int)4);
				m_y_3 = ((int)0);
				m_z_2 = ((t_sample)0.20000000000000001);
				
			};
			t_sample iftrue_13 = (m_x_4 * ((t_sample)0.050000000000000003));
			t_sample iffalse_14 = (m_x_4 * ((t_sample)0.080000000000000002));
			t_sample v_15 = (cond_12 ? iftrue_13 : iffalse_14);
			t_sample norm_x = ((v_15 <= ((int)-1)) ? ((int)-1) : ((v_15 >= ((int)1)) ? ((int)1) : v_15));
			t_sample iftrue_17 = (m_y_3 * ((t_sample)0.040000000000000001));
			t_sample iffalse_18 = (m_y_3 * ((t_sample)0.080000000000000002));
			t_sample v_19 = (cond_16 ? iftrue_17 : iffalse_18);
			t_sample norm_y = ((v_19 <= ((int)-1)) ? ((int)-1) : ((v_19 >= ((int)1)) ? ((int)1) : v_19));
			t_sample v_21 = ((m_z_2 - (m_param_rho_6 - ((int)1))) * ((t_sample)0.055));
			t_sample iftrue_22 = ((v_21 <= ((int)-1)) ? ((int)-1) : ((v_21 >= ((int)1)) ? ((int)1) : v_21));
			t_sample v_23 = ((m_z_2 - ((t_sample)2.5)) * ((t_sample)0.10000000000000001));
			t_sample iffalse_24 = ((v_23 <= ((int)-1)) ? ((int)-1) : ((v_23 >= ((int)1)) ? ((int)1) : v_23));
			t_sample norm_z = (cond_20 ? iftrue_22 : iffalse_24);
			int trig_pulse = ((norm_x > ((int)0)) && (m_h_last_x_1 <= ((int)0)));
			m_h_last_x_1 = norm_x;
			t_sample tmp_expr_405 = norm_x;
			t_sample tmp_expr_406 = norm_y;
			t_sample tmp_expr_407 = norm_z;
			int tmp_expr_408 = trig_pulse;
			t_sample out1 = tmp_expr_405;
			t_sample out2 = tmp_expr_406;
			t_sample out3 = tmp_expr_407;
			t_sample out4 = tmp_expr_408;
			// assign results to output buffer;
			(*(__out1++)) = out1;
			(*(__out2++)) = out2;
			(*(__out3++)) = out3;
			(*(__out4++)) = out4;
			
		};
		return __exception;
		
	};
	inline void set_inject(t_param _value) {
		m_inject_5 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline void set_param_rho(t_param _value) {
		m_param_rho_6 = (_value < 10 ? 10 : (_value > 60 ? 60 : _value));
	};
	inline void set_drive(t_param _value) {
		m_drive_7 = (_value < 0 ? 0 : (_value > 2 ? 2 : _value));
	};
	inline void set_speed(t_param _value) {
		m_speed_8 = (_value < 0.01 ? 0.01 : (_value > 1000 ? 1000 : _value));
	};
	inline void set_system(t_param _value) {
		m_system_9 = (_value < 0 ? 0 : (_value > 1 ? 1 : _value));
	};
	inline t_sample lorenz_dx_d_d_d_d(t_sample px, t_sample py, t_sample pz, t_sample sigm) {
		return (sigm * (py - px));
		
	};
	inline t_sample lorenz_dy_d_d_d_d(t_sample px, t_sample py, t_sample pz, t_sample r_val) {
		return ((px * (r_val - pz)) - py);
		
	};
	inline t_sample lorenz_dz_d_d_d_d(t_sample px, t_sample py, t_sample pz, t_sample bet) {
		return ((px * py) - (bet * pz));
		
	};
	inline t_sample rossler_dx_d_d_d(t_sample px, t_sample py, t_sample pz) {
		return ((-py) - pz);
		
	};
	inline t_sample rossler_dy_d_d_d_d(t_sample px, t_sample py, t_sample pz, t_sample a_val) {
		return (px + (a_val * py));
		
	};
	inline t_sample rossler_dz_d_d_d_d_d(t_sample px, t_sample py, t_sample pz, t_sample b_val, t_sample c_val) {
		return (b_val + (pz * (px - c_val)));
		
	};
	
} State;


///
///	Configuration for the genlib API
///

/// Number of signal inputs and outputs

int gen_kernel_numins = 2;
int gen_kernel_numouts = 4;

int num_inputs() { return gen_kernel_numins; }
int num_outputs() { return gen_kernel_numouts; }
int num_params() { return 5; }

/// Assistive lables for the signal inputs and outputs

const char *gen_kernel_innames[] = { "Audio / Cross-Modulation Injection In", "Speed FM Modulation CV In" };
const char *gen_kernel_outnames[] = { "X Coordinate (-1..1 audio / CV azimuth)", "Y Coordinate (-1..1 audio / CV elevation)", "Z Coordinate (-1..1 spatial height: 0=ear level, -1=floor, +1=ceiling)", "Trigger Impulse (Poincaré section crossing)" };

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
		case 0: self->set_drive(value); break;
		case 1: self->set_inject(value); break;
		case 2: self->set_param_rho(value); break;
		case 3: self->set_speed(value); break;
		case 4: self->set_system(value); break;
		
		default: break;
	}
}

/// Get the value of a parameter of a State object

void getparameter(CommonState *cself, long index, t_param *value) {
	State *self = (State *)cself;
	switch (index) {
		case 0: *value = self->m_drive_7; break;
		case 1: *value = self->m_inject_5; break;
		case 2: *value = self->m_param_rho_6; break;
		case 3: *value = self->m_speed_8; break;
		case 4: *value = self->m_system_9; break;
		
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
	self->__commonstate.params = (ParamInfo *)genlib_sysmem_newptr(5 * sizeof(ParamInfo));
	self->__commonstate.numparams = 5;
	// initialize parameter 0 ("m_drive_7")
	pi = self->__commonstate.params + 0;
	pi->name = "drive";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_drive_7;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 2;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 1 ("m_inject_5")
	pi = self->__commonstate.params + 1;
	pi->name = "inject";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_inject_5;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0;
	pi->outputmax = 1;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 2 ("m_param_rho_6")
	pi = self->__commonstate.params + 2;
	pi->name = "param_rho";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_param_rho_6;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 10;
	pi->outputmax = 60;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 3 ("m_speed_8")
	pi = self->__commonstate.params + 3;
	pi->name = "speed";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_speed_8;
	pi->defaultref = 0;
	pi->hasinputminmax = false;
	pi->inputmin = 0;
	pi->inputmax = 1;
	pi->hasminmax = true;
	pi->outputmin = 0.01;
	pi->outputmax = 1000;
	pi->exp = 0;
	pi->units = "";		// no units defined
	// initialize parameter 4 ("m_system_9")
	pi = self->__commonstate.params + 4;
	pi->name = "system";
	pi->paramtype = GENLIB_PARAMTYPE_FLOAT;
	pi->defaultvalue = self->m_system_9;
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


} // lorenz_rossler_chaos::
