# Golang Docker Image 

customizes golang the way is should be used including preferred vendoring tool.

The src folder is passed as a volume. The user id should be set the the user id of the user execution the docker container to retain the owner and group of the compiled binaries written to the host folder.

A sample Makefile snippet is shown below:

SRC=src/my-project

USERNAME := $(shell whoami)
UID := $(shell id -u $(USERNAME))

DOCKER_BUILD_RUN_CMD=docker run --rm -u $(UID) -v $(CURDIR):/usr/app -w /usr/app $(REGISTRY)/golang:1.7.1



