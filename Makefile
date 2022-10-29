.ONESHELL:
.PHONY: docker
SHELL=/bin/bash

PREFIX=~/.stow

all: docker all-stow

docker: docker/Dockerfile_ubuntu
	 DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile_ubuntu .

include makefiles/lmod/setup_lmod.mk

docker/Dockerfile_ubuntu: makefiles/Makefile docker/Dockerfile_head_ubuntu docker/create_dockerfile.py
	${INIT_LMOD}
	ml home/mambaforge
	mamba activate docker/conda_env
	python docker/create_dockerfile.py makefiles/Makefile docker/Dockerfile_head_ubuntu docker/Dockerfile_ubuntu
	mamba deactivate

progs=openssl libevent ncurses tmux mambaforge golang rust cmake \
	  git nvim pyenv pipx zotero buildg lua luarocks libgit2 exa stow \
	  bat broot ripgrep tealdeer zoxide du-dust fd-find git-delta \
	  bottom mcfly starship glow lazygit duf task chezmoi \
	  isort mypy black pyright python angband brogueCE

all-stow-targets:= $(foreach prog, ${progs}, stow-${prog})
all-unstow-targets:= $(foreach prog, ${progs}, unstow-${prog})

all-stow: $(all-stow-targets)
all-unstow: $(all-unstow-targets)

STOW_SRC=${HOME}/.stow
STOW_TGT=${HOME}/stowed
stow-%:
	mkdir -p ${STOW_TGT}/bin
	mkdir -p ${STOW_TGT}/lib
	mkdir -p ${STOW_TGT}/lib/pkgconfig
	for file in ${STOW_SRC}/$*/bin/*; do if [ -f $$file ]; then echo $$file; ln -s -f -T $$file ${STOW_TGT}/bin/$$(basename $$file); fi; done
	for file in ${STOW_SRC}/$*/lib/*; do if [ -f $$file ]; then echo $$file; ln -s -f -T $$file ${STOW_TGT}/lib/$$(basename $$file); fi; done
	for file in ${STOW_SRC}/$*/lib/pkgconfig/*; do if [ -f $$file ]; then echo $$file; ln -s -f -T $$file ${STOW_TGT}/lib/pkgconfig/$$(basename $$file); fi; done

unstow-%:
	for file in ${STOW_SRC}/$*/bin/*; do if [ -f $$file ]; then echo $$file; rm -f ${STOW_TGT}/bin/$$(basename $$file); fi; done
	for file in ${STOW_SRC}/$*/lib/*; do if [ -f $$file ]; then echo $$file; rm -f ${STOW_TGT}/lib/$$(basename $$file); fi; done
	for file in ${STOW_SRC}/$*/lib/pkgconfig/*; do if [ -f $$file ]; then echo $$file; rm -f ${STOW_TGT}/lib/pkgconfig/$$(basename $$file); fi; done
