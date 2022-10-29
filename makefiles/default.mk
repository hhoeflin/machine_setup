.ONESHELL:
.DEFAULT_GOAL = all
SHELL=/bin/bash

ifndef PREFIX
$(error PREFIX is not set)
endif
export PREFIX

ifndef APP
$(error APP is not set)
endif

# set APP_VERSION to latest if not otherwise set
APP_VERSION ?= latest
# module category is home if not otherwise set
MODULE_CATEG ?= home
# default location for the MODULE_ROOT if not otherwise set
MODULE_ROOT ?= ${PREFIX}/modules

# set the paths for installation and modules but make them overwritable
ifdef MULTI_VERSION
APP_PREFIX ?= ${PREFIX}/${APP}/${APP_VERSION}
MODULE_PATH ?= ${MODULE_ROOT}/${MODULE_CATEG}/${APP}/${APP_VERSION}.lua
else
APP_PREFIX ?= ${PREFIX}/${APP}
MODULE_PATH ?= ${MODULE_ROOT}/${MODULE_CATEG}/${APP}/sole.lua
endif

# default app-binary is named like the app
APP_BINARY ?= ${APP}

# set the default binary target
BINARY_TARGET ?= ${APP_PREFIX}/bin/${APP_BINARY}

# set the default target for all
ifndef OMIT_ALL
.PHONY: all
all:  ${BINARY_TARGET} ${MODULE_PATH}
endif

# default uninstall target
ifndef OMIT_UNINSTALL
.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
endif

# default clean target
ifndef OMIT_CLEAN
.PHONY: clean
clean:
	rm -rf !(Makefile|module_template)
endif

# set the default way of writing the module
ifndef CUSTOM_MODULE
${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} APP=${APP} APP_VERSION=${APP_VERSION} \
		envsubst '$$APP_PREFIX $$APP $$APP_VERSION' < module_template > ${MODULE_PATH}
endif
