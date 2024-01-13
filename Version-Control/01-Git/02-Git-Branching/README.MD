# Git Workflows

## Table Of Contents

# Overview Of Feature Branch

- The core idea behind the **Feature Branch Workflow** is that all feature development should take place in a dedicated branch instead of the `main` **branch**. Use branches for:

  1. Features
  2. Bugs
  3. Experiments

- Merits of **Feature Branch** include:

  - This encapsulation makes it easy for multiple developers to work on a particular feature without disturbing the main codebase.
  - It also means the `main` branch will never contain broken code, which is a huge advantage for continuous integration environments.
  - Encapsulating feature development also makes it possible to leverage **pull requests**, which are a way to initiate discussions around a branch. They give other developers the opportunity to sign off on a feature before it gets integrated into the official project.

- How it works:

  - The **Feature Branch Workflow** assumes a **central repository**, and main represents the **official project history**.
  - Instead of committing directly on their local main branch, developers create a new branch every time they start work on a new feature.

# Working With Branches (Features Branch)

## Step 1: Start with `main` branch

- Switch the Repo to the `main/master` branch
  ```sh
    git checkout master # old syntax
    # or,
    git switch master # new syntax (as of Git 2.23)
  ```
- Next, fetch the latest changes from the remote repository
  - This command will fetch the latest changes from the remote origin repository, but will not modify your local master branch.
    ```sh
      git fetch origin
    ```
  - or, directly update your local branch with the latest changes from the remote repository
    ```sh
      git reset --hard origin/main
      # or
      git pull origin master
    ```
    - The `git reset --hard origin/main` and `git pull origin master` commands are both used to update your local branch with the latest changes from the remote repository. However, they do so in different ways.
    - The `git reset --hard origin/main` command resets your local branch to match the exact state of the `origin/main` branch, discarding any local changes that you may have made. **This means that any local commits that have not been pushed to the remote repository will be lost**.
    - On the other hand, the `git pull origin master` command combines the `git fetch` and `git merge` commands into one convenient step. It fetches the latest changes from the remote master branch and then merges those changes into your local master branch. This preserves any local changes that you may have made, and attempts to merge them with the changes from the remote branch.

## Step 2: List all the Branches in the repo

- Run the following command to list all the Branches
  ```sh
    git branch -a
  ```
- This outputs `origin/HEAD -> origin/master` and `origin/master`:

  - `remotes/origin/HEAD` is a symbolic reference that points to the default branch on the remote server.
  - `-> origin/master`: The arrow indicates that `remotes/origin/HEAD` is currently pointing to the `origin/master` branch, meaning that's the default branch on the remote.
  - `remotes/origin/master`: This is a remote-tracking branch that mirrors the master branch on the remote server. It's a local copy that Git uses to track the state of the remote branch and compare it to your local branches.

- **REMARKS**:
  - Remote-tracking branches: These are local copies of remote branches, prefixed with `remotes/<remote-name>/`. They allow you to see the status of remote branches without fetching their full histories.
  - `HEAD`: This is a special pointer that indicates the current working branch. The `remotes/origin/HEAD` symbolic reference tracks the default branch on the remote.

## Step 3: Create a `new-feature` branch

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

## Step 4: Set Up Tracking Relationship Between Local Branch and Remote Branch

- To set up a tracking relationship between a **local branch** and a **remote branch**, so that **Git** knows which remote branch to push changes to by default. which means that when you run `git pull` or `git push` while on the `new-feature` branch, Git will automatically fetch or push changes to the corresponding remote branch.

  ```sh
      # push the new-feature branch to origin and set it up to track the remote branch with the name
      git push -u origin new-feature
  ```

- This command pushes `new-feature` to the central repository (`origin`), and the `-u` flag adds it as a remote tracking branch.

- After setting up the tracking branch, `git push` can be invoked without any parameters to automatically push the new-feature branch to the central repository.

## Step 5: Update, Add, Commit, and Push Changes

- On this branch, edit, stage, and commit changes in the usual fashion, building up the feature with as many commits as necessary.

  ```sh
      git status
      git add <some files>
      git commit
      git push
  ```

## Step 6: Resolve feedback

- Now teammates comment and approve the pushed commits. Resolve their comments locally, commit, and push the suggested changes to Bitbucket/GitHub.
- Your updates appear in the pull request.

## Step 7: Merge your pull request

- Before you merge, you may have to resolve merge conflicts if others have made changes to the repo. When your pull request is approved and conflict-free, you can add your code to the `main` branch. Merge from the pull request in Bitbucket/GitHub.

## Step 8: Pull Requests (PR)

- Aside from isolating feature development, branches make it possible to discuss changes via pull requests.
- Once someone completes a feature, they don’t immediately merge it into `main`. Instead, they push the feature branch to the central server and file a **pull request** asking to merge their additions into `main`. This gives other developers an opportunity to review the changes before they become a part of the main codebase.

## Step 9: Perform `git merge`

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

## Step 10: Compare `new-feature` and `old-feature` Branches

- To see which commits are in `new-feature` but not in `old-feature`, you can use the `git log` command with the double dot syntax:

  ```sh
      # compare commits between old-feature and new-feature
      git log old-feature..new-feature
  ```

- Of course, you could also use this to compare your local and remote states by writing something like `git log main..origin/main`.

* If instead of the commits you'd prefer to see the actual changes that make up those differences, you can use the `git diff` command:

  ```sh
      git diff old-feature..new-feature
  ```

## Step 11: Delete `new-feature` Branch

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

## Step 11: Renaming `new-feature` Branch

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

# Remote Repository Settings

- **Delete branches on merge**:

  - Once things are merged, you should not care about the branch anymore since the history should be reflected on your master/dev branch. This significantly cleans up the number of branches you have to manage. It also makes `git fetch --all --prune` much more effective in keeping your local repository clean.

- **Prevent pushes directly to master**:

  - Without this, it's a very understandable mistake to accidentally forget you're on master and do a `git push`, potentially braking your production build. Not good.

- **Require at least one approval before merging**:
  - Depending on the size of your team, you may want to require even more than one approval before merging. The bare minimum should be one though, even if you're on a team of 2 people. You don't have to spend hours nit picking every single line, but in general your code should have two sets of eyes on it.

# Resources

1. [Atlassian - Git Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)
2. [the Atlassian docs - Merging vs. Rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)
