APP=miniforge
APP_BINARY=mamba
APP_VERSION=24.9.0-0
OMIT_CLEAN=1

include ../default.mk

APP_DWNLOAD=Miniforge3-${APP_VERSION}-Linux-x86_64.sh


${APP_DWNLOAD}:
	wget https://github.com/conda-forge/miniforge/releases/download/${APP_VERSION}/${APP_DWNLOAD}


${BINARY_TARGET}: ${APP_DWNLOAD}
	chmod 770 ${APP_DWNLOAD}
	./${APP_DWNLOAD} -bf -p ${APP_PREFIX}


.PHONY: clean
clean:
	shopt -s extglob
	rm -rf !(Makefile|module_template)
