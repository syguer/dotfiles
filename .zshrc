# Created by newuser for 5.0.2
LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# 履歴
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt hist_ignore_dups
setopt extended_history

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt auto_cd
setopt auto_pushd
setopt list_packed

# aliases
alias ll="ls -alG"
alias git=hub
alias g=git
alias t=tmux
alias v=vim
alias d=docker
alias dco=docker-compose
alias my=mycli
alias vrc='vim ~/dotfiles/.vimrc'
alias zrc='vim ~/dotfiles/.zshrc'
alias gcon='vim ~/dotfiles/.gitconfig'
alias rezsh='source ~/.zshrc'
alias vima='vim ~/.aliases'
alias dot='cd ~/dotfiles'

# ruby
alias b='bundle'
alias bi='bundle install -j4'
alias be='bundle exec'

# rails
alias ra='bundle exec rails'
alias rp='rubocop'
alias rpa='rubocop -a'
alias bi='bundle install -j4'
alias s='bundle exec rails s'
alias c='bundle exec rails c'
alias ss='bundle ex spring stop'
alias sp='bundle exec rspec'
alias gu='bundle exec guard start'
alias mi='bundle exec rake db:migrate'
alias ro='bundle exec rake db:rollback'
alias gmi='bundle exec rails g migration'
alias con='bundle exec rails c'
alias seed='bundle exec rake db:seed'
alias rroute='bundle exec rake routes | peco'
alias gc='gcloud'

[[ -s /Users/keisuke/.nvm/nvm.sh ]] && . /Users/keisuke/.nvm/nvm.sh ]]

PATH=/usr/local/bin:$PATH
PATH=$(brew --prefix)/bin:$HOME/.composer/vendor/bin/:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# using fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        fzf --query "$LBUFFER")
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
export PS1='\[\033[33m\]\u@MacMini\[\033[00m\]:\[\033[36m\]\w\[\033[35m\]$(__git_ps1)\[\033[00m\]\$ '

[ -f ~/.aliases ] && source ~/.aliases

# gobrew
# export PATH="$HOME/.gobrew/bin:$PATH"
# eval "$(gobrew init -)"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
