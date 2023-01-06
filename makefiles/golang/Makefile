APP=golang
APP_VERSION=1.19.2
APP_BINARY=go

include ../default.mk

APP_TARFILE=go${APP_VERSION}.linux-amd64.tar.gz


${APP_TARFILE}:
	wget https://go.dev/dl/${APP_TARFILE}


${BINARY_TARGET}: ${APP_TARFILE}
	mkdir -p ${APP_PREFIX}
	tar zxvf ${APP_TARFILE} --directory ${APP_PREFIX} --strip-components=1
	touch ${BINARY_TARGET}
