.ONESHELL:
.PHONY: docker
SHELL=/bin/bash

all: docker

docker: docker/Dockerfile_ubuntu
	 DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile_ubuntu .

include makefiles/lmod/setup_lmod.mk

docker/Dockerfile_ubuntu: makefiles/Makefile docker/Dockerfile_head_ubuntu docker/create_dockerfile.py
	${INIT_LMOD}
	ml home/mambaforge
	mamba activate docker/conda_env
	python docker/create_dockerfile.py makefiles/Makefile docker/Dockerfile_head_ubuntu docker/Dockerfile_ubuntu
	mamba deactivate

