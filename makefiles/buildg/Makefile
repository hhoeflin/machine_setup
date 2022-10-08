.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/buildg
VERSION=0.4.1
MODULE_PATH=${PREFIX}/modules/home/buildg/default.lua
APP_TARFILE=buildg-full-v${VERSION}-linux-amd64.tar.gz

.PHONY: all

all: ${APP_PREFIX}/bin/buildg ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/ktock/buildg/releases/download/v${VERSION}/${APP_TARFILE}


${APP_PREFIX}/bin/buildg: ${APP_TARFILE}
	set -e
	mkdir -p ${APP_PREFIX}
	tar xvf ${APP_TARFILE} --directory=${APP_PREFIX}
	touch ${APP_PREFIX}/bin/buildg

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
