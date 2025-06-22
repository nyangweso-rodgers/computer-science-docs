# Bash (Bourne Again SHell) Scripting

## Table Of Contents

# Overview Of Bash

- **Bash** is an acronym for ‘**Bourne-Again SHell**’. **Bash** is a _command language interpreter_.
- **Bash** can be used for:
  - virtual machines,
  - deploying services and
  - automating basic tasks.

# WHAT IS THE SHELL

- A **shell** is a program that acts as an interface between the user and the kernel, i.e., translates the commands from the terminal to the operating system.
- The original unix shell (**sh**) was written by Steve Bourne. At present, the most popular shell is **bash**, (**Bourne Again Shell**) and is an enhanced version of the original shell. Other shell programs include but are not limited to:
  - zsh (Z Shell),
  - csh (C Shell) and
  - ksch (KornShell).

# Bash Shell

- **Shell scripts** use the **.sh** extension and begin with a **shebang** ( e.g. **#!/bin/bash**, **#! usr/bin/bash**), which indicates to the shell how to locate the interpreter required to execute the script.

# What is shebang?

- **Shebang** is a line that starts with **#!** to specify the interpreter of the script!
- Usual shebang for the bash scripts looks like this:**#!/bin/bash**. However, be careful! Because different linux distributions can have different paths to bash executable. You can check yours by typing:

  ```sh
      which bash # output: /usr/bin/bash
  ```

# What is Git Bash?

- **Git Bash** is a terminal emulator for Windows that provides a **Bash shell** command-line interface to users. It is a part of the Git for Windows package, which includes Git, the popular version control system, as well as a **Bash shell**, command-line utilities, and other tools that are commonly used in Linux and Unix environments.
- **Git Bash** provides a Unix-like environment on Windows, allowing users to run Bash scripts, use Unix commands, and perform other tasks that are typically done on Linux or Unix systems. Git Bash is based on the **MINGW64** (Minimalist GNU for Windows 64) project, which provides a collection of Unix tools and utilities for Windows.

- One advantage of using Git Bash is that it provides an easy way for Windows users to use Git, as the Git command-line interface is integrated with the Bash shell. Git Bash also allows users to run Bash scripts and use other Unix tools on a Windows system, without the need to install a separate **Linux distribution** or **virtual machine**.

- However, it's important to note that Git Bash is not a complete Linux or Unix environment, and there may be some differences between the behavior of Git Bash and a native Linux or Unix environment. Also, some Unix commands or features may not be available or may behave differently in Git Bash, depending on the version of MINGW64 and other factors.

# MINGW64/ - (Minimalist GNU for Windows 64)

- **MINGW64/** that appears at the beginning of the prompt is the name of the **current directory**, or more specifically, the path to the current directory relative to the root directory of the Git Bash environment. It's the name of the environment in which **Git Bash** runs. This environment is based on the **MINGW64 project**, which provides a Unix-like environment on Windows.

- The part of the prompt that comes after the **MINGW64/** prefix represents the current directory. For example, if you are currently in the **Documents directory**, the prompt would look like **MINGW64~/Documents$**.

# How to Write a Bash Script

- Bash scripting is a powerful tool for automating tasks in Unix-like operating systems.
- A **Bash script** is a text file containing a series of commands that the Bash shell can execute. **Bash** is the default command-line shell on most Linux distributions and macOS.
- As Developers, we mostly use VS Code or other text editors to write code. But for Writing bash scripts its preferred to use terminal based editors like vim,neovim
- To create a bash script, follow the following steps:
  1. Step 1: Open Your Terminal
  2. Step 2: Create a Folder and File
     - Create a new folder:
       ```sh
        mkdir test-bash-directory
       ```
     - Let's get into the directory:
       ```sh
        cd test-bash-directory
       ```
     - create a new file:
     ```sh
      touch test-script.SH
     ```
  3. Add some content to the file:
     - add some content to the file e.g.,
       ```sh
        echo "Test Bash script"
       ```
  4. Step 4: Add the Shebang Line
     - The shebang line tells the system which interpreter to use to execute the script. Add the following line at the top of your script:
       ```sh
        #!/bin/bash

         echo "Test Bash script"
       ```
  5. Step 4: Write Your Script
     - Below the shebang line, you can start writing your commands. Here’s a simple script that prints "Hello, World!" to the terminal:
       ```sh
        #!/bin/bash
        # This is a simple bash scripts
        echo "Hello, World!"
       ```
  6. Step 5: Save and Close the File

# Making Your Script Executable

- Before you can run your script, you need to make it executable. Use the `chmod` command:
  ```sh
    chmod +x myscript.sh
  ```

# Running Your Script

- Now you can run your script by typing:
  ```sh
    ./myscript.sh
  ```

# Commands

## 1. Get Current Working Directory

- Sometimes, we might forget which directory we're working in.
- To get the current working directory we can use the pwd command, which stands for "print working directory":
  ```sh
    pwd
  ```
- This will show you the full path to your current location.

## 2. Print

- Use `echo` command to print something to the screen
  ```sh
    echo "Hello world!"
  ```

# Resources and Further Reading
