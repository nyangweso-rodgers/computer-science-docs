# Navigating the Filesystem in Bash

# The Commands
```sh
    pwd # print path to current directory
    ls <path>   # print visible content of current directory
    cd <path>   # change current directory
    cat <path>  # print content of a file
```

# Ways of Expressing Paths
```sh
    # Ways to express paths
    foo/bar # relative to current directory
    ./foo/bar # equivalent to foo/bar

    /foo/bar # from root
    ~/foo/bar    # from home directory
    ../          # to parent directory
```
* Hence, if you want to move to the parent directory, you type:
```sh
    cd ../
```

# Applying flags to Commands
```sh
    # show all files and folders with their current permissions, creation date and file size
    # remove `a` to hide hidden files (prefixed with `.`)
    ls -ao <path>

    # also show all subdirectories recursively
    # caution - gets big fast!
    ls -R

    # show all files and folders including all their subdirectories
    # with their current permissions, creation date and file size
    ls -aoR <path>

    # Add line-numbers to the output
    cat -n <path>
```