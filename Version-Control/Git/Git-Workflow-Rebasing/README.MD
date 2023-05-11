# Rebasing in Git

# Rebasing Branches
* If we want to update our branch with changes made in another branch, we can use the `git rebase`:

    ```sh
        git checkout new-feature
        git rebase main
    ```
* This updates the `new-feature` branch with the changes made in the `main` branch.
* _Note_: _We may need to resolve any conflicts that arise during the rebase process._