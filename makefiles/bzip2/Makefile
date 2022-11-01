APP=bzip2
APP_VERSION=1.0.8

include ../default.mk

APP_TARFILE=bzip2-${APP_VERSION}.tar.gz

${APP_TARFILE}:
	wget https://sourceware.org/pub/bzip2/${APP_TARFILE}

${BINARY_TARGET}: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd bzip2-${APP_VERSION}
	mkdir -p ${APP_PREFIX}
	make -f Makefile-libbz2_so
	make
	make install PREFIX=${APP_PREFIX}
	cp libbz2.so.${APP_VERSION} ${APP_PREFIX}/lib/
	cd ${APP_PREFIX}/lib
	ln -s libbz2.so.${APP_VERSION} libbz2.so.1.0
