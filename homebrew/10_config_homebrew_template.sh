export HOMEBREW_GIT_PATH="/usr/bin/git"
export HOMEBREW_ARCHFLAGS="-march=skylake -mtune=generic"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
eval $(__HOMEBREW_PREFIX__/bin/brew shellenv)
