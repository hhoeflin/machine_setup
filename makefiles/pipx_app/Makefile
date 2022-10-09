.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

ifndef APP
$(error APP is not set)
endif

ifndef APP_BINARY
APP_BINARY=${APP}
endif

APP_PREFIX=${PREFIX}/${APP}
MODULE_PATH=${PREFIX}/modules/home/${APP}/default.lua
PIPX_HOME=${PREFIX}/pipx
PIPX_BIN_DIR=${APP_PREFIX}/bin
export PIPX_HOME
export PIPX_BIN_DIR

.PHONY: all
all: ${PIPX_BIN_DIR}/${APP_BINARY} ${MODULE_PATH}

.PHONY: deps
	$(MAKE) -C ../pipx

${PIPX_BIN_DIR}/${APP_BINARY}: | deps
	. ${PREFIX}/mambaforge/shell/init_bash.sh
	mamba activate ${PREFIX}/pipx/conda_env
	pipx install -f ${APP}
	mamba deactivate

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} APP=${APP} envsubst '$$APP_PREFIX $$APP' < module_template > ${MODULE_PATH}


.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
