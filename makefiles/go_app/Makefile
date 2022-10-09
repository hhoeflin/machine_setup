.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif
export PREFIX

ifndef APP_URL
$(error APP is not set)
endif

ifndef VERSION
VERSION=latest
endif

ifndef APP_BINARY
$(error APP_BINARY is not set)
endif

APP=$(shell basename ${APP_URL})
APP_PREFIX=${PREFIX}/${APP}
MODULE_PATH=${PREFIX}/modules/home/${APP}/default.lua
GOBIN=${APP_PREFIX}/bin
GO=${PREFIX}/go/bin/go
export GOBIN

.PHONY: all
all: ${GOBIN}/${APP_BINARY} ${MODULE_PATH}

.PHONY: deps
	$(MAKE) -C ../golang

${GOBIN}/${APP_BINARY}: | deps
	mkdir -p $$(dirname ${GOBIN})
	$(GO) install ${APP_URL}@${VERSION}

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} APP=${APP} envsubst '$$APP_PREFIX $$APP' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	rm -f ${GOBIN}/APP_BINARY
	rm -f ${MODULE_PATH}
