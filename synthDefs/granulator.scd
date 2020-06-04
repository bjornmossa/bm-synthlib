var shakerSample = Buffer.read(
  Server.default,
  BmSynthLib.samplesPath+/+"shaker_synthetic_mono.wav"
);

SynthDef(\granulator, {
  |
  out = 0,
  gate = 1,
  pan = 0,
  amp = 1,
  sndbuf,
  freq = 100,
  rate = 1,
  pos = 1,
  dur = 1,
  att = 1,
  dec = 1
  |

  var env;

  env = EnvGen.kr(
    Env([0, 1, 0], [att, dec], \sin, 1),
    gate,
    levelScale: amp,
    doneAction: Done.freeSelf);

  Out.ar(out,
	GrainBuf.ar(
	  2,
	  Impulse.kr(freq / 2),
	  dur,
	  sndbuf,
	  rate,
	  pos,
	  2,
	  pan
	) * env);
}).add;

PresetStorage.add(
  "granular shaker",
  \granulator,
  [
	\bufn, shakerSample
  ]
);
