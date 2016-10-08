#
# Makefile for docker-go build environment
#
# push requires VERSION and REGISTRY to be set as environment variables
#

include MANIFEST

REGISTRY=rbock44

USERNAME := $(shell whoami)
UID := $(shell id -u $(USERNAME))

DOCKER_BUILD_RUN_CMD=docker run --rm -u $(UID) -v $(CURDIR):/usr/app -w /usr/app $(IMAGE)


all: build package test

.PHONY: build
build:
	@echo no build required

.PHONY: prepare
prepare: build

.PHONY: package
package:
	docker build --no-cache -t $(IMAGE) .

.PHONY: test
test:
	$(DOCKER_BUILD_RUN_CMD) version | grep $(VERSION)

.PHONY: push
push:
	docker tag $(IMAGE) $(REGISTRY)/$(IMAGE)
	docker push $(REGISTRY)/$(IMAGE)
