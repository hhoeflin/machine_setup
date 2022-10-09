.ONESHELL:


ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/mambaforge
VERSION=4.14.0-0
MODULE_PATH=${PREFIX}/modules/home/mambaforge/default.lua
APP_DWNLOAD=Mambaforge-${VERSION}-Linux-x86_64.sh

.PHONY: all
all: ${APP_PREFIX}/bin/mamba ${APP_PREFIX}/shell/init_bash.sh ${MODULE_PATH}

${APP_DWNLOAD}:
	wget https://github.com/conda-forge/miniforge/releases/download/${VERSION}/${APP_DWNLOAD}


${APP_PREFIX}/bin/mamba: ${APP_DWNLOAD}
	chmod 770 ${APP_DWNLOAD}
	./${APP_DWNLOAD} -bf -p ${APP_PREFIX}

${APP_PREFIX}/shell/init_bash.sh: mambaforge-init-template.sh
	MAMBA_PATH=${APP_PREFIX} envsubst '$$MAMBA_PATH' < mambaforge-init-template.sh > ${APP_PREFIX}/shell/init_bash.sh

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
