(
play({
    var fundamental, partials, out, offset;
    fundamental = 50;
    partials = 20;
    out = 0.0;
    offset = Line.kr(0, -0.02, 60);
    partials.do({
        arg i;
        out = FSinOsc.ar(
            fundamental * (i + 1),
            0,
            max(0,
                LFNoise1.kr(
                    6 + [4.0.rand2, 4.0.rand2],
                    89
                    0.02,
                    offset
                )
            ),
            out
        )
    });
    out
})
)

(
{
    Mix.fill(15,
        {
            var freq;
            freq = exprand(100, 3000);
            Pan2.ar(
                SinOsc.ar(
                    freq * LFNoise1.kr(1 / 6, 0.4, 1),
                    mul: EnvGen.kr(
                        Env.perc(0, (freq ** (-0.7)) * 100), Dust.kr(1 / 5))
                ), LFNoise1.kr(1 / 8)
            )
    }) * 0.3
}.play;
)