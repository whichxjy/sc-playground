(
SynthDef.new(\x, {
    arg freq = 40;
    var sum, env, temp;
    sum = 0;
    env = EnvGen.kr(
        Env.perc(0.01, 5, 1, -2),
        doneAction: 2
    );
    10.do({
        temp = VarSaw.ar(
            freq * { Rand(0.99, 1.02) }.dup(2),
            { Rand(0.0, 1.0) }.dup(2),
            { ExpRand(0.005, 0.05) }.dup(2)
        );
        sum = sum + temp;
    });
    sum = sum * env * 0.05;
    Out.ar(0, sum);
}).add;
)

Synth.new(\x, [\freq, 400]);
Synth.new(\x, [\freq, 300]);
Synth.new(\x, [\freq, 200]);
Synth.new(\x, [\freq, 100]);

Synth.new(\x, [\freq, 80.midicps]);
Synth.new(\x, [\freq, 70.midicps]);
Synth.new(\x, [\freq, 60.midicps]);
Synth.new(\x, [\freq, 50.midicps]);

(
[90, 80, 70, 60, 50, 40, 30, 20, 10].do({
    arg midinote;
    Synth.new(\x, [\freq, midinote.midicps]);
})
)