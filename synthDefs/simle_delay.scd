SynthDef(\simple_delay, {
  |
  in,
  out = 0,
  wet = 0.25,
  maxtime = 1,
  delayTime = 0.99,
  decay = 0.5,
  pan = 0
  |
  var sig, delay;
  sig = In.ar(in, 2);
  delay = AllpassL.ar(
	sig,
	maxtime,
	delayTime,
  decay
  );

  Out.ar(out, Mix.ar([sig * (1.0 - wet), delay * wet]));
}).add;