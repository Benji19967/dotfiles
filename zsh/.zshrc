# Set up prompt to track git branch
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
autoload -Uz vcs_info
precmd() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST

# Use single quotes for PROMPT value so it updates on every command
# https://unix.stackexchange.com/questions/14266/how-do-you-make-rprompt-in-zsh-update-itself-on-every-enter
PROMPT='%F{blue}(${vcs_info_msg_0_})%f %1~$ '
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

# Source tmux
tmux source ~/.tmux.conf

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html
function fzf_find_edit() 
{
    # local dir=$(ls -1 | fzf);
    local dir=$(ls -1 ${WORKSPACE} | fzf)
    if [[ -n "$dir" ]]; then
        cd "$dir"
        nvim .
    fi
}

# https://unix.stackexchange.com/a/608616
bindkey -s '^p' 'fzf_find_edit^M'

# Source shell-base files
BASE_SHELL_CONFIG_DIR="$HOME/.config/shell"
if [[ -d "$BASE_SHELL_CONFIG_DIR" ]]; then
  for file in "$BASE_SHELL_CONFIG_DIR"/*.sh(N); do
    source "$file"
  done
fi

# Source .zshrc.d files
ZSHRC_D="$HOME/.zshrc.d"
if [[ -d "$ZSHRC_D" ]]; then
  for file in "$ZSHRC_D"/*.sh(N); do
    source "$file"
  done
fi

# opam configuration
[[ ! -r /Users/benjaminlabrecque/.opam/opam-init/init.zsh ]] || source /Users/benjaminlabrecque/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/benjaminlabrecque/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
