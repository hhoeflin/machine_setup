.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/brogueCE
VERSION=1.11.1
MODULE_PATH=${PREFIX}/modules/home/brogueCE/default.lua
APP_TARFILE=v${VERSION}.tar.gz

.PHONY: all

all: ${APP_PREFIX}/bin/brogue ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/tmewett/BrogueCE/archive/refs/tags/${APP_TARFILE}


.PHONY: deps
deps:
	$(MAKE) -C ../ncurses

${APP_PREFIX}/bin/brogue: ${APP_TARFILE} config.mk | deps
	tar zxvf ${APP_TARFILE}
	cd BrogueCE-${VERSION}
	cp -f ../config.mk .
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	export PKG_CONFIG_PATH="${PREFIX}/ncurses/lib/pkgconfig"
	make bin/brogue
	# prepare the install prefix
	mkdir -p ${APP_PREFIX}
	cp -r --parents bin/brogue bin/assets bin/keymap.txt ${APP_PREFIX}

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}


.PHONY: clean
clean:
	rm -rf BrogueCE-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
