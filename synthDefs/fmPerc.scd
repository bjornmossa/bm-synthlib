SynthDef(\fmPerc, {
  |
  out = 0,
  amp = 1,
  freq = 80,
  mod1_freq = 80,
  mod1_gain = 1,
  mod2_freq = 90,
  mod2_gain = 1,
  slope = 0.1,
  release = 0.1,
  tail = 0.1,
  noiseGain = 0.1,
  filtFreq = 1200,
  filtQ = 1,
  pan = 0
  |
  var sig, env, car, mod1, mod2, noise;

  mod2 = SinOsc.ar(mod2_freq) * mod2_gain;
  mod1 = SinOsc.ar(mod1_freq * mod2) * mod1_gain;
  car = SinOsc.ar(((freq + WhiteNoise.kr(1)) * Env([1, 0.8], [0.01], [-2]).kr()) * mod1);
  noise = WhiteNoise.ar(noiseGain);
  sig = BMoog.ar(car + noise, filtFreq, filtQ, 1);

  env = Env([0, amp, slope, 0], [0.001, release, tail], [1, 2, -2]).kr(2);

  Out.ar(out, Pan2.ar(sig * env));
}).add;

PresetStorage.add(
  "wooden block",
  \fmPerc,
  [
    \freq, 600,
    \mod1_freq, 100,
    \mod2_freq, 1000,
    \release, 0.05,
    \slope, 0.01,
    \tail, 0.5,
    \amp, 0.25,
    \noiseGain, 0.004
  ]
);