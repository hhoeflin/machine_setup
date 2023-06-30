ifndef APP_URL
$(error APP is not set)
endif

ifndef APP_VERSION_PREFIX
APP_VERSION_PREFIX=v
endif

APP=$(shell basename ${APP_URL})

include ../default.mk

GOBIN=${APP_PREFIX}/bin
export GOBIN


.PHONY: deps
	$(MAKE) -C ../golang

include ../lmod/setup_lmod.mk

ifndef OMIT_BINARY_TARGET
${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/golang
	mkdir -p $$(dirname ${GOBIN})
	if [[ x${APP_VERSION} == xlatest ]]; then go install ${APP_URL}@latest;  else go install ${APP_URL}@${APP_VERSION_PREFIX}${APP_VERSION}; fi
endif
