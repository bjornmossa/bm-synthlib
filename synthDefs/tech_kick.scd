SynthDef(\tech_kick, {
  |out = 0, freq = 80, amp = 1, res = 0.01 |
  var sig;

  sig = RLPF.ar(SinOsc.ar(freq / 2), Env([100, 40], [0.1]).kr(), res);
  sig = sig * Env([0, 1, 0], [0.001, 0.25]).kr(2);

  Out.ar(out, Pan2.ar(sig * amp, 0));
}).add;
