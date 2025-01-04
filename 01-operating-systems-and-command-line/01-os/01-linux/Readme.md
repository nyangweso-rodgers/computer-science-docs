# Linux OS

## Table of Contents

# Introduction to Linux

- **Linux** is **UNIX** like a source software and can use an OS that provides full memory protection and multi-tasking operations.
- Why use **Linux**?
  1. **Widespread use**: - **Linux** powers the computing infrastructure of the entire world. From servers to critical cloud infrastructure, from android to screens in Teslas cars.
  2. **Designed for developers by developers**:
  3. **No virus or anything**: because Linux is open source, it means that if any release has any chance of getting affected by a malware or anything, developers from anywhere can work to patch it. This results in a secure and robust OS.
  4. **Endless customizations**: if you run **Linux**, you can customise practically every pixel of your screen. From themes to icon packs to booting screen, if you can think of it, it is customisable.
  5. **Get comfortable with the terminal**: a lot of time, new developers have a hard tim adjsuting to a workflow that makes use of terminal. With **Linux**, you will have to run so many commands that terminal will become your second home.
  6. **Understand Computer hardware better**:

# What is a Linux Shell

- Whenever a user logs in to the system or opens a console window, the **kernel** runs a new **shell** instance. The **kernel** is the heart of any os. It is responsible for the control management, and execution of processes, and to ensure proper utilization of system resources.
- A **shell** is a program that acts as an interface between a **user** and the **kernel**. It allows a user to give commands to the **kernel** and receive responses from it. Through a **shell**, we can execute programs and utilities on the **kernel**. Hence, at its core, a **shell** is a program used to execute other programs on our system.
- Why do we need a **shell**?
  - Being able to interact with the **kernel** makes **shells** a powerful tool. Without the ability to interact with the **kernel**, a user cannot access the utilities offered by their machine’s os.

# Types of Shells

## 1. The Bourne Shell (sh)

- Developed at AT&T Bell Labs by Steve Bourne, the **Bourne shell** is regarded as the first **UNIX shell** ever. It is denoted as **sh**. It gained popularity due to its compact nature and high speeds of operation.
- However, the Bourne shell has some major drawbacks.
  - It doesn’t have in-built functionality to handle logical and arithmetic operations.
  - Also, unlike most different types of shells in Linux, the Bourne shell cannot recall previously used commands.
  - It also lacks comprehensive features to offer a proper interactive use.
- The complete path-name for the **Bourne shell** is `/bin/sh and /sbin/sh`. By default, it uses the prompt `#` for the root user and `$` for the non-root users.

## 2. The GNU Bourne-Again Shell (bash)

- More popularly known as the **Bash shell**, the **GNU Bourne-Again shell** was designed to be compatible with the **Bourne shell**. It incorporates useful features from different types of shells in **Linux** such as **Korn shell** and **C shell**.
- It allows us to automatically recall previously used commands and edit them with help of arrow keys, unlike the **Bourne shell**.
- The complete path-name for the **GNU Bourne-Again shell** is `/bin/bash`. By default, it uses the prompt `bash-VersionNumber#` for the root user and `bash-VersionNumber$` for the non-root users.

## 3. The C Shell (csh)

- The **C shell** was created at the University of California by Bill Joy. It is denoted as **csh**. It was developed to include useful programming features like in-built support for arithmetic operations and a syntax similar to the C programming language.
- Further, it incorporated command history which was missing in different types of shells in **Linux** like the _Bourne shell_. Another prominent feature of a C shell is “aliases”.
- The complete path-name for the **C shell** is `/bin/csh`. By default, it uses the prompt hostname# for the root user and hostname% for the non-root users.

## 4. The Korn Shell (ksh)

- The **Korn shell** was developed at AT&T Bell Labs by David Korn, to improve the **Bourne shell**. It is denoted as **ksh**. The _Korn shell_ is essentially a superset of the **Bourne shell**.
- Besides supporting everything that would be supported by the **Bourne shell**, it provides users with new functionalities. It allows in-built support for arithmetic operations while offereing interactive features which are similar to the C shell.
- The **Korn shell** runs scripts made for the **Bourne shell**, while offering string, array and function manipulation similar to the C programming language. It also supports scripts which were written for the **C shell**. Further, it is faster than most different types of shells in **Linux**, including the **C shell**.
- The complete path-name for the **Korn shell** is `/bin/ksh`. By default, it uses the prompt `#` for the root user and `$` for the non-root users.

## 5. The Z Shell (zsh)

- The **Z Shell** or `zsh` is a sh shell extension with tons of improvements for customization. If you want a modern shell that has all the features a much more, the `zsh` shell is what you’re looking for.
- Some noteworthy features of the z shell include:
  - Generate filenames based on given conditions
  - Plugins and theming support
  - Index of built-in functions
  - Command completion

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

# Windows Subsystem for Linux (WSL)

- **WSL** lets you run a **Linux** environment directly on your **Windows** machine, without needing a separate virtual machine or dual-booting. It's like having two operating systems in one, seamlessly integrated!
- Similarities between **Linux** and **WSL**:

  1. **Core**: Both **WSL** and **Linux** are based on the **Linux kernel**, which means they share the same fundamental building blocks. This translates to a familiar experience for **Linux** users, as many commands and tools work the same way in both environments.
  2. **Command-line**: Both offer access to the powerful **Linux** command-line, allowing you to manage files, install software, and automate tasks with scripts.
  3. Both WSL and Linux are open source

- Differences between **Linux** and **WSL**:

  1. **Architecture**: **WSL 1**, the earlier version, emulated the **Linux kernel** within **Windows**, while **WSL 2** uses a lightweight virtual machine to run a real **Linux kernel**. This makes **WSL 2** faster and more compatible with a wider range of Linux software.
  2. **Integration**: **WSL** integrates seamlessly with the Windows file system, allowing you to easily access and modify files from both environments. You can also run some Linux GUI applications using **WSLg**, a graphical interface extension.
  3. **Applications**: While **WSL** provides access to a vast library of **Linux** tools and applications, it may not run every single program available for native Linux. However, the compatibility is constantly improving.

- Setup WSL:

  - Step 1: Enable WSL and Virtual Machine features:
    - Open **PowerShell** or **Command Prompt** as administrator and run the following command:
      ```sh
          dism /online /enable-optional-feature -FeatureName Microsoft-Windows-Subsystem-Linux
          # or
          dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
      ```
    - Restart your computer.
  - Step 2: (Optional): Set WSL 2 as the default version:
    - Open **PowerShell** or **Command Prompt** as administrator and Run the following command:
      ```sh
      wsl --set-default-version 2
      ```

- **WSL Commands**:
  1. List available WSL distributions
     - There are several distributions, that you can install directly from either Microsoft store or through terminal commands.
       ```sh
        wsl --list --online
       ```
  2. Install **Ubuntu**, the default distribution
     - In **WSL**, **Ubuntu** is set as the default distribution. So, if you want to install **Ubuntu**, you can open a terminal in **Admin** mode and run the command:
       ```sh
        wsl --install
       ```
  3. Install **Debian** or some other distribution
     - Not a fan of **Ubuntu**? Don't worry! You can install the other distributions, that are available by using the command:
       ```sh
       wsl --install -d <distribution_name>
       ```
     - Or:
       ```sh
        wsl --install -d <distribution_name>
       ```
     - You should make sure that, the `distribution_name` should be same as the name shown in the output of the `wsl --list --online` command.
  4. List Installed Distributions
     - If you have multiple distributions installed, it is important to list those for future management. In order to do that, use the command:
       ```sh
        wsl --list --verbose
       ```
     - or:
       ```sh
        wsl -l -v
       ```
  5. Run a distribution from Windows terminal
     - If you have installed the distribution from the store, you can launch it from the start menu. But that's not always the case. Sometimes, you may need to rely on the terminal to run a distribution. In that case, you can run a distribution by using:
       ```sh
         wsl -d <distribution_name>
       ```
     - Remember: The distribution_name is the one that appears on the output of `wsl -l -v`.
  6. Terminate a running distribution
     - if you want to terminate a running **WSL** distribution, run:
       ```sh
        wsl --terminate <running_distribution_name>
       ```
     - Or, if you intend to shut down the entire WSL system, use:
       ```sh
        wsl --shutdown
       ```
  7. Get the **WSL** version installed on your system
     - There are two major versions for **WSL**; **WSL 1** and **WSL 2**. WSL version 2 has several advanced features and is better compared to WSL 1.
       ```sh
        wsl --version
       ```
  8. Check **WSL** Status
     - You can check the status of **WSL**, its configuration, etc. using the `--status` option.
       ```sh
        wsl --status
       ```
  9. Change the **WSL** version of a distribution
     - Let's say you are running a distribution using **WSL 1**, and you want to change the **WSL** version to 2 so that you can install Linux GUI apps with that system. For this, you can open a terminal in Admin mode and use the command below:
       ```sh
        wsl --set-version <distribution name> <versionNumber>
       ```
     - Example:
       ```sh
        wsl --set-version Ubuntu 2
       ```
  10. Export a distribution
      - Backing up data is always important, if you are dealing with critical information. In Linux distributions, we have tools like **Timeshift**, to create comprehensive system backups.
      - **WSL** provides a built-in method to take a backup of your installed distribution along with all the data.
      - Remark: It is better to create a two separate folders called `WSL_Exports` and `WSL_Imports` to keep the exported files and imported distributions. This way, you can avoid cluttering and easy data retrieval.
      - To export a distribution, use the command inside the `WSL_Exports` folder (for convenience):
        ```sh
            wsl --export <distribution_name> <file_name.tar>
        ```
      - You are exporting the distribution along with the data to a tar file. The `distribution_name` should be the proper name, as in the output of the command `ws -l -v`.
  11. Import a distribution
      - You have exported a distribution. Now, how will you restore it so that you can work with the data it carries? For this, on an elevated terminal, run the command:
        ```sh
            wsl --import <Distribution Name> <Import location> <exported file>
        ```
  12. Unregister a distribution
      - To remove a distribution from the system, you can use the `--unregister` option of **WSL**. First, list the distribution using `wsl -l -v`. Note the name of the distribution and then perform the command:
        ```sh
             wsl --unregister <distribution_name>
        ```
      - If you have installed the distribution from the list of available distributions (`wsl --list --online`), you may also need to uninstall the app from the system too.
  13. Update WSL
      - To update **WSL** from the command line, you can use the command below on an elevated terminal:
        ```sh
            wsl --update
        ```
  14. Get Help
      - There are many options and sub commands for **WSL**, that you can utilize to get the most out of **WSL**. So, if you need any assistance regarding some options, always use the built-in `help` mechanism.
        ```sh
            wsl --help
        ```

# Resource and Further Reading

1. [Microsoft Learn - Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/)
2. [digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev](https://www.digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev)
3. [Ubuntu WSL](https://canonical-ubuntu-wsl.readthedocs-hosted.com/en/latest/)
4. [How to Install WSL 2 on Windows 10 (Updated)](https://www.omgubuntu.co.uk/how-to-install-wsl2-on-windows-10)
5. [https://itsfoss.com/wsl-commands/?ref=dailydev](https://itsfoss.com/wsl-commands/?ref=dailydev)
