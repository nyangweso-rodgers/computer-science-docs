# Git Commands

## Table Of Contents

# 1. Logging Commands
* What did I just do?
  
  ```sh
        git log # shows the history of the snapshot
        git log --oneline # more succinct output
        git log --graph # with a visual graph of branches
  ```

# 2. Navigation Commands
# 2.1. I want to switch to another branch
* __git checkout__ can be a bit confusing because it can work on the file and branch level.

    ```sh
        git switch branch-name   # new syntax (as of Git 2.23)
        git checkout branch-name # old syntax
    ```

# 2.2. I want to go back to the branch I was on
```sh
    git switch -
```