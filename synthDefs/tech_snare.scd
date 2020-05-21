SynthDef(\tech_snare, {
  |out = 0, amp = 1, filt = 300, att = 0.1, dec = 0.5, res = 0.2, pan = 0, width = 2.0, orient = 0.5 |
  var sig, env;
  env = Env([1, 0.1, 0], [att, dec]).kr(2);
  sig = RHPF.ar(PinkNoise.ar(), filt, res) * env;
  Out.ar(
	out,
	PanAz.ar(
	  2,
	  HPF.ar(sig, 600 * Env([0.1, 1.0], [att]).kr()) * amp,
	  pan,
	  1,
	  width,
	  orient
	)
  )
}).add;
