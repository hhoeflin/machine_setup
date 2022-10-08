.ONESHELL:

ifndef PREFIX
$(error PREFIX is not set)
endif
export PREFIX

ifndef APP_URL
$(error APP is not set)
endif

ifndef APP_BINARY
$(error APP_BINARY is not set)
endif

GOBIN=${PREFIX}/go/bin
GO=${PREFIX}/go/bin/go
export GOBIN

.PHONY: all
all: ${GOBIN}/${APP_BINARY}

.PHONY: deps
	$(MAKE) -C ../golang

${GOBIN}/${APP_BINARY}: | deps
	$(GO) install ${APP_URL}

.PHONY: clean
clean:

.PHONY: uninstall
uninstall:
	rm -f ${GOBIN}/APP_BINARY
