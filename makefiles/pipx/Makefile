APP=pipx
OMIT_ALL=True
PYTHON_VERSION=3.12

include ../default.mk


.PHONY: all
all: ${APP_PREFIX}/conda_env/bin/pipx ${MODULE_PATH}

include ../lmod/setup_lmod.mk

deps:
	$(MAKE) -C ../miniforge

${APP_PREFIX}/conda_env/bin/pipx: | deps
	set -e

	${INIT_LMOD}
	module load home/miniforge
	mamba create -y --prefix ${APP_PREFIX}/conda_env python=${PYTHON_VERSION}
	mamba activate ${APP_PREFIX}/conda_env
	pip install pipx
	mamba deactivate
	mkdir -p ${APP_PREFIX}/bin
