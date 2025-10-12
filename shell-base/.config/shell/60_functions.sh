function a() 
{
    source env/bin/activate
}
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

function knit()
{
    R -e "rmarkdown::render('$1')"
}

function double_file()
{
    filename=$1
    x=$(cat $filename) && echo "$x" >> $filename
}

function pyenv() 
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

