.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/stow
VERSION=2.3.1
MODULE_PATH=${PREFIX}/modules/home/ncurses/default.lua
APP_TARFILE=stow-${VERSION}.tar.gz

all: ${APP_PREFIX}/bin/stow ${MODULE_PATH}

${APP_TARFILE}:
	wget http://ftp.gnu.org/gnu/stow/${APP_TARFILE}


${APP_PREFIX}/bin/stow: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd stow-${VERSION}/
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -rf stow-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
