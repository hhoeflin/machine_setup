.ONESHELL:
.PHONY: docker

all: docker

docker: docker/Dockerfile_ubuntu
	 DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile_ubuntu .

docker/Dockerfile_ubuntu: makefiles/Makefile docker/Dockerfile_head_ubuntu docker/create_dockerfile.py
	mamba activate docker/conda_env
	python docker/create_dockerfile.py makefiles/Makefile docker/Dockerfile_head_ubuntu docker/Dockerfile_ubuntu
	mamba deactivate
