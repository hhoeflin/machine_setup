.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/cmake
VERSION=3.24.2
MODULE_PATH=${PREFIX}/modules/home/cmake/default.lua
APP_TARFILE=cmake-${VERSION}.tar.gz

.PHONY: all

all: ${APP_PREFIX}/bin/cmake ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/Kitware/CMake/releases/download/v${VERSION}/${APP_TARFILE}

.PHONY: deps
deps:
	$(MAKE) -C ../openssl

${APP_PREFIX}/bin/cmake: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd cmake-${VERSION}
	PKG_CONFIG_PATH=${PREFIX}/openssl/lib/pkgconfig ./bootstrap --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -rf cmake-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
