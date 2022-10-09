.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/openssl3
VERSION=3.0.5
MODULE_PATH=${PREFIX}/modules/home/openssl3/${VERSION}.lua
APP_TARFILE=openssl-${VERSION}.tar.gz

.PHONY: all
all: ${APP_PREFIX}/lib/libssl.so.3.0 ${MODULE_PATH}

${APP_TARFILE}:
	wget https://www.openssl.org/source/${APP_TARFILE}


${APP_PREFIX}/lib/libssl.so.3.0: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd openssl-${VERSION}
	mkdir -p ${APP_PREFIX}
	./Configure --prefix=${APP_PREFIX}
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
	rm -f ${MODULE_PATH}
