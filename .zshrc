# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/benjaminlabrecque/.oh-my-zsh"

plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

CODE_REPO="~/apps/home/labrecqb"

# Aliases
alias ap="cd $CODE_REPO"
alias rc="nvim ~/.zshrc"
alias prc="nvim ~/.zprofile"
alias vrc="nvim ~/.vimrc"
alias nrc="nvim ~/.config/nvim/init.vim"
alias src="source ~/.zshrc"
alias srcp="source ~/.zprofile"
alias gd="git diff"
alias s="git status"
alias c="git commit -am "
alias b="git branch"
alias notes="cd $CODE_REPO/notes"
alias dot="cd $CODE_REPO/dotfiles"
alias cl="clear"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
