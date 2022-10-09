.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/lua
VERSION=5.4.4

.PHONY: all

all: ${APP_PREFIX}/bin/lua

lua-${VERSION}.tar.gz:
	wget https://www.lua.org/ftp/lua-${VERSION}.tar.gz


${APP_PREFIX}/bin/lua: lua-${VERSION}.tar.gz
	set -e
	tar xvf lua-${VERSION}.tar.gz
	cd lua-${VERSION}
	make all install INSTALL_TOP=${APP_PREFIX}

.PHONY: clean
clean:
	rm -f lua-${VERSION}.tar.gz
	rm -rf lua-${VERSION}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
