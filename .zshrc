# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/benjaminlabrecque/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias rc="vim ~/.zshrc"
alias src="source ~/.zshrc"
alias gd="git diff"
alias s="git status"
alias c="git commit -am "
