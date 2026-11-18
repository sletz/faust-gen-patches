// OFFSET-SPLINE-RANDOM: continuous drunk walk through a 6-point spline
// (gen~: gendsp/offset-spline-random.gendsp)
//
// A random walk folded into [-1, 1] takes a Gaussian step (Box-Muller, scaled
// by range) at each trigger: a wrap of the internal phasor, or a jump of more
// than 0.5 of in2 when trigmode is on. The last six points of the walk are
// kept in a shift register and read by genlib's 6-point, 5th-order B-spline
// (interp mode "spline6") with the phase itself as the fraction. in1 passes
// through a 120-sample feedback comb (y = in1 + 0.5*(y[n-120] - in1)) and is
// added to the walk scaled by amp.
//
// in1: audio / signal thru    in2: external phase / clock (trigmode on)
// out1: fold(comb(in1) + amp * (mode ? spline : stepped), -1, 1)
// out2: trigger   out3: spline output   out4: stepped (sample-and-hold) walk
//
// Parameters: amp (0..1, def 0.2), trigmode (0/1, def 0: internal phasor),
// frequency (0.01..500 Hz, def 20: internal phasor), range (0..100, def 50: step size),
// mode (0/1, def 1: spline, 0: stepped). trigmode and mode are tested for
// nonzero, not >= 0.5, as gen does.

declare name "offset-spline-random";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

amp = hslider("amp", 0.2, 0, 1, 0.001);
trigmode = hslider("trigmode", 0, 0, 1, 1);
frequency = hslider("frequency [unit:Hz]", 20, 0.01, 500, 0.01);
range = hslider("range", 50, 0, 100, 0.01);
mode = hslider("mode", 1, 0, 1, 1);

walker(in1, in2, n1, n2) = out1, trig, sig_spline, sig_stepped
with {
    phasor_int = g.phasor(frequency);
    phase = select2(trigmode != 0, phasor_int, in2);
    trig = abs(g.delta(phase)) > 0.5;

    // Box-Muller, u1 kept away from 0
    u1 = abs(n1);
    u2 = n2 * ma.PI;
    gen_noise = sqrt(log(max(u1, 0.000001)) * -2.0) * cos(u2);
    scale_amt = g.scale(range, 0, 100, 0, 4, 1);
    step = gen_noise * scale_amt;
    h_rand_walk = (\(h).(g.fold(-1, 1, h + select2(trig, 0, step)))) ~ _;

    // shift register p0..p5, shifted at a trigger (p0 = the new walk value)
    sh(x) = (\(h).(select2(trig, h, x))) ~ _;
    p0 = sh(h_rand_walk);
    p1 = sh(p0');
    p2 = sh(p1');
    p3 = sh(p2');
    p4 = sh(p3');
    p5 = sh(p4');

    sig_spline = g.spline6_interp(phase, p5, p4, p3, p2, p1, p0);
    sig_stepped = p0;
    sig_final = select2(mode != 0, sig_stepped, sig_spline);
    audio_out = g.fixdenorm(sig_final * amp);

    // Delay delay_fb(120), read_step(120) before the write
    mixed_input = (\(xd).(g.mix(in1, g.rd_step_fb(128, 120, xd, 120), 0.5))) ~ _;
    out1 = g.fold(-1, 1, mixed_input + audio_out);
};

process(in1, in2) = walker(in1, in2, g.noises(2, 0), g.noises(2, 1));
// the port with its noises as inputs: in1, in2, n1, n2
det = walker;
