(
SynthDef.new(\blip, {
    arg out, fund = 300, dens = 2, decay = 0.2;
    var freq, trig, sig;
    freq = LFNoise0.kr(3).exprange(fund, fund * 4).round(fund);
    trig = Dust.kr(dens);
    sig = SinOsc.ar(freq) * 0.25;
    sig = sig * EnvGen.kr(Env.perc(0.01, decay), trig);
    sig = Pan2.ar(sig, LFNoise1.kr(10));
    Out.ar(out, sig);
}).add;

SynthDef.new(\reverb, {
    arg in, out = 0;
    var sig;
    sig = In.ar(in, 2);
    sig = FreeVerb.ar(sig, 0.5, 0.8, 0.2);
    Out.ar(out, sig);
}).add;
)

~reverb_bus = Bus.audio(s, 2);
~dst = Synth.new(\reverb, [\in, ~reverb_bus]);
~sourceGrp = Group.new;
~fxGrp = Group.after(~sourceGrp);

10.do({
    Synth.new(
        \blip,
        [
            \out, ~reverb_bus,
            \fund, exprand(60, 300).round(30)
        ],
        ~sourceGrp
    );
})