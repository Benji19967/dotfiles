function a() {
    if [ -d "env" ]; then
        source env/bin/activate
    elif [ -d ".venv" ]; then
        source .venv/bin/activate
    else
        echo "No virtual environment found in env/ or .venv/"
    fi
}

function knit()
{
    R -e "rmarkdown::render('$1')"
}

function double_file()
{
    filename=$1
    x=$(cat $filename) && echo "$x" >> $filename
}

function python_env() 
{
    cd $CODE_REPO/python_env
    make env
    source env/bin/activate
    cd -
}

function python_env_dir() 
{
    cd $CODE_REPO/python_env
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

function p()
{
    realpath $@
}

# https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html
function fzf_open_project() 
{
    # local dir=$(ls -1 | fzf);
    local dir_stem=$(ls -1 ${WORKSPACE} | fzf)
    local dir=${WORKSPACE}/${dir_stem}
    if [[ -n "$dir" ]]; then
        cd "$dir"
        nvim .
    fi
}

function fzf_add_project_as_tmux_session() 
{
    # local dir=$(ls -1 | fzf);
    local dir_stem=$(ls -1 ${WORKSPACE} | fzf)
    local dir=${WORKSPACE}/${dir_stem}
    if [[ -n "$dir" ]]; then
        source ${WORKSPACE}/dotfiles/tmux-start-session.sh
        tmux_start_session ${dir_stem}
        tmux switch-client -t ${dir_stem}
    fi
}
# https://unix.stackexchange.com/a/608616
# bindkey -s '^p' 'fzf_open_project^M'
bindkey -s '^p' 'fzf_add_project_as_tmux_session^M'
