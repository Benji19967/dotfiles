# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/benjaminlabrecque/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

CODE_REPO="~/programming"

# Aliases
alias rc="vim ~/.zshrc"
alias prc="vim ~/.zprofile"
alias vrc="vim ~/.vimrc"
alias src="source ~/.zshrc"
alias srcp="source ~/.zprofile"
alias gd="git diff"
alias s="git status"
alias c="git commit -am "
alias b="git branch"
alias notes="cd $CODE_REPO/notes"
alias dot="cd $CODE_REPO/dotfiles"
alias cl="clear"
