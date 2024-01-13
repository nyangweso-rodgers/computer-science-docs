# Rebasing in Git

## Table of contents

# Understanding `git rebase`

- `git rebase` is a powerful feature of Git that has the ability to rewrite and reorganize your commit history. `git rebase` allows you to change the base of your branch.
- Unlike `merging`, which _creates a new merge commit and combines the history of both branches_, `rebasing` _replays the commits of one branch onto another_. This results in a linear commit history, making it easier to read and understand.

# How to perform `git rebase`

- While on `new-feature` branch, you will want to do the following:
- Switch to the `main` branch:

  ```sh
        # swithc to main branch
        git checkout main
  ```

- Update your local `main` branch with `git pull`. This is so we have the latest HEAD of `main` available for the rebase.

  ```sh
      # update local branch with git pull
      git pull
  ```

- Switch back to the `new-feature` branch, and use `git rebase main` which will complete the rebase, replaying your commits on top of the HEAD of `main`

# This rebase is a mess, let's scrap it

- You can do this mid rebase. I often find that a rebase is way more trouble than it's worth, especially when rebasing two branches with a lot of similar changes. Until the rebase is complete, you can always abort it.

  ```sh
      git rebase --abort
  ```

# Rebase Best Practices

- While `git rebase` undoubtedly keeps your commit history cleaner, there are a few things to be mindful of:

  - Use `rebase` **ONLY** for local branches. **DO NOT REBASE branches others are working on**. Rebase changes the commit history, and others will not know about it.
  - Regularly fetch and rebase your local branches to stay up-to-date with the main branch. Conflicts become messy! Rebase early and often.

# Resources

1. [TOWER - Using git rebase Instead of git merge](https://www.git-tower.com/learn/git/faq/rebase/?utm_source=freecodecamp&utm_medium=guestpost&utm_campaign=working-with-branches-in-git)
