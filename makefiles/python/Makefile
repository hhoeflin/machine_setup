APP=python
APP_VERSION=3.10.8
BINARY_TARGET=${PREFIX}/pyenv/versions/${APP_VERSION}/bin/python3
MULTI_VERSION=True

include ../default.mk
include ../lmod/setup_lmod.mk

deps:
	$(MAKE) -C ../pyenv
	$(MAKE) -C ../openssl
	$(MAKE) -C ../bzip2

${BINARY_TARGET}: | deps
	set -e
	${INIT_LMOD}
	module load home/pyenv home/openssl home/bzip2
	pyenv install ${APP_VERSION}
