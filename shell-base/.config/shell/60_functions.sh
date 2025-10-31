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

function create_python_env() 
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

