// LORENZ-ROSSLER-CHAOS: Lorenz and Rössler strange attractors integrated by RK4
// (gen~: gendsp/lorenz-rossler-chaos.gendsp)
//
// One RK4 step per sample of the Lorenz system (sigma = 10*max(drive, 0.05),
// rho = param_rho, beta = 8/3) or of the Rössler system (a = b = 0.2,
// c = param_rho mapped 10..60 -> 4..9), dt = min(1.2*speed'/sr, 0.024) with
// speed' = clamp(speed + 200*in2, 0.01, 1000). in1*inject*0.2 perturbs the x
// fed to the derivatives (not the integrated x). The state restarts at
// (0.1, 0.1, 0.1) when a coordinate leaves [-100, 100].
//
// in1: audio injection on x    in2: speed CV (+200 per unit)
// out1, out2, out3: x, y, z scaled to [-1, 1] (clamped)
// out4: trigger on the upward zero crossing of out1
//
// Parameters: system (0..1, def 0: < 0.5 Lorenz, else Rössler),
// speed (0.01..1000, def 150), drive (0..2, def 1: Lorenz sigma),
// param_rho (10..60, def 28), inject (0..1, def 0).
//
// gen~ behaviour kept: in Lorenz mode with param_rho above about 51-55 (drive
// 1), the first excursion from (0.1, 0.1, 0.1) leaves [-100, 100], so the
// state restarts there forever: a periodic burst (every 75 samples at speed 150 and rho 60,
// 104 at rho 55) instead of the attractor.

declare name "lorenz-rossler-chaos";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

system = hslider("system", 0, 0, 1, 1);
speed = hslider("speed", 150, 0.01, 1000, 0.01);
drive = hslider("drive", 1, 0, 2, 0.001);
param_rho = hslider("param_rho", 28, 10, 60, 0.01);
inject = hslider("inject", 0, 0, 1, 0.001);

// Faust's normalizer reorders this arithmetic (it distributes sigma over
// (py - px), merges dt*1/6 with the parameters, factors the RK4 sums), and a
// chaotic system turns each ulp of difference into a different trajectory
// within a few thousand samples. Every operation goes through K, an identity
// the normalizer does not see through (for finite x, which the reset to 0.1
// above |100| ensures), so that the program computes gen's expressions in
// gen's order.
K = g.keep;
add(a, b) = K(a + b);
sub(a, b) = K(a - b);
mul(a, b) = K(a * b);
// x / SR as a true division (the normalizer turns /SR into *(1/SR))
divsr = g.divsr;

lorenz_dx(px, py, pz, sigm) = mul(sigm, sub(py, px));
lorenz_dy(px, py, pz, r_val) = sub(mul(px, sub(r_val, pz)), py);
lorenz_dz(px, py, pz, bet) = sub(mul(px, py), mul(bet, pz));

rossler_dx(px, py, pz) = sub(K(0 - py), pz);
rossler_dy(px, py, pz, a_val) = add(px, mul(a_val, py));
rossler_dz(px, py, pz, b_val, c_val) = add(b_val, mul(pz, sub(px, c_val)));

// one RK4 step of the derivative triple (fx, fy, fz) from (x_in, y, z),
// x itself (not x_in) integrated; the export writes dt/6 as dt*0.16666666666666666
_rk4(fx, fy, fz, dt, x, x_in, y, z) = xn, yn, zn
with {
    k1x = fx(x_in, y, z); k1y = fy(x_in, y, z); k1z = fz(x_in, y, z);
    h = mul(0.5, dt);
    a2x = add(x_in, mul(h, k1x)); a2y = add(y, mul(h, k1y)); a2z = add(z, mul(h, k1z));
    k2x = fx(a2x, a2y, a2z); k2y = fy(a2x, a2y, a2z); k2z = fz(a2x, a2y, a2z);
    a3x = add(x_in, mul(h, k2x)); a3y = add(y, mul(h, k2y)); a3z = add(z, mul(h, k2z));
    k3x = fx(a3x, a3y, a3z); k3y = fy(a3x, a3y, a3z); k3z = fz(a3x, a3y, a3z);
    a4x = add(x_in, mul(dt, k3x)); a4y = add(y, mul(dt, k3y)); a4z = add(z, mul(dt, k3z));
    k4x = fx(a4x, a4y, a4z); k4y = fy(a4x, a4y, a4z); k4z = fz(a4x, a4y, a4z);
    d6 = mul(dt, 0.16666666666666666);
    rksum(k1, k2, k3, k4) = add(add(add(k1, mul(2, k2)), mul(2, k3)), k4);
    xn = add(x, mul(d6, rksum(k1x, k2x, k3x, k4x)));
    yn = add(y, mul(d6, rksum(k1y, k2y, k3y, k4y)));
    zn = add(z, mul(d6, rksum(k1z, k2z, k3z, k4z)));
};

chaos(in1, in2) = norm_x, norm_y, norm_z, trig_pulse
with {
    lor = system < 0.5;
    eff_speed = g.clamp(0.01, 1000, add(speed, mul(in2, 200)));
    dt = min(mul(divsr(eff_speed), 1.2), 0.024);

    sig_param = mul(10, max(drive, 0.05));
    rho_param = param_rho;
    beta_param = 2.6666666666666665;
    // scale(param_rho, 10, 60, 4, 9): ((rho - 10) * 0.02)^1 * 5 + 4
    c_param = add(mul(mul(sub(param_rho, 10), 0.02), 5), 4);

    step(x, y, z) = xr, yr, zr
    with {
        x_in = add(x, mul(mul(in1, inject), 0.2));
        // the derivatives as functions of (px, py, pz), parameters bound
        lx = _rk4(\(px, py, pz).(lorenz_dx(px, py, pz, sig_param)),
                  \(px, py, pz).(lorenz_dy(px, py, pz, rho_param)),
                  \(px, py, pz).(lorenz_dz(px, py, pz, beta_param)),
                  dt, x, x_in, y, z);
        rx = _rk4(rossler_dx,
                  \(px, py, pz).(rossler_dy(px, py, pz, 0.2)),
                  \(px, py, pz).(rossler_dz(px, py, pz, 0.2, c_param)),
                  dt, x, x_in, y, z);
        xs = select2(lor, (rx : _, !, !), (lx : _, !, !));
        ys = select2(lor, (rx : !, _, !), (lx : !, _, !));
        zs = select2(lor, (rx : !, !, _), (lx : !, !, _));
        blow = (abs(xs) > 100) | (abs(ys) > 100) | (abs(zs) > 100);
        xr = select2(blow, xs, 0.1);
        yr = select2(blow, ys, 0.1);
        zr = select2(blow, zs, 0.1);
    };
    // History x(0.1), y(0.1), z(0.1)
    st = step ~ (g.init(0.1), g.init(0.1), g.init(0.1));
    xo = st : _, !, !;
    yo = st : !, _, !;
    zo = st : !, !, _;

    norm_x = g.clamp(-1, 1, select2(lor, xo * 0.08, xo * 0.05));
    norm_y = g.clamp(-1, 1, select2(lor, yo * 0.08, yo * 0.04));
    norm_z = g.clamp(-1, 1, select2(lor, (zo - 5.0) * 0.15, (zo - 25.0) * 0.04));
    trig_pulse = (norm_x > 0) & (norm_x' <= 0);
};

process = chaos;
det = process;
