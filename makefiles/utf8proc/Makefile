APP=utf8proc
APP_VERSION=2.8.0
OMIT_ALL=True
BINARY_TARGET=${APP_PREFIX}/lib/libutf8proc.so

include ../default.mk

APP_TARFILE=v${APP_VERSION}.tar.gz

.PHONY: all
all:  ${MODULE_PATH}

${APP_TARFILE}:
	wget https://github.com/JuliaStrings/utf8proc/archive/refs/tags/${APP_TARFILE}

${BINARY_TARGET}: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd utf8proc-${APP_VERSION}
	mkdir -p ${APP_PREFIX}
	make prefix=${APP_PREFIX} && make install prefix=${APP_PREFIX}
