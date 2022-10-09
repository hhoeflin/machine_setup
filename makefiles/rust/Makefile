.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

APP_PREFIX=${PREFIX}/cargo
MODULE_PATH=${PREFIX}/modules/home/rust/default.lua
APP_DWNLOAD=rustup.sh

.PHONY: all
all: ${APP_PREFIX}/bin/cargo ${MODULE_PATH}

${APP_DWNLOAD}:
	wget --output-document ${APP_DWNLOAD} https://sh.rustup.rs


${APP_PREFIX}/bin/cargo: ${APP_DWNLOAD}
	chmod 770 ${APP_DWNLOAD}
	RUSTUP_HOME=${APP_PREFIX} CARGO_HOME=${APP_PREFIX}  ./${APP_DWNLOAD} --no-modify-path -y

${MODULE_PATH}: module_template
	mkdir -p $$(dirname ${MODULE_PATH})
	APP_PREFIX=${APP_PREFIX} envsubst '$$APP_PREFIX' < module_template > ${MODULE_PATH}

.PHONY: clean
clean:
	rm -f ${APP_DWNLOAD}

.PHONY: uninstall
uninstall:
	rm -rf ${APP_PREFIX}
	rm -f ${MODULE_PATH}
