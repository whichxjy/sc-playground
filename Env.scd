(
x = {
    arg t_gate = 0;
    var env, sig;
    env = EnvGen.kr(Env.new(
        [0, 1, 0.2, 0],
        [0.5, 1, 2],
        [3, -3, 0]), t_gate);
    sig = Pulse.ar(LFPulse.kr(8).range(600, 900)) * env;
}.play;
)

x.set(\t_gate, 1);

(
y = {
    arg gate = 0;
    var freq, env, sig;
    freq = EnvGen.kr(Env.adsr(1), gate, 200, 0.1, doneAction: 2);
    env = EnvGen.kr(Env.adsr, gate, doneAction: 2);
    sig = VarSaw.ar(SinOsc.kr(freq).range(500, 1000)) * env;
}.play;
)

y.set(\gate, 1);