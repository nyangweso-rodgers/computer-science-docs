# Understanding GitHub
__GitHub__ is a web-based hosting service for __Git__

## GitHub's Main Features
1. code
2. Pull Requests
3. Issues
4. CI/CD - continuos build and continuos deployed features

## Repositories
__Repositories__ are the building blocks of GitHub and can be seen as a folder for your project. We can either create a repository on GitHub and clone it to the local machine or create a reposiory on the local machine, initialize it and push it to remotely.

### Features of Repository
1. Assign Topics to Repository
2. Work with __Projects__
3. See and Manage Issues
4. Pull Requests
5. Insights - information about project.
6. Settings to the Repository

## Special Files in GitHub
### 1. README Files
This is a special file known to __GitHub__ and is automatically rendered on the landing page. It is typically written in __Markdown__(.md)
### 2. Licence
Contains your open source licence allowing a spying contributor to know what is the upright licence for the project.
### 3. Contributing and Contributors
Contain list of people/organizations who have contributed to the project.
### 4. Change log
Contains a list of all major changes between versions of the project.
### 5. Support
Exists to inform people about possible ways to get help with the project.
### 6. Code - of -Conduct
Contains guidelines for people on the rules that have to obey when interacting with the project
### 7. Code Owners
Used to specify which users are responsible for the code in a respository

# Collaborating in GitHub Using the GitHub Flow
## Working with Branches
__Branching__ diverging from the main development line.
## Branching in Git
__Branch__ is a pointer to a commit. The default brach is the _master_.
### Use Branches for:
* Features
* Bugs
* Experiments

## Creating a Brach in GitHub
### Popular Commands for Branching
* $ git branch [branch-name] # creating a branch
* $ git checkout [branch-name] # for existing branch - specifying which branch you want to checkout
* $ git push -u[origin][branch] #  when we create a new branch, the brach is not pushed automatically to GitHub
* $ git checkout -b "add titles" # switch to branch, if it does not exist, it will be created.
* $ git push -u origin

## Using the GitHub Flow
### Pull Requests
This tells others e have made changes to a seperate branch i.e., announcing changes

### Fork
* This is a copy of a repo. 
* It doesn't impact the original copy
* Changes can be merged again via pull request.
* Available for everyone

## Worrking with Issues
### Popular GitHub Issues
* Bugs
* Enhancements
* Tasks
* Ideas

### Built-in Labels
* Bugs
* Duplicate
* Enhancements
* Help wanted
* Questions
* want fix
* good first issue
* invalid

## Working with Milestones
* Track progress to certain point
* Group issues
* Prioritization

## Adding Tags
### Types of tags
* Lightweight
* Annotated

## Creating a GitHub Wiki
__Wiki__ is a knowledge based site where people can collaborate on documentation and order content. __Wiki__ can contain many pages and can be edited directly on GitHub or Offline.

## Creating a Gist
__Gist__ is a simple way to share snippets and notes with others

## Publishing Information Using GitHub Pages
__GitHub pages__ are hosting sites which host static pages like personal websites, blog or company webpage. No server-side code.