
all: hvcc plugins

PLUGIN = ChaffVerb

DEST_LV2 = .lv2
DEST_VST = .vst
DEST_CLAP = .clap
HM = ~/

plugins: hvcc
	$(foreach var, $(PLUGIN), make -C $(var)/ features;)
	$(foreach var, $(PLUGIN), make -C $(var)/ $(MAKECMDGOALS);)

hvcc:
	$(foreach var, $(PLUGIN), hvcc $(var).pd -n $(var) -m $(var).json -o $(var) -g dpf -p ./ ../heavylib;)

binmove:
	mkdir bin
	$(foreach var, $(PLUGIN), mv $(var)/bin/* bin/;)

install:
	rm -rf $(HM)$(DEST_LV2)/$(PLUGIN).lv2
	cp -r $(PLUGIN)/bin/$(PLUGIN).lv2 $(HM)$(DEST_LV2)/
	rm -rf $(HM)$(DEST_VST)/$(PLUGIN)-vst.so
	cp -r $(PLUGIN)/bin/$(PLUGIN)-vst.so $(HM)$(DEST_VST)/
	rm -rf $(HM)$(DEST_CLAP)/$(PLUGIN).clap
	cp -r $(PLUGIN)/bin/$(PLUGIN).clap $(HM)$(DEST_CLAP)/

modduo: all
modduox: all
moddwarf: all
