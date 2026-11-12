// BERNOULLI-GATE: probabilistic clock and gate router (gen~: gendsp/bernoulli-gate.gendsp)
//
// On each trigger (in1 crossing zero upward or falling, or the internal clock),
// a Bernoulli trial against `probability` sends a one-sample pulse to out1
// (outcome A) or out2 (outcome B); out3 holds the last outcome (0 = A, 1 = B).
//
// in1: trigger / clock    out1: pulse A, out2: pulse B, out3: latched state

declare name "bernoulli-gate";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");

probability = hslider("probability", 0.5, 0, 1, 0.001);
trigmode = hslider("trigmode [style:menu{'external':0;'internal':1}]", 0, 0, 1, 1);
frequency = hslider("frequency [unit:Hz]", 1, 0.1, 100, 0.01);

// nz: the noise drawn at a trigger (gen's noise(), uniform in [-1, 1))
gate(nz, in1) = pulseA, pulseB, state
with {
    p = g.phasor(frequency);
    trig_int = p < p';
    trig_ext = (in1 < in1') | ((in1 > 0) & (in1' <= 0));
    trig = select2(trigmode >= 0.5, trig_ext, trig_int);
    isB = nz < (probability * 2) - 1;
    pulseB = trig & isB;
    pulseA = trig & (1 - isB);
    state = (\(s).(select2(trig, s, isB))) ~ _;
};

process = gate(g.noises(1, 0));
// the port with its noise as an input, for scripts/test_gen.py: in1, noise
det(in1, nz) = gate(nz, in1);
