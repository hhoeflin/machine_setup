#!/usr/bin/env bash
###############################
#
# Initialize chezmoi dotfiles
#
###############################
set -euo pipefail

# install the dotfiles
export CHEZMOI_TARGET_DIR=$HOME
chezmoi init --apply git@github.com:hhoeflin/chezmoi_dotfiles.git -D ${CHEZMOI_TARGET_DIR}