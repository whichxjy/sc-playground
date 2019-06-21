(SynthDef.new(\x, {
    arg freq = 200, dev = 1.02;
    var sum, temp;
    sum = 0;
    20.do({
        arg count;
        temp = SinOsc.ar(
            freq
            * (count + 1)
            * LFNoise1.kr({ Rand(0.05, 0.2) }.dup(2).range(dev.reciprocal, dev))
        );
        temp = temp * LFNoise1.kr({ Rand(0.5, 8) }.dup(2)).exprange(0.01, 1);
        sum = sum + temp;
    });
    sum = sum * 0.05;
    Out.ar(0, sum);
}).add;
)

Synth.new(\x);