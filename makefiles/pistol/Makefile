APP_URL=github.com/doronbehar/pistol/cmd/pistol
APP_BINARY=pistol
APP_VERSION=0.4.2
OMIT_BINARY_TARGET=True

include ../go_app/Makefile
include ../funcs.mk


${BINARY_TARGET}: | deps
	${INIT_LMOD}
	module load home/golang home/libmagic
	mkdir -p $$(dirname ${GOBIN})
	export CGO_CFLAGS="-I$(call LATEST_VERSION_DIR,${PREFIX}/libmagic)include"
	export CGO_LDFLAGS="-L$(call LATEST_VERSION_DIR,${PREFIX}/libmagic)lib"
	if [[ x${APP_VERSION} == xlatest ]]; then
		go install ${APP_URL}@latest
	else
		go install ${APP_URL}@${APP_VERSION_PREFIX}${APP_VERSION}
	fi
