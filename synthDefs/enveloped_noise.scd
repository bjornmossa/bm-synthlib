SynthDef(\env_noise, {
  |
  out = 0,
  amp = 1,
  pan = 0,
  attack = 0.01,
  decay = 0.01,
  filtFreq = 900,
  filtQ = 0.8,
  lfoFreq = 10,
  lfoAmount = 0.2
  |
  var sig, env, filtered;

  env = Env([0, amp, 0], [attack, decay], [1, -4]).kr(2);
  sig = WhiteNoise.ar();
  filtered = RLPF.ar(sig, filtFreq * (1 - (SinOsc.kr(lfoFreq) * lfoAmount)), filtQ);

  Out.ar(out, Pan2.ar(filtered * env, pan));
}).add;

PresetStorage.add(
  "mod waves",
  \env_noise,
  [
    \decay, 2,
    \attack, 4,
    \dur, 12,
  ]
);