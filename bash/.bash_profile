source ${HOME}/.profile

export WORKSPACE="${HOME}/apps/home/labrecqb"
export PATH="${WORKSPACE}/bin:${PATH}"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

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
