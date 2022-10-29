ifndef APP_URL
$(error APP is not set)
endif

APP=$(shell basename ${APP_URL})

include ../default.mk

GOBIN=${APP_PREFIX}/bin
export GOBIN


.PHONY: deps
	$(MAKE) -C ../golang

include ../lmod/setup_lmod.mk

${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/golang
	mkdir -p $$(dirname ${GOBIN})
	go install ${APP_URL}@${APP_VERSION}
