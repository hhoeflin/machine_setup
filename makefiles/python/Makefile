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
	module load home/pyenv
	CPPFLAGS="-I${PREFIX}/openssl/include -I${PREFIX}/bzip2/include" \
	LDFLAGS="-L${PREFIX}/openssl/lib -L${PREFIX}/bzip2/lib" \
	pyenv install ${APP_VERSION}
