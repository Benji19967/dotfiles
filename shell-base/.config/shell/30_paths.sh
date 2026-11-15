# Set new PATH
add_to_path() {
  PATH="$1:$PATH"
}

add_to_path "${WORKSPACE}/bin"
add_to_path "${HOME}/.local/bin"
# mise binary lives here when DOT_ROOT is relocated (see ./bootstrap)
[ "${DOT_ROOT:-$HOME}" != "$HOME" ] && add_to_path "${DOT_ROOT}/.local/bin"

[ -d "${CARGO_HOME:-$HOME/.cargo}/bin" ] && add_to_path "${CARGO_HOME:-$HOME/.cargo}/bin"
[ -n "${NPM_CONFIG_PREFIX:-}" ] && add_to_path "${NPM_CONFIG_PREFIX}/bin"

# mise tools are activated last, in .bashrc / .zshrc, so they win over system
# and homebrew binaries.
