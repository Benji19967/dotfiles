# Login shells (e.g. ssh) don't read ~/.bashrc on their own.
# Ubuntu ships a ~/.profile that sources it; RHEL/CentOS don't -> source it directly.
if [ -f "$HOME/.profile" ]; then
  source "$HOME/.profile"
elif [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init - bash)"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/ubuntu/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/ubuntu/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
