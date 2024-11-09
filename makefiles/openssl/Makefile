APP=openssl
APP_VERSION=3.0.15
OMIT_ALL=True

include ../default.mk

APP_TARFILE=openssl-${APP_VERSION}.tar.gz

.PHONY: all
all: ${APP_PREFIX}/lib64/libssl.so.3 ${MODULE_PATH}

${APP_TARFILE}:
	wget https://www.openssl.org/source/${APP_TARFILE}


${APP_PREFIX}/lib64/libssl.so.3: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd openssl-${APP_VERSION}
	mkdir -p ${APP_PREFIX}
	./config --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install
