.ONESHELL:

APP=zoxide

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
ZOXIDE_INIT=${APP_PREFIX}/shell/zoxide_init.sh
MODULE_PATH=${PREFIX}/modules/home/${APP}/default.lua
RUSTUP_HOME=${PREFIX}/cargo
CARGO_HOME=${PREFIX}/cargo
export RUSTUP_HOME
export CARGO_HOME

.PHONY: all
all: ${APP_PREFIX}/bin/${APP_BINARY} ${MODULE_PATH} ${ZOXIDE_INIT}

.PHONY: deps
	$(MAKE) -C ../rust
	$(MAKE) -C ../cmake

${APP_PREFIX}/bin/${APP_BINARY}: | deps
	# some need cmake; make it available (starship)
	export PATH=${PREFIX}/cmake/bin:${PATH}
	${CARGO_HOME}/bin/cargo install ${APP} --root=${APP_PREFIX}

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} APP=${APP} envsubst '$$APP_PREFIX $$APP' < module_template > ${MODULE_PATH}

${ZOXIDE_INIT}:
	mkdir -p $$(dirname ${ZOXIDE_INIT})
	ZOXIDE_BIN=${APP_PREFIX}/bin/${APP_BINARY} envsubst '$$ZOXIDE_BIN' < ./zoxide_init_template.sh > ${ZOXIDE_INIT}


.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}