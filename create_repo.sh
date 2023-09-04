#!/bin/bash

# 1) Go to directory where you want to create repo
# 2) ./create_repo.sh <repo_name> # this will create a directory <repo_name>

set -x

# Exit if any error occurs
set -e

REPO_NAME=$1

echo "Clone the remote directory ...? --> No"
read -p "Are you sure you want to create the repo ${REPO_NAME} here: $(pwd) [Yy]?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	mkdir -p ${REPO_NAME}
	cd ${REPO_NAME}
	gh auth login
	gh repo create ${REPO_NAME}
	git init
	git remote add origin git@github.com:Benji19967/${REPO_NAME}.git
    git pull origin master
fi

