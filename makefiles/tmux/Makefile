.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/tmux
VERSION=3.3a
MODULE_PATH=${PREFIX}/modules/home/tmux/default.lua
APP_TARFILE=tmux-${VERSION}.tar.gz

.PHONY: all

all: ${APP_PREFIX}/bin/tmux ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/tmux/tmux/releases/download/${VERSION}/${APP_TARFILE}


.PHONY: deps
deps:
	$(MAKE) -C ../libevent
	$(MAKE) -C ../ncurses

${APP_PREFIX}/bin/tmux: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd tmux-${VERSION}
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	PKG_CONFIG_PATH="${PREFIX}/libevent/lib/pkgconfig:${PREFIX}/ncurses/lib/pkgconfig" ./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}


.PHONY: clean
clean:
	rm -rf tmux-${VERSION}
	rm -f ${APP_TARFILE}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
