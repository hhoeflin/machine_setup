APP=nodejs
APP_VERSION=22.11.0
APP_BINARY=node

include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=v${APP_VERSION}.tar.gz

.SECONDARY: ${APP_TARFILE}
${APP_TARFILE}:
	wget https://github.com/nodejs/node/archive/refs/tags/${APP_TARFILE}


.PHONY: deps
deps:
	$(MAKE) -C ../python
	$(MAKE) -C ../lmod

${BINARY_TARGET}: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd node-${APP_VERSION}

	${INIT_LMOD}
	module load home/python
	./configure --prefix=${APP_PREFIX}
	$(MAKE) -j 4 && $(MAKE) install
