# OSI (Open Systems Interconnection) Model

## Table Of Contents

# OSI Model

- The **OSI model** provides a conceptual framework for understanding the different aspects of network communication. Its seven layers offer a structured way to think about the various functions involved in transmitting data.

# 7 Layers of OSI Model

-

## 1. Application Layer

- This is where the user interacts with the application (e.g., sending an email, browsing the web).
- Data is prepared for transmission.
- **Protocols**:

  1. **HTTP**/**HTTPS** (**HyperText Transfer Protocol)**

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

  4. POP3/IMAP: Receiving emails.

  5. **DNS** (**Domain Name System**)

     - Translates human-readable domain names (e.g., google.com) into IP addresses.
     - Port: 53

  6. **SSH** (**Secure Shell**)
     - Provides secure remote access to servers.
     - Also used for secure file transfers.
     - Port 22

## 2. Presentation Layer

- Data is formatted and encrypted/decrypted as needed for transmission.
- Translates data formats (e.g., encryption, compression).
- Examples:
  - **TLS**/**SSL** (**Transport Layer Security** / **Secure Sockets Layer**): Encrypts data transmitted over networks (e.g., **HTTPS** uses **TLS**).

## 3. Session Layer

- A connection is established and managed between the communicating devices.
- Manages sessions and connections.
- Examples:
  - **SMB** (used in Windows file sharing).

## 4. Transport Layer

- Data is divided into segments and reliable delivery is ensured (e.g., using **TCP**).
- Ensures reliable data delivery between devices.
- **Protocols**:

  1. **TCP** (**Transmission Control Protocol**)

     - Ensures reliable, ordered delivery of data. Breaks data into packets and reassembles them at the destination. Works with **IP** (**Internet Protocol**).

  2. **UDP** (**User Datagram Protocol**)
     - Similar to **TCP** but faster and less reliable. Commonly used for real-time applications like video streaming or online gaming.

## 5. Network Layer

- Logical addresses (IP addresses) are assigned, and data is routed across the network.
- Handles routing and addressing.
- **Protocols**:

  1. **IP** (**Internet Protocol**)

     - Directs packets to their destination using IP addresses.
     - Two versions: **IPv4** and **IPv6**.

  2. **ICMP** (I**nternet Control Message Protocol**)
     - Used for diagnostics and error messages (e.g., when you "ping" a server).

## 6. Data Link Layer

- Data is framed into packets, physical addresses (MAC addresses) are added, and error detection is performed.
- **Protocols**:
  1. **Ethernet**: Standard for wired **local area networks** (**LANs**)
  2. MAC addressing

## 7. Physical Layer

- The actual transmission of the data bits over the physical medium (e.g., cables, Wi-Fi) occurs.
- **Protocols**:
  1. Hardware
  2. Cables
  3. Bluetooth: Protocol for short-range wireless communication between devices.

# Resources and Further Reading
