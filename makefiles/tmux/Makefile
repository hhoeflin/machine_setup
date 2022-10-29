APP=tmux
APP_VERSION=3.3a

include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=tmux-${APP_VERSION}.tar.gz


${APP_TARFILE}:
	wget https://github.com/tmux/tmux/releases/download/${APP_VERSION}/${APP_TARFILE}


.PHONY: deps
deps:
	$(MAKE) -C ../libevent
	$(MAKE) -C ../ncurses
	$(MAKE) -C ../lmod

${APP_PREFIX}/bin/tmux: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd tmux-${APP_VERSION}

	${INIT_LMOD}
	module load home/libevent home/ncurses
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	echo $${PKG_CONFIG_PATH}
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install
