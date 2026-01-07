# PATH & ENVIRONMENT VARIABLES
export ZSH="$HOME/dotfiles/zsh/.oh-my-zsh"
export EDITOR='nvim'
export NVM_DIR="$HOME/.nvm"

path=(
  $HOME/go/bin
  $HOME/.local/bin
  /usr/local/bin
  $path
)
export PATH

#  OH MY ZSH CONFIGURATION 
ZSH_THEME="" 
plugins=(
    git 
    zsh-autosuggestions 
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#  TOOLS INITIALIZATION 
eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#  LAZY LOAD NVM (Performance Optimization) 
_load_nvm() {
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
}
nvm() { unset -f nvm node npm npx; _load_nvm; nvm "$@" }
node() { unset -f nvm node npm npx; _load_nvm; node "$@" }
npm() { unset -f nvm node npm npx; _load_nvm; npm "$@" }
npx() { unset -f nvm node npm npx; _load_nvm; npx "$@" }

#  ALIASES 
alias n='nvim'
alias v='nvim'
alias zconf='nvim ~/.zshrc'
alias reload='source ~/.zshrc'

#  BEHAVIOR & UI 
bindkey -v
export KEYTIMEOUT=1

bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^W' backward-kill-word

