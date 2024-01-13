# Commits

# Tagging commits
* To mark a specific commit as a release or a milestone, we can use the `git tag`

    ```sh
        git tag v1.0
    ```
* This command creates a tag called `v1.0` for the current commit. We can later push the tags to the remote repository using the `git push --tags` command.

# See Differences Between `first-commit` and `last-commit`
```sh
    # shows the changes between any two commits
    git diff first-commit last-commit
```

# Adding a few more changes to the `last-commit`
```sh
    git commit --amend
```