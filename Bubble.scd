(
x = {
    CombN.ar(
    SinOsc.ar(
        LFNoise1.kr(
            4, 24,
            LFSaw.kr([ 8, 7.23], 0, 3, 80)
        ).midicps,
        0,
        0.04
    ),
    0.2,
    0.2,
    4
    )
}.play;
)