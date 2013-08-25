# Created by newuser for 5.0.2
PROMPT="[%n@%m]%B%(!,#,$)%b "
RPROMPT="[%d]"
setopt hist_ignore_dups
setopt share_history
autoload -U compinit
compinit
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
alias ll="ls -al"

[[ -s /home/syguer/.nvm/nvm.sh ]] && . /home/syguer/.nvm/nvm.sh ]]
