APP=atuin
APP_VERSION=13.0.1
OMIT_ALL=True
OMIT_CLEAN=True

include ../default.mk
include ../lmod/setup_lmod.mk

.PHONY: all
all: ${APP_PREFIX}/bin/${APP_BINARY} ${MODULE_PATH} ${APP_PREFIX}/shell/atuin_init.sh \
	${APP_PREFIX}/shell/bash-preexec.sh

.PHONY: deps
	$(MAKE) -C ../rust
	$(MAKE) -C ../cmake

${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/cmake home/rust
	cargo install ${APP} --root=${APP_PREFIX} --version ${APP_VERSION}
	# also set the shell scripts
	mkdir -p ${APP_PREFIX}/shell
	cp ./bash-preexec.sh ${APP_PREFIX}/shell

${APP_PREFIX}/shell/atuin_init.sh: ./atuin_init_template.sh
	mkdir -p ${APP_PREFIX}/shell
	ATUIN_BIN=${APP_PREFIX}/bin/${APP_BINARY} envsubst '$$ATUIN_BIN' < ./atuin_init_template.sh > ${APP_PREFIX}/shell/atuin_init.sh

${APP_PREFIX}/shell/bash-preexec.sh: ./bash-preexec.sh
	mkdir -p ${APP_PREFIX}/shell
	cp ./bash-preexec.sh ${APP_PREFIX}/shell

.PHONY: clean
clean:
	rm -rf !(Makefile|module_template|atuin_init_template.sh)
