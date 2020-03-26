SynthDef(\greyhole, {
  |
  in,
  out = 0,
  wet = 0.25,
  dtime = 0.1,
  damp = 0.1,
  size = 1,
  diff = 0.707,
  fb = 0.1,
  modDepth = 0.01,
  modFreq = 2
  |
  var sig, grayhole;
  sig = In.ar(in);
  grayhole = Greyhole.ar(
	sig,
	dtime,
	damp,
	size,
	diff,
	fb,
	modDepth,
	modFreq
  );

  Out.ar(out, Mix.ar([sig * (1.0 - wet), grayhole * wet]));
}).add;
