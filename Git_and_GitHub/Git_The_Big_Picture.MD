# Git - The Big Picture
__Git__ tracks changes to source code. i.e., version control system.

## Understanding Version Control
### Benefits of Version Control
1. Tracking Project's History. With >> git log, you are able to view the changes made at what point of the project.
2. Managing Multiple Versions of a Project
3. Sharing code amongst developers
4. Coordinating Teamwork

## Making Sense of Git
### Git's Strong Points
1. Git is very Fast
2. Git is smart - even if you change the name of a file, or move it to another directory, Git will continue to track it.
3. Git is flexible and powerful - you can alomost do anything.
4. Git is safe once is backedup.

## Git Bash
To open the default editor using __Git Bash__ and show global configuration files, use:

$ git config --edit --global # launches the default editor i.e., specifying your default editor (see the global configurations including the current settings)

### Setting VS Code as the default editor for Git
On __Git Bash__ type:

$ git config --global core.editor "code -- wait --new-window" # opens new window and ensures it is openned all the time

## 3 States of Git
A file can either be in one of the following states:
1. Committed - the data is stored in stored in the local database.
2. Modified - the file has been modified but it has not been committed to the database yet.
3. Staged - the modified file is marked to be part of the next commit snapshot. All the changes are still local.

## Working with Git
1. Using Command line - console
2. Using GUI e.g., GitHub Desktop or Source Tree

## Client Server Version Control
 __Example__: Subversion - Before Git:

## Distributed Version Control
This isn't the only feature of __Git__ but it is one of it's strongest feature.

## Git - Based Services
1. Gitlab
2. Bitbucket
3. GitHub - hosting service

__GitHub__ is a _hosting service_, a set of _project management tools_ and a _social network_ centered around coding.

## Getting Started with Git
### Command Line Tools
>> git config # configure the tooling

>> mkdir "name of the repository" # creates a new repository

>> git init # initialize a git local repo (create an empty repository)

>> git status

>> code README.MD # creates an empty file into the directory

>> git add "file_name" # we can add a file or multiple files into the staging area makes git include those fast to the index making them ready for commit later on.

>> git add . # adds all the new files created and added to git
>> cd Project_Folder

>> dir # list all the files/folders in the working directory

>> git init # put the project into git # created a repository which is a git storage area
>> git commit -m "comments about the commmit" # commites a file to the repo

>> git commit -ma "commit message" # commit multiple files
>> git log # shows the history of the snapshot

>> git diff commit1 commit2 # shows the changes between ant two commits

>> git checkout commit1 # version of the project that we want to go into

### others:
1. git clone # downloads a project from remote
2. git push origin master # push the commites to the origin master