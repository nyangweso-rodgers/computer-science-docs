# Bash Scripting

## Table Of Contents
- [Navigating the Filesystem in Bash]() 
  - Navigating the Filesystem in Bash
- [Bash Execution]() 
  - Bash Execution Rights
- [Reading User Inputs]() 
  - Reading User Inputs in Bash
- [Further Reading]() 
  - [Dev - Basic Bash Scripting](https://dev.to/tonnss/basic-bash-scripting-2a37) 
  - [Dev - SHELL SCRIPTING FOR BEGINNERS](https://dev.to/zone2/shell-scripting-for-beginners-4h21)

# Overview Of Bash
* __Bash__ is an acronym for ‘__Bourne-Again SHell__’. __Bash__ is a _command language interpreter_.
* __Bash__ can be used for:
  *  virtual machines, 
  *  deploying services and 
  *  automating basic tasks.


# WHAT IS THE SHELL
* A __shell__ is a program that acts as an interface between the user and the kernel, i.e., translates the commands from the terminal to the operating system.
* The original unix shell (__sh__) was written by Steve Bourne. At present, the most popular shell is __bash__, (__Bourne Again Shell__) and is an enhanced version of the original shell. Other shell programs include but are not limited to: 
  * zsh (Z Shell), 
  * csh (C Shell) and 
  * ksch (KornShell).

# Bash Shell
* __Shell scripts__ use the __.sh__ extension and begin with a __shebang__ ( e.g. __#!/bin/bash__, __#! usr/bin/bash__), which indicates to the shell how to locate the interpreter required to execute the script.

# What is shebang?
* __Shebang__ is a line that starts with __#!__ to specify the interpreter of the script!
* Usual shebang for the bash scripts looks like this:__#!/bin/bash__. However, be careful! Because different linux distributions can have different paths to bash executable. You can check yours by typing:
  
    ```sh
        which bash # output: /usr/bin/bash
    ```

# What is Git Bash?
* __Git Bash__ is a terminal emulator for Windows that provides a __Bash shell__ command-line interface to users. It is a part of the Git for Windows package, which includes Git, the popular version control system, as well as a __Bash shell__, command-line utilities, and other tools that are commonly used in Linux and Unix environments.
  
* __Git Bash__ provides a Unix-like environment on Windows, allowing users to run Bash scripts, use Unix commands, and perform other tasks that are typically done on Linux or Unix systems. Git Bash is based on the __MINGW64__ (Minimalist GNU for Windows 64) project, which provides a collection of Unix tools and utilities for Windows.

* One advantage of using Git Bash is that it provides an easy way for Windows users to use Git, as the Git command-line interface is integrated with the Bash shell. Git Bash also allows users to run Bash scripts and use other Unix tools on a Windows system, without the need to install a separate __Linux distribution__ or __virtual machine__.

* However, it's important to note that Git Bash is not a complete Linux or Unix environment, and there may be some differences between the behavior of Git Bash and a native Linux or Unix environment. Also, some Unix commands or features may not be available or may behave differently in Git Bash, depending on the version of MINGW64 and other factors.

# MINGW64/ - (Minimalist GNU for Windows 64)
* __MINGW64/__ that appears at the beginning of the prompt is the name of the __current directory__, or more specifically, the path to the current directory relative to the root directory of the Git Bash environment. It's the name of the environment in which __Git Bash__ runs. This environment is based on the __MINGW64 project__, which provides a Unix-like environment on Windows.

* The part of the prompt that comes after the __MINGW64/__ prefix represents the current directory. For example, if you are currently in the __Documents directory__, the prompt would look like __MINGW64~/Documents$__.