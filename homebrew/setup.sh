###############################
#
# Installation script for homebrew 
# in user mode without sudo
#
###############################
SCRIPTDIR="$( dirname -- "$BASH_SOURCE"; )"

# needed during installation
export HOMEBREW_PREFIX=$HOME/.homebrew
export HOMEBREW_BREW_GIT_REMOTE="https://github.com/Homebrew/brew"  # put your Git mirror of Homebrew/brew here
export HOMEBREW_CORE_GIT_REMOTE="https://github.com/Homebrew/homebrew-core"  # put your Git mirror of Homebrew/homebrew-core here
export HOMEBREW_ARCHFLAGS="-march=skylake -mtune=generic"
# needed in environment when running
# don't send analytics
export HOMEBREW_NO_ANALYTICS=1

##########################
# installation notes
# ncurses: Needed `unset TERMINFO` to unset the kitty terminfo which was in write-protected location
##########################

# download the install script
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh --output ${SCRIPTDIR}/install.sh
patch -p1 < ${SCRIPTDIR}/install.sh.patch

# execute the install script
bash ${SCRIPTDIR}/install.sh


# altnative installation method
# https://docs.brew.sh/Installation#alternative-installs
mkdir ${HOMEBREW_PREFIX} && curl -L ${HOMEBREW_BREW_GIT_REMOTE}/tarball/master | tar xz --strip-components 1 -C ${HOMEBREW_PREFIX}
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"


# install the dotfiles 
export CHEZMOI_TARGET_DIR=$HOME
chezmoi init --apply git@github.com:hhoeflin/chezmoi_dotfiles.git -D ${CHEZMOI_TARGET_DIR}
