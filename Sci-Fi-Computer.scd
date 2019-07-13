(
{
    PMOsc.ar(
        LFNoise1.kr(
            MouseX.kr([1, 1], 12),
            mul: MouseY.kr(10, 1000),
            add: 1000),
        LFNoise0.kr(
            MouseX.kr([1, 1], 12),
            mul: MouseY.kr(30, 1000),
            add: 1000),
        MouseY.kr(0.1, 5.0),
        mul: 0.3
    )
}.play;
)