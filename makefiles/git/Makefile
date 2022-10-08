.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/git
VERSION=2.38.0
MODULE_PATH=${PREFIX}/modules/home/git/default.lua
APP_TARFILE=git-${VERSION}.tar.gz

.PHONY: all

all: ${APP_PREFIX}/bin/git ${MODULE_PATH}

${APP_TARFILE}:
	wget https://www.kernel.org/pub/software/scm/git/${APP_TARFILE}

${APP_PREFIX}/bin/git: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd git-${VERSION}
	make configure
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -rf git-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
