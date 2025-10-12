# Set new PATH
add_to_path() {
  PATH="$1:$PATH"
}

add_to_path "${WORKSPACE}/bin"
add_to_path "${HOME}/.local/bin"
add_to_path "/opt/homebrew/opt/python@3.10/libexec/bin"
add_to_path "/opt/homebrew/bin"
add_to_path "${HOME}/.rubies/ruby-3.1.3/bin"
add_to_path "/Library/TeX/texbin/tex"

export WORKSPACE="${HOME}/apps/home/labrecqb"
export CODE_REPO="${HOME}/apps/home/labrecqb"
