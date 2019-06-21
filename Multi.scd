(
SynthDef.new(\multi, {
    var amp, env, sig;
    amp = SinOsc.kr({ ExpRand(0.2, 12) }.dup(2).range(0, 1));
    env = EnvGen.kr(
        Env.new([0, 1, 0], [10, 10], [1, -1]),
        doneAction: 2
    );
    sig = SinOsc.ar({ ExpRand(50, 1200) }.dup(2));
    sig = sig * amp * env;
    sig = Splay.ar(sig) * 0.5;
    Out.ar(0, sig);
}).add;
)

Synth.new(\multi);