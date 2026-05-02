.PHONY: clean extract_brew_home

APPTAINER_BUILD = env -i PATH=$(PATH) sudo apptainer build --force
BREW_OUTPUT_DIR ?= $(PWD)

00_rocky9_base.sif: 00_rocky9_base.def 00_bashrc.sh
	$(APPTAINER_BUILD) 00_rocky9_base.sif 00_rocky9_base.def

10_homebrew_default.sif: 10_homebrew_template.def 00_rocky9_base.sif
	sed -e "s|__HOMEBREW_PREFIX__|/home/linuxbrew/.linuxbrew|g" 10_homebrew_template.def > 10_homebrew_default.def
	$(APPTAINER_BUILD) 10_homebrew_default.sif 10_homebrew_default.def

10_homebrew_home.sif: 10_homebrew_template.def 00_rocky9_base.sif
	sed -e "s|__HOMEBREW_PREFIX__|${HOME}/.linuxbrew|g" 10_homebrew_template.def > 10_homebrew_home.def
	$(APPTAINER_BUILD) 10_homebrew_home.sif 10_homebrew_home.def

20_brew_bundle_default.sif: 20_brew_bundle_template.def 10_homebrew_default.sif
	sed -e "s|__BASE_IMAGE__|10_homebrew_default.sif|g" 20_brew_bundle_template.def > 20_brew_bundle_default.def
	$(APPTAINER_BUILD) 20_brew_bundle.sif 20_brew_bundle_default.def

20_brew_bundle_home.sif: 20_brew_bundle_template.def 10_homebrew_home.sif
	sed -e "s|__BASE_IMAGE__|10_homebrew_home.sif|g" 20_brew_bundle_template.def > 20_brew_bundle_home.def
	$(APPTAINER_BUILD) 20_brew_bundle_home.sif 20_brew_bundle_home.def

extract_brew_home: 20_brew_bundle_home.sif
	apptainer exec --no-home \
		--bind $(BREW_OUTPUT_DIR):/brew_output \
		20_brew_bundle_home.sif \
		tar -czf /brew_output/linuxbrew.tar.gz $(HOME)/.linuxbrew

clean:
	rm -f 10_homebrew_default.def
	rm -f 10_homebrew_home.def
	rm -f 20_brew_bundle_default.def
	rm -f 20_brew_bundle_home.def
