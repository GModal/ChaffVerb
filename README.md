## ChaffVerb

An audio plugin utilizing pitch shifting, echo and reverb, *ChaffVerb* can create sounds that vary from shimmers to whale songs.

Plugins are provided in LV2, VST, VST3 and CLAP formats, compiled for Linux environments. With a working hvcc environment, the patch *should* compile for other systems.

### Parameters

  * **A: LFO Section**

     * LFO Period
        * The Low Freq Oscillator, time period


     * LFO Steps (Type2 LFO only)
        * The number of steps in the STEP LFO type. This is an integer value, but displayed as a float (limitation of hvcc).


     * LFO Steps Scale (Type 2)
        * A multiplier applied to the STEP LFO


     * LFO Switch
        * The Low Freq Oscillator, On/Off


     * LFO Type
        * The Low Freq Oscillator types: 
            * RAMP (0)
            * SINE (1)
            * STEP (2)
        * hvcc doesn't do integer controls, so these are floats: (0.0-0.99, 1.0-1.99, 2.0-2.99)

  * **B: General Shifts Section**

       * General Offset
          * A general offset added after the LFO
    
    
       * General Scale
          * A general multiplier after the LFO

  * **C: Random LFO Section**

       * Random LFO Offset
          * A random offset added after the general offset & scale
    
    
       * Random LFO Period
          * The random LFO, time period
    
    
       * Random LFO Scale
          * A random multiplier, after the general offset & scale
    
    
       * Random LFO Switch
          * The random LFO, On/Off

  * **D: Shift Transpose Section**
       * Shift Microtone
          * A float (+/-1.0)added to the transpose integer, for other intervals (although offsets and scalers do the same)
    
    
       * Shift Transpose
          * The base amount of pitch-shifting applied

  * **E: FX Level and Pitchshift Tuning Section**

       * FX Level
          * Volume of effect
    
    
       * HiPass Freq
          * High Pass filter applied before the echo/delay
    
    
       * Shift Delay
          * The delay applied during the pitch shift
    
    
       * Shift Window
          * The pitch shift "window." The window effects the quality of the shift effect. The larger the window, the better the quality. However, this increases the audio latency. The audio quality does begin to *noticably* degrade below 100 ms (but may or may not be acceptable above OR below that mark, depending on the frequency, the shift amount, and other effects such as reverb).
          * Due to the increased aliasing, smaller windows can be used for complex 'bell' type sounds.
    
  * **F: FX Delay Section**

       * FX Delay
          * Amt of echo/delay applied to the effect
    
    
       * FX Delay Feedback
          * Amt of echo/delay feedback

  * **Mix: Mixing Section**

       * Dry Mix
          * Amt of Dry signal mixed in
    
    
       * Dry Vol
          * Volume of the Dry signal
    
    
       * Reverb Level
          * Level (strength) of the reverb effect
    
    
       * Reverb Vol
          * Volume of the reverb effect

When a parameter placement seems counter-intuitive (**FX Level** is NOT in the Mix section), it's because like sections, parameters are generally sequencial.


### Example Patches

| Patch <br />Name  |  LFO <br />Period  |  LFO <br />Steps <br />Scale <br />(Type2)  |  LFO <br />Steps <br />(Type 2)  |  LFO <br />Switch  |  LFO <br />Type  |  General <br />Offset  |  General <br />Scale  |  Random <br />LFO <br />Offset  |  Random <br />LFO <br />Period  |  Random <br />LFO <br />Scale  |  Random <br />LFO <br />Switch  |  Shift <br />Microtone    |  Shift <br />Transpose    |  FX <br />Level  |  HiPass <br />Freq  |  Shift <br />Delay  |  Shift <br />Window  |  FX <br />Delay  |  FX <br />Delay <br />Feedback  |  Dry <br />Mix  |  Dry <br />Vol  |  Reverb <br />Level  |  Reverb <br />Vol  |
|:--------------|:-------------:|:--------------:|:--------------:|:---------------:|:--------------:|:------------------:|:-----------------:|:---------------:|:---------------:|:--------------:|:------------:|:-----------------:|:-----------------:|:----------------:|:-----------------:|:----------------:|:---------------:|:-----------------:|:-------------------:|:-------------------:|:----------------:|:--------------:|:--------------:|
|                 |  <u>A:</u>   |  <u>A:</u>          |  <u>A:</u>     |  <u>A:</u>   |  <u>A:</u> |  <u>B:</u>       |  <u>B:</u>      |  <u>C:</u>          |  <u>C:</u>          |  <u>C:</u>         |  <u>C:</u>   |  <u>D: </u>     |  <u>D</u>        |  <u>E:</u> |  <u>E:</u>    |  <u>E:</u>    |  <u>E:</u>     |  <u>F:</u> |  <u>F:</u>      |  <u>Mix:</u> |  <u>Mix:</u>  |  <u>Mix:</u>    |  <u>Mix:</u>   |
| Default         |  1500        |  1                  |  4             |  0           |  1         |  0               |  1              |  NA                 |  NA                 |  NA                |  0           |  0              |  16              |  0.7       |  2200         |  0            |  1000          |  500       |  0.65           |  0.45        |  0.1          |  0.75          |  0.55          |
| 2 Octave        |  NA          |  1                  |  4             |  0           |  0         |  0               |  1              |  NA                 |  NA                 |  NA                |  0           |  0              |  24              |  0.7       |  2200         |  0            |  1400          |  500       |  0.3            |  0.45        |  0.1          |  0.75          |  0.55          |
| Submare         |  1500        |  1                  |  4             |  1           |  0         |  0               |  -2             |  NA                 |  NA                 |  NA                |  0           |  0              |  -5              |  0.7       |  100          |  0            |  1400          |  500       |  0.9            |  0.45        |  0.1          |  0.5           |  0.3           |
| Shimmer         |  1500        |  1                  |  4             |  1           |  1         |  0.7             |  0.25           |  NA                 |  NA                 |  NA                |  0           |  0              |  36              |  0.7       |  1500         |  0            |  3100          |  500       |  0.65           |  0.45        |  0.1          |  0.92          |  0.25          |
| DeezBells       |  2040        |  0.6                |  6             |  1           |  2         |  0.05            |  -2             |  NA                 |  NA                 |  NA                |  0           |  0              |  36              |  0.6       |  900          |  0            |  330           |  675       |  0.75           |  0.45        |  0.1          |  0.85          |  0.3           |
| DeezRize        |  2040        |  1                  |  5             |  1           |  2         |  1               |  1.2            |  NA                 |  NA                 |  NA                |  0           |  0              |  12              |  0.7       |  500          |  0            |  3100          |  500       |  0.75           |  0.45        |  0.1          |  0.8           |  0.25          |
| subterr         |  1250        |  -0.9               |   5            |  1           |  2         |  0.89            |  0.4            |  1.4                |  495                |  -1.9              |  1           |  0              |  5               |  0.7       |  600          |  90           |  2000          |  500       |  0.85           |  0.45        |  0.1          |  0.85          |  0.35          |
| upterr          |  1250        |  -0.7               |  5             |  1           |  2         |  0.08            |  -1.96          |  -0.88              |  365                |  -1.2              |  1           |  0              |  5               |  0.6       |  800          |  130          |  475           |  670       |  0.75           |  0.45        |  0.1          |  0.85          |  0.27          |
| goldkaos        |  1250        |  -0.7               |  4             |  1           |  2         |  -0.24           |  5.9            |  1.7                |  240                |  -1.6              |  1           |  0              |  24              |  0.6       |  700          |  400          |  2200          |  700       |  0.87           |  0.33        |  0.05         |  0.58          |  0.45          |
| crickets        |  1250        |  5                  |  4             |  1           |  2         |  -0.24           |  5.95           |  1.7                |  240                |  2.8               |  1           |   0             |  -36             |  0.6       |  1600         |  270          |  2200          |  900       |  0.88           |  0.33        |  0.06         |  0.58          |  0.44          |

### Tips

  * Offsets, scalers and LFOs can interact in interesting ways. Pitch can ramp up or down in a direction that's contrary to expectations. Experimentation is good...
  * NA (Not Applicable) entries still display values. In it's current form, hvcc can't 'ghost out' unused controls. The 'NA' refers to an associated 'switch' parameter.
  * **Shift Transpose** and **Shift Microtone** (Section D) are really just another pair of offsets & multipliers, and like earlier offsets (and scaling), similarly effect the pitch shift.

### About ChaffVerb

ChaffVerb is based on a Pure Data patch, and built with the Heavy (hvcc) Pd compiler and the DISTRHO Plugin Framework. It also leans heavily on Miller Puckette's G09.pitchshift.pd patch (converted to abstraction) and the std Rev2~.pd reverb patch, with a few modifications.

The Pd source patch is also included, and the plugin should build for any other OS that supports the "modern" version of hvcc (modern being support for python3).

   * [Miller Puckette and Pure Data](http://msp.ucsd.edu/index.htm)
   * [hvcc, the 'Heavy' Pd compiler](https://github.com/Wasted-Audio/hvcc)
      * Qudos to [dromer](https://github.com/dromer) for updating the original EnzienAudio code to python3
   * [DPF - DISTRHO Plugin Framework](https://distrho.github.io/DPF/index.html)

No effort has been made to integrate a fancy GUI for the plugin.

ChaffVerb was written by Doug Garmon, and released under the MIT licence.

### Installing the prebuilds

The Releases section has a zip file with pre-built Linux plugin binaries. There's currently no installer, so just move the associated plugins to your home **.lv2**, **.vst**, and **.clap** directories. And the .vst3 directory as well, although I've not tested the VST3 version.

### Building ChaffVerb

Install the **heavy** compiler: (See the section on the 'namefix' version below FIRST, if that's desired.)
```
$ pip3 install hvcc
```
Clone the ChaffVerb source (and the DISTHRO Plugin Framework):

```
git clone --recursive https://github.com/GModal/ChaffVerb
```

Open a terminal (or cd to) the ChaffVerb directory, then enter:

`make`

There's a simple install option for local (single user) install:

`make install`

The plugin folders for each type must be present for install to work. These are named **.lv2**, **.vst**, and **.clap**, in your home directory. Each plugin can be manually copied to the local directories as well.

### The hvcc 'namefix' version (the release builds)

The release versions of ChaffVerb were built with a somewhat 'hacked' version of hvcc that allows inserting non-alphanumberic characters via codes in the Pd patch (characters which PureData itself wouldn't allow in send/receive arguments...well, some, at least. A dash character should be allowed, but it's not), and converts them for use in the hvcc-generated plugin interfaces.

This includes characters such as colon, dash, parenthesis, etc. Only four codes are currently supported, but it's simple to add more.

The source does NOT default to the 'namefix' version, however. It's a more complicated build process.

[Read the 'namefix' build instructions](hvcc_namefix.md)