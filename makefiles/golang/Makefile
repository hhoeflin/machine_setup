.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/go
VERSION=1.19.2
MODULE_PATH=${PREFIX}/modules/home/golang/default.lua
APP_TARFILE=go${VERSION}.linux-amd64.tar.gz

.PHONY: all
all: ${APP_PREFIX}/bin/go ${MODULE_PATH}

${APP_TARFILE}:
	wget https://go.dev/dl/${APP_TARFILE}


${APP_PREFIX}/bin/go: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE} --directory ${PREFIX}
	touch ${APP_PREFIX}/bin/go

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
