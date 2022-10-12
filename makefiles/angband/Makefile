.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/angband
VERSION=4.2.4
MODULE_PATH=${PREFIX}/modules/home/angband/default.lua
APP_TARFILE=${VERSION}.tar.gz

.PHONY: all

all: ${APP_PREFIX}/games/angband ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/angband/angband/archive/refs/tags/${APP_TARFILE}


.PHONY: deps
deps:
	$(MAKE) -C ../ncurses

${APP_PREFIX}/games/angband: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd angband-${VERSION}
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	./autogen.sh
	PKG_CONFIG_PATH="${PREFIX}/ncurses/lib/pkgconfig" ./configure --prefix=${APP_PREFIX} --enable-x11=False
	make -j && make install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}


.PHONY: clean
clean:
	rm -rf angband-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
