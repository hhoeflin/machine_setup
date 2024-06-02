.ONESHELL:
.PHONY: all

R_MAJOR:=$(shell echo ${R_VERSION} | head -c 1)
MODULES_DIR=${HOME}/.local/progs/modules/devel

all: ${MODULES_DIR}/R/${R_VERSION}


R-${R_VERSION}.tar.gz:
	wget https://cran.r-project.org/src/base/R-${R_MAJOR}/R-${R_VERSION}.tar.gz

R-${R_VERSION}: R-${R_VERSION}.tar.gz
	tar kxvf R-${R_VERSION}.tar.gz

${R_INSTALL_DIR}/R-${R_VERSION}/bin/R: R-${R_VERSION}
	cd R-${R_VERSION};\
	mkdir -p ${R_INSTALL_DIR}/R-${R_VERSION};\
	./configure --prefix=${R_INSTALL_DIR}/R-${R_VERSION};\
	make;\
	make install

${MODULES_DIR}/R/${R_VERSION}: ${R_INSTALL_DIR}/R-${R_VERSION}/bin/R R_module_template
	mkdir -p ${MODULES_DIR}/R
	cat R_module_template | envsubst '$$R_INSTALL_DIR $$R_VERSION' > ${MODULES_DIR}/R/${R_VERSION}
