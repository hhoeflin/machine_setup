APP=tmux
APP_VERSION=3.5a

include ../funcs.mk
include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=tmux-${APP_VERSION}.tar.gz


${APP_TARFILE}:
	wget https://github.com/tmux/tmux/releases/download/${APP_VERSION}/${APP_TARFILE}


.PHONY: deps

deps:
	$(MAKE) -C ../libevent
	$(MAKE) -C ../ncurses
	$(MAKE) -C ../utf8proc
	$(MAKE) -C ../lmod

UTF8PROC_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/utf8proc)

${APP_PREFIX}/bin/tmux: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd tmux-${APP_VERSION}
	autoconf
	${INIT_LMOD}
	module load home/libevent home/ncurses home/utf8proc
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	PKG_CONFIG_PATH=$$PKG_CONFIG_PATH \
	CPPFLAGS="-I${UTF8PROC_PREFIX}include" \
	LDFLAGS="-L${UTF8PROC_PREFIX}lib" \
	./configure --enable-utf8proc --enable-static --enable-sixel --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install
