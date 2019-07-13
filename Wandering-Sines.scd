(
{
var out, delay;

out = SinOsc.ar(
        abs(
            LFNoise1.kr(
                0.5,
                600,
                LFSaw.kr(
                    1.5,
                    mul: 50,
                    add: 500
                )
            )
        ),
        0,
        0.1
);

//delay
delay = CombN.ar(out,
        3.0,
        [ 1.35, 0.7 ],
        6
);

Pan2.ar(out, 0) + delay;
}.play;
)