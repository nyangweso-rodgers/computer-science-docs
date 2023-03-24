# Git

## Table Of Contents
- [Further Reading]() 
  - [Git Concepts I Wish I Knew Years Ago](https://dev.to/g_abud/advanced-git-reference-1o9j)
  - [Official git Documentation](https://git-scm.com/docs/gittutorial)

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

# Git Commands


# 2. View your "undo" history
* Because sometimes __git log__ doesn't cut it, especially for commands that don't show up in your commit history.
* __reflog__ is basically your safety net after running "scary" commands like __git rebase__. You'll be able to see not only the commits you made, but each of the actions that led you there.
    ```sh
        git reflog
    ```

# 3. View your current state + any merge conflicts
* check the status of a file
* It can also help you navigate through a complicated rebase or merge.

    ```sh
        git status
    ```

# 4. See the differences in your staged (or unstaged) changes
* see the difference in your staged (or unstaged) changes
    ```sh
        git diff --staged # for staged changes
        git diff # for unstaged changes
    ```
# 5. See the differences between two commits
* shows the changes between any two commits
  
    ```sh
        git diff commit1 commit2
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

# 3.2 I want to reset a file back to how it was
```sh
    git restore <filename>     # new syntax (as of Git 2.23)
    git checkout -- <filename> # old syntax
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

# 3.6 I want to add a few more changes to the last commit
```sh
    git commit --amend
```

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

# 3.11 I want to stop tracking a file in version control
```sh
    git rm --cached <file-name>
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
# 4.1 Oh my god how do I have so many branches?
```sh
    git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d
```
* This will delete all merged branches that you have locally except for master, developer or dev. If you have different names for your main and dev branches, you can change the grep __regex__ accordingly.
* This is a long command to remember, however you can set it to an alias like so:

    ```sh
        alias gbda='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
    ```

# 4.2 Let's garbage collect old branches/detached commits
```sh
    git fetch --all --prune
```

# Remote Repository Settings
# 1. Delete branches on merge
* Once things are merged, you should not care about the branch anymore since the history should be reflected on your master/dev branch. This significantly cleans up the number of branches you have to manage. It also makes __git fetch --all --prune__ much more effective in keeping your local repository clean.

# 2. Prevent pushes directly to master
* Without this, it's a very understandable mistake to accidentally forget you're on master and do a __git push__, potentially braking your production build. Not good.

# 3. Require at least one approval before merging
* Depending on the size of your team, you may want to require even more than one approval before merging. The bare minimum should be one though, even if you're on a team of 2 people. You don't have to spend hours nit picking every single line, but in general your code should have two sets of eyes on it.
# Commonly Used Git Commands
command | Explanation | Example
|-------|:------:|:------:|
$ git init  |initialize a git local repo (create an empty repository)
$ git config | configure the tooling
$ git add . | adds all the new files created and added to git
$ git add "file_name" | add a file or multiple files into the staging area makes git include those fast to the index making them ready for commit later on.
$ git commit | commits a file to the repo | git commit -m "comments about the commmit" OR git commit -ma "commit message" # commit multiple files
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