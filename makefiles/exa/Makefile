.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP=exa
APP_BINARY=exa
APP_PREFIX=${PREFIX}/${APP}
MODULE_PATH=${PREFIX}/modules/home/exa/default.lua

RUSTUP_HOME=${PREFIX}/cargo
CARGO_HOME=${PREFIX}/cargo
export RUSTUP_HOME
export CARGO_HOME

.PHONY: all
all: ${APP_PREFIX}/bin/${APP_BINARY} ${MODULE_PATH}

.PHONY: deps
	$(MAKE) -C ../rust

${APP_PREFIX}/bin/${APP_BINARY}: | deps
	${CARGO_HOME}/bin/cargo install ${APP} --root ${APP_PREFIX}

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	${CARGO_HOME}/bin/cargo uninstall ${APP}
	rm -f ${MODULE_PATH}
