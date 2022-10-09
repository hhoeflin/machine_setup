.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/zotero
VERSION=6.0.13
MODULE_PATH=${PREFIX}/modules/home/zotero/default.lua
APP_TARFILE=zotero-${VERSION}.tar

.PHONY: all

all: ${APP_PREFIX}/bin/zotero ${MODULE_PATH}

${APP_TARFILE}:
	wget --output-document ${APP_TARFILE} "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=${VERSION}"


${APP_PREFIX}/bin/zotero: ${APP_TARFILE}
	set -e
	tar xvf ${APP_TARFILE}
	mv Zotero_linux-x86_64 ${APP_PREFIX}
	mkdir -p ${APP_PREFIX}/bin
	ln -sf ${APP_PREFIX}/zotero ${APP_PREFIX}/bin/zotero
	touch ${APP_PREFIX}/bin/zotero

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
