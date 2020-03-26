SynthDef(\kick, {
  |
  out = 0,
  decay = 0.1,
  amp = 0.7,
  tCur = -1,
  tickGain = 0.1,
  tickDecay = 0.01,
  pan = 0
  |
  var body, transient, tick, sig;

  body = SinOsc.ar(Env([60, 70], [0.01], [4]).kr()) * Env([0, amp, 0], [0.01, decay], [1, -4]).kr(2);
  transient = LFTri.ar(60) * Env([0, amp, 0], [0.01, 0.02], [tCur, -4]).kr();
  tick = WhiteNoise.ar() * Env([tickGain, 0], [tickDecay], [-4]).kr();

  sig = body + transient + tick;
  Out.ar(out, Pan2.ar(sig, pan) * 0.5);
}).add;