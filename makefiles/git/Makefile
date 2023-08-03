APP=git
APP_VERSION=2.41.0

include ../default.mk

APP_TARFILE=git-${APP_VERSION}.tar.gz

${APP_TARFILE}:
	wget https://www.kernel.org/pub/software/scm/git/${APP_TARFILE}

${BINARY_TARGET}: ${APP_TARFILE}
	tar zxvf ${APP_TARFILE}
	cd git-${APP_VERSION}
	make configure
	./configure --prefix=${APP_PREFIX} --without-tcltk
	$(MAKE) -j && $(MAKE) install
