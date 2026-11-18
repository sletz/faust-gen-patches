// GRAINER: envelope-triggered grain bursts (gen~: gendsp/grainer.gendsp)
//
// An envelope follower of max(|in1|, |in2|) times `gain` (one-pole slews of
// `slide_attack` / `slide_decay` ms) is compared to `thresh` % (+ in3, in %);
// each rising crossing, outside a lockout of `antibis` ms that it restarts,
// opens a grain with probability `proba` % (+ in4). A grain is a window of
// `grain` ms (at least two fades) with raised-cosine fades of `fade` ms (at
// least 8 samples); a crossing during a grain already past its fade-in
// restarts it at the end of the fade-in (the gate stays open). The window
// multiplies the input delayed by the fade length (linear Delay of 9600), and
// `mix` blends the delayed input with the grains.
//
// in1, in2: audio L, R    in3: threshold CV (added to thresh, %)
// in4: probability CV (added to proba, %)
// out1, out2: processed L, R    out3: envelope    out4: grain trigger (0/1)
//
// Parameters (gen~'s ranges and defaults): gain (1..10, 4),
// thresh (0..100 %, 40), slide_attack (0..500 ms, 5),
// slide_decay (0..5000 ms, 50), grain (6..20000 ms, 250),
// antibis (0..10000 ms, 150), proba (0..100 %, 100), fade (0.5..20 ms, 1.5),
// mix (0..100 %, 100).
//
// gen~ quirks kept:
// - the dry side of `mix` is the delayed input, not the input;
// - a crossing refused by the probability draw still restarts the lockout;
// - the retrigger compares the grain counter to mstosamps(fade), not to the
//   fade length the window uses (max(8, mstosamps(clamp(fade)))): the same
//   at 48 kHz, where fade >= 0.5 ms is 24 samples or more.
//
// Noise sites (export order): 0 the probability draw (on a crossing).

declare name "grainer";
declare author "Max Bruckert (gen~), Faust port";
declare license "MIT";

g = library("genops.lib");
ma = library("maths.lib");
si = library("signals.lib");

gain = hslider("gain", 4, 1, 10, 0.001);
thresh = hslider("thresh [unit:%]", 40, 0, 100, 0.01);
slide_attack = hslider("slide_attack [unit:ms]", 5, 0, 500, 0.01);
slide_decay = hslider("slide_decay [unit:ms]", 50, 0, 5000, 0.01);
grain = hslider("grain [unit:ms]", 250, 6, 20000, 0.01);
antibis = hslider("antibis [unit:ms]", 150, 0, 10000, 0.01);
proba = hslider("proba [unit:%]", 100, 0, 100, 0.01);
fade = hslider("fade [unit:ms]", 1.5, 0.5, 20, 0.001);
mix = hslider("mix [unit:%]", 100, 0, 100, 0.01);

PI = 3.1415926535897931;

att_samps = max(1, g.mstosamps(g.clip(0, 500, slide_attack)));
dec_samps = max(1, g.mstosamps(g.clip(0, 5000, slide_decay)));
antibis_samps = max(1, g.mstosamps(g.clip(0, 10000, antibis)));
fade_ms = g.mstosamps(fade);
fade_samps = max(8, g.mstosamps(g.clip(0.5, 20, fade)));
grain_samps = max(fade_samps * 2, g.mstosamps(g.clip(6, 20000, grain)));

tdiv = g.tdiv;   // safediv(n, d) for d > 0 (fade_samps >= 8), as a true division

// envelope follower (out3 is the updated history)
envf(in_level) = (\(h).(g.fixdenorm(h + (in_level - h)
                    * select2(in_level > h, g.safediv(1, dec_samps), g.safediv(1, att_samps))))) ~ _;

// lockout, gate and counter: states cooldown, active, count; outputs the
// window and the trigger
grains(is_over, eff_proba, nz) = (body ~ si.bus(3)) : si.block(3), _, _
with {
    was_over = is_over';
    body(cd_d, act_d, cnt_d) = cd, act, cnt, win, trig
    with {
        cd1 = max(0, cd_d - 1);
        hit = is_over & (was_over == 0) & (cd1 == 0);
        cd = select2(hit, cd1, antibis_samps);
        trig = hit & ((nz * 0.5 + 0.5) * 100.0 <= eff_proba);
        cnt0 = select2(trig, cnt_d, select2((act_d != 0) & (cnt_d > fade_ms), 0, fade_ms));
        act0 = select2(trig, act_d, 1);
        cnt1 = cnt0 + 1;
        ended = cnt1 >= grain_samps;
        act = select2(act0 != 0, act0, select2(ended, act0, 0));
        cnt = select2(act0 != 0, cnt0, select2(ended, cnt1, 0));
        // tdiv and g.keep: Faust would compute cnt1 * (PI * (1 / fade_samps))
        // and (grain_samps - 1) - cnt0
        fin = 0.5 - 0.5 * cos(tdiv(PI * cnt1, fade_samps));
        fout = 0.5 - 0.5 * cos(tdiv(PI * (grain_samps - g.keep(cnt1)), fade_samps));
        win = select2(act0 != 0, 0,
                select2(ended,
                  select2(cnt1 < fade_samps,
                    select2(cnt1 >= grain_samps - fade_samps, 1.0, fout),
                    fin),
                  0.0));
    };
};

grainer(in1, in2, in3, in4, nz) = out1, out2, out3, out4
with {
    env = envf(max(abs(in1), abs(in2)) * g.clip(1, 10, gain));
    is_over = env > g.clip(0, 1, (thresh + in3) * 0.01);
    gw = grains(is_over, g.clip(0, 100, proba + in4), nz);
    grain_win = gw : _, !;
    trig = gw : !, _;
    del_L = g.rd_linear(9600, 9600, 0, in1, fade_samps);
    del_R = g.rd_linear(9600, 9600, 0, in2, fade_samps);
    mix_val = g.clip(0, 1, mix * 0.01);
    out1 = g.mix(del_L, del_L * grain_win, mix_val);
    out2 = g.mix(del_R, del_R * grain_win, mix_val);
    out3 = env;
    out4 = float(trig);
};

// the port with its noise as an input: in1..in4, noise site 0 (probability draw)
det = grainer;
process = (_, _, _, _, g.noises(1, 0)) : det;
