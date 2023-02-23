# Git

# Introduction to Git
* __Git__ tracks changes to source code. i.e., version control system. __GitHub__ is a _hosting service_, a set of _project management tools_ and a _social network_ centered around coding.

# Git's Strong Points
1. Git is very Fast
2. Git is smart - even if you change the name of a file, or move it to another directory, Git will continue to track it.
3. Git is flexible and powerful - you can alomost do anything.
4. Git is safe once is backedup.

# Three States of Git
* A file can either be in one of the following states:
    1. __Committed__ - the data is stored in stored in the local database.
    2. __Modified__ - the file has been modified but it has not been committed to the database yet.
    3. __Staged__ - the modified file is marked to be part of the next commit snapshot. All the changes are still local.

# Commonly Used Git Commands
command | Explanation | Example
|-------|:------:|:------:|
$ git init  |initialize a git local repo (create an empty repository)
$ git config | configure the tooling
$ git add . | adds all the new files created and added to git
$ git add "file_name" | add a file or multiple files into the staging area makes git include those fast to the index making them ready for commit later on.
$ git status |  check the status of a file | 
$ git commit | commits a file to the repo | git commit -m "comments about the commmit" OR git commit -ma "commit message" # commit multiple files
$ git log  | shows the history of the snapshot
$ git diff  | shows the changes between any two commits | git diff commit1 commit2
$ git checkout | version of the project that we want to go into | git checkout commit1
$ git clone |  downloads a project from remote
$ git push |  push the commites to the origin master
$ git mv | rename a file | git mv README README.MD
$ git rm | deltes a file | git rm README.MD
$ git branch "branch_name" | creates a branch | 
$ git checkout "branch_name" | for existing branch - specifying which branch you want to checkout |
$ git push -u[origin][branch] | when we create a new branch, the brach is not pushed automatically to GitHub |
$ git checkout -b "add titles" | switch to branch, if it does not exist, it will be created. |
$ git push -u origin | 
$ git log --oneline | shows ouput as one commit per item |