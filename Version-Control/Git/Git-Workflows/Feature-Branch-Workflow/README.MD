# Git Feature Branch Workflow

## Table Of Contents
- [Overview Of Feature Branch](#Overview-Of-Feature-Branch)
- [Merits of Feature Branch](#Merits-of-Feature-Branch)
- [How it Works](#How-it-works)
    1. [Step 1: Start with the main branch](#Step-1:-Start-with-the-main-branch)


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

# Step 1: Start with the main branch
* Switch the Repo to the `main/master` branch
* Next, fetch the latest changes from the remote repository
* Finally, pull the latest changes from the remote `master` branch and update your local master branch
  
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
* This switches the repo to the `main` branch, pulls the latest commits and resets the repo's local copy of `main` to match the latest version.
  
* __NOTE__: 
  * The `git reset --hard origin/main` and `git pull origin master` commands are both used to update your local branch with the latest changes from the remote repository. However, they do so in different ways.
  
  * The `git reset --hard origin/main` command resets your local branch to match the exact state of the `origin/main` branch, discarding any local changes that you may have made. _This means that any local commits that have not been pushed to the remote repository will be lost_.
  
  * On the other hand, the `git pull origin master` command combines the `git fetch` and `git merge` commands into one convenient step. It fetches the latest changes from the remote master branch and then merges those changes into your local master branch. This preserves any local changes that you may have made, and attempts to merge them with the changes from the remote branch.

# Step 2: Create a new feature branch
* Use a separate branch for each feature or issue you work on. After creating a branch, check it out locally so that any changes you make will be on that branch.

  ```sh
      git checkout -b new-feature
  ```
* This checks out a branch called `new-feature` based on `main`, and the `-b` flag tells Git to create the branch if it doesn’t already exist.

# Step 3: Update, add, commit, and push changes
* On this branch, edit, stage, and commit changes in the usual fashion, building up the feature with as many commits as necessary. Work on the feature and make commits like you would any time you use Git. 

  ```sh
      git status
      git add <some files>
      git commit 
  ```

# Step 4: Push feature branch to remote
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
# Step 5: Set Up Tracking Relationship Between Local Branch and Remote Branch
* To set up a tracking relationship between a `local branch` and a `remote branch`, so that Git knows which remote branch to push changes to by default, you can use the following command:

  ```sh
      # new-feature branch
      git branch --set-upstream-to=origin/new-feature new-feature
      # or
      git push -u origin new-feature
      # or
      git push -u new-feature

  ```
* This will set up a tracking relationship between the local `new-feature` branch and the remote `origin/new-feature` branch, which means that when you run `git pull` or `git push` while on the `new-feature` branch, Git will automatically fetch or push changes to the corresponding remote branch.

* The `git push -u` command is a shorthand for `git push --set-upstream`.
  
* When you run `git push -u origin new-feature`, Git will push the local `new-feature` branch to the `origin` remote and set it up to track the remote branch with the same name.
  
* When you run `git push -u new-feature` , Git will try to push the local `new-feature` branch to remote branch with the same name, but it will use the default remote repo configured for the current branch. If the current branch has a configured upstream branch, then Git will push to that upstream branch. Otherwise, Git will display an error message.
  
* _Remark_: _it is a best practice to use `git push -u origin new-feature` instead of `git push -u new-feature`. The reason for this is that the first command explicitly specifies the remote repository and branch to push to and set up tracking for, which is more clear and less error-prone. It ensures that the changes are pushed to the correct remote repository and branch, even if the default remote or branch is different than what you intended_.


* This command pushes `new-feature` to the central repository (`origin`), and the `-u` flag adds it as a remote tracking branch.
* After setting up the tracking branch, `git push` can be invoked without any parameters to automatically push the new-feature branch to the central repository. 
* To get feedback on the new feature branch, create a pull request in a repository management solution like GitHub.

# Step 6: Resolve feedback
* Now teammates comment and approve the pushed commits. Resolve their comments locally, commit, and push the suggested changes to Bitbucket/GitHub.
* Your updates appear in the pull request.

# Step 7: Merge your pull request
* Before you merge, you may have to resolve merge conflicts if others have made changes to the repo. When your pull request is approved and conflict-free, you can add your code to the `main` branch. Merge from the pull request in Bitbucket/GitHub.

# Step 8: Pull Requests (PR)
* Aside from isolating feature development, branches make it possible to discuss changes via pull requests.
* Once someone completes a feature, they don’t immediately merge it into `main`. Instead, they push the feature branch to the central server and file a `pull request` asking to merge their additions into `main`. This gives other developers an opportunity to review the changes before they become a part of the main codebase.

# Step 9: Perform `git merge`
## Step 9.1: Merge the `new-feature` Branch to `main` Branch
* To merge  `new-feature` branch into the `main` branch, you should first switch to the `main` branch using the following command:

  ```sh
      # swicth to main branch
      git checkout main
  ```
* Ensure you have the latest updates from the remote `main` branch.

  ```sh
      # pull the latest updates from the remote main branch
      git pull
  ```

* Use `git merge` to merge `new-feature` branch into the `main` branch:

  ```sh
      # merge new-feature to main
      git merge new-feature
  ```
* Resolve any conflicts that may arise during the merge process. If there are any conflicts, Git will prompt you to resolve them before proceeding.
* Once the merge is complete, push the changes to the remote `main` branch:

  ```sh
      # push the local merged changes to remote
      git push origin main
  ```
* Delete the `new-feature` branch locally:

  ```sh
      # delete new-feature branch locally
      git branch -d new-feature
  ```

* Finally, delete the `new-feature` branch remotely:

  ```sh
      # delete the new-feature branch remotely
      git push origin :new-feature
  ```

## Step 9.2: Resolving Conflicts
* When you are in the middle of a merge and there are conflicts to resolve, you can exit the merge process without completing the merge by using the command `git merge --abort`. This will undo the merge and return the repository to the state it was in before the merge began.

  ```sh
      # exit the merge 
      git nerge --abort
  ```
* __Note__: _any changes you made during the merge process that were not committed will be lost when you abort the merge. So, make sure to save any changes you want to keep before aborting the merge._


# Step 10: Delete `new-feature` Branch
* To `delete` a `new-feature` branch both locally and remotely, you can follow these steps:
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
  4. Verify the branch has been deleted: To verify that the branch has been deleted both locally and remotely, you can use the `git branch` command with the `-a` option to list all the branches, including remote branches.

      ```sh
        # lists all branches both locally and remotely
        git branch -a

        # or
        # lists remote branches
        git branch -r
      ```
# Step 11: Updating Local & Remote Feature Branch to Match the origin/master
* First, make sure you are on the feature branch by running the following command:

  ```sh
      git checkout feature-branch
  ```
* Next, fetch the latest changes from the remote main branch by running the following command:

  ```sh
      git fetch origin main
  ```
* Merge the changes from the remote main branch into your local feature branch by running the following command:

  ```sh
      git merge origin/main
  ```
* If there are any merge conflicts, resolve them and commit the changes
  ```sh
    git commit -m "Merge remote-tracking branch 'origin/main' into feature_branch"
  ```
* Finally, push the changes to the remore feature branch by running the following branch

  ```sh
      git push origin feature-branch
  ```
* This will update both your local and remote feature branch to match the origin/main branch in Git.

# Step 12: Renaming Feature Branches Locally & Remotely
* Rename the `local branch` from `old-branch-name` to `new-branch-name`
  ```sh
      git branch -m old-branch-name new-branch-name
  ```
* Push the renamed local branch to the remote branch with the same name:

  ```sh
      git push origin new-branch-name
  ```
* Alternatively, you can combine the two steps into one by using the `-u` flag with the `git push` command, which will automatically set the upstream branch to the newly renamed branch. Here's the command:

  ```sh
      git push -u origin new-branch-name
  ```
* This will both push the renamed local branch to the remote branch with the new name and set the upstream branch for the local branch to the remote branch with the same name.
* To check the lists of remote branches, you can use `git branch -r` command. This will show you a list of all remote branches that your local repository is aware of.
* If you see two branches listed for the same feature, one with the old name and one with the new name, you can delete the old branch from the remote repository using the following command:

  ```sh
      git push origin :old-branch-name
  ```
* This command will push nothing to the remote branch with the name old-branch-name, effectively deleting it.
* After deleting the old branch, you can verify that there is only one branch with the new name on the remote repository by running `git branch -r` again.


# Step 13: Cleaning Git Branches
* __Cleaning Git Branches__: Oh my god how do I have so many branches?
  ```sh
      git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d
  ```
* This will delete all merged branches that you have locally except for master, developer or dev. If you have different names for your main and dev branches, you can change the grep __regex__ accordingly.
* This is a long command to remember, however you can set it to an alias like so:

    ```sh
        alias gbda='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
    ```

# Step 14: Remote Repository Settings
* __Delete branches on merge__:
  * Once things are merged, you should not care about the branch anymore since the history should be reflected on your master/dev branch. This significantly cleans up the number of branches you have to manage. It also makes __git fetch --all --prune__ much more effective in keeping your local repository clean.

* __Prevent pushes directly to master__:
  * Without this, it's a very understandable mistake to accidentally forget you're on master and do a __git push__, potentially braking your production build. Not good.

* __Require at least one approval before merging__:
  * Depending on the size of your team, you may want to require even more than one approval before merging. The bare minimum should be one though, even if you're on a team of 2 people. You don't have to spend hours nit picking every single line, but in general your code should have two sets of eyes on it.