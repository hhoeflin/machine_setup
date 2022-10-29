.ONESHELL:
.DEFAULT_GOAL = all
SHELL=/bin/bash

ifndef PREFIX
$(error PREFIX is not set)
endif
export PREFIX
MODULE_ROOT ?= ${PREFIX}/modules

MODULE_PATH=${MODULE_ROOT}/home/std.lua


.PHONY: all uninstall clean
all: ${PREFIX}/modules/home/std.lua

${MODULE_ROOT}/home/std.lua: std_module.lua
	cp ./std_module.lua ${MODULE_PATH}

clean:
	echo "Nothing to clean."

uninstall:
	rm -f ${MODULE_PATH}
