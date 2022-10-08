.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/openssl
VERSION=1.1.1q
MODULE_PATH=${PREFIX}/modules/home/openssl/${VERSION}.lua
APP_TARFILE=openssl-${VERSION}.tar.gz

.PHONY: all
all: ${APP_PREFIX}/lib/libssl.so.1.1 ${MODULE_PATH}

${APP_TARFILE}:
	wget https://www.openssl.org/source/${APP_TARFILE}


${APP_PREFIX}/lib/libssl.so.1.1: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd openssl-${VERSION}
	mkdir -p ${APP_PREFIX}
	./config --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -rf openssl-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
