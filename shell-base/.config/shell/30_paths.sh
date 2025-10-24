# Set new PATH
add_to_path() {
  PATH="$1:$PATH"
}

add_to_path "${WORKSPACE}/bin"
add_to_path "${HOME}/.local/bin"
