# automation of git repository creation using shell script

This code on execution create a parent folder if necessary and creates a new repositiry in your github account with the files of the specified folder pushed to the repository, commits a first commit.

It also automatically creates an empty "README.md" file if required and also a standard ".gitignore" file (attached to code)


## Setup
  Firstly, download the code and paste it at any folder where you can keep it permanently
  and note the directory of the file(say a/b/c/d)

  next, open terminal and go to the home directory 
  
    cd ~/

check if ".bash_profile" named file exists or not in the hidden files list 
  
    ls -a
    
  if not, create the file
    
    touch .bash_profile
     
  then open the folder and paste the following command
  
     alias new-git-repo=~/a/b/c/d/git_repo_creation/git_repo_creation.sh
   ###### note that  new-git-repo is the name choosen for the shortcut command, you can give any arbitary name you want. a/b/c/d is the directory in which the file is downloaded. You should give the directory of the folder you downloaded there
   
  and the setup is done
   
## Instructions for use
 ####  you can type the command you gave the name in the setup for the shrotcut or alias in the terminal to get the instructions or follow the below instructions
    new-git-repo
###### or the alias you've set
The command consists of 3 fileds as below

    new-git-repo [--repository-name] [--directory-location] [--new-folder-creation]
    
 'repositiory name' is same as the name of the required repository name on github, it gives the same name if new folder is created.
 this field is necessary
 
 'direactory location' is the abbsolute(~/....) or the relative(./....) path of the folder location in your system. 
  repositry will be created in your present directory and readme will be added. (no other files in the folder will be tracked)
 
 the third field is specified if the folder does not exist and needed to be created in the given location 
 if this filed is not mandatory, any given input is considered as an yes for the folder creation
 
 ##### many assumptions were made while writing the ".gitignore" file. You might wanna update the file if some of your files consistently stop adding or if you're facing any problem
 ####
 ###### my first project using shell-scripting
  
 
