# Set new PATH
add_to_path() {
  PATH="$1:$PATH"
}

add_to_path "${WORKSPACE}/bin"
add_to_path "${HOME}/.local/bin"

export WORKSPACE="${HOME}/apps/home/labrecqb"
export CODE_REPO="${HOME}/apps/home/labrecqb"
