APP=angband
APP_VERSION=4.2.4
BINARY_TARGET=${PREFIX}/${APP}/games/angband

include ../default.mk

APP_TARFILE=${APP_VERSION}.tar.gz

${APP_TARFILE}:
	wget https://github.com/angband/angband/archive/refs/tags/${APP_TARFILE}

.PHONY: deps
deps:
	$(MAKE) -C ../ncurses

${BINARY_TARGET}: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd angband-${APP_VERSION}
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	./autogen.sh
	PKG_CONFIG_PATH="${PREFIX}/ncurses/lib/pkgconfig" ./configure --prefix=${APP_PREFIX} --enable-x11=False
	make -j && make install
