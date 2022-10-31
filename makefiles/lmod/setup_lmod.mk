INIT_LMOD=if [[ -z ${MODULEPATH} ]]; then . ${PREFIX}/lmod/lmod/init/bash; else . ${PREFIX}/lmod/lmod/init/profile; fi; module use ${PREFIX}/modules;
