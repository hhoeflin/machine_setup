include ../default.mk

PIPX_INJECT ?= ''
PIPX_HOME=${PREFIX}/pipx
PIPX_BIN_DIR=${APP_PREFIX}/bin
export PIPX_HOME
export PIPX_BIN_DIR

.PHONY: all
all: ${PIPX_BIN_DIR}/${APP_BINARY} ${MODULE_PATH}

.PHONY: deps
	$(MAKE) -C ../pipx

include ../lmod/setup_lmod.mk

${PIPX_BIN_DIR}/${APP_BINARY}: | deps
	${INIT_LMOD}
	module load home/mambaforge
	mamba activate ${PREFIX}/pipx/conda_env
	pipx install -f ${APP}
	if [[ 'x${PIPX_INJECT}' != x ]]; then pipx inject -f ${APP} ${PIPX_INJECT}; fi
	mamba deactivate
