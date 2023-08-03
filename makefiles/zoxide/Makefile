APP=zoxide
APP_VERSION=0.9.1
OMIT_ALL=True
OMIT_CLEAN=True

include ../default.mk
include ../lmod/setup_lmod.mk

ZOXIDE_INIT=${APP_PREFIX}/shell/zoxide_init.sh

.PHONY: all
all: ${APP_PREFIX}/bin/${APP_BINARY} ${MODULE_PATH} ${ZOXIDE_INIT}

.PHONY: deps
	$(MAKE) -C ../rust
	$(MAKE) -C ../cmake

${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/rust home/cmake
	cargo install ${APP} --root=${APP_PREFIX} --version ${APP_VERSION}

include ../lmod/module_target.mk

${ZOXIDE_INIT}:
	mkdir -p $$(dirname ${ZOXIDE_INIT})
	ZOXIDE_BIN=${APP_PREFIX}/bin/${APP_BINARY} envsubst '$$ZOXIDE_BIN' < ./zoxide_init_template.sh > ${ZOXIDE_INIT}


.PHONY: clean
clean:
	rm -rf !(Makefile|module_template|zoxide_init_template)
