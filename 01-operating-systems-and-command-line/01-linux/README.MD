# Linux

## Table Of Contents

# Introduction to Linux

- **Linux** is **UNIX** like a source software and can use an operating system that provides full memory protection and multi-tasking operations. It is an opened by anyone.

# Why Use Linux?

1. **Widespread use**: - **Linux** powers the computing infrastructure of the entire world. From servers to critical cloud infrastructure, from android to screens in Teslas cars.
2. **Designed for developers by developers**:
3. **No virus or anything**: because Linux is open source, it means that if any release has any chance of getting affected by a malware or anything, developers from anywhere can work to patch it. This results in a secure and robust O.S.
4. **Endless customizations**: if you run **Linux**, you can customise practically every pixel of your screen. From themes to icon packs to booting screen, if you can think of it, it is customisable.
5. **Get comfortable with the terminal**: a lot of time, new developers have a hard tim adjsuting to a workflow that makes use of terminal. With **Linux**, you will have to run so many commands that terminal will become your second home.
6. **Understand Computer hardware better**:

# What is a Linux Shell

- Whenever a user logs in to the system or opens a console window, the **kernel** runs a new **shell** instance. The **kernel** is the heart of any os. It is responsible for the control management, and execution of processes, and to ensure proper utilization of system resources.
- A **shell** is a program that acts as an interface between a **user** and the **kernel**. It allows a user to give commands to the **kernel** and receive responses from it. Through a **shell**, we can execute programs and utilities on the **kernel**. Hence, at its core, a **shell** is a program used to execute other programs on our system.

## Why do we need a Shell?

- Being able to interact with the **kernel** makes **shells** a powerful tool. Without the ability to interact with the **kernel**, a user cannot access the utilities offered by their machine’s os.

## What are the Different Types of Shells in Linux?

### 1. The Bourne Shell (sh)

- Developed at AT&T Bell Labs by Steve Bourne, the **Bourne shell** is regarded as the first **UNIX shell** ever. It is denoted as **sh**. It gained popularity due to its compact nature and high speeds of operation.
- However, the Bourne shell has some major drawbacks.
  - It doesn’t have in-built functionality to handle logical and arithmetic operations.
  - Also, unlike most different types of shells in Linux, the Bourne shell cannot recall previously used commands.
  - It also lacks comprehensive features to offer a proper interactive use.
- The complete path-name for the **Bourne shell** is `/bin/sh and /sbin/sh`. By default, it uses the prompt `#` for the root user and `$` for the non-root users.

### 2. The GNU Bourne-Again Shell (bash)

- More popularly known as the **Bash shell**, the **GNU Bourne-Again shell** was designed to be compatible with the **Bourne shell**. It incorporates useful features from different types of shells in **Linux** such as **Korn shell** and **C shell**.
- It allows us to automatically recall previously used commands and edit them with help of arrow keys, unlike the **Bourne shell**.
- The complete path-name for the **GNU Bourne-Again shell** is `/bin/bash`. By default, it uses the prompt `bash-VersionNumber#` for the root user and `bash-VersionNumber$` for the non-root users.

### 3. The C Shell (csh)

- The **C shell** was created at the University of California by Bill Joy. It is denoted as **csh**. It was developed to include useful programming features like in-built support for arithmetic operations and a syntax similar to the C programming language.

- Further, it incorporated command history which was missing in different types of shells in **Linux** like the _Bourne shell_. Another prominent feature of a C shell is “aliases”.

- The complete path-name for the **C shell** is `/bin/csh`. By default, it uses the prompt hostname# for the root user and hostname% for the non-root users.

### 4. The Korn Shell (ksh)

- The **Korn shell** was developed at AT&T Bell Labs by David Korn, to improve the **Bourne shell**. It is denoted as **ksh**. The _Korn shell_ is essentially a superset of the **Bourne shell**.

- Besides supporting everything that would be supported by the **Bourne shell**, it provides users with new functionalities. It allows in-built support for arithmetic operations while offereing interactive features which are similar to the C shell.

- The **Korn shell** runs scripts made for the **Bourne shell**, while offering string, array and function manipulation similar to the C programming language. It also supports scripts which were written for the **C shell**. Further, it is faster than most different types of shells in **Linux**, including the **C shell**.

- The complete path-name for the **Korn shell** is `/bin/ksh`. By default, it uses the prompt `#` for the root user and `$` for the non-root users.

### 5. The Z Shell (zsh)

- The **Z Shell** or `zsh` is a sh shell extension with tons of improvements for customization. If you want a modern shell that has all the features a much more, the `zsh` shell is what you’re looking for.
- Some noteworthy features of the z shell include:
  - Generate filenames based on given conditions
  - Plugins and theming support
  - Index of built-in functions
  - Command completion

## Remarks

- There are different Linux distributions available for WSL, such as:
  1. Ubuntu,
  2. Debian, and
  3. Kali Linux.
- You can choose the one that best suits your needs.

### Step 4: Launch your Linux distribution:

- Open the Start Menu.
- Search for the name of your Linux distribution (e.g., Ubuntu).
- Click on the icon to launch the distribution's terminal.

### Step 5: (Optional): Set up a username and password:

- Follow the on-screen instructions within the terminal to create a username and password for your Linux environment.

# Linux Folders Structures

1. /bin - user binaries
2. /boot - boot loader files
3. /dev - device files
4. /etc configuration files
5. /home - home directories
6. /lib - system libraries
7. /media - removable devices
8. /mnt - mount directory
9. /opt - optional add on apps
10. /proc - process information
11. /sbin - system binaries
12. /srv - service data
13. /tmp - temporary files
14. /usr - users sys resources
15. /var - variable files

# Linux Commands

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

# Linux File System

- Here are some key aspects of the Linux file system:
  1. **Root Directory (/)**: this is the top-level directory in the file system hierarchy. Everything in the Linux file system is organized under this directory.
  2. **Common Directories**: Some important directories in the Linux file system include:
     - `/bin`: Essential command binaries (e.g., `ls`, `cp`, `mv`).
     - `/boot`: Boot loader files and the Linux kernel.
     - `/dev`: Device files representing hardware devices.
     - `/etc`: System configuration files.
     - `/home`: Home directories for users.
     - `/lib`: Shared libraries.
     - `/lib64`: Shared libraries on 64-bit systems.
     - `/mnt`: Temporary mount points for external storage.
     - `/opt`: Optional software packages.
     - `/proc`: Virtual file system containing information about processes.
     - `/usr`: User-related programs and data.
     - `/var`: Variable data, such as logs and spool files.
     - `/root`: Home directory for the root user.
     - `/run`: Run-time variable data (often used for temporary files).
     - `/sbin`: System binaries (critical system administration binaries).
     - `/srv`: Service-specific data.
     - `/sys`: Virtual file system exposing kernel information.
     - `/tmp`: Temporary files.
     - `/snap`: Snap packages (containerized software packages).
- Additionally, it's worth noting that directories like `/sys` and `/proc` are virtual filesystems providing information about the kernel and processes, respectively.

# Resources

1. [Microsoft Learn - Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/)
2. [digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev](https://www.digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev)
