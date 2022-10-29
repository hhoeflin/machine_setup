APP=go
APP_VERSION=1.19.2

include ../default.mk

APP_TARFILE=go${APP_VERSION}.linux-amd64.tar.gz


${APP_TARFILE}:
	wget https://go.dev/dl/${APP_TARFILE}


${BINARY_TARGET}: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE} --directory ${PREFIX}
	touch ${BINARY_TARGET}
