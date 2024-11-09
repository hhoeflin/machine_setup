APP=libgit2
APP_VERSION=1.8.4
OMIT_ALL=True

include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=v${APP_VERSION}.tar.gz

.PHONY: all
all: ${APP_PREFIX}/bin/git2 ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/libgit2/libgit2/archive/refs/tags/${APP_TARFILE}

.PHONY: deps
deps:
	$(MAKE) -C ../cmake
	$(MAKE) -C ../openssl

${APP_PREFIX}/bin/git2: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd libgit2-${APP_VERSION}
	mkdir build
	cd build

	${INIT_LMOD}
	module load home/cmake
	module load home/openssl
	cmake .. -DCMAKE_INSTALL_PREFIX=${APP_PREFIX} -DBUILD_TESTS=OFF
	cmake --build . --target install
