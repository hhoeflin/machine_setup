APP=hledger
APP_VERSION=1.34

include ../default.mk

APP_ZIPFILE=hledger-linux-x64.tar.gz

${APP_ZIPFILE}:
	wget https://github.com/simonmichael/hledger/releases/download/${APP_VERSION}/${APP_ZIPFILE}


${BINARY_TARGET}: ${APP_ZIPFILE}
	tar xvf ${APP_ZIPFILE}
	mkdir -p ${APP_PREFIX}/bin
	mv hledger ${APP_PREFIX}/bin
	mv hledger-ui ${APP_PREFIX}/bin
	mv hledger-web ${APP_PREFIX}/bin
