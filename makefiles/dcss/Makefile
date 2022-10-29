.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/dcss
VERSION=0.29.1
MODULE_PATH=${PREFIX}/modules/home/dcss/default.lua
APP_OUTPUT=${APP_PREFIX}

.PHONY: all

all: ${APP_OUTPUT} ${MODULE_PATH}

.PHONY: deps
deps:
	$(MAKE) -C ../ncurses
	$(MAKE) -C ../git

${APP_OUTPUT}: | deps
	export PATH=${PREFIX}/git/bin:${PATH}
	if ! [[ -d ./crawl ]]; then git clone --depth 1 --branch ${VERSION} https://github.com/crawl/crawl; fi
	cd crawl
	git submodule update --init
	cd crawl-ref/source
	PKG_CONFIG_PATH="${PREFIX}/ncurses/lib/pkgconfig" PREFIX=${APP_PREFIX} make
	PKG_CONFIG_PATH="${PREFIX}/ncurses/lib/pkgconfig" PREFIX=${APP_PREFIX} make install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}


.PHONY: clean
clean:
	rm -rf crawl

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
