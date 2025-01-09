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

- History of Linux OS:
  - In 1991, Linus Torvalds a student at the university of Helsinki, Finland, thought to have a freely available academic version of Unix started writing its own code.
  - After this project became the Linux kernel.
  - The Linux kernel is written in C language.
  - In 1992, he released the kernel under GNU General Public License. 

# What is a Linux Shell

- Whenever a user logs in to the system or opens a console window, the **kernel** runs a new **shell** instance. The **kernel** is the heart of any os. It is responsible for the control management, and execution of processes, and to ensure proper utilization of system resources.
- A **shell** is a program that acts as an interface between a **user** and the **kernel**. It allows a user to give commands to the **kernel** and receive responses from it. Through a **shell**, we can execute programs and utilities on the **kernel**. Hence, at its core, a **shell** is a program used to execute other programs on our system.
- Why do we need a **shell**?
  - Being able to interact with the **kernel** makes **shells** a powerful tool. Without the ability to interact with the **kernel**, a user cannot access the utilities offered by their machine’s os.

# Linux OS Distributions

- Many of the users taken the linux OS and modified according to their requirements and released into the market with different names called Linux distribution.
  1. RedHat
  2. Ubuntu
  3. Debian
  4. Centos
  5. Fedora
  6. Opensuse
  7. Kali Linux
  8. Amazon Linux
  9. Rocky Linux

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

# Resource and Further Reading

1. [Microsoft Learn - Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/)
2. [digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev](https://www.digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev)
3. [Ubuntu WSL](https://canonical-ubuntu-wsl.readthedocs-hosted.com/en/latest/)
4. [How to Install WSL 2 on Windows 10 (Updated)](https://www.omgubuntu.co.uk/how-to-install-wsl2-on-windows-10)
5. [https://itsfoss.com/wsl-commands/?ref=dailydev](https://itsfoss.com/wsl-commands/?ref=dailydev)
