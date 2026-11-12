// POISSON-CLOUD: stochastic Poisson / Geiger pulse burst generator
// (gen~: gendsp/poisson-cloud.gendsp)
//
// A start trigger launches a burst of `occurrences` pulses. Each inter-pulse
// interval lasts interval ms scaled by mix(1, -log(r), jitter), r uniform in
// [0.001, 1) (an exponential inter-arrival time when jitter = 1), at least 2
// samples; each pulse is high for the first `width` of its interval, and
// always low on the last sample (one-sample gap between pulses). At the end
// of the burst the process stops, or restarts at count 1 when loop is on.
//
// in1: start trigger (> 0.1, restarts the burst at every sample it is high)
// in2: stop trigger (> 0.1: stop, count = 0)
// out1: pulse stream   out2: pulse counter (1..occurrences, held at the end)
// out3: activity (1 while running)
//
// Parameters: occurrences (def 16, min 1), interval (1..30000 ms, def 250),
// width (0.01..0.99, def 0.5: duty cycle of each pulse), loop (0/1, def 0),
// jitter (0..1, def 0: 0 regular, 1 Poisson).
// (The gendsp header comment documents other names, n_pulses, total_time_ms,
// pulse_width_ms, which are not the code's parameters.)
// occurrences is declared `min=1` without max: the export clamps it to [1, 1]
// (setparameter), so only its default 16 can be compared; the range here is
// 1..1000.

declare name "poisson-cloud";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

ma = library("maths.lib");
g = library("genops.lib");

occurrences = hslider("occurrences", 16, 1, 1000, 1);
interval = hslider("interval [unit:ms]", 250, 1, 30000, 1);
width = hslider("width", 0.5, 0.01, 0.99, 0.001);
loop = hslider("loop", 0, 0, 1, 1);
jitter = hslider("jitter", 0, 0, 1, 0.001);

cloud(in1, in2, nz_start, nz_loop, nz_next) = _frame ~ (_, _, _, _) : outsel
with {
    // the export writes (interval * sr) / 1000 as (interval * sr) * 0.001
    base_s = (interval * ma.SR) * 0.001;
    dur(nz) = max(2, base_s * g.mix(1, 0 - log(max((nz + 1) * 0.5, 0.001)), jitter));

    // state: running, count, phase, current_dur; out: the new state and pulse
    _frame(running, count, phase, current_dur) = running3, count3, phase4, dur3, pulse
    with {
        start = in1 > 0.1;
        running1 = select2(start, running, 1);
        count1 = select2(start, count, 1);
        phase1 = select2(start, phase, 0);
        dur1 = select2(start, current_dur, dur(nz_start));
        stop = in2 > 0.1;
        running2 = select2(stop, running1, 0);
        count2 = select2(stop, count1, 0);
        phase2 = select2(stop, phase1, 0);

        safe_dur = max(dur1, 2);
        p_inc = g.safediv(1, safe_dur);
        pulse = running2 & (phase2 < width) & (phase2 < (1 - p_inc));
        phase3 = phase2 + p_inc;
        atEnd = count2 >= occurrences;
        looping = loop > 0.5;
        // in the running branch
        phaseR = select2(phase3 >= 1, phase3, 0);
        countR = select2(phase3 >= 1, count2, select2(atEnd, count2 + 1, select2(looping, count2, 1)));
        durR = select2(phase3 >= 1, dur1, select2(atEnd, dur(nz_next), select2(looping, dur1, dur(nz_loop))));
        runR = select2((phase3 >= 1) & atEnd & (1 - looping), running2, 0);
        running3 = select2(running2 != 0, running2, runR);
        count3 = select2(running2 != 0, count2, countR);
        phase4 = select2(running2 != 0, phase2, phaseR);
        dur3 = select2(running2 != 0, dur1, durR);
    };
    outsel(running, count, phase, current_dur, pulse) = pulse, count, running;
};

process(in1, in2) = cloud(in1, in2, g.noises(3, 0), g.noises(3, 1), g.noises(3, 2));
// the port with its noises as inputs: in1, in2, then the noise sites start, loop, next
det = cloud;
