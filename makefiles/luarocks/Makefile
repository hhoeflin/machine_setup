.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/luarocks
VERSION=3.9.1

.PHONY: all

all: ${APP_PREFIX}/bin/luarocks

luarocks-${VERSION}.tar.gz:
	wget https://luarocks.org/releases/luarocks-${VERSION}.tar.gz

.PHONY: deps
deps:
	$(MAKE) -C ../lua

${APP_PREFIX}/bin/luarocks: luarocks-${VERSION}.tar.gz | deps
	set -e
	export PATH=${PREFIX}/lua/bin:${PATH}
	tar xvf luarocks-${VERSION}.tar.gz
	cd luarocks-${VERSION}
	./configure --prefix=${APP_PREFIX} --with-lua=${PREFIX}/lua
	make -j; make install

.PHONY: clean
clean:
	rm -f luarocks-${VERSION}.tar.gz
	rm -rf luarocks-${VERSION}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
