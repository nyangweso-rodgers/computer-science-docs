# Git & GitHub

## Table of Contents
- [Understanding Version Control](#Understanding-Version-Control)
    - [Benefits of Version Control](#Benefits-of-Version-Control)

- [Introduction to Git & GitHub](#Introduction-to-Git-&-GitHub)
    - [Git's Strong Points](#Git's-Strong-Points)
    - [Three States of Git](#Three-States-of-Git)
    - [Commonly Used Git Commands](#Commonly-Used-Git-Commands)

- [Understanding GitHub](#Understanding-GitHub)
    - [GitHub's Main Features](#GitHub's-Main-Features)
    - [Repository](#Repository)
    - [Features of Repository](#Features-of-Repository)
    - [Special Files in GitHub](#Special-Files-in-GitHub)
    - [Working with Branches](#Working-with-Branches) 
    - [Use Branches for:](#Use-Branches-for:)


- [References](#References)



# Understanding Version Control
# Benefits of Version Control
1. Tracking Project's History. With >> git log, you are able to view the changes made at what point of the project.
2. Managing Multiple Versions of a Project
3. Sharing code amongst developers
4. Coordinating Teamwork

# Introduction to Git & GitHub
__Git__ tracks changes to source code. i.e., version control system. __GitHub__ is a _hosting service_, a set of _project management tools_ and a _social network_ centered around coding.

# Git's Strong Points
1. Git is very Fast
2. Git is smart - even if you change the name of a file, or move it to another directory, Git will continue to track it.
3. Git is flexible and powerful - you can alomost do anything.
4. Git is safe once is backedup.

# Three States of Git
A file can either be in one of the following states:
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

# Understanding GitHub
__GitHub__ is a web-based hosting service for __Git__

# GitHub's Main Features
1. code
2. Pull Requests
3. Issues
4. CI/CD - continuos build and continuos deployed features

# Repositories
__Repositories__ are the building blocks of __GitHub__ and can be seen as a folder for your project. We can either create a repository on GitHub and clone it to the local machine or create a reposiory on the local machine, initialize it and push it to remotely.

# Features of Repository
* Assign Topics to Repository
* Work with __Projects__
* See and Manage Issues
* Pull Requests
* Insights - information about project.
* Settings to the Repository

# Special Files in GitHub
1. __README Files__: This is a special file known to __GitHub__ and is automatically rendered on the landing page. It is typically written in __Markdown__(.md)
2. __Licence__: Contains your open source licence allowing a spying contributor to know what is the upright licence for the project.
3. __Contributing and Contributors__: Contain list of people/organizations who have contributed to the project.
4. __Change log__: Contains a list of all major changes between versions of the project.
5. __Support__: Exists to inform people about possible ways to get help with the project.
6. __Code - of -Conduct__: Contains guidelines for people on the rules that have to obey when interacting with the project
7. __Code Owners__: Used to specify which users are responsible for the code in a respository

# Working with Branches
__Branching__ diverging from the main development line. __Branch__ is a pointer to a commit. The default brach is the _master_.

# Use Branches for:
* Features
* Bugs
* Experiments

# Creating a Gist
__Gist__ is a simple way to share snippets and notes with others

# Creating a GitHub Wiki
__Wiki__ is a knowledge based site where people can collaborate on documentation and order content. __Wiki__ can contain many pages and can be edited directly on GitHub or Offline.

# GitHub Pages
__GitHub pages__ are hosting sites which host static pages like personal websites, blog or company webpage. No server-side code.

# References