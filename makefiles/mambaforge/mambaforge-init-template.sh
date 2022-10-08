__conda_setup="$('${MAMBA_PATH}/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${MAMBA_PATH}/etc/profile.d/conda.sh" ]; then
        . "${MAMBA_PATH}/etc/profile.d/conda.sh"
    else
        export PATH="${MAMBA_PATH}/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "${MAMBA_PATH}/etc/profile.d/mamba.sh" ]; then
    . "${MAMBA_PATH}/etc/profile.d/mamba.sh"
fi
