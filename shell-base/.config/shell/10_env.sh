# Machine-local settings written by ./bootstrap (untracked). On machines where
# $HOME is small, it sets DOT_ROOT to a bigger mount (e.g. NFS).
[ -r "$HOME/.dotfiles.env" ] && . "$HOME/.dotfiles.env"

# Root for everything heavy: tools, plugin data, caches. Configs stay in $HOME
# (they're just symlinks). Defaults to $HOME -> no change on normal machines.
export DOT_ROOT="${DOT_ROOT:-$HOME}"

export WORKSPACE="${WORKSPACE:-${DOT_ROOT}/apps/home/labrecqb}"
export CODE_REPO="${CODE_REPO:-${WORKSPACE}}"

if [ "$DOT_ROOT" != "$HOME" ]; then
  # XDG_CONFIG_HOME deliberately stays ~/.config ([dotfiles] targets it).
  export XDG_DATA_HOME="${XDG_DATA_HOME:-${DOT_ROOT}/.local/share}"   # lazy.nvim plugins, mason, uv pythons
  export XDG_STATE_HOME="${XDG_STATE_HOME:-${DOT_ROOT}/.local/state}" # nvim undo/swap/shada, logs
  export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${DOT_ROOT}/.cache}"       # uv, pip, ...
  export MISE_DATA_DIR="${MISE_DATA_DIR:-${XDG_DATA_HOME}/mise}"      # all mise-installed tools
  export MISE_CACHE_DIR="${MISE_CACHE_DIR:-${XDG_CACHE_HOME}/mise}"
  export MISE_STATE_DIR="${MISE_STATE_DIR:-${XDG_STATE_HOME}/mise}"
  export CARGO_HOME="${CARGO_HOME:-${DOT_ROOT}/.cargo}"
  export RUSTUP_HOME="${RUSTUP_HOME:-${DOT_ROOT}/.rustup}"
  export NPM_CONFIG_PREFIX="${NPM_CONFIG_PREFIX:-${DOT_ROOT}/.npm-global}"
  export NPM_CONFIG_CACHE="${NPM_CONFIG_CACHE:-${XDG_CACHE_HOME}/npm}"
fi
