SynthDef(\saw_pulse, {
	|
  out = 0,
  freq,
  amp = 1,
  pan = 0,
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
  var sawFreq, pulseFreq;

  sawFreq = freq;
  pulseFreq = freq * pulseDetune.midiratio;

  ampEnv = Env([0, amp, 0], [attack, decay], [aCur, dCur]).kr(2);
  ampEnv = ampEnv * PinkNoise.ar(1!2).range(0.01, 1).lag(0.05);

  saw = LFSaw.ar(
	sawFreq,
    sPhase,
	0.5
  );

  pulse = LFPulse.ar(
	pulseFreq,
    pPhase,
    0.5 + (SinOsc.kr(pwmFreq).range(-0.5, 0.5) * pwmGain),
	0.5
  );

  noise = WhiteNoise.ar() * noiseGain;

  sig = (saw + pulse + noise) * ampEnv;
  sig = HPF.ar(sig, min(sawFreq, pulseFreq));

  filtered = RLPF.ar(
    sig,
    cutoffFreq * Env([0.01, 1], [fAttack]).kr(0) * (1 - (LFSaw.kr(fLfo, mul: lfoGain).range(0, 1) )),
    filtQ
  );

  Out.ar(out, Splay.ar(filtered * ampEnv, pan));
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
    \noiseGain, 0.1
  ]
);

PresetStorage.add(
  "saw_pulse pluck",
  \saw_pulse,
  [
    \attack, 0.01,
    \fAttack, 0.001,
    \decay, 0.3,
    \filtQ, 0.01,
    \cutoffFreq, 1200,
  ]
);