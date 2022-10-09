.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/ncurses
VERSION=6.3
MODULE_PATH=${PREFIX}/modules/home/ncurses/default.lua
APP_TARFILE=ncurses-${VERSION}.tar.gz

all: ${APP_PREFIX}/include/ncurses/ncurses.h ${MODULE_PATH}

${APP_TARFILE}:
	wget https://ftp.gnu.org/pub/gnu/ncurses/${APP_TARFILE}


${APP_PREFIX}/include/ncurses/ncurses.h: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd ncurses-${VERSION}/
	mkdir -p ${APP_PREFIX}/lib/pkgconfig
	./configure --prefix=${APP_PREFIX} --with-shared --with-termlib --enable-pc-files \
		--with-pkg-config-libdir=${APP_PREFIX}/lib/pkgconfig
	$(MAKE) -j && $(MAKE) install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -rf ncurses-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
