.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/libevent
VERSION=2.1.12
MODULE_PATH=${PREFIX}/modules/home/libevent/default.lua
APP_TARFILE=libevent-${VERSION}-stable.tar.gz

.PHONY: all
all: ${APP_PREFIX}/lib/libevent.a ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/libevent/libevent/releases/download/release-${VERSION}-stable/${APP_TARFILE}


${APP_PREFIX}/lib/libevent.a: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd libevent-${VERSION}-stable
	mkdir -p ${APP_PREFIX}
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -rf libevent-${VERSION}-stable
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
