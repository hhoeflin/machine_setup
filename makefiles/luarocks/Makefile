APP=luarocks
APP_VERSION=3.9.1

include ../funcs.mk
include ../default.mk

luarocks-${APP_VERSION}.tar.gz:
	wget https://luarocks.org/releases/luarocks-${APP_VERSION}.tar.gz

.PHONY: deps
deps:
	$(MAKE) -C ../lua

LUA_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/lua)

${BINARY_TARGET}: luarocks-${APP_VERSION}.tar.gz | deps
	set -e
	export PATH=${LUA_PREFIX}/bin:${PATH}
	tar xvf luarocks-${APP_VERSION}.tar.gz
	cd luarocks-${APP_VERSION}
	./configure --prefix=${APP_PREFIX} --with-lua=${LUA_PREFIX}
	make -j; make install
