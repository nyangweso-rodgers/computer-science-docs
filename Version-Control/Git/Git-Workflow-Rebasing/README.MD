# Rebasing in Git

## Table of contents
- [Further Reading]()
    1. [TOWER - Using git rebase Instead of git merge](https://www.git-tower.com/learn/git/faq/rebase/?utm_source=freecodecamp&utm_medium=guestpost&utm_campaign=working-with-branches-in-git)

# Rebasing Branches
* If we want to update our branch with changes made in another branch, we can use the `git rebase`:

    ```sh
        git checkout new-feature
        git rebase main
    ```
* This updates the `new-feature` branch with the changes made in the `main` branch.
* _Note_: _We may need to resolve any conflicts that arise during the rebase process._