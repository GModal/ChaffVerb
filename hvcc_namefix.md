<!---
Markdown
-->

### The hvcc 'namefix' version (the ChaffVerb release builds)

The release versions of ChaffVerb were built with a somewhat 'hacked' version of hvcc that allows inserting non-alphanumberic characters via codes in the Pd patch (characters which PureData itself wouldn't allow in send/receive arguments...well, some, at least. A dash character should be allowed, but it's not), and converts them for use in the hvcc-generated plugin interfaces.

This includes characters such as colon, dash, parenthesis, etc. Only four codes are currently supported, but it's simple to add more.

### Use

The insertion codes are numbers (1-4) with double-underscores before:
```
   __1      ":"
   __2      "-"
   __3      "("
   __4      ")"
```

Example-- a Pd receive object with this argument... :
```
    r A__1_LFO_Steps_Scale___3Type2__4 @hv_param -5 5 1
```

...would generate a parameter label name of:
```
   A: LFO_Steps_Scale (Type2)
```

The standard patch omits the namefix codes and inserts an extra space instead.  The receive objects look like this:
```
    r A__LFO_Steps_Scale__Type2 @hv_param -5 5 1
```

It generates a usable, but slightly harder to read, label of:
```
   A  LFO_Steps_Scale  Type2
```


### Installing 'namefix' in hvcc

**At this writing, the hvcc version is v0.6.3, and the patch will work if HeavyDPF.cpp remains unchanged.**

First, install hvcc from the repository. Create a directory for the source code, open a terminal in that folder, then clone the repo:

Here are the instructions copied from the site :

```
     If you want to develop hvcc you can install it from the source directory:
     $ git clone https://github.com/Wasted-Audio/hvcc.git
     $ cd hvcc/
     $ pip3 install -e .
```

Once installed, python should link to that local folder. Any changes made to the code should be 'live' immediately. DON'T move the installation to another location--it won't be linked.

#### Patch hvcc

The following patches the DISTRHO plugin generator code in the hvcc repository. From the ChaffVerb directory (cloned), in the 'hvcc_namefix' folder, copy the Pd patch to the parent dir (replacing 'ChaffVerb.pd').

Now copy the 'HeavyDPF.patch' file to:
```
     <local clone of hvcc>/hvcc/generators/c2dpf/templates
```

The contents of which should be:
```
   DistrhoPluginInfo.h
   HeavyDPF.cpp
   HeavyDPF.hpp
   Makefile
   Makefile.project
```

And from a terminal (in that folder), enter:
```
     patch HeavyDPF.cpp HeavyDPF.patch
```

That's it. The non-namefix version of the Pd patch is standard, and will work with the stock hvcc code, OR with the hacked hvcc.