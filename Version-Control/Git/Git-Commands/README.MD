# Git Commands

## Table Of Contents
- [Further Reading]()
  - [freeCodeCamp - Undo Git Add – How to Remove Added Files in Git](https://www.freecodecamp.org/news/undo-git-add-how-to-remove-added-files-in-git/)

# How to Add Files to Git
* You can add files to the staging area using `git add` command.

    ```sh
        # stage all file in the current working directory
        git add .

        # stage a single file
        git add index.html

        # stage multiple files in the current working directory
        git add index.html index.css index.js
    ```

* You can confirm the staged files using `git status` command.

# How to Remove Added Files in Git
* You can either use `git reset` or `git rm --cached` command with the following differences.
* `git reset` is used to remove files from the staging area but keep the changes in 'your working directory'

    ```sh
        # to remove a single file
        git reset index.html

        # to remove multiple files from the staging area
        git reset
    ```
* `git rm` is used to permanently delete  a file from the repository.
* By adding `--cached` flag, you "unstage" the file. The cached option specifies that the removal should happen only on the staging index. Working directory files will be left alone.

    ```sh
        # stop tracking a file in version control
        git rm --cached
    ```
* Because of this, it's recommended to use this command with caution and to make sure you are intentionally removing files you no longer need to track in Git.

# How to View your current state + any merge conflicts
* check the  for the status of a file to help you navigate through a complicated rebase or merge, use `git status`

    ```sh
        # check status of a file
        git status
    ```

# How to Reset a file back to the previous state

```sh
    # new syntax (as of Git 2.23)
    git restore index.html    
    
    # old syntax 
    git checkout --index.html 
```
# 1. Logging Commands
* What did I just do?
  
  ```sh
        git log # shows the history of the snapshot
        git log --oneline # more succinct output
        git log --graph # with a visual graph of branches
  ```

# 2. Navigation Commands

# 2. View your "undo" history
* Because sometimes __git log__ doesn't cut it, especially for commands that don't show up in your commit history.
* __reflog__ is basically your safety net after running "scary" commands like __git rebase__. You'll be able to see not only the commits you made, but each of the actions that led you there.
    ```sh
        git reflog
    ```

# 4. See the differences in your staged (or unstaged) changes
* see the difference in your staged (or unstaged) changes
    ```sh
        git diff --staged # for staged changes
        git diff # for unstaged changes
    ```

# 2. Navigation Commands
# 2.1. I want to see what I did before
* This will uncommit and unstage those changes but leave those files in the working directory.
    ```sh
        git reset <commit-sha>
    ```

# 3. Modifications Commands
# 3.1 I dug myself into a rabbit hole, let's start over
* This will reset your local directory to match the latest commit and discard unstaged changes.

    ```sh
        git reset --hard HEAD
    ```

# 3.3 I want to undo the last commit and rewrite history
```sh
    git reset --hard HEAD~1
```

# 3.4 I want to rewind back n commits
```sh
    git reset --hard HEAD~n        # n is the last n commits
    git reset --hard <commit-sha>  # or to a specific commit
```

* There is an important distinction between soft, mixed, and hard resets. 
* Basically:
  1. __--soft__: Uncommit changes but leave those changes staged
  2. __--mixed__: (the default): Uncommit and unstage changes, but changes are left in the working directory
  3. __--hard__: Uncommit, unstage, and delete changes

# 3.5 I've rewritten history and now want to push those changes to the remote repository
* This is necessary anytime your local and remote repository diverge.

    ```sh
        git push -f
    ```

* __WARNING__: _Force pushing should be done with __great care__. In general, on shared branches you should avoid doing any force pushes. Limit force pushing to your own branches, before opening a pull request, so that you don't inadvertently mess up your teammates' git history._

# 3.7 I want to rewrite a bunch of commits locally
* This will open up an interactive prompt where you can select which commits to keep, squash, or delete. You can also change commit messages here. This is very useful when cleaning up typo or linting commits, for example.
  
    ```sh
        git rebase -i <commit hash> # where the commit hash is the one *before* all the changes you want to make
    ```

# 3.8 This rebase is a mess, let's scrap it
* You can do this mid rebase. I often find that a rebase is way more trouble than it's worth, especially when rebasing two branches with a lot of similar changes. Until the rebase is complete, you can always abort it.

    ```sh
        git rebase --abort
    ```

# 3.9 I want to bring in a commit from a different branch
```sh
    # From the branch you want to bring the commit *into*
    git cherry-pick <commit-sha>
```

# 3.10 I want to bring in a specific file from a different branch
```sh
    git checkout <branch-name> <file-name>
```

# 3.12 I need to switch branches but my current state is broken
```sh
    git stash # saves your changes to the top of the stash stack
    git stash save "message to go along with changes"
    git stash -u # stash untracked files as well
```

# 3.13 I want to see what's in my stash
```sh
    git stash list
```

# 3.14 I want to bring back something in my stash
```sh
    git stash pop # "pops" the most recent item added to the stash stack
    git stash apply stash@{stash_index} # apply a given item in the stash (from git stash list)
```

# 3.15 I want to undo a commit without rewriting history
```sh
    git revert HEAD # undo the last commit
    git revert <commit hash> # for a specific commit
```
* This will replay the inverse of the commit specified as a new commit, thereby undoing your changes without undoing history. This is a much safer way to undo a commit on shared branches, where rewriting history has much bigger consequences.

# 3.16 I want to find which commit caused a bug
```sh
    git bisect start
    git bisect bad           # Current version is bad
    git bisect good v1.1     # v1.1 is known to be good

    git help bisect          # For more
```

# 4. Cleanup Git Commands

# 4.1 Let's garbage collect old branches/detached commits
```sh
    git fetch --all --prune
```