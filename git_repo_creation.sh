#!/bin/bash

# GitHub API Token
GH_API_TOKEN='***'
# GitHub User Name
GH_USER_NAME='***'
# Variable to store first argument to setup-repo, the repo name. Will be used as GH repo name, too.
REPO_NAME=$1
# Store current working directory.
CURRENT_DIR=$PWD
# Project directory can be passed as second argument to setup-repo, or will default to current working directory.
PROJECT_DIR=${2:-$CURRENT_DIR}
IS_NEW=$3
# GitHub repos Create API call
    if [ ! -z $3 ];
     then 
        mkdir $REPO_NAME
         cd $REPO_NAME
        pwd 
     fi    

        git init 
        # Initialize Git in project directory, and add the GH repo remote.
        if [  -z $2 ] || [ ! -z $3  ] ;
        then 
            touch README.md
            git add README.md
            git commit -m "initial commit with empty readme"
        else        
            read -p "Enter the commit message: " Message
            read -p "Do you need a readMe(Y/N): " IsReadmeNeeded
            if [ "$IsReadmeNeeded"  = "Y" ]
            then 
                touch README.md
            fi    
            git add .
            git commit -m "$Message"    
        fi
        git remote add origin https://github.com/${GH_USER_NAME}/${REPO_NAME}.git
        git push -u origin master  
