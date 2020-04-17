SynthDef(\simple_delay_p, {
  |
  out = 0,
  wet = 0.25,
  maxtime = 1,
  delayTime = 0.99,
  decay = 0.5,
  pan = 0,
  gate = 1
  |
  var sig, delay, env;
  env = Linen.kr(gate, 0.05, 1, 0.1, 2);
  sig = In.ar(out, 2);
  delay = AllpassL.ar(
	sig,
	maxtime,
	delayTime,
	decay
  );

  XOut.ar(out, env, Mix.ar([sig * (1.0 - wet), delay * wet]));
}).add;