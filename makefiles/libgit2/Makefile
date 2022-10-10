.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/libgit2
VERSION=1.5.0
MODULE_PATH=${PREFIX}/modules/home/libgit2/default.lua
APP_TARFILE=v${VERSION}.tar.gz

.PHONY: all
all: ${APP_PREFIX}/bin/git2_cli ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/libgit2/libgit2/archive/refs/tags/${APP_TARFILE}

.PHONY: deps
deps:
	$(MAKE) -C ../cmake

${APP_PREFIX}/bin/git2_cli: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd libgit2-${VERSION}
	mkdir build
	cd build
	export PATH=${PREFIX}/cmake/bin:${PATH}
	cmake .. -DCMAKE_INSTALL_PREFIX=${APP_PREFIX} -DBUILD_TESTS=OFF
	cmake --build . --target install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -rf libgit2-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
