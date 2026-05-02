#!/usr/bin/env bash
###############################
#
# Installation script for homebrew
# in user mode without sudo
#
###############################
set -euo pipefail

SCRIPTDIR="$( dirname -- "$BASH_SOURCE"; )"

# needed during installation
export HOMEBREW_PREFIX=$HOME/.homebrew
export HOMEBREW_BREW_GIT_REMOTE="https://github.com/Homebrew/brew"  # put your Git mirror of Homebrew/brew here
export HOMEBREW_CORE_GIT_REMOTE="https://github.com/Homebrew/homebrew-core"  # put your Git mirror of Homebrew/homebrew-core here
export HOMEBREW_ARCHFLAGS="-march=skylake -mtune=generic"
# needed in environment when running
# don't send analytics
export HOMEBREW_NO_ANALYTICS=1
# done update
export HOMEBREW_NO_AUTO_UPDATE=1

##########################
# installation notes
# ncurses: Needed `unset TERMINFO` to unset the kitty terminfo which was in write-protected location
##########################

# download the install script
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh --output "${SCRIPTDIR}/install.sh"
patch "${SCRIPTDIR}/install.sh" < "${SCRIPTDIR}/install.sh.patch"

# pre-create the prefix so the installer's writability check passes
# and so it takes the user-owned branch rather than the root-install branch
mkdir -p "${HOMEBREW_PREFIX}"

# execute the install script
NONINTERACTIVE=1 bash "${SCRIPTDIR}/install.sh"

