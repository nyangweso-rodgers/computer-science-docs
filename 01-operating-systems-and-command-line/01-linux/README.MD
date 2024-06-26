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

# Windows Subsystem for Linux (WSL)

- **WSL** lets you run a **Linux** environment directly on your **Windows** machine, without needing a separate virtual machine or dual-booting. It's like having two operating systems in one, seamlessly integrated!

## Similarities between Linux and WSL

- **Core**: Both WSL and Linux are based on the Linux kernel, which means they share the same fundamental building blocks. This translates to a familiar experience for Linux users, as many commands and tools work the same way in both environments.
- Command-line: Both offer access to the powerful Linux command-line, allowing you to manage files, install software, and automate tasks with scripts.
- Both WSL and Linux are open source

## Differences between Linux and WSL

- **Architecture**: WSL 1, the earlier version, emulated the Linux kernel within Windows, while WSL 2 uses a lightweight virtual machine to run a real Linux kernel. This makes WSL 2 faster and more compatible with a wider range of Linux software.
- **Integration**: WSL integrates seamlessly with the Windows file system, allowing you to easily access and modify files from both environments. You can also run some Linux GUI applications using WSLg, a graphical interface extension.
- **Applications**: While WSL provides access to a vast library of Linux tools and applications, it may not run every single program available for native Linux. However, the compatibility is constantly improving.

## Remarks

- There are different Linux distributions available for WSL, such as:
  1. Ubuntu,
  2. Debian, and
  3. Kali Linux.
- You can choose the one that best suits your needs.

## Download and Setup WSL

- Choose your preferred Linux distribution from the Microsoft Store (e.g., Ubuntu, Debian) or download a WSL distribution file (`.appx`) from their website.

### Step 1: Enable WSL and Virtual Machine features:

- Open PowerShell or Command Prompt as administrator.
- Run the command: `dism /online /enable-optional-feature -FeatureName Microsoft-Windows-Subsystem-Linux` or `dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
- Restart your computer.

### Step 2: Install your chosen Linux distribution:

- Open the Microsoft Store and search for your preferred Linux distribution (e.g., Ubuntu).

### Step 3 (Optional): Set WSL 2 as the default version:

- Open PowerShell or Command Prompt as administrator.
- Run the command: `wsl --set-default-version 2`.

### Step 4: Launch your Linux distribution:

- Open the Start Menu.
- Search for the name of your Linux distribution (e.g., Ubuntu).
- Click on the icon to launch the distribution's terminal.

### Step 5: (Optional): Set up a username and password:

- Follow the on-screen instructions within the terminal to create a username and password for your Linux environment.

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
2. [Ubuntu WSL](https://canonical-ubuntu-wsl.readthedocs-hosted.com/en/latest/)
3. [How to Install WSL 2 on Windows 10 (Updated)](https://www.omgubuntu.co.uk/how-to-install-wsl2-on-windows-10)
4. [digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev](https://www.digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev)
