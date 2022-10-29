APP=pyenv

include ../default.mk

APP_DWNLOAD=pyenv-installer

${APP_DWNLOAD}:
	wget --output-document ${APP_DWNLOAD} \
		https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/${APP_DWNLOAD}

.PHONY: deps
deps:
	$(MAKE) -C ../git

${BINARY_TARGET}: ${APP_DWNLOAD} | deps
	export PATH=${PREFIX}/git/bin:${PATH}
	export PYENV_ROOT=${APP_PREFIX}
	chmod 770 ${APP_DWNLOAD}
	bash ${APP_DWNLOAD}
	mkdir -p ${APP_PREFIX}/shell
	${APP_PREFIX}/bin/pyenv init - > ${APP_PREFIX}/shell/init.sh
	cd ${APP_PREFIX}/shims
	ln -s python3 python
