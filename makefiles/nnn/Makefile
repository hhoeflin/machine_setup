APP=nnn
APP_VERSION=v4.8

include ../funcs.mk
include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=nnn-${APP_VERSION}.tar.gz


${APP_TARFILE}:
	wget https://github.com/jarun/nnn/releases/download/${APP_VERSION}/${APP_TARFILE}


.PHONY: deps

deps:
	$(MAKE) -C ../ncurses
	$(MAKE) -C ../lmod


${APP_PREFIX}/bin/nnn: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd nnn-$(subst v,,${APP_VERSION})
	${INIT_LMOD}
	module load home/ncurses
	PREFIX=${APP_PREFIX} $(MAKE) install
