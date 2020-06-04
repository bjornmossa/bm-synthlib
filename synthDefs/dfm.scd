SynthDef(\dfm_stereo, {
  |
  in,
  out = 0,
  freq = 800,
  res = 0.5,
  mix = 1
  |
  var inSig, processed;

  inSig = In.ar(in, 2);
  processed = DFM1.ar(inSig, freq, res);

  Out.ar(out, XFade2.ar(inSig, processed, mix));
}).add;