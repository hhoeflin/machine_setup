APP=pdm
include ../funcs.mk
include ../default.mk

PIPX_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/pipx)

PIPX_INJECT=pdm-dockerize pdm-audit
PDM_SELF_INSTALL=pdm-dotenv pdm-download pdm-version
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
	module load home/miniforge
	mamba activate ${PIPX_PREFIX}/conda_env
	if [[ x${APP_VERSION} -eq 'xlatest' ]]
	then
		pipx install -f ${APP}
	else
		pipx install -f ${APP}@${APP_VERSION}
	fi
	if [[ 'x${PIPX_INJECT}' != x ]]; then
		pipx inject --include-apps --include-deps -f ${APP} ${PIPX_INJECT};
	fi
	if [[ 'x${PDM_SELF_INSTALL}' != x ]]; then
		${PIPX_BIN_DIR}/pdm self add ${PDM_SELF_INSTALL};
	fi
	mamba deactivate
