.PHONY: docker

docker:
	 DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile_ubuntu .
