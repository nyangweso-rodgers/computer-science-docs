# Git Feature Branch Workflow

## Table Of Contents
- [Further Reading]()
  - [Atlassian - Git Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)


# Overview Of Feature Branch
* The core idea behind the __Feature Branch Workflow__ is that all feature development should take place in a dedicated branch instead of the __main branch__. 

# Merits of Feature Branch
* This encapsulation makes it easy for multiple developers to work on a particular feature without disturbing the main codebase.
* It also means the __main__ branch will never contain broken code, which is a huge advantage for continuous integration environments. 
* Encapsulating feature development also makes it possible to leverage pull requests, which are a way to initiate discussions around a branch. They give other developers the opportunity to sign off on a feature before it gets integrated into the official project.

# How it works
* The __Feature Branch Workflow__ assumes a __central repository__, and main represents the __official project history__. 
* Instead of committing directly on their local main branch, developers create a new branch every time they start work on a new feature.

# Start with the main branch
```sh
    git checkout master
    git fetch origin
    git reset --hard origin/main
```
* This switches the repo to the main branch, pulls the latest commits and resets the repo's local copy of main to match the latest version.

# Create a new-branch
* Use a separate branch for each feature or issue you work on. After creating a branch, check it out locally so that any changes you make will be on that branch.

  ```sh
      git checkout -b new-feature
  ```
* This checks out a branch called new-feature based on __main__, and the __-b__ flag tells Git to create the branch if it doesn’t already exist.

# Update, add, commit, and push changes
* On this branch, edit, stage, and commit changes in the usual fashion, building up the feature with as many commits as necessary. Work on the feature and make commits like you would any time you use Git. 

  ```sh
      git status
      git add <some files>
      git commit 
  ```

# Push feature branch to remote
* It’s a good idea to push the feature branch up to the central repository. This serves as a convenient backup, when collaborating with other developers, this would give them access to view commits to the new branch.

  ```sh
      git push -u new-feature
  ```
* This command pushes __new-feature__ to the central repository (__origin__), and the __-u__ flag adds it as a remote tracking branch.
* After setting up the tracking branch, __git push__ can be invoked without any parameters to automatically push the new-feature branch to the central repository. 
* To get feedback on the new feature branch, create a pull request in a repository management solution like GitHub.

# Resolve feedback
* Now teammates comment and approve the pushed commits. Resolve their comments locally, commit, and push the suggested changes to Bitbucket/GitHub.
* Your updates appear in the pull request.

# Merge your pull request
* Before you merge, you may have to resolve merge conflicts if others have made changes to the repo. When your pull request is approved and conflict-free, you can add your code to the __main__ branch. Merge from the pull request in Bitbucket/GitHub.

# Pull requests
* Aside from isolating feature development, branches make it possible to discuss changes via pull requests.
* Once someone completes a feature, they don’t immediately merge it into __main__. Instead, they push the feature branch to the central server and file a __pull request__ asking to merge their additions into __main__. This gives other developers an opportunity to review the changes before they become a part of the main codebase.

# Merge the feature-branch to main
```sh
    git checkout main
    git pull
    git pull origin new-feature
    git push
```