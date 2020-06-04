SynthDef(\sinFb, {
  |
  freq = 220,
  modFreq = 0.1,
  attack = 0.01,
  release = 0.1,
  amp = 1,
  pitchRatio = 1,
  pitchGain = 0,
  pan = 0,
  out = 0
  |
  var sig, pitched, env;

  env = Env([0, amp, 0], [attack, release]).kr(2);
  sig = SinOscFB.ar(freq, SinOsc.kr(modFreq).range(0.1));
  pitched = PitchShift.ar(sig, pitchRatio: pitchRatio) * pitchGain;
  
  Out.ar(out, Pan2.ar((sig + pitched) * env, pan));
}).add;

PresetStorage.add(
  "sinFb harsh",
  \sinFb,
  [
	\modFreq, 100,
	\pitchGain, 0.25,
	\pitchRatio, 4,
	\release, 0.25
  ]
);
