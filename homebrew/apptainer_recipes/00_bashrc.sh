BASHRC_DIR=/opt/etc/bashrc.d
if [ ! -d "$BASHRC_DIR" ]; then
    for script in $(find "$BASHRC_DIR" -type f -name "*.sh" | sort); do
      source "$script"
    done
fi
