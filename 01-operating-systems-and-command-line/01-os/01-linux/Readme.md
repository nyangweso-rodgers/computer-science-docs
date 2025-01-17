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

# Linux Remote Server

- A **Linux remote server** is a Linux-based machine that can be accessed and controlled remotely over a network. Unlike a local server or machine that you interact with directly (using a keyboard, monitor, etc.), a remote server is located elsewhere and accessed from your local machine or other networked device. Remote access is often used for managing systems, hosting applications, providing services, or performing tasks like backups, data analysis, or web hosting.

- **Server Types**:

  1. **Headless Server**: Many Linux remote servers are "headless," meaning they do not have a graphical interface (GUI) by default. These servers typically run in a text-based environment accessed via the command line. It's common for web servers, file servers, database servers, etc., to be headless
  2. **Cloud Servers**: Many organizations or individuals use cloud providers like AWS, Google Cloud, or DigitalOcean to deploy Linux remote servers. These servers are virtual machines that run in the cloud and are fully remote
  3. **On-Premise Servers**: These are physical Linux machines located within an organization's facilities and are accessed remotely over the company's internal network or the internet.

- **Common Use Cases for Remote Linux Servers**:

  1. **Web Hosting**: A Linux server can host websites and web applications, serving them to users via the internet.
  2. **File Storage**: Linux servers can act as file storage servers (using protocols like Samba or NFS) for remote file access.
  3. **Databases**: A Linux server may host databases such as MySQL, PostgreSQL, or MongoDB, which are accessed remotely by applications or clients.
  4. **Development and Testing**: Developers often use remote Linux servers for deploying and testing code, particularly in environments like Docker or Kubernetes.
  5. **Backup and Archiving**: Linux servers are commonly used for backing up large amounts of data and archiving important information remotely.
  6. **Networking and Security Services**: Linux servers can run networking services like VPNs, DNS, firewalls, and more, acting as network security devices.

- **Connecting Linux Remote Servers**:

  1.  **SSH** (**Secure Shell**)

      - **SSH** is the most widely used and secure method for remote login to a Linux server. It allows you to access the command line interface (CLI) of the remote machine over an encrypted connection.
      - Command:
        ```sh
          ssh user@hostname_or_IP
        ```
      - Where:
        - `user`: The username on the remote server.
        - `hostname_or_IP`: The IP address or hostname of the remote server.
      - You can also specify a private key for authentication using:
        ```sh
          ssh -i /path/to/private_key user@hostname_or_IP
        ```

  2.  **SFTP** (**Secure File Transfer Protocol**)

      - **SFTP** allows you to securely transfer files to and from a remote Linux server.
      - It operates over **SSH**, and you can use it to manage files on the remote server.
      - Command: `sftp user@hostname_or_IP`
      - After connecting, you can use commands like `put`, `get`, `ls`, `cd` to interact with the files.

  3.  **VNC** (**Virtual Network Computing**)

      - **VNC** is a graphical desktop-sharing protocol that allows you to remotely control a Linux machine's desktop environment. Unlike **SSH**, which is text-based, **VNC** gives you access to the GUI of the Linux server.
      - You need to install a **VNC** server on the remote machine (e.g., **TigerVNC** or **RealVNC**), and then you can connect to it using a **VNC client**.
      - Command to connect (using a VNC client): `vncviewer hostname_or_IP:port`
      - You'll need to specify the port on which the VNC server is running (default is `5901`)

  4.  **RDP** (**Remote Desktop Protocol**)

      - Though **RDP** is primarily used for Windows, there are Linux implementations (like **xRDP**) that allow you to use the **RDP** protocol to access a Linux machine's GUI.
      - Command: You would typically use an RDP client (like **Microsoft Remote Desktop on Windows** or **Remmina on Linux**) to connect to the Linux server's IP with the specified port (usually port `3389`).

  5.  **Telnet** (Not Recommended for Secure Connections)

      - **Telnet** is another protocol that can be used to connect to a remote Linux server, but it is not secure because it transmits data (including passwords) in plaintext.
      - Command: `telnet hostname_or_IP`
      - Note: **SSH** is always preferred over **Telnet** due to its encryption and security.

  6.  **Web-based Control Panels** (**cPanel**, **Webmin**, etc.)

      - If the **Linux server** has a web-based control panel like Webmin or cPanel, you can connect via a web browser by navigating to the server's IP address on a specific port (usually port `10000` for **Webmin**).
      - Example URL: `https://hostname_or_IP:10000`

  7.  **Mosh** (**Mobile Shell**)
      - **Mosh** is a replacement for **SSH** that is designed to work better over unreliable network connections. It allows you to stay connected even if your network connection drops and reconnects automatically.
      - Command: `mosh user@hostname_or_IP`
      - **Mosh** is particularly useful for mobile users with inconsistent network connectivity.

- **Remote Server Management Tools**
  1. **Ansible, Puppet, Chef**: Configuration management tools used to automate server setup, application deployment, and system updates.
  2. **Webmin**: A web-based interface for managing Linux servers. It provides an easy-to-use graphical interface for tasks like managing users, packages, and services.
  3. **Cockpit**: Another web-based tool for system administration that allows you to monitor and manage your Linux server remotely.
  4. **SSH Daemon** (**sshd**): The service that runs on a Linux machine and allows SSH access to the server. It listens for incoming connections on port 22 (by default).

# Resource and Further Reading

1. [Microsoft Learn - Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/)
2. [digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev](https://www.digitalocean.com/community/tutorials/different-types-of-shells-in-linux?ref=dailydev)
3. [Ubuntu WSL](https://canonical-ubuntu-wsl.readthedocs-hosted.com/en/latest/)
4. [How to Install WSL 2 on Windows 10 (Updated)](https://www.omgubuntu.co.uk/how-to-install-wsl2-on-windows-10)
5. [https://itsfoss.com/wsl-commands/?ref=dailydev](https://itsfoss.com/wsl-commands/?ref=dailydev)
