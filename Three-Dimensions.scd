(
{
Mix.ar(
        Array.fill(10,
            {arg c;
                SinOsc.ar(
                    LFSaw.ar((c * 0.2 + 1) / 3, mul: 500, add: 700)
                )
            }
        )
    ) * 0.1;
}.play;
)