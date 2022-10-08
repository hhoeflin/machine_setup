# use one shell and exit on first error of a command
.ONESHELL:
.SHELLFLAGS = -ce
SHELL=/bin/bash

# variables used
HOMEBREW_DIR = ${HOME}/homebrew
HOMEBREW_BIN = ${HOMEBREW_DIR}/bin
BREW_CMD = ${HOMEBREW_BIN}/brew
activate_brew = eval $$(${HOMEBREW_BIN}/brew shellenv)

.PHONY: homebrew_targets all

all: homebrew_targets

# specify the targets from brew
# this can more easily be done with the brewfile
direct_targets:=
direct_target_paths:= $(foreach name, $(direct_targets), ${HOMEBREW_BIN}/$(name))

homebrew_targets: ${HOMEBREW_BIN}/starship ${HOMEBREW_DIR}/opt/lmod/init/profile $(direct_target_paths) Brewfile.lock.json

Brewfile.lock.json: Brewfile
	$(activate_brew)
	${BREW_CMD} bundle install

$(direct_target_paths): %: ${BREW_CMD}
	$(activate_brew)
	${BREW_CMD} install $$(basename $@)

# need to use this as an unnecessary dependency fails to install
${HOMEBREW_BIN}/starship: ${BREW_CMD} Brewfile.lock.json
	$(activate_brew)
	${BREW_CMD} install --ignore-dependencies starship
	touch $@

${HOMEBREW_DIR}/opt/lmod/init/profile: ${BREW_CMD} Brewfile.lock.json
	$(activate_brew)
	${BREW_CMD} install --ignore-dependencies lmod
	touch $@

${HOMEBREW_DIR}/bin/brew :
	git clone https://github.com/Homebrew/brew ${HOMEBREW_DIR}
	$(activate_brew)
	${BREW_CMD} update --force --quiet
