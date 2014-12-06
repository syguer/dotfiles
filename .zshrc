# Created by newuser for 5.0.2
LANG=ja_JP.UTF-8

# 履歴
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt auto_cd
setopt auto_pushd
setopt list_packed

# aliases
alias ll="ls -alG"
alias g=git
alias t=tmux
alias v=vim
alias gcc=gcc-4.9
alias vrc='vim ~/.vimrc'
alias zrc='vim ~/.zshrc'
alias rezsh='source ~/.zshrc'
alias vima='vim ~/.aliases'

[[ -s /Users/keisuke/.nvm/nvm.sh ]] && . /Users/keisuke/.nvm/nvm.sh ]]

PATH=$(brew --prefix)/bin:$HOME/.composer/vendor/bin/:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# using peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# using zsh-completions
fpath=(~/zsh-completions/src $fpath)

autoload -U compinit; compinit

# show branch name
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
add-zsh-hook precmd _get_vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats " %F{blue}(%r %c%u%b%f%F{blue})%f "
zstyle ':vcs_info:*' actionformats '[%b|%a]'
_get_vcs_info () {
  vcs_info
  if [ -z "$vcs_info_msg_0_" ];then
    PROMPT="[%n@%m]%(!,#,$) "
    return 0
  fi
  PROMPT="[%n@%m]${vcs_info_msg_0_}%(!,#,$) "
}

RPROMPT="[%d]"

export GOPATH=~/.golang
PATH=$GOPATH/bin:$PATH

[ -f ~/.aliase ]; source ~/.aliases
