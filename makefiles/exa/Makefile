APP=exa
APP_VERSION=0.10.1

include ../default.mk

.PHONY: deps
	$(MAKE) -C ../rust

include ../lmod/setup_lmod.mk

${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/rust
	cargo install ${APP} --root ${APP_PREFIX} --version ${APP_VERSION}
