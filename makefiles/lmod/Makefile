APP=lmod
APP_VERSION=8.7.53
OMIT_ALL=True

include ../funcs.mk
include ../default.mk

LUAROCKS_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/luarocks)
LUA_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/lua)
LUA_VERSION=$(shell ${LUA_PREFIX}/bin/lua -e "print(_VERSION)" | cut --characters=5-7)

.PHONY: all
all: ${APP_PREFIX}/init/profile

${APP_VERSION}.tar.gz:
	wget https://github.com/TACC/Lmod/archive/refs/tags/${APP_VERSION}.tar.gz

.PHONY: deps
deps:
	$(MAKE) -C ../luarocks

${APP_PREFIX}/init/profile: ${APP_VERSION}.tar.gz | deps
	set -e
	export PATH=${LUA_PREFIX}/bin:${LUAROCKS_PREFIX}/bin:${PATH}
	export LUA_PATH="${LUAROCKS_PREFIX}/share/lua/${LUA_VERSION}/?.lua;${LUAROCKS_PREFIX}/share/lua/${LUA_VERSION}/?/init.lua;;"
	export LUA_CPATH="${LUAROCKS_PREFIX}/lib/lua/${LUA_VERSION}/?.so;;"
	${LUAROCKS_PREFIX}/bin/luarocks install luaposix
	tar xvf ${APP_VERSION}.tar.gz
	cd Lmod-${APP_VERSION}
	./configure --prefix=${PREFIX} --with-fastTCLInterp=no
	make -j; make install
