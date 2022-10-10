.ONESHELL:

APP=atuin

ifndef PREFIX
$(error PREFIX is not set)
endif

ifndef APP
$(error APP is not set)
endif

ifndef APP_BINARY
APP_BINARY=${APP}
endif

APP_PREFIX=${PREFIX}/${APP}
MODULE_PATH=${PREFIX}/modules/home/${APP}/default.lua
RUSTUP_HOME=${PREFIX}/cargo
CARGO_HOME=${PREFIX}/cargo
export RUSTUP_HOME
export CARGO_HOME

.PHONY: all
all: ${APP_PREFIX}/bin/${APP_BINARY} ${MODULE_PATH} ${APP_PREFIX}/shell/atuin_init.sh \
	${APP_PREFIX}/shell/bash-preexec.sh

.PHONY: deps
	$(MAKE) -C ../rust
	$(MAKE) -C ../cmake

${APP_PREFIX}/bin/${APP_BINARY}: | deps
	# some need cmake; make it available (starship)
	export PATH=${PREFIX}/cmake/bin:${PATH}
	${CARGO_HOME}/bin/cargo install ${APP} --root=${APP_PREFIX}
	# also set the shell scripts
	mkdir -p ${APP_PREFIX}/shell
	cp ./bash-preexec.sh ${APP_PREFIX}/shell
	ATUIN_BIN=${APP_PREFIX}/bin/${APP_BINARY} envsubst '$$ATUIN_BIN' < ./atuin_init_template.sh > ${APP_PREFIX}/shell/atuin_init.sh

${APP_PREFIX}/shell/atuin_init.sh: ./atuin_init_template.sh
	mkdir -p ${APP_PREFIX}/shell
	ATUIN_BIN=${APP_PREFIX}/bin/${APP_BINARY} envsubst '$$ATUIN_BIN' < ./atuin_init_template.sh > ${APP_PREFIX}/shell/atuin_init.sh

${APP_PREFIX}/shell/bash-preexec.sh: ./bash-preexec.sh
	mkdir -p ${APP_PREFIX}/shell
	cp ./bash-preexec.sh ${APP_PREFIX}/shell

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} APP=${APP} envsubst '$$APP_PREFIX $$APP' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
