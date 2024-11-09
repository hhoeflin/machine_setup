APP=ncurses
APP_VERSION=6.5
OMIT_ALL=True

include ../default.mk

APP_TARFILE=ncurses-${APP_VERSION}.tar.gz

all: ${APP_PREFIX}/include/ncursesw/ncurses.h ${MODULE_PATH}

${APP_TARFILE}:
	wget https://ftp.gnu.org/pub/gnu/ncurses/${APP_TARFILE}


${APP_PREFIX}/include/ncursesw/ncurses.h: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd ncurses-${APP_VERSION}/
	mkdir -p ${APP_PREFIX}/lib/pkgconfig
	./configure --prefix=${APP_PREFIX} --with-shared --enable-pc-files --enable-widec --without-debug --enable-symlinks \
		--with-pkg-config-libdir=${APP_PREFIX}/lib/pkgconfig
	$(MAKE) -j && $(MAKE) install
