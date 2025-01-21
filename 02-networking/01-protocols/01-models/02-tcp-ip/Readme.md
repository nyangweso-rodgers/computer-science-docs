# TCP/IP Model

## Table Of Contents

# TCP/IP Model

- The **TCP/IP** model is focused on the practical implementation of network communication protocols. It reflects the actual structure and protocols used in real-world networks.

# 4 Layers of TCP/IP Model

## 1. Application Layer

- **Functionality**: Combines the **Application**, **Presentation**, and **Session layers** of the **OSI model**
- **Protocols**

  1. **HTTP** (**HyperText Transfer Protocol**)

     - The foundation of the web; HTTP is used for browsing websites.
     - HTTPS is the secure version (uses encryption).
     - HTTP Port: 80
     - HTTPS Port: 443

  2. **FTP** (**File Transfer Protocol**)
     - For transferring files between computers.
     - Secure alternatives: **SFTP** (Secure FTP) or FTPS.
     - Ports: 20 (data) and 21 (control)
  3. **SMTP** (**Simple Mail Transfer Protocol**)

     - Used for sending emails.
     - Works with other protocols like **IMAP** or **POP3** to retrieve emails.
     - Port 25 (unencrypted) or Port 587 (encrypted for sending emails)

  4. **DNS** (**Domain Name System**)
     - Translates human-readable domain names (e.g., google.com) into IP addresses.
     - Port: 53
  5. Telnet

## 2. Transport Layer

- **Functionality**: Similar to the **OSI Transport Layer**
- **Protocols**:
  1. TCP
  2. UDP

## 3. Internet Layer

- **Functionality**: Similar to the **OSI Network Layer**
- **Protocols**:
  1. IP
  2. ICMP
  3. ARP

## 4. Network Access Layer

- **Functionality**: Combines the **Data Link** and **Physical layers** of the **OSI model**
- **Protocols** included:
  1. Ethernet
  2. Wi-Fi

# Resources and Further Reading

1.
