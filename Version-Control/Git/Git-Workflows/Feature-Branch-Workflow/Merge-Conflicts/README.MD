# Merge Conflicts


## Table Of Contents
- [Further Reading]()
  - [freeCodeCamp - How to Fix Merge Conflicts in Git](https://www.freecodecamp.org/news/how-to-fix-merge-conflicts-in-git/)

# What is a Merge Conflict in Git?
* In Git, a merge conflict occurs when:
  1.  _you or any of your team members make conflicting changes to the same file from two different branches_.
  2.  _If you’ve made changes to the same file from different branches and the changes are conflicting_.

* A sample scenario of a merge conflict could look like this:
  * you work in branch `main` and makes changes to line 1 of a `index.txt` file, say `Hi world`
  * you switch to `new-feature` branch and makes changes to the same line two of `index.txt`, say `Hello earth`.
  * if you attempt to merge `new-feature` to `main`, git won't be able to automatically decide which one to accept between `Hi world` and `Hello earth`. So, Git will raise a merge conflict error and tell you to manually resolve the conflict.

# What to Do When Merge Conflicts Occur
* When conflicts occur, git will automatically annonate the conflicting lines for you with `<`, `=` and `>` symbols:

    ```sh
        <<<<<<<<<
        =========
        >>>>>>>>>
    ```
* Everything between the lesser than (`<`) and equals signs (`=`) is the change in the current branch (the branch you're merging into). Everything between the equals (`=`) and greater than (`>`) signs is the incoming change from the branch you want to merge to another branch.

* It is left up to you to remove those annotations and decide how you want the conflicting lines to be – you can accept one of the changes or both of them.

# What are the Types of Merge Conflicts in Git?
* There are two types of merge conflicts:
  1. _content conflict_ and 
  2. _structural conflict_.

# Type 1: Content Merge Conflict
* __Content conflict__ occurs when the changes you make in two different branches affect the same lines of code in a file. This results in conflicting changes that cannot be automatically merged by Git.

* E.g., you make change `display: flex` to L2 in one branch and another change `text-align: center` to the same L2 in the same file in another branch.
* When this content conflict happens, Git will stop the merging process and prompt you to make adjustments to the code before moving forward.


# Type 2: Structural Merge Conflict
* __Structural conflict__ occurs when the changes you make in two different branches affect the same file but do not conflict with each other line-by-line. Instead, the changes affect the structure or organization of the file, such as renaming a variable, or function, or moving a block of code.

* If this structural conflict happens, Git won’t be able to determine which of the changes to accept and will prompt you to decide which changes you want.

# How to Resolve Merge Conflicts in `Git`


# Method 1: How to Resolve Merge Conflicts in `Git` with the `GitHub Interface`
* After pushing the `new-feature` branch to GitHub, GitHub will ask I create a `pull request`  so the `new-feature` branch will be merged to `main`.
* In this case, immediately you click on “__Compare and Pull__”, you will see that there can’t be an automatic merging because there’s a conflict:
* This means there’s a conflict you need to resolve. Create the pull request and scroll down to see where you can resolve the conflict, then click the “__Resolve conflicts__” button:
  * __Step 1__: When you click on “__Resolve conflicts__”, you will get an editor, and to the right, you will see the list of files that have the conflicts:
  * __Step 2__: In the editor, you will see the lines where the conflicts have occurred: the changes in the incoming branch are between the lesser than `(<)` and equals `(=)` signs, while the changes in the branch you want to merge into are surrounded by greater than `(>)` and equals `(=)` signs.
  * __Step 3__: Choose the line you want, remove the annotations, and click “__Mark as resolved__” in the top right corner:

* Repeat the same process for any other file that have some conflict(s) too.
* If you want, you can keep both lines. Just make sure you remove the annotations.
* After doing that, click on “__Commit merge__” in the top right corner:

# Method 2: How to Resolve Merge Conflicts in `Git` with `VS Code`
* When you switch `main` ,the branch you want to merge into and run `git merge new-feature`, you will be prompted to resolve some conflicts (if any).
  
* At this stage, if you’re not ready to resolve the conflicts, you can __abort__ the merging by running:

    ```sh
        # exit the merge 
        git merge --abort
    ```
* __Note__: _any changes you made during the merge process that were not committed will be lost when you abort the merge. So, make sure to save any changes you want to keep before aborting the merge._

* But if you want to resolve the conflicts, you can either _accept the incoming change(s)_, _accept the current change_, or _accept both changes_.

* If you select any of the three, the merge conflict(s) will be resolved. After that, add the file and commit it the usual way you would do it:

    ```sh
        git add .
        git commit -m"some commit message"
    ```

# Method 3: How to Resolve Merge Conflicts in `Git` with `VS Code 3-way Merge Editor`
* You can also rebase a conflict with the VS Code 3-way merge editor.
* After running `git merge new-feature`, click on the “__Resolve in Merge Editor__” button.
* You will see you now have 3 views. You will see the changes in the incoming branch on the right, the changes in the branch you want to merge into on the right (the current branch), and the preview below the two.
* Now start resolving the conflicts by selecting any of the available options:
  1. Accept Incoming
  2. Accept Combination (Incoming First)
  3. Accept Current
  4. Accept Combination (Current First)
* __Incoming__ is the change in the `new-feature `branch you want to merge into, `main` a target branch, and current is the change already in the branch you want to merge into.

* Switch to each file, click on the “__Resolve in Merge Editor__” button, and select any of the options there.
* You can also resolve the conflicts by entering the right code in each of the files.
* When you are satisfied, click on “Complete Merge” in each merge editor:
* You have to add the files again and commit them:

    ```sh
        git add .
        git commit -m"some commit message"
    ```

# Remarks
* _If you want the 3-way merge editor to open automatically when you want to merge conflicts, click “Settings” and search for “merge editor”, then checkmark “open the merge editor for files that are currently under conflicts”._