APP=luarocks
APP_VERSION=3.9.1

include ../default.mk

luarocks-${APP_VERSION}.tar.gz:
	wget https://luarocks.org/releases/luarocks-${APP_VERSION}.tar.gz

.PHONY: deps
deps:
	$(MAKE) -C ../lua

${BINARY_TARGET}: luarocks-${APP_VERSION}.tar.gz | deps
	set -e
	export PATH=${PREFIX}/lua/bin:${PATH}
	tar xvf luarocks-${APP_VERSION}.tar.gz
	cd luarocks-${APP_VERSION}
	./configure --prefix=${APP_PREFIX} --with-lua=${PREFIX}/lua
	make -j; make install
