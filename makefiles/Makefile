.ONESHELL:
SHELL=/bin/bash
# can define PREFIX from the outside, otherwise
ifndef PREFIX
PREFIX=${HOME}/.stow
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
	$(MAKE) -C zotero $@
	$(MAKE) -C buildg $@
	$(MAKE) -C libgit2 $@
	$(MAKE) -C exa $@
	$(MAKE) -C atuin $@
	$(MAKE) -C zoxide $@
	$(MAKE) -C bzip2 $@
	$(MAKE) -C python $@
	# rust apps
	$(MAKE) -C rust_app APP=bat $@
	$(MAKE) -C rust_app APP=broot $@
	$(MAKE) -C rust_app APP=ripgrep APP_BINARY=rg $@
	$(MAKE) -C rust_app APP=tealdeer APP_BINARY=tldr $@
	$(MAKE) -C rust_app APP=du-dust APP_BINARY=dust $@
	$(MAKE) -C rust_app APP=fd-find APP_BINARY=fd $@
	$(MAKE) -C rust_app APP=git-delta APP_BINARY=delta $@
	$(MAKE) -C rust_app APP=bottom APP_BINARY=btm $@
	$(MAKE) -C rust_app APP=mcfly APP_BINARY=mcfly $@
	$(MAKE) -C rust_app APP=starship $@
	# go apps
	$(MAKE) -C go_app APP_URL=github.com/charmbracelet/glow APP_BINARY=glow $@
	$(MAKE) -C go_app APP_URL=github.com/muesli/duf APP_BINARY=duf $@
	$(MAKE) -C go_app APP_URL=github.com/go-task/task/v3/cmd/task APP_BINARY=task $@
	$(MAKE) -C go_app APP_URL=github.com/twpayne/chezmoi APP_BINARY=chezmoi $@
	# go app with custom module
	$(MAKE) -C lazygit $@
	# pipx apps
	$(MAKE) -C pipx_app APP=isort $@
	$(MAKE) -C pipx_app APP=mypy $@
	$(MAKE) -C pipx_app APP=black $@
	$(MAKE) -C pipx_app APP=ranger-fm APP_BINARY=ranger $@
	$(MAKE) -C pipx_app APP=python-lsp-server APP_BINARY=pylsp \
		PIPX_INJECT='pylsp-mypy pyls-isort python-lsp-black pylsp-rope' $@
	# nodejs apps
	$(MAKE) -C nodejs_app APP=pyright $@
	# install the std_module
	$(MAKE) -C std_module $@

	# stop here if at work; below here only games
	if [ ${AT_WORK} = 'TRUE' ]; then exit 0; fi
	# text-based roguelikes
	$(MAKE) -C angband $@
	$(MAKE) -C brogueCE $@
