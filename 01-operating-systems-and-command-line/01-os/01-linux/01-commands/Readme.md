# Linux Commands

## Table of Contents# Linux Commands

1. `pwd` - Print the current working directory.
2. `whoami`: Display your username.
3. `man <command>`: Access the manual for a specific command.
4. `echo "Hello, WSL!"`: Print a message to the terminal.
5. `ls` - List files and directoriesv. View the contents of your current directory.
6. `cd` - Change directories.
7. `mkdir` - Create a new directory
8. `cat` - View file contents
9. Install software:
   - Use `sudo apt install` followed by package name.
   - E.g.,
     ```sh
      sudo apt install chrome
     ```
10. Update package:
    - Use `sudo apt update`
    - E.g.,
      ```sh
        sudo apt update
      ```
11. Upgrade installed packages.
    - Use, `sudo apt upgrade`
12. `clear` - Clear the terminal screen.

# Command : Check Which Shell You are using on Linux

- Out of the box, **Linux** provides a wide variety of shells. There is:
  1. bash (Bourne Again shell) shell which ships by default in many Linux distributions.
  2. sh (Bourne Shell),
  3. tcsh (TC shell),
  4. csh (C shell), Zsh (Z shell) and
  5. ksh (Korn Shell).
- Curious to know which shell you are using on your Linux system?

  1. Using `echo` Command

     - The Linux `echo` command is a built-in command that is used to print the output of a string which is passed as an argument. Additionally, you can use the `echo` command to check the shell that you are running commands in. To accomplish this, execute:

     ```sh
       echo $SHELL
     ```

     - Sample Output:
       ```sh
        /usr/bin/bash
       ```
     - The output shows that I am using the bash shell. Additionally, you can simply run the command:
       ```sh
        echo $0
       ```

  2. Using `ps` command
     - Commonly used for listing running processes, the `ps` command in its basic format sheds light on the shell that you are using. Simply execute the command:
       ```sh
        ps
       ```
     - Alternatively, you can run the command:
       ```sh
        ps -p $$
       ```
     - You can also use `ps -p $$ -o args=` which output just the shell name.
  3. By viewing `/etc/passwd` file
  4. Using `lsof` command
     - Ordinarily, the `lsof` command, short for **list of open files**, is used to provide a list of open files on your system. However, when used with the `-p $$` flag, it gives a pointer to the shell you are in when you look at the first column of the output.
       ```sh
        lsof -p $$
       ```

# Command : List and Set Environment Variables in Linux

- When you start a new **Linux shell session**, a certain system configuration is read and your computer is set up accordingly. These configurations and settings are controlled by the **environment variables**.
- The Linux os supports two types of variables- **environment** and **shell variables**. These variables can affect the way your applications and programs work.

- **Environment variables**:

  - Are system-wide variables that affect the entire system. They are used by all shells and spawned child processes, and are available on both command-line and GUI.
  - **Linux environment variables** are dynamic system values that supply the necessary information to programs and processes.
  - These variables control things like default web browser, default file editor or default text editor, executable files, keyboard layout settings, directory path, and system locale. Basically, those are names that have a value assigned to them. For example, we use `JAVA_HOME` variable to set the directory location where JDK or JRE was installed.
  - Most common environment variables include:
    1. `PATH`: A colon-separated list of directories that Linux searches when executing a command.
    2. `USER`: Username of the currently logged-in user.
    3. `HOME`: Home directory of the current user.
    4. `UID`: Unique identifier of the current user.
    5. `EDITOR`: Default editor to edit the files.
    6. `SHELL`: Name of the current user’s shell.
    7. `TERM`: Current terminal emulation.
    8. `PWD`: Present working directory.
    9. `TEMP`: Path of the temporary directory.
  - The values of some of these variables might be different on every Linux computer.

- **Shell variables**:

  - are native to a particular shell instance that affect only the shell functions. Every Linux os shell, such as **Bash** and **Korn** has their own internal shell variables. This helps to track data in the current session - mostly used in an interactive shell session or a script to keep variables local. The Bash specific variables are normally prefixed with `BASH_` for example `BASH_VERSION`.

- **Remarks**:
  - Both environment and shell variables have the same format:
    ```sh
      VAR_NAME=value
    ```
  - You must keep the following variable requirement in mind when working with both shell and environment variables:
    - The variable names by convention always are in uppercase, such as PATH.
    - Cases sensitive - it's possible to have a lower case.
    - There should not be a space before and after the = sign.
    - Always separate multiple values by a colon (:), for example, value1:value2:value3.

## Command 1.1: List Current Environment Variables

- To print a list of all environment variables, type:

  ```sh
    printenv
  ```

- You can also use the `env` command to list all **Linux variables**:

  ```sh
    env
  ```

- The list of variables can be very long, and thus it is difficult to read. You can use the more or less command along with the printenv command to list environment variables one screen at a time:

  ```sh
    printenv | more
  ```

- All the commands described above list multiple variables at a time. To find information about specified variable or variables, use the following command:

  ```sh
    printenv HOME
  ```

  - This command prints the home directory of the user.

- You may also use the `echo` command to print the environment variable value. The following example prints the values of the PATH environment variable:
  ```sh
    echo $PATH
  ```
  - The PATH variable has multiple values and they are separated by a colon.

## Command 1.2: Set Environment Variables

- **Linux** offers two ways to **set environment variables**:
  - You can first set a shell variable and then export the shell variable as an **environment variable**
  - The second way is to directly export an **environment variable**.
- To create new **environment variables** and set their value for the current shell session, use the following command:
  ```sh
    MYVAR=foo
  ```
- At this point, new **environment variables** are created only for the **shell**. You can confirm if the variable is set using the `echo` command. This variable is not an **environment variable** and if you use the `printenv` command, its output will be empty:
  ```sh
    printenv MYVAR
  ```
- Now we can convert this **shell variable** to a single **environment variable** using the `export` command:
  ```sh
    export MYVAR
  ```
- Now MYVAR is an environment variable, this affects the current shell and all processes started from the current shell.
- Remarks:
  - You do not have to always follow this long process to **set an environment variable**. You can directly export the environment variable in a single command:
    ```sh
        export MYENV=bar
    ```
  - You must note that variables set through these commands are available only for the current session. Once you close the session, these variables are lost. To permanently set the environment variables, you must edit /etc/profile.d directory, ~/.bashrc, /etc/environment, or /etc/profile files using a text editor.

# Resources and Further Reading

1. [List and Set Environment Variables in Linux](https://linuxopsys.com/list-and-set-environment-variables-in-linux)
