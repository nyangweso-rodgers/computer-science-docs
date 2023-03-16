# Bash Execution

# How to Create a sample test file
```sh
    touch test-file.sh
```

* By default, after creation, the file has only read and write permissions, represented by "r" and "w". The execution right is marked with an "x".

# Check for file permisions
```sh
    ls -l test-file.sh # -rw-r--r-- 1 Rodgers Nyangweso 197121 0 Mar 16 14:55 test-file.sh
    ls -la test-file.sh # -rw-r--r-- 1 Rodgers Nyangweso 197121 0 Mar 16 14:55 test-file.sh
```
* "-rw-r--r--": The first three letters represent the rights of the owner of the file.
* Rights which are not granted are marked with a dash instead of their respecive letters. In this case the owner has read and write rights (__rw-__), while the user and group rights are read-only (__r--__).

# Allow File Execution for All
* In order to allow the execution of the test-file.sh file for all:
    ```sh
        # allow execution of the file for all
        chmod +x test-file.sh # 
    ```