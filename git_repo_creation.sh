#!/bin/bash

# GitHub API Token
GH_API_TOKEN='****'
# GitHub User Name
GH_USER_NAME='****'
# Variable to store first argument to setup-repo, the repo name. Will be used as GH repo name, too.
REPO_NAME=$1
# Store current working directory.
CURRENT_DIR=$PWD
# Project directory can be passed as second argument to setup-repo, or will default to current working directory.
PROJECT_DIR=${2:-$CURRENT_DIR}
# Specified if folder does not exist and needed to be created
IS_NEW=$3

if [ -z $1 ]
 then 
   echo " " ; echo ""
   echo " usage : new-git-repo [--repository-name] [--directory-location] [--new-folder-creation]"
   echo ""
   echo "'repositiory name' is same as the name of the required repository name on github, it gives the same name if new folder is created"
   echo ""
   echo "'direactory location' is the abbsolute(~/....) or the relative(./....) path of the folder location in the computer "
   echo ""
   echo "the third field is specified if the folder does not exist and needed to be created in the given location "
   echo "any given input is considered is yes for the folder creation"
   echo " " ; echo ""
else  
    curl -H "Authorization: token $GH_API_TOKEN" https://api.github.com/user/repos -d '{"name": "'"${REPO_NAME}"'"}'
    cd $PROJECT_DIR

    if [ ! -z $3 ];
     then 
        mkdir $REPO_NAME
         cd $REPO_NAME
        pwd 
     fi    

        git init 
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
fi
