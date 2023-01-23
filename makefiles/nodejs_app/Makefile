include ../default.mk

.PHONY: deps
	$(MAKE) -C ../nodejs

include ../lmod/setup_lmod.mk

${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/nodejs
	npm install --prefix ${APP_PREFIX} -g ${APP}@${APP_VERSION}
