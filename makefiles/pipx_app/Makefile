include ../funcs.mk
include ../default.mk

PIPX_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/pipx)

PIPX_INJECT ?= ''
PIPX_HOME=${PIPX_PREFIX}
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
	mamba activate ${PIPX_PREFIX}/conda_env
	pipx install -f ${APP}@${APP_VERSION}
	if [[ 'x${PIPX_INJECT}' != x ]]; then
		pipx inject --include-apps --include-deps -f ${APP} ${PIPX_INJECT};
	fi
	mamba deactivate
