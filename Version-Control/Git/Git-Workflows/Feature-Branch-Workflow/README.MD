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
* Switch the Repo to the main/master branch
* Next, fetch the latest changes from the remote repository
* Finally, pull the latest changes from the remote __master__ branch and update your local master branch
  
  ```sh
      # switch the repo to main branch
      git checkout master # old syntax
      # fetch the latest changes from the remote repository
      # This command will fetch the latest changes from the remote origin repository, but will not modify your local master branch.
      git fetch origin
      git reset --hard origin/main # or
      git pull origin master
  ```
* OR:
  ```sh
      git switch master  # new syntax (as of Git 2.23)
  ```
* This switches the repo to the main branch, pulls the latest commits and resets the repo's local copy of main to match the latest version.
  
* __NOTE__: 
  * The __git reset --hard origin/main__ and __git pull origin master__ commands are both used to update your local branch with the latest changes from the remote repository. However, they do so in different ways.
  * The __git reset --hard origin/main__ command resets your local branch to match the exact state of the __origin/main__ branch, discarding any local changes that you may have made. _This means that any local commits that have not been pushed to the remote repository will be lost_.
  * On the other hand, the __git pull origin master__ command combines the __git fetch__ and __git merge__ commands into one convenient step. It fetches the latest changes from the remote master branch and then merges those changes into your local master branch. This preserves any local changes that you may have made, and attempts to merge them with the changes from the remote branch.

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

* Here's an example command that you can use to push a new feature branch named "__new-feature__" to a remote repository named "__origin__":
  ```sh
      git push origin new-feature
  ```
* This command assumes that "__origin__" is the name of the remote repository that you want to push your changes to. If you're working with a different remote repository, you should replace "origin" with the actual name of the remote repository.

* Git will push the local `__new-feature__` to the remote named `__origin__`. However, this command does not automatically set up a tracking branch.
  
* Also, make sure that you have already set up a remote repository and have the correct permissions to push changes to it. If you haven't set up a remote repository yet, you can do so using the below command.

  ```sh
    git remote add
  ```
# Set Up Tracking Relationship Between Local Branch and Remote Branch
* To set up a tracking relationship between a local branch and a remote branch, so that Git knows which remote branch to push changes to by default, you can use the following command:

  ```sh
      # new-feature branch
      git branch --set-upstream-to=origin/new-feature new-feature
      # or
      git push -u origin new-feature
      # or
      git push -u new-feature

  ```
* This will set up a tracking relationship between the local `__new-feature__` branch and the remote `__origin/new-feature__` branch, which means that when you run `__git pull__` or `__git push__` while on the `__new-feature__` branch, Git will automatically fetch or push changes to the corresponding remote branch.

* The `__git push -u__` command is a shorthand for `__git push --set-upstream__`.
  
* When you run `__git push -u origin new-feature__`, Git will push the local `__new-feature__` branch to the `__origin__` remote and set it up to track the remote branch with the same name.
  
* When you run `__git push -u new-feature__` , Git will try to push the local `__new-feature__` branch to remote branch with the same name, but it will use the default remote repo configured for the current branch. If the current branch has a configured upstream branch, then Git will push to that upstream branch. Otherwise, Git will display an error message.
  
* _Remark_: _it is a best practice to use `__git push -u origin new-feature__` instead of `__git push -u new-feature__`. The reason for this is that the first command explicitly specifies the remote repository and branch to push to and set up tracking for, which is more clear and less error-prone. It ensures that the changes are pushed to the correct remote repository and branch, even if the default remote or branch is different than what you intended_.


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

# Delete a Feature Branch
* To delete a feature branch both locally and remotely, you can follow these steps:
  1. Switch to another branch: Before deleting the branch, make sure you're on a different branch. You cannot delete a branch that you are currently on.

      ```sh
        # checkout of the feature branch
        git checkout new-feature
      ```
  2. Delete the local branch: To delete a local branch, use the git branch command with the -d option followed by the name of the branch you want to delete.

      ```sh
      git branch -d new-feature
      ```
  3. Delete the remote branch: To delete a remote branch, use the git push command with the --delete option followed by the name of the remote branch.

      ```sh
        git push origin --delete new-feature
      ```
  4. Verify the branch has been deleted: To verify that the branch has been deleted both locally and remotely, you can use the git branch command with the -a option to list all the branches, including remote branches.

      ```sh
        git branch -a
      ```

# Cleaning Git Branches
# Clening Git Branches: Oh my god how do I have so many branches?
```sh
    git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d
```
* This will delete all merged branches that you have locally except for master, developer or dev. If you have different names for your main and dev branches, you can change the grep __regex__ accordingly.
* This is a long command to remember, however you can set it to an alias like so:

    ```sh
        alias gbda='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
    ```

# Remote Repository Settings
# 1. Delete branches on merge
* Once things are merged, you should not care about the branch anymore since the history should be reflected on your master/dev branch. This significantly cleans up the number of branches you have to manage. It also makes __git fetch --all --prune__ much more effective in keeping your local repository clean.

# 2. Prevent pushes directly to master
* Without this, it's a very understandable mistake to accidentally forget you're on master and do a __git push__, potentially braking your production build. Not good.

# 3. Require at least one approval before merging
* Depending on the size of your team, you may want to require even more than one approval before merging. The bare minimum should be one though, even if you're on a team of 2 people. You don't have to spend hours nit picking every single line, but in general your code should have two sets of eyes on it.