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
