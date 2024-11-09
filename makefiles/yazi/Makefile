APP=yazi
APP_VERSION=0.3.3
OMIT_ALL=True
OMIT_CLEAN=True

include ../default.mk
include ../lmod/setup_lmod.mk

.PHONY: all
all: ${APP_PREFIX}/bin/${APP_BINARY} ${MODULE_PATH}

.PHONY: deps
	$(MAKE) -C ../rust
	$(MAKE) -C ../cmake

${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/cmake home/rust
	cargo install yazi-fm yazi-cli --locked --root=${APP_PREFIX} --version ${APP_VERSION}


.PHONY: clean
clean:
	rm -rf !(Makefile|module_template)
