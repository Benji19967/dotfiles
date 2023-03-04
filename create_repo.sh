#!/bin/bash

set -x

# Exit if any error occurs
set -e

REPO_NAME=$1

echo "Make sure not clone repo if prompted for"
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
fi

