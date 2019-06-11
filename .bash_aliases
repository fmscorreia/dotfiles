alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias dmesg='dmesg --color=always'
alias ls='ls --color=auto'

alias pbc='xclip -selection clipboard'
alias pbp='xclip -selection clipboard -o'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

function cheat () { curl "https://cheat.sh/$1"; }
