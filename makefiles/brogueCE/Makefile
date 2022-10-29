APP=brogueCE
APP_BINARY=brogue
APP_VERSION=1.11.1

include ../default.mk

APP_TARFILE=v${APP_VERSION}.tar.gz

${APP_TARFILE}:
	wget https://github.com/tmewett/BrogueCE/archive/refs/tags/${APP_TARFILE}

.PHONY: deps
deps:
	$(MAKE) -C ../ncurses

${BINARY_TARGET}: ${APP_TARFILE} config.mk | deps
	tar zxvf ${APP_TARFILE}
	cd BrogueCE-${APP_VERSION}
	cp -f ../config.mk .
	# the CPPFLAGS and LDFLAGS are important, make sure you have written them correctly, or the build will fail
	CPPFLAGS="-I${PREFIX}/ncurses/include" LDFLAGS="-L${PREFIX}/ncurses/lib" make bin/brogue
	# prepare the install prefix
	mkdir -p ${APP_PREFIX}
	cp -r --parents bin/brogue bin/assets bin/keymap.txt ${APP_PREFIX}
	# we move the brogue binary under a different name, so that we can
	# call it with a shell script that changes to the appropriate working
	# directory. Reason is that brogue writes out high scores in working dir
	mv ${APP_PREFIX}/bin/brogue ${APP_PREFIX}/bin/brogue_binary
	cd ..
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < brogue_script.sh > ${APP_PREFIX}/bin/brogue
	chmod +x ${APP_PREFIX}/bin/brogue
