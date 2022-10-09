.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif

ifndef APP
$(error APP is not set)
endif

ifndef APP_BINARY
APP_BINARY=${APP}
endif


RUSTUP_HOME=${PREFIX}/cargo
CARGO_HOME=${PREFIX}/cargo
export RUSTUP_HOME
export CARGO_HOME

.PHONY: all
all: ${CARGO_HOME}/bin/${APP_BINARY}

.PHONY: deps
	$(MAKE) -C ../rust
	$(MAKE) -C ../cmake

${CARGO_HOME}/bin/${APP_BINARY}: | deps
	# some need cmake; make it available (starship)
	export PATH=${PREFIX}/cmake/bin:${PATH}
	${CARGO_HOME}/bin/cargo install ${APP}

.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	${CARGO_HOME}/bin/cargo uninstall ${APP}
