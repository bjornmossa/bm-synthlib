SynthDef(\mono_sampler, {
  |out = 0, bufn = 0, dur, loop = 0, amp = 1, pan = 0, rate = 1, filtFreq = 2000|
  var sig, env;
  env = Line.kr(1, 1, dur - 0.01, doneAction: 2);
  sig = PlayBuf.ar(1, bufn, BufRateScale.kr(bufn) * rate, loop: 0, doneAction: 2);
  sig = LPF.ar(sig, filtFreq);
  sig = Pan2.ar(sig, pan);
  Out.ar(out, (sig * env) * amp);
}).add;