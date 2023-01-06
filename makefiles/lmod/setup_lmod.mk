ifdef GLOBAL_MODULES
LOAD_MODULES=module load ${GLOBAL_MODULES};
endif
# this way all loaded modules will stay active; globally needed modules can be set before running make
INIT_LMOD=if [[ -z $${MODULEPATH} ]]; then . ${PREFIX}/lmod/lmod/init/bash; else . ${PREFIX}/lmod/lmod/init/profile; fi; module --force purge; export MODULEPATH=${PREFIX}/modules; ${LOAD_MODULES}
