APP=buildg
APP_VERSION=0.4.1

include ../default.mk

APP_TARFILE=buildg-full-v${APP_VERSION}-linux-amd64.tar.gz

${APP_TARFILE}:
	wget https://github.com/ktock/buildg/releases/download/v${APP_VERSION}/${APP_TARFILE}


${APP_PREFIX}/bin/buildg: ${APP_TARFILE}
	set -e
	mkdir -p ${APP_PREFIX}
	tar xvf ${APP_TARFILE} --directory=${APP_PREFIX}
	touch ${APP_PREFIX}/bin/buildg
