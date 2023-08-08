APP=mambaforge
APP_BINARY=mamba
APP_VERSION=23.1.0-4
OMIT_CLEAN=1

include ../default.mk

APP_DWNLOAD=Mambaforge-${APP_VERSION}-Linux-x86_64.sh


${APP_DWNLOAD}:
	wget https://github.com/conda-forge/miniforge/releases/download/${APP_VERSION}/${APP_DWNLOAD}


${BINARY_TARGET}: ${APP_DWNLOAD}
	chmod 770 ${APP_DWNLOAD}
	./${APP_DWNLOAD} -bf -p ${APP_PREFIX}


.PHONY: clean
clean:
	shopt -s extglob
	rm -rf !(Makefile|module_template|mambaforge-init-template.sh)
