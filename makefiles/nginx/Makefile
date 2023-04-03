APP=nginx
APP_VERSION=1.23.3

include ../funcs.mk
include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=nginx-${APP_VERSION}.tar.gz


${APP_TARFILE}:
	wget https://nginx.org/download/${APP_TARFILE}


.PHONY: deps

deps:
	$(MAKE) -C ../openssl


${BINARY_TARGET}: ${APP_TARFILE} | deps
	tar zxvf ${APP_TARFILE}
	cd nginx-${APP_VERSION}

	${INIT_LMOD}
	module load home/openssl
	./configure --prefix=${APP_PREFIX} --with-http_ssl_module
	$(MAKE) -j && $(MAKE) install
