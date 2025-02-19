# Git Commands

## Table Of Contents

# Git Commands

## 2. Git Branching

- The core idea behind the **Feature Branch Workflow** is that all feature development should take place in a dedicated branch instead of the `main` **branch**. Use branches for:

  1. Features
  2. Bugs
  3. Experiments

- Merits of **Feature Branch** include:

  - This encapsulation makes it easy for multiple developers to work on a particular feature without disturbing the main codebase.
  - It also means the `main` branch will never contain broken code, which is a huge advantage for continuous integration environments.
  - Encapsulating feature development also makes it possible to leverage **pull requests**, which are a way to initiate discussions around a branch. They give other developers the opportunity to sign off on a feature before it gets integrated into the official project.

- Steps to working with Git Branches:

  1.  **Step 1**: Start with `main` or `master`

      - Switch the Repo to the `main/master` branch
        ```sh
         git checkout main # old syntax
         # or
         git switch main # new syntax (as of Git 2.23)
        ```

  2.  **Step 2**: **Fetch the latest changes from the remote repository**

      - This command will fetch the latest changes from the remote origin repository, but will not modify your local master branch.

        ```sh
         git fetch origin
        ```

      - or, directly update your local branch with the latest changes from the remote repository
        ```sh
         git reset --hard origin/main
         # or,
         git pull origin main
        ```
      - **Remarks**:
        - The `git reset --hard origin/main` and `git pull origin master` commands are both used to update your local branch with the latest changes from the remote repository. However, they do so in different ways.
        - The `git reset --hard origin/main` command resets your local branch to match the exact state of the `origin/main` branch, discarding any local changes that you may have made. **This means that any local commits that have not been pushed to the remote repository will be lost**.
        - On the other hand, the `git pull origin master` command combines the `git fetch` and `git merge` commands into one convenient step. It fetches the latest changes from the remote master branch and then merges those changes into your local master branch. This preserves any local changes that you may have made, and attempts to merge them with the changes from the remote branch.

  3.  **Step 3**: **List all the Branches in the repo**

      - Run the following command to list all the **Branches**

        ```sh
          git branch -a
        ```

      - This outputs `origin/HEAD -> origin/master` and `origin/master`:

        - `remotes/origin/HEAD` is a symbolic reference that points to the default branch on the remote server.
        - `-> origin/master`: The arrow indicates that `remotes/origin/HEAD` is currently pointing to the `origin/master` branch, meaning that's the default branch on the remote.
        - `remotes/origin/master`: This is a remote-tracking branch that mirrors the master branch on the remote server. It's a local copy that Git uses to track the state of the remote branch and compare it to your local branches.

      - **Remarks**:
        - Remote-tracking branches: These are local copies of remote branches, prefixed with `remotes/<remote-name>/`. They allow you to see the status of remote branches without fetching their full histories.
        - `HEAD`: This is a special pointer that indicates the current working branch. The `remotes/origin/HEAD` symbolic reference tracks the default branch on the remote.

  4.  **Step 4**: Create a `new-feature` branch

      - Use a separate branch for each feature or issue you work on. After creating a branch, check it out locally so that any changes you make will be on that branch.

        ```sh
            git checkout -b new-feature
        ```

      - This checks out a branch called `new-feature` based on `main`, and the `-b` flag tells Git to create the branch if it doesn’t already exist.
      - If you want to go back to a previous branch use `git switch -` command

        ```sh
            # go back to a previous branch
            git switch -
        ```

  5.  **Step 5**: **Set Up Tracking Relationship Between Local Branch and Remote Branch**

      - To set up a tracking relationship between a **local branch** and a **remote branch**, so that **Git** knows which remote branch to push changes to by default. which means that when you run `git pull` or `git push` while on the `new-feature` branch, **Git** will automatically fetch or push changes to the corresponding remote branch.

        ```sh
            # push the new-feature branch to origin and set it up to track the remote branch with the name
            git push -u origin new-feature
        ```

      - This command pushes `new-feature` to the central repository (`origin`), and the `-u` flag adds it as a remote tracking branch.
      - After setting up the tracking branch, `git push` can be invoked without any parameters to automatically push the new-feature branch to the central repository.

  6.  **Step 6**: **Update, Add, Commit, and Push Changes**

      - On this branch, edit, stage, and commit changes in the usual fashion, building up the feature with as many commits as necessary.

        ```sh
            git status
            git add <some files>
            git commit
            git push
        ```

  7.  **Step 7**: **Merge Pull Request**

      - Once someone completes a feature, they don’t immediately merge it into `main`. Instead, they push the feature branch to the central server and file a **pull request** asking to merge their additions into `main`. This gives other developers an opportunity to review the changes before they become a part of the main codebase.
      - Before you merge, you may have to resolve merge conflicts if others have made changes to the repo. When your pull request is approved and conflict-free, you can add your code to the `main` branch. Merge from the pull request in Bitbucket/GitHub.
      - To merge `new-feature` branch into the `main` branch, you should first switch to the `main` branch:

        ```sh
            # switch to main branch
            git checkout main
        ```

      - Ensure you have the latest updates from the remote `main` branch.

        ```sh
            # pull the latest updates from the remote main branch
            git pull
        ```

      - Use `git merge` to merge `new-feature` branch into the `main` branch:

        ```sh
            # merge new-feature to main
            git merge new-feature
        ```

      - Resolve any conflicts that may arise during the merge process. If there are any conflicts, Git will prompt you to resolve them before proceeding.
      - Once the merge is complete, push the changes to the remote `main` branch:

        ```sh
            # push the local merged changes to remote
            git push origin main
        ```

  8.  **Step 8**: Compare `new-feature` and `old-feature` Branches

      - To see which commits are in `new-feature` but not in `old-feature`, you can use the `git log` command with the double dot syntax:

        ```sh
            # compare commits between old-feature and new-feature
            git log old-feature..new-feature
        ```

      - Of course, you could also use this to compare your local and remote states by writing something like `git log main..origin/main`.
      - If instead of the commits you'd prefer to see the actual changes that make up those differences, you can use the `git diff` command:

        ```sh
            git diff old-feature..new-feature
        ```

  9.  **Step 9**: Delete `new-feature` Branch

      - To **delete** a `new-feature` branch both locally and remotely. Switch to the `main` branch:

        ```sh
            # checkout of the main branch
            git checkout main
        ```

      - Delete the `new-feature` branch locally:

        ```sh
            # delete new-feature branch locally
            git branch -d new-feature
        ```

      - Finally, delete the `new-feature` branch remotely:

        ```sh
            # delete the new-feature branch remotely
            git push origin :new-feature
            # or,
            git push origin --delete new-feature
        ```

      - Verify that the `new-feature` branch has been deleted both locally and remotely, you can use the `git branch` command with the `-a` option to list all the branches, including remote branches.

            ```sh
                # lists all branches both locally and remotely
                git branch -a

                # or
                # lists remote branches
                git branch -r
            ```

  10. **Step 10**: Renaming `new-feature` Branch

      - To rename the **local branch** from `old-branch-name` to `new-branch-name`
        ```sh
            git branch -m old-branch-name new-branch-name
        ```
      - Push the renamed local branch to the remote branch with the same name:

        ```sh
            git push origin new-branch-name
        ```

      - Alternatively, you can combine the two steps into one by using the `-u` flag with the `git push` command, which will automatically set the upstream branch to the newly renamed branch. Here's the command:

        ```sh
            git push -u origin new-branch-name
        ```

- **Remote Repository Settings**:

  - **Delete branches on merge**: Once things are merged, you should not care about the branch anymore since the history should be reflected on your master/dev branch. This significantly cleans up the number of branches you have to manage. It also makes `git fetch --all --prune` much more effective in keeping your local repository clean.
  - **Prevent pushes directly to master**: Without this, it's a very understandable mistake to accidentally forget you're on master and do a `git push`, potentially braking your production build. Not good.
  - **Require at least one approval before merging**: Depending on the size of your team, you may want to require even more than one approval before merging. The bare minimum should be one though, even if you're on a team of 2 people. You don't have to spend hours nit picking every single line, but in general your code should have two sets of eyes on it.

- **Resolving Merge Conflicts in Git**

  - In **Git**, a merge conflict occurs when:

    1.  you or any of your team members make conflicting changes to the same file from two different branches.
    2.  If you’ve made changes to the same file from different branches and the changes are conflicting.

  - A sample scenario of a merge conflict could look like this:
    - you work in branch `main` and makes changes to line 1 of a `index.txt` file, say `Hi world`
    - you switch to `new-feature` branch and makes changes to the same line two of `index.txt`, say `Hello earth`.
    - if you attempt to merge `new-feature` to `main`, git won't be able to automatically decide which one to accept between `Hi world` and `Hello earth`. So, `Git` will raise a merge conflict error and tell you to manually resolve the conflict.
  - There are two types of merge conflicts:
    1. **content conflict**:
    - occurs when the changes you make in two different branches affect the same lines of code in a file. This results in conflicting changes that cannot be automatically merged by **Git**.
    - E.g., you make change `display: flex` to L2 in one branch and another change `text-align: center` to the same L2 in the same file in another branch.
    - When this content conflict happens, **Git** will stop the merging process and prompt you to make adjustments to the code before moving forward.
    2. **structural conflict**.
    - occurs when the changes you make in two different branches affect the same file but do not conflict with each other line-by-line. Instead, the changes affect the structure or organization of the file, such as renaming a variable, or function, or moving a block of code.
    - If this structural conflict happens, **Git** won’t be able to determine which of the changes to accept and will prompt you to decide which changes you want.

- **What to Do When Merge Conflicts Occur**

  - When conflicts occur, git will automatically annonate the conflicting lines for you with `<`, `=` and `>` symbols:

  ```sh
      <<<<<<<<<
      changes in the current branch - branch you are erging into
      =========
      all the incoming changes from the branch you want to merge to another branch
      >>>>>>>>>
  ```

  - Everything between the lesser than (`<`) and equals signs (`=`) is the change in the current branch (the _branch you're merging into_). Everything between the equals (`=`) and greater than (`>`) signs is the incoming change from the branch you want to merge to another branch.

  - It is left up to you to remove those annotations and decide how you want the conflicting lines to be – you can accept one of the changes or both of them.

- **Using GitHub Interface to Resolve Merge Conflicts**

  - After pushing the `new-feature` branch to GitHub, GitHub will ask I create a `pull request` so the `new-feature` branch will be merged to `main`. In this case, immediately you click on “**Compare and Pull**”, you will see that there can’t be an automatic merging because there’s a conflict:
  - This means there’s a conflict you need to resolve. Create the pull request and scroll down to see where you can resolve the conflict, then click the “**Resolve conflicts**” button:

    - **Step 1**: When you click on “**Resolve conflicts**”, you will get an editor, and to the right, you will see the list of files that have the conflicts:
    - **Step 2**: In the editor, you will see the lines where the conflicts have occurred: the changes in the incoming branch are between the lesser than `(<)` and equals `(=)` signs, while the changes in the branch you want to merge into are surrounded by greater than `(>)` and equals `(=)` signs.
    - **Step 3**: Choose the line you want, remove the annotations, and click “**Mark as resolved**” in the top right corner:

  - Repeat the same process for any other file that have some conflict(s) too.
  - If you want, you can keep both lines. Just make sure you remove the annotations.
  - After doing that, click on “**Commit merge**” in the top right corner:

- **Resolve Merge Conflicts in VS Code**

  - When you switch `main` ,the branch you want to merge into and run `git merge new-feature`, you will be prompted to resolve some conflicts (if any).
  - At this stage, if you’re not ready to resolve the conflicts, you can `abort` the merging by running:

    ```sh
        # exit the merge
        git merge --abort
    ```

  - **Note**: _any changes you made during the merge process that were not committed will be lost when you abort the merge. So, make sure to save any changes you want to keep before aborting the merge._

  * But if you want to resolve the conflicts, you can either _accept the incoming change(s)_, _accept the current change_, or _accept both changes_.

  * If you select any of the three, the merge conflict(s) will be resolved. After that, add the file and commit it the usual way you would do it:

    ```sh
        git add .
        git commit -m"some commit message"
    ```

- **How to Resolve Merge Conflicts in Git with VS Code 3-way Merge Editor**

  - You can also rebase a conflict with the **VS Code** 3-way merge editor.
  - After running `git merge new-feature`, click on the “**Resolve in Merge Editor**” button.
  - You will see you now have 3 views. You will see the changes in the incoming branch on the right, the changes in the branch you want to merge into on the right (the current branch), and the preview below the two.
  - Now start resolving the conflicts by selecting any of the available options:
    1. Accept Incoming
    2. Accept Combination (Incoming First)
    3. Accept Current
    4. Accept Combination (Current First)
  - **Incoming** is the change in the `new-feature `branch you want to merge into, `main` a target branch, and current is the change already in the branch you want to merge into.

  - Switch to each file, click on the “**Resolve in Merge Editor**” button, and select any of the options there.
  - You can also resolve the conflicts by entering the right code in each of the files.
  - When you are satisfied, click on “Complete Merge” in each merge editor:
  - You have to add the files again and commit them:

    ```sh
        git add .
        git commit -m"some commit message"
    ```

  - **Remarks**
    - If you want the 3-way merge editor to open automatically when you want to merge conflicts, click “Settings” and search for “merge editor”, then checkmark “open the merge editor for files that are currently under conflicts”.

##

### `git add file_name` or `git add .`

- You can add files to the staging area using `git add` command.

  ```sh
      # stage all file in the current working directory
      git add .

      # stage a single file
      git add index.html

      # stage multiple files in the current working directory
      git add index.html index.css index.js
  ```

### `git status`

- You can confirm the staged files using `git status` command.
  ```sh
    # check status of a file
    git status
  ```

### `git reset file_name`

- `git reset` is used to remove files from the staging area but keep the changes in 'your working directory'

  ```sh
    # to remove a single file
    git reset index.html

    # to remove multiple files from the staging area
    git reset
  ```

### `git rm --cached`

- `git rm` is used to permanently delete a file from the repository.
- By adding `--cached` flag, you "**unstage**" the file. The cached option specifies that the removal should happen only on the staging index. Working directory files will be left alone.

  ```sh
      # stop tracking a file in version control
      git rm --cached
  ```

- Because of this, it's recommended to use this command with caution and to make sure you are intentionally removing files you no longer need to track in Git.

## 2. Logging Commands

### 2.1 `git log`

- logs the activities occurred with the files tracked in git.
- It is a verbose log with information like:
  - commit ID,
  - author,
  - date of commit, and
  - commit message.

### 2.2 `git log --oneline`

- As the `git log` is verbose, you can use the `--oneline` switch to get even crisper logging.
- It provides the commit ID and the commit message's first line.

### 2.3 `git log --stat`

- Use the `--stat` or `-p` options to display the diffs with every commit.
- The `--stat` option shows the number of insertions and deletions to each file, whereas the `-p` option shows the actual file changes.

### 2.4 `git shortalog`

- groups the commit by author and displays the first line of their commit messages.

### 2.5 `git log --graph --oneline --decorate`

- The `--graph` option provides the **graph** representing a branching structure.
- You can use the above command to determine which commit belongs to what branch!

# How to Reset a file back to the previous state

```sh
    # new syntax (as of Git 2.23)
    git restore index.html

    # old syntax
    git checkout --index.html
```

# 2. Navigation Commands

# 2. View your "undo" history

- Because sometimes **git log** doesn't cut it, especially for commands that don't show up in your commit history.
- **reflog** is basically your safety net after running "scary" commands like **git rebase**. You'll be able to see not only the commits you made, but each of the actions that led you there.
  ```sh
      git reflog
  ```

# 4. See the differences in your staged (or unstaged) changes

- see the difference in your staged (or unstaged) changes
  ```sh
      git diff --staged # for staged changes
      git diff # for unstaged changes
  ```

# 2. Navigation Commands

# 2.1. I want to see what I did before

- This will uncommit and unstage those changes but leave those files in the working directory.
  ```sh
      git reset <commit-sha>
  ```

# 3. Modifications Commands

# 3.1 I dug myself into a rabbit hole, let's start over

- This will reset your local directory to match the latest commit and discard unstaged changes.

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

- There is an important distinction between soft, mixed, and hard resets.
- Basically:
  1. **--soft**: Uncommit changes but leave those changes staged
  2. **--mixed**: (the default): Uncommit and unstage changes, but changes are left in the working directory
  3. **--hard**: Uncommit, unstage, and delete changes

# 3.5 I've rewritten history and now want to push those changes to the remote repository

- This is necessary anytime your local and remote repository diverge.

  ```sh
      git push -f
  ```

- **WARNING**: _Force pushing should be done with **great care**. In general, on shared branches you should avoid doing any force pushes. Limit force pushing to your own branches, before opening a pull request, so that you don't inadvertently mess up your teammates' git history._

# 3.7 I want to rewrite a bunch of commits locally

- This will open up an interactive prompt where you can select which commits to keep, squash, or delete. You can also change commit messages here. This is very useful when cleaning up typo or linting commits, for example.

  ```sh
      git rebase -i <commit hash> # where the commit hash is the one *before* all the changes you want to make
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

- This will replay the inverse of the commit specified as a new commit, thereby undoing your changes without undoing history. This is a much safer way to undo a commit on shared branches, where rewriting history has much bigger consequences.

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

## Commits

### 1. Adding a few more changes to the `last-commit`

```sh
    git commit --amend
```

### 1. See Differences Between `first-commit` and `last-commit`

```sh
    # shows the changes between any two commits
    git diff first-commit last-commit
```

### 1. Tagging commits

- To mark a specific commit as a **release** or a **milestone**, we can use the `git tag`

  ```sh
      git tag v1.0
  ```

- This command creates a tag called `v1.0` for the current commit. We can later push the tags to the remote repository using the `git push --tags` command.

# Resources

1. [freeCodeCamp - Undo Git Add – How to Remove Added Files in Git](https://www.freecodecamp.org/news/undo-git-add-how-to-remove-added-files-in-git/)
2. [Atlassian - Git Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)
3. [the Atlassian docs - Merging vs. Rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)
4. [freeCodeCamp - How to Fix Merge Conflicts in Git](https://www.freecodecamp.org/news/how-to-fix-merge-conflicts-in-git/)
5. [Adding locally hosted code to GitHub](https://docs.github.com/en/migrations/importing-source-code/using-the-command-line-to-import-source-code/adding-locally-hosted-code-to-github)
