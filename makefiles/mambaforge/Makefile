APP=mambaforge
APP_BINARY=mamba
APP_VERSION=4.14.0-0

include ../default.mk

APP_DWNLOAD=Mambaforge-${APP_VERSION}-Linux-x86_64.sh


${APP_DWNLOAD}:
	wget https://github.com/conda-forge/miniforge/releases/download/${APP_VERSION}/${APP_DWNLOAD}


${BINARY_TARGET}: ${APP_DWNLOAD}
	chmod 770 ${APP_DWNLOAD}
	./${APP_DWNLOAD} -bf -p ${APP_PREFIX}

${APP_PREFIX}/shell/init_bash.sh: mambaforge-init-template.sh
	MAMBA_PATH=${APP_PREFIX} envsubst '$$MAMBA_PATH' < mambaforge-init-template.sh > ${APP_PREFIX}/shell/init_bash.sh
