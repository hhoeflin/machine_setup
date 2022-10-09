.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/pyenv
MODULE_PATH=${PREFIX}/modules/home/pyenv/default.lua
APP_DWNLOAD=pyenv-installer

.PHONY: all
all: ${APP_PREFIX}/bin/pyenv ${MODULE_PATH}

${APP_DWNLOAD}:
	wget --output-document ${APP_DWNLOAD} \
		https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/${APP_DWNLOAD}

.PHONY: deps
deps:
	$(MAKE) -C ../git

${APP_PREFIX}/bin/pyenv: ${APP_DWNLOAD} | deps
	export PATH=${PREFIX}/git/bin:${PATH}
	export PYENV_ROOT=${APP_PREFIX}
	chmod 770 ${APP_DWNLOAD}
	bash ${APP_DWNLOAD}
	mkdir -p ${APP_PREFIX}/shell
	${APP_PREFIX}/bin/pyenv init - > ${APP_PREFIX}/shell/init.sh

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -f ${APP_DWNLOAD}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
