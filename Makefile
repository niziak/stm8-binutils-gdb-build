DOCKER_IMAGE := "niziak/stm8-binutils"
DOCKER_CONTAINER := "stm8-binutils"


NPROCS:=1
OS:=$(shell uname -s)

ifeq ($(OS),Linux)
  NPROCS:=$(shell nproc)
endif

DR := docker run --rm=true --interactive=true --tty=false -v ${PWD}:/home/user/build --user $$(id -u $${USER}):$$(id -g $${USER}) --name $(DOCKER_CONTAINER) $(DOCKER_IMAGE) /bin/bash -c

docker_build: ./docker/Dockerfile
	docker build ./docker -t $(DOCKER_IMAGE)


patch:
	$(DR) "cd /home/user/build && ./patch_binutils.sh"

configure:
	$(DR) "cd /home/user/build && ./configure_binutils.sh"

build:
	$(DR) "cd /home/user/build/binutils-2.30 && make -j $(NPROCS)"


bash:
	$(DR) bash

test:
	$(DR) "gcc --version && whoami"