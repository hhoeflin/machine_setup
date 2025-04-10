# source ble.sh if homebrew is installed
if [[ -v HOMEBREW_PREFIX ]]; then
    if [[ -f ${HOMEBREW_PREFIX}/etc/profile.d/ble.sh ]]; then
        source ${HOMEBREW_PREFIX}/etc/profile.d/ble.sh
    else
        echo "ble.sh not found in ${HOMEBREW_PREFIX}/etc/profile.d"
    fi
else
    echo "HOMEBREW_PREFIX is not set"
fi

eval "$(atuin init bash)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"
eval "$(micromamba shell hook -s bash)"
