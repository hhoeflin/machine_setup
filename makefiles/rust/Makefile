APP=rust
APP_VERSION=1.74.1
APP_BINARY=cargo

include ../default.mk

APP_DWNLOAD=rustup.sh

${APP_DWNLOAD}:
	wget --output-document ${APP_DWNLOAD} https://sh.rustup.rs

${APP_PREFIX}/bin/cargo: ${APP_DWNLOAD}
	chmod 770 ${APP_DWNLOAD}
	RUSTUP_HOME=${APP_PREFIX} CARGO_HOME=${APP_PREFIX}  ./${APP_DWNLOAD} --no-modify-path -y
	RUSTUP_HOME=${APP_PREFIX} CARGO_HOME=${APP_PREFIX}  ${APP_PREFIX}/bin/rustup default ${APP_VERSION}
