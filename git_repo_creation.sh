#!/bin/bash

# GitHub API Token
GH_API_TOKEN='64e8071589f58d1d2eee6bda644bfe62dfffd3b0'
# GitHub User Name
GH_USER_NAME='satyasaibhushan'
# Variable to store first argument to setup-repo, the repo name. Will be used as GH repo name, too.
REPO_NAME=$1
# Store current working directory.
CURRENT_DIR=$PWD
# Project directory can be passed as second argument to setup-repo, or will default to current working directory.
PROJECT_DIR=${2:-$CURRENT_DIR}
# GitHub repos Create API call
curl -H "Authorization: token $GH_API_TOKEN" https://api.github.com/user/repos -d '{"name": "'"${REPO_NAME}"'"}'
cd $PROJECT_DIR

git init 
# Initialize Git in project directory, and add the GH repo remote.
if [ -z $2 ];
then 
    touch README.md
    git add README.md
    git commit -m "initial commit with empty readme"
    
else        
    read -p "Enter the commit message: " Message
    read -p "Do you need a readMe(Y/N): " IsReadmeNeeded
    if ["$IsReadmeNeeded "  = "Y"]
    then 
        touch README.md
    fi    
    git add .
    git commit -m "$Message"
fi
git remote add origin https://github.com/${GH_USER_NAME}/${REPO_NAME}.git
git push -u origin master  
