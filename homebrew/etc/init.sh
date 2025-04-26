# set vars for homebrew itself
export HOMEBREW_NO_ANALYTICS=1
if ! [[ -v HOMEBREW_PREFIX ]]; then
    # variable unset; we auto-detect
    if [[ -d "/opt/homebrew" ]]; then
        HOMEBREW_PREFIX="/opt/homebrew"
    elif [[ -d "${HOME}/.homebrew" ]]; then
        HOMEBREW_PREFIX="${HOME}/.homebrew"
    else
        echo "HOMEBREW_PREFIX not set and can't auto-detect"
        exit 1
    fi
fi
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"


# source ble.sh if homebrew is installed
BLE_INIT_SCRIPT=${HOMEBREW_PREFIX}/etc/profile.d/ble.sh 
if [[ -f ${BLE_INIT_SCRIPT} ]]; then
    source ${BLE_INIT_SCRIPT}
else
    echo "${BLE_INIT_SCRIPT} not found."
fi

# source lmod if is installed
LMOD_INIT_SCRIPT=${HOMEBREW_PREFIX}/opt/lmod/init/profile
if [[ -f ${LMOD_INIT_SCRIPT} ]]; then
    source ${LMOD_INIT_SCRIPT}
else
    echo "${LMOD_INIT_SCRIPT} not found."
fi


eval "$(atuin init bash)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"
eval "$(micromamba shell hook -s bash)"
