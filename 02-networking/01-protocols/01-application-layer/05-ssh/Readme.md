# SSH (Secure Shell)

- **SSH** is a network protocol used to securely connect to and manage remote devices or servers over an insecure network (like the internet).
- **SSH** provides **encrypted communication**, ensuring that the data exchanged between the client and the server cannot be intercepted or tampered with by malicious actors.
- **SSH** is less expensive and complex than the hardware based **VPN** solutions. i.e., it offers **authentication**, **encryption** and **data integrity** for securing network communicationsy.

- It’s primarily used to:

  1. Log into remote servers.
  2. Execute commands remotely.
  3. Transfer files securely.
  4. Tunnel or forward ports securely

- By Implementing **SSH**, we get some of the capabilities like:
  1. secure command-shell
  2. secure file transfer
  3. remote access to a variety of **TCP/IP** applications via a secure tunnel

# How SSH Works (Architecture and Workflow)

- **SSH** involves two key components:

  1. **Client**

     - The device or user initiating the connection
     - Tools like `ssh` (Linux/macOS command), **PuTTY** (Windows), or Termius (GUI client) are used to initiate an SSH connection.

  2. **Server**: The remote machine you’re connecting to. It runs an SSH server, such as OpenSSH.

# Alternatives to SSH

- While **SSH** is the most popular and widely used tool for secure remote access, there are alternatives:
  1. RDP (Remote Desktop Protocol):
  2. Telnet
  3. VNC (Virtual Network Computing):
  4. Mosh (Mobile Shell):
  5. FTPS/SFTP:
