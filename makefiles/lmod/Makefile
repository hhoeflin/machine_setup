.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/lmod
VERSION=8.7.13
LUAROCKS_PREFIX=${PREFIX}/luarocks
LUA_VERSION=$(shell ${PREFIX}/lua/bin/lua -e "print(_VERSION)" | cut --characters=5-7)

.PHONY: all

all: ${APP_PREFIX}/lmod/init/profile

${VERSION}.tar.gz:
	wget https://github.com/TACC/Lmod/archive/refs/tags/${VERSION}.tar.gz

.PHONY: deps
deps:
	$(MAKE) -C ../luarocks

${APP_PREFIX}/lmod/init/profile: ${VERSION}.tar.gz | deps
	set -e
	export PATH=${PREFIX}/lua/bin:${PREFIX}/bin/luarocks:${PATH}
	export LUA_PATH="${LUAROCKS_PREFIX}/share/lua/${LUA_VERSION}/?.lua;${LUAROCKS_PREFIX}/share/lua/${LUA_VERSION}/?/init.lua;;"
	export LUA_CPATH="${LUAROCKS_PREFIX}/lib/lua/${LUA_VERSION}/?.so;;"
	${LUAROCKS_PREFIX}/bin/luarocks install luaposix
	tar xvf ${VERSION}.tar.gz
	cd Lmod-${VERSION}
	./configure --prefix=${PREFIX} --with-fastTCLInterp=no
	make -j; make install

.PHONY: clean
clean:
	rm -f ${VERSION}.tar.gz
	rm -rf Lmod-${VERSION}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
