APP=libmagic
#APP_VERSION=5.45
APP_VERSION=5.30
OMIT_ALL=True

include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=file-${APP_VERSION}.tar.gz

.PHONY: all
all: ${APP_PREFIX}/lib/libmagic.so ${MODULE_PATH}

${APP_TARFILE}:
	wget https://astron.com/pub/file/${APP_TARFILE}

.PHONY: deps
deps:
	$(MAKE) -C ../lmod

${APP_PREFIX}/lib/libmagic.so: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd file-${APP_VERSION}
	mkdir -p ${APP_PREFIX}

	${INIT_LMOD}
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j && $(MAKE) install
