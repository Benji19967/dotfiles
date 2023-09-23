# Set up prompt to track git branch
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST

# Use single quotes for PROMPT value so it updates on every command
# https://unix.stackexchange.com/questions/14266/how-do-you-make-rprompt-in-zsh-update-itself-on-every-enter
PROMPT='labrecqb %F{blue}(${vcs_info_msg_0_})%f %1~$ '
zstyle ':vcs_info:git:*' formats '%b'

# zsh plugins
plugins=(
    git
)

# Path to your oh-my-zsh installation.
export ZSH="/Users/benjaminlabrecque/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

CODE_REPO="${HOME}/apps/home/labrecqb"

# Source tmux
tmux source ~/.tmux.conf

# Aliases
alias v="vim ."
alias rc="vim ~/.zshrc"
alias prc="vim ~/.zprofile"
alias vrc="vim ~/.vimrc"
alias trc="vim ~/.tmux.conf"
alias nrc="vim ~/.config/nvim/init.vim" # symlinked
alias vim="nvim"
alias src="source ~/.zshrc"
alias srcp="source ~/.zprofile"
alias gd="git diff"
alias s="git status"
alias c="git commit -am "
alias b="git branch"
alias notes="vim $CODE_REPO/notes"
alias todo="vim $CODE_REPO/notes/todo.md"
alias cl="clear"
alias ll="ls -l"
alias lla="ls -la"
alias poetry=".poetry_venv/bin/poetry"

# Path Aliases
alias ap="cd $CODE_REPO"
alias dot="cd $CODE_REPO/dotfiles/nvim/.config/nvim"
alias nlp="cd $CODE_REPO/nlp"
alias ner="cd $CODE_REPO/nlp/ner"
#alias lua="cd $CODE_REPO/dotfiles/nvim/.config/nvim/lua/benji19967"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Functions 
function a() 
{
    source env/bin/activate
}
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

function knit()
{
    R -e "rmarkdown::render('$1')"
}
