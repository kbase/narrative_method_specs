
NMS_URL ?= ci

TOP_DIR = $(shell python -c "import os.path as p; print p.abspath('../..')")

TOP_DIR_NAME = $(shell basename $(TOP_DIR))

DIR = $(shell pwd)

default: 

submodule-init:
	git submodule init
	git submodule update

test: submodule-init
	make -C narrative_method_store build-nms-bin
	./narrative_method_store/bin/nms-validate --url $(NMS_URL)