.ONESHELL:

SHELL=/bin/bash
# can define PREFIX from the outside, otherwise
ifndef PREFIX
PREFIX=${HOME}/.local/progs
endif

# with GLOBAL_MODULES can set a number of modules that should be loaded
# during compilation; will be picked up in lmod setup and module creation
ifdef GLOBAL_MODULES
export GLOBAL_MODULES
endif

AT_WORK ?= TRUE

export PREFIX

.PHONY: all clean uninstall
all clean uninstall:
	set -e
	# first we set up lmod
	$(MAKE) -C lua $@
	$(MAKE) -C luarocks $@
	$(MAKE) -C lmod $@
	# all subsequent installs can rely on lmod to set up dependencies
	$(MAKE) -C openssl $@
	$(MAKE) -C libevent $@
	$(MAKE) -C utf8proc $@
	$(MAKE) -C ncurses $@
	$(MAKE) -C tmux $@
	$(MAKE) -C mambaforge $@
	$(MAKE) -C golang $@
	$(MAKE) -C rust $@
	$(MAKE) -C cmake $@
	$(MAKE) -C git $@
	$(MAKE) -C nvim $@
	$(MAKE) -C pyenv $@
	$(MAKE) -C pipx $@
	$(MAKE) -C bzip2 $@
	$(MAKE) -C sqlite3 $@
	$(MAKE) -C python $@
	$(MAKE) -C zotero $@
	$(MAKE) -C buildg $@
	$(MAKE) -C libgit2 $@
	$(MAKE) -C exa $@
	$(MAKE) -C atuin $@
	$(MAKE) -C zoxide $@
	$(MAKE) -C bzip2 $@
	$(MAKE) -C nodejs $@
	$(MAKE) -C libmagic $@
	# $(MAKE) -C nnn $@
	# $(MAKE) -C purescript $@
	# rust apps
	$(MAKE) -C rust_app APP=bat APP_VERSION=0.22.1 $@
	$(MAKE) -C rust_app APP=broot APP_VERSION=1.20.2 $@
	$(MAKE) -C rust_app APP=ripgrep APP_BINARY=rg APP_VERSION=13.0.0 $@
	$(MAKE) -C rust_app APP=tealdeer APP_BINARY=tldr APP_VERSION=1.6.1 $@
	$(MAKE) -C rust_app APP=du-dust APP_BINARY=dust APP_VERSION=0.8.4 $@
	$(MAKE) -C rust_app APP=fd-find APP_BINARY=fd APP_VERSION=8.7.0 $@
	$(MAKE) -C rust_app APP=git-delta APP_BINARY=delta APP_VERSION=0.15.1 $@
	$(MAKE) -C rust_app APP=bottom APP_BINARY=btm APP_VERSION=0.8.0 $@
	$(MAKE) -C rust_app APP=starship APP_VERSION=1.13.1 $@
	$(MAKE) -C rust_app APP=tokei APP_VERSION=12.1.2 $@
	$(MAKE) -C rust_app APP=zellij APP_VERSION=0.36.0 $@
	# $(MAKE) -C rust_app APP=joshuto APP_VERSION=0.9.4 $@
	# go apps
	$(MAKE) -C go_app APP_URL=github.com/charmbracelet/glow APP_BINARY=glow APP_VERSION=1.5.0 $@
	$(MAKE) -C go_app APP_URL=github.com/muesli/duf APP_BINARY=duf APP_VERSION=0.8.1 $@
	$(MAKE) -C go_app APP_URL=github.com/go-task/task/v3/cmd/task APP_BINARY=task APP_VERSION=3.22.0 $@
	$(MAKE) -C go_app APP_URL=github.com/twpayne/chezmoi APP_BINARY=chezmoi APP_VERSION=latest $@
	$(MAKE) -C go_app APP_URL=github.com/jesseduffield/lazydocker APP_BINARY=lazydocker APP_VERSION=0.20.0 $@
	$(MAKE) -C lazygit
	$(MAKE) -C pistol
	$(MAKE) -C lf
	# pipx apps
	$(MAKE) -C pipx_app APP=isort $@
	$(MAKE) -C pipx_app APP=ruff $@
	$(MAKE) -C pipx_app APP=mypy $@
	$(MAKE) -C pipx_app APP=black $@
	# $(MAKE) -C pipx_app APP=ranger-fm APP_BINARY=ranger $@
	$(MAKE) -C pipx_app APP=python-lsp-server APP_BINARY=pylsp PIPX_INJECT='pylsp-mypy pyls-isort python-lsp-black pylsp-rope' $@
	# nodejs apps
	$(MAKE) -C nodejs_app APP=pyright APP_VERSION=1.1.298 $@
	# install the std_module
	$(MAKE) -C std_module $@
	# stop here if at work; below here only games
	if [ ${AT_WORK} = 'TRUE' ]; then exit 0; fi
	# text-based roguelikes
	$(MAKE) -C angband $@
	$(MAKE) -C brogueCE $@
