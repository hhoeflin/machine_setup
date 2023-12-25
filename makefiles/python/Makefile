APP=python
APP_VERSION=3.11.7

include ../funcs.mk

PYENV_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/pyenv)

BINARY_TARGET=${PYENV_PREFIX}/versions/${APP_VERSION}/bin/python3

include ../default.mk
include ../lmod/setup_lmod.mk

deps:
	$(MAKE) -C ../pyenv
	$(MAKE) -C ../openssl
	$(MAKE) -C ../bzip2
	$(MAKE) -C ../sqlite3

OPENSSL_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/openssl)
BZIP2_PREFIX=$(call LATEST_VERSION_DIR,${PREFIX}/bzip2)

${BINARY_TARGET}: | deps
	set -e
	${INIT_LMOD}
	module load home/pyenv
	CPPFLAGS="-I${OPENSSL_PREFIX}/include -I${BZIP2_PREFIX}/include" \
	LDFLAGS="-L${OPENSSL_PREFIX}/lib -L${BZIP2_PREFIX}/lib" \
	pyenv install ${APP_VERSION}
