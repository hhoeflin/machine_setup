.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/nvim
VERSION=0.8.0
APP_TARFILE=v${VERSION}.tar.gz
MODULE_PATH=${PREFIX}/modules/home/neovim/default.lua

.PHONY: all

all: ${APP_PREFIX}/bin/nvim ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/neovim/neovim/archive/refs/tags/${APP_TARFILE}


.PHONY: deps
deps:
	$(MAKE) -C ../cmake

${APP_PREFIX}/bin/nvim: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd neovim-${VERSION}
	export PATH=${PREFIX}/cmake/bin:${PATH}
	make CMAKE_BUILD_TYPE=Release
	make CMAKE_INSTALL_PREFIX=${APP_PREFIX} install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -rf neovim-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
