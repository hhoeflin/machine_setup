APP=lmod
APP_VERSION=8.7.13
OMIT_ALL=True

include ../default.mk

LUAROCKS_PREFIX=${PREFIX}/luarocks
LUA_VERSION=$(shell ${PREFIX}/lua/bin/lua -e "print(_VERSION)" | cut --characters=5-7)

.PHONY: all
all: ${APP_PREFIX}/lmod/init/profile

${APP_VERSION}.tar.gz:
	wget https://github.com/TACC/Lmod/archive/refs/tags/${APP_VERSION}.tar.gz

.PHONY: deps
deps:
	$(MAKE) -C ../luarocks

${APP_PREFIX}/lmod/init/profile: ${APP_VERSION}.tar.gz | deps
	set -e
	export PATH=${PREFIX}/lua/bin:${PREFIX}/bin/luarocks:${PATH}
	export LUA_PATH="${LUAROCKS_PREFIX}/share/lua/${LUA_VERSION}/?.lua;${LUAROCKS_PREFIX}/share/lua/${LUA_VERSION}/?/init.lua;;"
	export LUA_CPATH="${LUAROCKS_PREFIX}/lib/lua/${LUA_VERSION}/?.so;;"
	${LUAROCKS_PREFIX}/bin/luarocks install luaposix
	tar xvf ${APP_VERSION}.tar.gz
	cd Lmod-${APP_VERSION}
	./configure --prefix=${PREFIX} --with-fastTCLInterp=no
	make -j; make install
