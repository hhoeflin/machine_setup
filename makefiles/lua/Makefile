APP=lua
APP_VERSION=5.4.4

include ../default.mk

lua-${APP_VERSION}.tar.gz:
	wget https://www.lua.org/ftp/lua-${APP_VERSION}.tar.gz

${BINARY_TARGET}: lua-${APP_VERSION}.tar.gz
	set -e
	tar xvf lua-${APP_VERSION}.tar.gz
	cd lua-${APP_VERSION}
	make all install INSTALL_TOP=${APP_PREFIX}
