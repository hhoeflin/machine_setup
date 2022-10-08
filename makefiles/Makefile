.ONESHELL:

PREFIX=${HOME}/.local
export PREFIX

.PHONY: all clean uninstall
all clean uninstall:
	set -e
	$(MAKE) -C libevent $@
	$(MAKE) -C ncurses $@
	$(MAKE) -C tmux $@
	$(MAKE) -C mambaforge $@
	$(MAKE) -C golang $@
	$(MAKE) -C rust $@
	$(MAKE) -C cmake $@
	$(MAKE) -C git $@
	$(MAKE) -C neovim $@
	$(MAKE) -C openssl $@
	$(MAKE) -C pyenv $@
	$(MAKE) -C pipx $@
	$(MAKE) -C zotero $@
	$(MAKE) -C buildg $@
	$(MAKE) -C lua $@
	$(MAKE) -C luarocks $@
	$(MAKE) -C lmod $@
	$(MAKE) -C libgit2 $@
	$(MAKE) -C exa $@
	# rust apps
	$(MAKE) -C rust_app APP=bat $@
	$(MAKE) -C rust_app APP=broot $@
	$(MAKE) -C rust_app APP=ripgrep APP_BINARY=rg $@
	$(MAKE) -C rust_app APP=tealdeer APP_BINARY=tldr $@
	$(MAKE) -C rust_app APP=zoxide $@
	$(MAKE) -C rust_app APP=du-dust APP_BINARY=dust $@
	$(MAKE) -C rust_app APP=fd-find APP_BINARY=fd $@
	$(MAKE) -C rust_app APP=git-delta APP_BINARY=delta $@
	$(MAKE) -C rust_app APP=bottom APP_BINARY=btm $@
	$(MAKE) -C rust_app APP=mcfly APP_BINARY=mcfly $@
	$(MAKE) -C rust_app APP=starship $@
	# go apps
	$(MAKE) -C go_app APP_URL=github.com/charmbracelet/glow@latest APP_BINARY=glow $@
	$(MAKE) -C go_app APP_URL=github.com/jesseduffield/lazygit@latest APP_BINARY=lazygit $@
	$(MAKE) -C go_app APP_URL=github.com/muesli/duf@latest APP_BINARY=duf $@
	$(MAKE) -C go_app APP_URL=github.com/go-task/task/v3/cmd/task@latest APP_BINARY=task $@
	$(MAKE) -C go_app APP_URL=github.com/twpayne/chezmoi@latest APP_BINARY=chezmoi $@
	# pipx apps
	$(MAKE) -C pipx_app APP=isort $@
	$(MAKE) -C pipx_app APP=mypy $@
	$(MAKE) -C pipx_app APP=black $@
	$(MAKE) -C pipx_app APP=pyright $@
