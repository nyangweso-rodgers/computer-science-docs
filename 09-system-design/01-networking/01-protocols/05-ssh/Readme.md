# SSH (Secure Shell)

- **SSH** is a **network protocol** used to securely connect to and manage remote devices or servers over an insecure network (like the internet).
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
  1. **RDP** (**Remote Desktop Protocol**):
  2. **Telnet**
  3. **VNC** (**Virtual Network Computing**):
  4. **Mosh** (**Mobile Shell**):
  5. **FTPS**/**SFTP**:

# SSH Port Forwarding

- **Port forwarding** is a technique that allows network traffic to be redirected from one **address/port** to another **address/port**. It is commonly used in **networking**, **SSH tunneling**, and **firewall configurations** to allow access to services that are otherwise unreachable.

- **Local Port forwarding**

  - It forwards traffic from remote server (to which we’re ssh’ing) to our local machine on specified port.
  - You can use this technique to get access to management port to application server, because it’s not exposed through network. Similarly you can use it for example to get access to database (but please be cautions if you want to do this on production environment if you really need to)
  - So, how to do this ?
    ```sh
      ssh -L 19999:localhost:9990 user@myserver.local
    ```
  - I.e.,
    - `ssh -L` tells that we want to create **SSH** connection with server with **local** port forwarding
    - `19990:localhost:9990`
      - `19990` – it’s port on our local machine to which traffic should be forwarded from server – remember about colon after local port!
      - `localhost:9990` – it’s service/port that we want to forward to local machine. Important here is fact that address is from server perspective. Few paragraphs below I’ll explain it, but here you need to point to service/port from server perspective
    - `user@myserver.local` User and server name to which we’re ssh’ing. Like in “normal” SSH connection.
  - After issuing this command and connecting to server, you should have access to port from server under your local port that you provided in command above. In this example when I go to browser and go to `localhost:19990` I will see my management console that is hosted on `myserver.local:9990`.

  - **Remote Port forwarding**
    - It works similar, but now we’re forwarding our local port to server.
