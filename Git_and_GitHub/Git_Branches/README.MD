# Git Branches

## Table Of Contents
- [Working with Git Branches](#Working-with-Git-Branches)
    - [Uses Of Git Branches](#Uses-Of-Git-Branches)
    - [How to Create a Branch in Git](#How-to-Create-a-Branch-in-Git)
    - [How to Rename a Branch in Git](#How-to-Rename-a-Branch-in-Git)
    - [How to Switch Branches in Git](#How-to-Switch-Branches-in-Git)
    - [Check the available Branches](#Check-the-available-Branches)
    - [How to Publish a Branch in Git](#How-to-Publish-a-Branch-in-Git)
    - [How to Track Branches in Git](#How-to-Track-Branches-in-Git)
    - [How to Delete a Branch in Git](#How-to-Delete-a-Branch-in-Git)
    - [How to Merge Branches in Git](#How-to-Merge-Branches-in-Git)
    - [How to Rebase Branches in Git](#How-to-Rebase-Branches-in-Git)
    - [How to Compare Branches in Git](#How-to-Compare-Branches-in-Git)

- [Further Reading]()
    - [How to Use Branches in Git – the Ultimate Cheatsheet](https://www.freecodecamp.org/news/how-to-use-branches-in-git/)
    - [post about "Tracking Relationships in Git".](https://www.git-tower.com/learn/git/faq/track-remote-upstream-branch/?utm_source=freecodecamp&utm_medium=guestpost&utm_campaign=working-with-branches-in-git)
    - [Using git rebase Instead of git merge](https://www.git-tower.com/learn/git/faq/rebase/?utm_source=freecodecamp&utm_medium=guestpost&utm_campaign=working-with-branches-in-git)

# Working with Git Branches
* A __branch__ is a new/separate version of the main repository. __Branches__ allow you to work on different parts of a project without impacting the main branch.

# Uses Of Git Branches
* Features
* Bugs
* Experiments

# How to Create a Branch in Git
```git
    git branch <new-branch-name>
```
* It goes without saying that you can only create new branches in your __local repository__. Creating" branches in a remote repository happens by publishing an existing local branch

# How to Rename a Branch in Git
```git
    $ git branch -m <new-name>
```
* In case you'd like to rename a different local branch (which is NOT currently checked out), you'll have to provide the old and the new name:
    ```git
        $ git branch -m <old-name> <new-name>
    ```
_Remarks_:
* These commands, again, are used to work with __local branches__. If you'd like to rename a remote branch, things are a little bit more complicated - because Git doesn't allow you to rename remote branches.
* In practice, renaming a remote branch can be done by deleting the old one and then pushing up the new one from your local repository:

    ```git
        # First, delete the current / old branch:
        $ git push origin --delete <old-name>

        # Then, simply push the new local branch with the correct name:
        $ git push -u origin <new-name>
    ```

# How to Switch Branches in Git
* The current branch (also referred to as the __HEAD__ branch) defines the context you're working in at the moment. Or in other words: the current HEAD branch is where new commits will be created.

* switching the currently active branch is one of the most-used actions any developer performs when working with branches.

*  _switching branches_ is also referred to as "_checking out_" branches

    ```git
        $ git checkout <other-branch>
    ```
* However, because the __git checkout__ command has so many different duties, the Git community (fairly recently) introduced a new command you can now also use to change the current HEAD branch:

    ```git
        $ git switch <other-branch>
    ```

# Check the available Branches
```git
    git branch
```

# How to Publish a Branch in Git
* _Note_:  it's not possible to create a new branch on a remote repository.

* What we can do, however, is _publish an existing local branch on a remote repository_. We can "upload" what we have locally to the remote and thereby share it with our team:

    ```git
        $ git push -u origin <local-branch>
    ```

# How to Track Branches in Git
* By default, __local__ and __remote branches__ have nothing to do with each other. They are stored and managed as independent objects in Git. But in real life, of course, local and remote branches often do have a relationship with each other. For example, a remote branch is often something like the "counterpart" of a local one. Such a relationship can be modeled in Git: one branch (typically a local one) can "track" another one (typically remote).

* Once such a tracking relationship has been established, a couple of things will become a lot easier: most notably, when pushing or pulling, you can simply use the vanilla commands without any further parameters (for example, a simple __git push__).

* The tracking connection helps Git fill in the blanks – which branch on which remote you want to push to, for example.

* You have already read about one way to establish such a tracking connection: using git push with the -u option when publishing a local branch for the first time does exactly that. After that, you can simply use git push without mentioning the remote or the target branch.

* This also works the other way around: when creating a local branch that should be based on a remote one. In other words, when you want to track a remote branch:

    ```git
        $ git branch --track <new-branch> origin/<base-branch>
    ```

* Alternatively, you could also use the __git checkout__ command to achieve this. If you want to name the local branch after the remote one, you only have to specify the remote branch's name:

    ```git
        $ git checkout --track origin/<base-branch>
    ```

# How to Delete a Branch in Git
```git
    $ git branch -d <branch-name>
```

* _Note_ that you might also need the __-f__ option in case you're trying to delete a branch that contains un-merged changes. Use this option with care because it makes losing data very easy!

* To delete a remote branch, we cannot use the __git branch__ command. Instead, __git push__ will do the trick, using the __--delete__ flag:

    ```git
        $ git push origin --delete <branch-name>
    ```

* When deleting a branch, keep in mind that you need to check if you should delete its counterpart branch, too.
* For example, if you have just deleted a remote feature branch, it might make sense to also delete its local tracking branch. That way, you make sure you aren't left with lots of obsolete branches – and a messy Git repository.

# How to Merge Branches in Git
* Merging is probably the most popular way to integrate changes. It allows you to bring all of the new commits from another branch into your current HEAD branch.

* One of the great things about Git is that merging branches is so simple and stress-free. It requires just two steps:

    ```git
        # (1) Check out the branch that should receive the changes
        $ git switch main

        # (2) Execute the "merge" command with the name of the branch that contains the desired changes
        $ git merge feature/contact-form
    ```

* Often, the result of a merge will be a separate new commit, the so-called "merge commit". This is where Git combines the incoming changes. You can think of it like a knot that connects two branches.

# How to Rebase Branches in Git
* An alternative way to integrate commits from another branch is using __rebase__. And I'm very careful to call it an "alternative" way: it's not better or worse, but simply different.

* If and when you use rebase mainly comes down to personal preference and the conventions in your team. Some teams love rebase, some prefer merge.

    ```git
        # (1) Check out the branch that should receive the changes
        $ git switch feature/contact-form
            
        # (2) Execute the "rebase" command with the name of the branch that contains the desired changes
        $ git rebase main
    ```

# How to Compare Branches in Git
* In certain situations, it can be very helpful to compare two branches. For example, before you decide to integrate or delete a branch, it's interesting to see how it differs from another branch. Does it contain any new commits? And if so: are they valuable?

* To see which commits are in branch-B but not in branch-A, you can use the __git log__ command with the double dot syntax:

    ```git
        $ git log branch-A..branch-B
    ```

* Of course, you could also use this to compare your local and remote states by writing something like __git log main..origin/main__.

* If instead of the commits you'd prefer to see the actual changes that make up those differences, you can use the __git diff__ command:

    ```git
        $ git diff branch-A..branch-B
    ```