SynthDef(\jpverb, {
  |
  in,
  out = 0,
  mix = 1,
  t60 = 0.5,
  damp = 0,
  size = 1
  |
  var inSig, processed;

  inSig = In.ar(in, 2);
  processed = JPverb.ar(inSig, t60, damp, size);

  Out.ar(out, XFade2.ar(inSig, processed, mix));
}).add;