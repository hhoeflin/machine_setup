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


PIPX_HOME=${PREFIX}/pipx
PIPX_BIN_DIR=${PREFIX}/pipx/bin
export PIPX_HOME
export PIPX_BIN_DIR

.PHONY: all
all: ${PIPX_BIN_DIR}/${APP_BINARY}

.PHONY: deps
	$(MAKE) -C ../pipx

${PIPX_BIN_DIR}/${APP_BINARY}: | deps
	. ${PREFIX}/mambaforge/shell/init_bash.sh
	mamba activate ${PREFIX}/pipx/conda_env
	pipx install -f ${APP}
	mamba deactivate

.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	. ${PREFIX}/mambaforge/shell/init_bash.sh
	mamba activate ${PREFIX}/pipx/conda_env
	pipx uninstall ${APP}
	mamba deactivate
