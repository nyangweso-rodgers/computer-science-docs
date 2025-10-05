# Computer Networking

## Table Of Contents

# Net

# Networking Models (Netwokr Reference Models or Network Architecture Models)

## 1. (OSI Model)

- The **OSI model** provides a conceptual framework for understanding the different aspects of network communication. Its seven layers offer a structured way to think about the various functions involved in transmitting data.
- **Purpose**:
  - A theoretical model created by **ISO** to standardize networking concepts and design.
- **7 Layers of OSI Model**

  1. **Application Layer**

     - This is where the user interacts with the application (e.g., sending an email, browsing the web). It provides network services to applications.
     - Data is prepared for transmission.
     - **Protocols** include:
       1. **HTTP**/**HTTPS** (**HyperText Transfer Protocol)**
          - The foundation of the web; **HTTP** is used for browsing websites.
          - **HTTPS** is the secure version (uses encryption).
          - HTTP Port: `80`
          - HTTPS Port: `443`
       2. **FTP** (**File Transfer Protocol**)
          - For transferring files between computers.
          - Secure alternatives: **SFTP** (Secure FTP) or FTPS.
          - Ports: `20` (data) and `21` (control)
       3. **SMTP** (**Simple Mail Transfer Protocol**)
          - Used for sending emails.
          - Works with other protocols like **IMAP** or **POP3** to retrieve emails.
          - Port: `25` (unencrypted) or Port `587` (encrypted for sending emails)
       4. **DNS** (**Domain Name System**)
          - Translates human-readable domain names (e.g., google.com) into IP addresses.
          - Port: `53`
       5. **POP3/IMAP**
          - Receiving emails.
       6. **SSH** (**Secure Shell**)
          - Provides secure remote access to servers.
          - Also used for secure file transfers.
          - Port: `22`

  2. **Presentation Layer**

     - Data is formatted and encrypted/decrypted as needed for transmission.
     - Translates data formats (e.g., encryption, compression).
     - Examples:
       1. **TLS**/**SSL** (**Transport Layer Security** / **Secure Sockets Layer**)
          - Encrypts data transmitted over networks (e.g., **HTTPS** uses **TLS**).

  3. **Session Layer**

     - A connection is established and managed between the communicating devices.
     - Manages sessions and connections.
     - Examples:
       1. **SMB** (used in Windows file sharing).

  4. **Transport Layer**

     - Data is divided into segments and reliable delivery is ensured (e.g., using **TCP**).
     - Ensures reliable data delivery between devices.
     - **Protocols** include:
       1. **TCP** (**Transmission Control Protocol**)
          - Ensures reliable, ordered delivery of data.
          - Breaks data into packets and reassembles them at the destination. Works with **IP** (**Internet Protocol**).
       2. **UDP** (**User Datagram Protocol**)
          - Similar to **TCP** but faster and less reliable.
          - Commonly used for real-time applications like **video streaming** or **online gaming**.

  5. **Network Layer**

     - Logical addresses (**IP addresses**) are assigned, and data is routed across the network.
     - Handles routing and addressing.
     - **Protocols** include:
       1. **IP** (**Internet Protocol**)
          - Directs packets to their destination using **IP addresses**.
          - Two versions: **IPv4** and **IPv6**.
       2. **ICMP** (**Internet Control Message Protocol**)
          - Used for diagnostics and error messages (e.g., when you "ping" a server).

  6. **Data Link Layer**

     - Data is framed into packets, physical addresses (**MAC addresses**) are added, and error detection is performed.
     - **Protocols**:
       1. **Ethernet**: Standard for wired **local area networks** (**LANs**)
       2. **MAC addressing**

  7. **Physical Layer**
     - The actual transmission of the data bits over the physical medium (e.g., cables, Wi-Fi) occurs.
     - **Protocols**:
       1. Hardware
       2. Cables
       3. Bluetooth: Protocol for short-range wireless communication between devices.

## 2. TCP/IP Model

- The **TCP/IP** model is focused on the practical implementation of network communication **protocols**. It reflects the actual structure and protocols used in real-world networks.
- **Purpose**
  - A practical model that defines how the **Internet** actually works. It’s based on real protocols (like **TCP**, **IP**, **HTTP**).
- **4 Layers of TCP/IP Model**

  1. **Application Layer**

     - **Functionality**: Combines the **Application**, **Presentation**, and **Session layers** of the **OSI model**
     - **Protocols**
       1. **HTTP** (**HyperText Transfer Protocol**)
       2. **FTP** (**File Transfer Protocol**)
       3. **SMTP** (**Simple Mail Transfer Protocol**)
       4. **DNS** (**Domain Name System**)
       5. **Telnet**

  2. **Transport Layer**

     - **Functionality**: Similar to the **OSI Transport Layer**
     - **Protocols**:
       1. **TCP**
       2. **UDP**

  3. **Internet Layer**

     - **Functionality**: Similar to the **OSI Network Layer**
     - **Protocols**:
       1. **IP**
       2. **ICMP**
       3. **ARP**

  4. **Network Access Layer**
     - **Functionality**: Combines the **Data Link** and **Physical layers** of the **OSI model**
     - **Protocols** included:
       1. **Ethernet**
       2. **Wi-Fi**

# The Journey from Code to Bebpage

- Let’s walk through that Github search to see how we go from a URL typed into an address bar to a running web page:

  1. You type a URL into your browser

     ```sh
      https://github.com/
     ```

  2. The browser parses the information contained in the URL.

     - This includes the **protocol** (`“https”`), the **domain name** (“`github.com`”) and the **resource** (“`/`”)
     - In this case, there isn’t anything after the “.com” to indicate a specific resource, so the browser knows to retrieve just the main (index) page

  3. The browser communicates with your **ISP** to do a **DNS** lookup of the **IP address** for the web server that hosts www.github.com.

     - The **DNS service** will first contact a **Root Name Server**, which looks at https://www.github.com and replies with the **IP address** of a name server for the “.com” top-level domain. This address is sent back to your **DNS service**. The DNS service does another outreach to the “.com” name server and asks it for the address of https://www.github.com.

  4. Once the ISP receives the IP address of the destination server, it sends it to your web browser

     ```sh
      https://192.30.253.45:443
     ```

  - Where:
    - `https` is the **protocal**
    - `192.30.253.45` is the **IP Address**
    - `443` is the **port number**

  5. Your browser takes the **IP address** and the given **port** number from the **URL** (the HTTP protocol defaults to port `80` and HTTPS defaults to port `443`) and opens a **TCP socket connection**. At this point, your web browser and web server are finally connected.

  6. Your web browser sends an **HTTP request** to the **web server** for the main HTML web page of www.github.com.

  7. The web server receives the request and looks for that HTML page. If the page exists, the web server prepares the response and sends it back to your browser. If the server cannot find the requested page, it will send an HTTP 404 error message, which stands for “Page Not Found”.

  8. Your web browser takes the HTML page it receives and then parses through it doing a full head to toe scan looking for other assets that are listed, such as images, CSS files, JavaScript files, etc.

  9. For each asset listed, the browser repeats the entire process above, making additional HTTP requests to the server for each resource.

  10. Once the browser has finished loading all other assets that were listed in the HTML page, the page will finally be loaded in the browser window and the connection will be closed

- **Remarks**:
  - One thing worth noting is how information gets transmitted when you make a request for information.
    - When you make a request, that information is broken up into many tiny chunks called **packets**.
    - Each **packet** is tagged with a **TCP header**, which include the source and destination port numbers, and an **IP header** which includes the source and destination IP addresses to give it its identity.
    - The **packet** is then transmitted through ethernet, WiFi or Cellular network and is allowed to travel on any route and take as many hops as it needs to get to the final destination.
    - (We don’t actually care how the packets get there — all that matters is that they get to the destination safe and sound!) Once the packets reach the destination, they are reassembled again and delivered as one piece.
    - So how do all the packets know how to get to their destination without getting lost? The answer is TCP/IP.
      - **TCP/IP** is a two-part system, functioning as the Internet’s fundamental “control system”. IP stands for Internet Protocol; its job is to send and route packets to other computers using the IP headers (i.e. the IP addresses) on each packet. The second part, Transmission Control Protocol (TCP), is responsible for breaking the message or file into smaller packets, routing packets to the correct application on the destination computer using the TCP headers, resending the packets if they get lost on the way, and reassembling the packets in the correct order once they’ve reached the other end.

# Resource and Further Reading

1. [freecodecamp - How the Web Works: A Primer for Newcomers to Web Development (or anyone, really)](https://www.freecodecamp.org/news/how-the-web-works-a-primer-for-newcomers-to-web-development-or-anyone-really-b4584e63585c/)
2. [https://blog.isquaredsoftware.com/2020/11/how-web-apps-work-http-server/?ref=dailydev](https://blog.isquaredsoftware.com/2020/11/how-web-apps-work-http-server/?ref=dailydev)
3. [freecodecamp - Computer Networking Tutorial – How Network Applications Talk Over the Internet](https://www.freecodecamp.org/news/computer-networking-how-applications-talk-over-the-internet/?ref=dailydev)
