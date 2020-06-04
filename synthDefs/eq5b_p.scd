SynthDef(\eq5b_p, {
  |
  out = 0,
  lowShelfFreq = 100,
  lowShelfQ = 1,
  lowShelfDb = 1,
  lowFreq = 250,
  lowQ = 1,
  lowDb = 0,
  middleFreq = 1000,
  middleQ = 1,
  middleDb = 0,
  trebleFreq = 4000,
  trebleQ = 1,
  trebleDb = 0,
  hiShelfFreq = 100,
  hiShelfQ = 1,
  hiShelfDb = 1,
  gate = 1
  |
  var in, sig, env;
  env = Linen.kr(gate, 0.05, 1, 0.1, 2);
  in = In.ar(out, 2);
  sig = BLowShelf.ar(in, lowShelfFreq, lowShelfQ, lowShelfDb);
  sig = BPeakEQ.ar(sig, lowFreq, lowQ, lowDb);
  sig = BPeakEQ.ar(sig, middleFreq, middleQ, middleDb);
  sig = BPeakEQ.ar(sig, trebleFreq, trebleQ, trebleDb);
  sig = BHiShelf.ar(sig, hiShelfFreq, hiShelfQ, hiShelfDb);
  XOut.ar(out, env, sig);
}).add;

SynthDef(\eq5b, {
  |
  out = 0,
  lowShelfFreq = 100,
  lowShelfQ = 1,
  lowShelfDb = 1,
  lowFreq = 250,
  lowQ = 1,
  lowDb = 0,
  middleFreq = 1000,
  middleQ = 1,
  middleDb = 0,
  trebleFreq = 4000,
  trebleQ = 1,
  trebleDb = 0,
  hiShelfFreq = 100,
  hiShelfQ = 1,
  hiShelfDb = 1,
  gate = 1
  |
  var in, sig, env;
  env = Linen.kr(gate, 0.05, 1, 0.1, 2);
  in = In.ar(out, 2);
  sig = BLowShelf.ar(in, lowShelfFreq, lowShelfQ, lowShelfDb);
  sig = BPeakEQ.ar(sig, lowFreq, lowQ, lowDb);
  sig = BPeakEQ.ar(sig, middleFreq, middleQ, middleDb);
  sig = BPeakEQ.ar(sig, trebleFreq, trebleQ, trebleDb);
  sig = BHiShelf.ar(sig, hiShelfFreq, hiShelfQ, hiShelfDb);
  XOut.ar(out, env, sig);
}).add;
