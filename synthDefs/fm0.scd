SynthDef(\fm0, {
  |
  out = 0,
  freq = 220,
  rat0 = 1,
  rat1 = 1,
  modIndex = 0.5,
  filt = 1.5,
  amp = 1,
  att = 1,
  dec = 1,
  matt = 1,
  mdec = 1,
  spread = 0
  |
  var env, menv, car, mod, f, sig;

  f = freq * (rat0 / rat1);

  env = Env([0, amp, 0], [att, dec]).kr(2);
  menv = Env([0, 1, 0], [matt, mdec]).kr() * PinkNoise.kr().range(0, 1).lag(0.5);

  mod = SinOsc.ar(f) * freq * modIndex * menv;
  car = {
	LFSaw.ar((freq + Rand(0.1, 1)) + mod);
  };

  Out.ar(out, Splay.arFill(4, { LPF.ar(car * env, freq * filt) }, spread));
}).add;

PresetStorage.add(
  "fm0 pad",
  \fm0,
  [
	\modIndex, 0.6,
	\modGain, 0.4,
	\modRate, 20,
	\filt, 0.25,
	\rat0, 2,
	\rat1, 4
  ]
);
