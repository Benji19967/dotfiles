# Set up prompt to track git branch
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST

# Use single quotes for PROMPT value so it updates on every command
# https://unix.stackexchange.com/questions/14266/how-do-you-make-rprompt-in-zsh-update-itself-on-every-enter
PROMPT='labrecqb %F{blue}(${vcs_info_msg_0_})%f %1~$ '
# PROMPT='%F{blue}(${vcs_info_msg_0_})%f %1~$ '
zstyle ':vcs_info:git:*' formats '%b'

# zsh plugins
plugins=(
    git
)

# Unset ability to cd into a dir by just typing the dir name without `cd`
unsetopt autocd

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
alias notesdir="cd $CODE_REPO/notes"
alias todo="vim $CODE_REPO/notes/todo.md"
alias cl="clear"
alias ls="eza -l"
alias ll="eza -l"
alias lla="eza -la"
alias poetry=".poetry_venv/bin/poetry"
alias gpoetry="$HOME/.local/bin/poetry"
alias t="tree -d -L 1"
alias tt="tree -d -L 2"
alias ttt="tree -d -L 3"


# Path Aliases
alias ap="cd $CODE_REPO"
alias dot="vim $CODE_REPO/dotfiles"
alias dotdir="cd $CODE_REPO/dotfiles"
alias dotnvim="vim $CODE_REPO/dotfiles/nvim/.config/nvim"
alias dotnvimdir="cd $CODE_REPO/dotfiles/nvim/.config/nvim"
alias know="vim $HOME/Writing/knowledge"
alias knowdir="cd $HOME/Writing/knowledge"
alias nlp="cd $CODE_REPO/nlp"
alias ner="cd $CODE_REPO/nlp/ner"
alias dsc="cd $CODE_REPO/data_structures/ds_c"
alias bene="cd $CODE_REPO/benefri"
alias mach="cd $CODE_REPO/machine_setup"

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

function double_file()
{
    filename=$1
    x=$(cat $filename) && echo "$x" >> $filename
}

# https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html
function fzf_find_edit() 
{
    local dir=$(ls -1 | fzf);
    if [[ -n "$dir" ]]; then
        cd "$dir"
        vim .
    fi
}

# https://unix.stackexchange.com/a/608616
bindkey -s '^p' 'fzf_find_edit^M'

# opam configuration
[[ ! -r /Users/benjaminlabrecque/.opam/opam-init/init.zsh ]] || source /Users/benjaminlabrecque/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


function pyenv() 
{
    cd $CODE_REPO/pyenv
    make env
    source env/bin/activate
    cd -
}

function TODO() 
{
    rg "TODO" . $@
}

function find_dir_here()
{
    find . -type d -name $@
}

function find_file_here()
{
    find . -type f -name $@
}


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/benjaminlabrecque/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
