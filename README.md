# ChaffVerb
An audio plugin utilizing pitch shifting, echo and reverb, for creating sounds from shimmers to whale songs. 

ChaffVerb is based on a Pure Data patch, and built with the Heavy (hvcc) Pd compiler. It leans heavily on Miller Puckette's G09.pitchshift.pd patch (converted to abstraction) and the std Rev2~.pd reverb patch, with a few modifications.

It's provided in LV2, VST, VST3 and CLAP formats, for Linux environments. The Pd source patch is also included, and the pluging should build for any other OS that supports the "modern" version of hvcc.
