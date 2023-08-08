APP=micromamba
APP_VERSION=1.4.9-0
OMIT_CLEAN=1

include ../default.mk

APP_DWNLOAD=micromamba-linux-64.tar.bz2


${APP_DWNLOAD}:
	wget https://github.com/mamba-org/micromamba-releases/releases/download/${APP_VERSION}/micromamba-linux-64.tar.bz2


${BINARY_TARGET}: ${APP_DWNLOAD}
	echo ${BINARY_TARGET}
	mkdir -p ${APP_PREFIX}
	mkdir -p ${APP_PREFIX}/shell
	tar xvf ${APP_DWNLOAD} bin/micromamba
	mv bin ${APP_PREFIX}
	touch ${BINARY_TARGET}
	${BINARY_TARGET} shell init -s bash -p ~/.local/share/micromamba --dry-run | sed -e '1,5d' > ${APP_PREFIX}/shell/init_bash.sh


