function dotenv { 
    set -a; . ${1:-.env} || true; set +a; 
}; 
export -f dotenv

# lazygit
alias lg='lazygit'

# lsd
alias ls='lsd -F'
alias ll='lsd -lahF'
alias lt='lsd -lahF --tree'
alias lt2='lsd -lahF --tree --depth 2'
alias lt3='lsd -lahF --tree --depth 3'



