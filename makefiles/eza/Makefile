APP=eza
APP_VERSION=0.10.5

include ../default.mk

.PHONY: deps
	$(MAKE) -C ../rust

include ../lmod/setup_lmod.mk

${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/rust
	cargo install ${APP} --locked --root ${APP_PREFIX} --version ${APP_VERSION}
