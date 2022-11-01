APP=sqlite3
APP_VERSION=3390400

include ../default.mk

APP_TARFILE=sqlite-autoconf-${APP_VERSION}.tar.gz

${APP_TARFILE}:
	wget https://sqlite.org/2022/${APP_TARFILE}

${BINARY_TARGET}: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd sqlite-autoconf-${APP_VERSION}
	mkdir -p ${APP_PREFIX}
	./configure --prefix=${APP_PREFIX}
	make -j && make install
