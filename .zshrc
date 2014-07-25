# Created by newuser for 5.0.2
LANG=ja_JP.UTF-8
setopt hist_ignore_dups
setopt share_history

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt auto_cd
setopt auto_pushd
setopt list_packed

# aliases
alias ll="ls -alG"
alias ctags="/usr/local/Cellar/ctags/5.8/bin/ctags"
alias apachectl+"/usr/local/Cellar/httpd/2.2.27/sbin/apachectl"

# show branch name
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

[[ -s /Users/keisuke/.nvm/nvm.sh ]] && . /Users/keisuke/.nvm/nvm.sh ]]

PATH=$PATH:$HOME/.composer/vendor/bin/

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export GOPATH=/usr/local/Cellar/go/1.2.2/
PATH=$PATH:$GOPATH/bin

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

PROMPT="[%n@%m]%(!,#,$)%b "
RPROMPT=$RPROMPT"[%d]"
