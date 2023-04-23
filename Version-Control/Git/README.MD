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

# Git Architecture

# Check Git Components
* Inside the project which contains a Git repository, we can check the Git components:
    ```git
        ls -F1 .git/
    ```
* __Output__:
  * COMMIT_EDITMSG
  * config
  * description
  * HEAD
  * hooks/
  * index
  * info/
  * logs/
  * objects/
  * packed-refs
  * refs/