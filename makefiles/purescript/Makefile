APP=purescript
APP_BINARY=purs

include ../default.mk

.PHONY: deps
	$(MAKE) -C ../nodejs

include ../lmod/setup_lmod.mk

${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/nodejs
	npm install --prefix ${APP_PREFIX} -g ${APP}
	npm install --prefix ${APP_PREFIX} -g spago
	npm install --prefix ${APP_PREFIX} -g purescript-language-server
	npm install --prefix ${APP_PREFIX} -g purty
	npm install --prefix ${APP_PREFIX} -g purs-tidy
	npm install --prefix ${APP_PREFIX} -g esbuild
