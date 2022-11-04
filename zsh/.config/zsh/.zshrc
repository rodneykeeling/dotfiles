setopt completeinword       # not just at the end
setopt noglobdots           # * shouldn't match dotfiles. ever.

setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

autoload -U colors && colors
autoload -U promptinit
setopt prompt_subst

# stuff for tab completion
fpath=(~/.zsh/completion $fpath)
plugins=(docker kubectl)
autoload -Uz compinit && compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# no .pyc in tab completion
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.pyc'

autoload -U select-word-style
select-word-style bash

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# plug-ins
source /Users/rodneykeeling/dev/random/antigen/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jocelynmallon/zshmarks
antigen apply

# super secret work-related stuff
source $ZDOTDIR/.zshwork

bindkey -e  # allows for ctrl-e in tmux
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

PROMPT=$'%{$fg[white]%}%1~ %{$fg[magenta]%}\x00\xc2\xbb %{$fg[white]%}'

alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias ls="exa"
alias la="exa -aF"
alias ll="exa -l"
alias ..="cd ..; exa"
alias tree="tree -C -I '*.pyc|__pycache__|node_modules'"

# zshmarks shortcuts
alias j="jump"

# git aliasesss... aliai? 
alias gb='git branch'
alias gs="git status"
alias gd="git diff"
alias gch="git checkout"
function gl() {
    current_branch=$(git branch | grep \* | cut -d ' ' -f2)
    git log --graph --pretty=format:'%Cred%h%Creset - %Creset%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit $current_branch --not master
}

alias ag='echo "Did you mean rg?"'
alias rg="rg --smart-case --no-heading --glob '!*.sql' --glob '!*.map' -M 1500"

alias k='kubectl'

alias dc='docker compose'
alias da='docker attach'
alias dcr='docker compose run --rm'
alias dcu='docker compose up -d --no-recreate'
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dcd='docker compose -f docker compose.yml -f docker compose.dev.yml'
alias dcde='docker compose -f docker compose.yml -f docker compose.dev.yml exec'
alias dcdr='docker compose -f docker compose.yml -f docker compose.dev.yml run --rm'

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export TERM=xterm-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(ssh-agent) > /dev/null

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export VISUAL=nvim
export EDITOR=nvim
alias vim='nvim'

# no .pyc / __pycache__
export PYTHONDONTWRITEBYTECODE=1

# RECYCLE CONTAINER (can take an argument to specify which container,
# otherwise will reset all)
dc-recycle() {
  docker compose stop $1
  docker compose rm --force $1
  docker compose build $1
  docker compose up -d --no-recreate $1
}

alias pip="$HOME/.pyenv/shims/pip"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH=$PATH:$HOME/.npm/bin
export NODE_PATH=$NODE_PATH:$HOME/.npm/lib/node_modules

source $HOME/.cargo/env

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
