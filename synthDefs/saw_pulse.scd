SynthDef(\saw_pulse, {
	|
  out = 0,
  freq,
  amp = 1,
  pan = 0,
  drift = 0.5,
  attack = 0.5,
  decay = 1,
  aCur = 0.5,
  dCur = -2,
  sPhase = 0,
  pPhase = 0,
  pulseDetune = 0,
  pwmFreq = 2,
  pwmGain = 0,
  noiseGain = 0.1,
  filtQ = 1,
  cutoffFreq = 1000,
  fAttack = 0.5,
  fLfo = 3,
  lfoGain = 0
  |
  var saw, pulse, noise, ampEnv, filtered, sig;

  ampEnv = Env([0, amp, 0], [attack, decay], [aCur, dCur]).kr(2);

  saw = LFSaw.ar(
    freq + WhiteNoise.kr(drift),
    sPhase
  );

  pulse = LFPulse.ar(
    (freq * pulseDetune.midiratio) +  WhiteNoise.kr(drift),
    pPhase,
    0.5 + (SinOsc.kr(pwmFreq).range(-0.5, 0.5) * pwmGain)
  );

  noise = WhiteNoise.ar() * noiseGain;

  sig = (saw + pulse + noise) * ampEnv;

  filtered = RLPF.ar(
    sig,
    Env([60, cutoffFreq], [fAttack]).kr(0) * (1 - (SinOsc.kr(fLfo) * lfoGain)),
    filtQ
  );

  Out.ar(out, Pan2.ar(filtered * ampEnv, pan));
}).add;

PresetStorage.add(
  "saw_pulse bass",
  \saw_pulse,
  [
    \pulseDetune, -12,
    \decay, 6,
    \filtQ, 0.4,
    \lfoGain, 0.1,
    \pwmFreq, 3,
    \sPhase, 2,
    \pwmGain, 0.2,
    \fAttack, 0.05,
    \attack, 0.01,
    \noiseGain, 0.5,
    \drift, 1,
    \cutoffFreq, 400,
  ]
);

PresetStorage.add(
  "saw_pulse pluck",
  \saw_pulse,
  [
    \drift, 1,
    \attack, 0.01,
    \fAttack, 0.001,
    \decay, 0.3,
    \filtQ, 0.01,
    \cutoffFreq, 1200,
  ]
);