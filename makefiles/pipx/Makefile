.ONESHELL:


ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/pipx
PYTHON_VERSION=3.10
MODULE_PATH=${PREFIX}/modules/home/pipx/default.lua

.PHONY: all
all: ${APP_PREFIX}/conda_env/bin/pipx ${MODULE_PATH}

deps:
	$(MAKE) -C ../mambaforge

${APP_PREFIX}/conda_env/bin/pipx: | deps
	set -e
	. ${PREFIX}/mambaforge/shell/init_bash.sh
	mamba create -y --prefix ${APP_PREFIX}/conda_env python=${PYTHON_VERSION}
	mamba activate ${APP_PREFIX}/conda_env
	pip install pipx
	mamba deactivate
	mkdir -p ${APP_PREFIX}/bin

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
