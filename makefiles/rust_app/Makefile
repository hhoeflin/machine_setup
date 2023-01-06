include ../default.mk
include ../lmod/setup_lmod.mk

.PHONY: deps
	$(MAKE) -C ../rust
	$(MAKE) -C ../cmake

${APP_PREFIX}/bin/${APP_BINARY}: | deps
	${INIT_LMOD}
	module load home/cmake home/rust
	cargo install ${APP} --root=${APP_PREFIX} --version ${APP_VERSION}
