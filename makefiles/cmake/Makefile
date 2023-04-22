APP=cmake
APP_VERSION=3.25.3

include ../default.mk

APP_TARFILE=cmake-${APP_VERSION}.tar.gz

${APP_TARFILE}:
	wget https://github.com/Kitware/CMake/releases/download/v${APP_VERSION}/${APP_TARFILE}

include ../lmod/setup_lmod.mk

.PHONY: deps
deps:
	$(MAKE) -C ../openssl

${APP_PREFIX}/bin/cmake: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd cmake-${APP_VERSION}
	${INIT_LMOD}
	module load home/openssl
	./bootstrap --prefix=${APP_PREFIX} -- -DCMAKE_USE_OPENSSL=ON
	$(MAKE) -j && $(MAKE) install
