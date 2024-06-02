.PHONY: all

HDF5_VERSION=${HDF5_VERSION_MAJOR}.${HDF5_VERSION_MINOR}
DIR_LVL1=hdf5-${HDF5_VERSION_MAJOR}
HDF5_NAME=${DIR_LVL1}.${HDF5_VERSION_MINOR}
MODULES_DIR=${HOME}/.local/progs/modules/devel

all: ${MODULES_DIR}/hdf5/${HDF5_VERSION}


${HDF5_NAME}.tar.gz:
	wget https://support.hdfgroup.org/ftp/HDF5/releases/${DIR_LVL1}/${HDF5_NAME}/src/${HDF5_NAME}.tar.gz

${HDF5_NAME}: ${HDF5_NAME}.tar.gz
	tar kxvf ${HDF5_NAME}.tar.gz

${HDF5_INSTALL_DIR}/${HDF5_NAME}/bin/h5cc: ${HDF5_NAME}
	cd ${HDF5_NAME};\
	mkdir -p ${HDF5_INSTALL_DIR}/${HDF5_NAME};\
	./configure --prefix=${HDF5_INSTALL_DIR}/${HDF5_NAME};\
	make;\
	make install

${MODULES_DIR}/hdf5/${HDF5_VERSION}: ${HDF5_INSTALL_DIR}/${HDF5_NAME}/bin/h5cc HDF5_module_template
	mkdir -p ${MODULES_DIR}/hdf5
	cat HDF5_module_template | HDF5_VERSION=${HDF5_VERSION} envsubst '$$HDF5_INSTALL_DIR $$HDF5_VERSION' > ${MODULES_DIR}/hdf5/${HDF5_VERSION}
