APP=zotero
APP_VERSION=6.0.30

include ../default.mk

APP_TARFILE=zotero-${APP_VERSION}.tar

${APP_TARFILE}:
	wget --output-document ${APP_TARFILE} "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=${APP_VERSION}"


${APP_PREFIX}/bin/zotero: ${APP_TARFILE}
	set -e
	tar xvf ${APP_TARFILE}
	mkdir -p ${APP_PREFIX}
	mv Zotero_linux-x86_64 ${APP_PREFIX}
	mkdir -p ${APP_PREFIX}/bin
	ln -sf ${APP_PREFIX}/zotero ${APP_PREFIX}/bin/zotero
	touch ${APP_PREFIX}/bin/zotero
