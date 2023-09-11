APP=nvim
APP_VERSION=0.9.2

include ../default.mk
include ../lmod/setup_lmod.mk

APP_TARFILE=v${APP_VERSION}.tar.gz

${APP_TARFILE}:
	wget https://github.com/neovim/neovim/archive/refs/tags/${APP_TARFILE}

.PHONY: deps
deps:
	$(MAKE) -C ../cmake
	$(MAKE) -C ../git

${APP_PREFIX}/bin/nvim: ${APP_TARFILE} | deps
	if [[ ! -d "neovim-${APP_VERSION}" ]];
	then
		tar zxvf ${APP_TARFILE}
	fi
	cd neovim-${APP_VERSION}
	${INIT_LMOD}
	module load home/cmake home/git
	make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=${APP_PREFIX} install
