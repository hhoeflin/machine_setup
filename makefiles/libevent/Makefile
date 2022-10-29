APP=libevent
APP_VERSION=2.1.12
OMIT_ALL=True

include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=libevent-${APP_VERSION}-stable.tar.gz

.PHONY: all
all: ${APP_PREFIX}/lib/libevent.a ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/libevent/libevent/releases/download/release-${APP_VERSION}-stable/${APP_TARFILE}

.PHONY: deps
deps:
	$(MAKE) -C ../openssl
	$(MAKE) -C ../lmod

${APP_PREFIX}/lib/libevent.a: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd libevent-${APP_VERSION}-stable
	mkdir -p ${APP_PREFIX}

	${INIT_LMOD}
	module load home/openssl
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install
