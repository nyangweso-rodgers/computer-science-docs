# Servers

## Table of Contents

# What Is a Server?

- **Key components of a server**:

  1. **Processor** (**CPU**)

     - It acts as the brain of the server system.
     - Popular processor brands available today include **Intel Xeon processors**, **HPE**, **Dell**, and **Huawei**, among others

  2. **RAM**

     - **RAM** is the short-term memory unit that stores working data and machine code.
     - **Processors** require **RAM** to read and write data at a faster pace.
     - As servers work on multiple instructions, retrieving data from **RAM** saves much more time than fetching data from hard drives. Moreover, when the **processor** executes a computer program, that program typically resides in the main memory (RAM). The performance of the memory can ultimately determine the execution speed of the server computer.

  3. **Storage**

     - **Servers** use storage components to store various files necessary for executing machine code. This includes OS files, libraries, databases, website data, application data, etc. On the server side, traditional hard drives and **solid-state drives** (**SSDs**) are employed to store data. The choice of the storage element depends on the needs and requirements. For example, a **database server** should be capable of reading and writing data faster than a file archive server, which need not be as quick.
     - It is also important to consider that a single storage device can impact server performance negatively. For example, when a storage component fails, all the websites hosted by the web server are bound to go down, resulting in a bad online user experience. Hence, most servers employ a **Redundant Array of Independent Disks** (**RAID**) to address such problems and, in turn, increase fault tolerance. **RAIDs** are an array of independent disks that give better storage performance and data redundancy than any single storage component.

  4. **Bandwidth**:
     - **Servers** process user requests and deliver content via the internet or a combination of networks such as [WAN]() or [LAN](). It is inevitable that servers have a higher **bandwidth**, allowing them to cater to multiple clients and address queries on time.

- **How does a server work?**

  - When a user enters a website URL in the web browser, several servers are already waiting to provide the requested information. The process begins with the web browser dividing the URL into three parts:
    1. **Protocol**: The first part is the **HTTP** or **HTTPS**, which acts as a communication pathway for servers and browsers to talk to each other.
    2. **Server name**: The second part of the URL relates to the server name. Here, a **domain name server** (**DNS**) translates the domain name into the server’s IP address that hosts the requested website.
    3. **File name**: The final part encapsulates files that include HTML, CSS, fonts, images, graphics, and many other ingredients that make up the requested website.

- **Key Features of Servers**:
  1. Scalability
  2. High processing power
  3. Reliability
  4. Better collaboration
  5. Cost savings
  6. Safeguard from cyberattacks

# Types of Servers

- **Servers** of different types exist today. Several servers can perform multiple jobs, such as hosting websites, sending and receiving emails, safeguarding internal networks, etc. On the other hand, dedicated servers such as **database servers** or print servers focus on one objective.

  1. **Web Server**:

     - **Web servers** are designed to run websites and apps through client programs (web browsers) such as Chrome, Firefox. They are responsible for storing, processing, and delivering web content to users. They support protocols such as **HTTP**, **FTP**, and **SMTP** that are key to information exchange between network devices.
     - In a network, all machines hosting websites have **web server** software to better manage user access to hosted files. Some examples of web servers include:
       1. Apache HTTP Server
       2. Microsoft Internet Information Services (IIS), and
       3. Sun Microsystem’s Sun Java System Web Server.

  2. **Mail Server**:

     - A **mail server** facilitates email storage and management for clients. It uses different protocols for sending and receiving emails. For example, the **Simple Mail Transfer Protocol** (**SMTP**) is used to send an email. The server relies on the **Post Office Protocol** (**POP3**)l to store and receive an email.
     - Simply put, when a user sends an email to another computer, it requests the mail server to deliver it to the intended recipient. Mail servers rely on several software modules that allow emails to be sent, received, retrieved, and forwarded.

  3. **Application Server**

     - An **application server** provides an environment that helps develop, process, and run web-based applications, irrespective of their functionality. The server executes computer programs or scripts essential for running PHP, Java, or .Net applications.
     - **Application servers** are much like **web servers** as they tend to use **HTTP** protocol and answer client requests. However, these servers focus on creating dynamic websites that use object pooling, messaging services, and others; for example, ecommerce websites, blogs, etc. On the other hand, **web servers** are inclined towards creating static websites where information remains the same, for example, technical documentation websites, corporate portfolio websites, read-only websites, landing pages, and so on.
     - In some cases, **application servers** include a **web server** component in them so that they can perform the function of a web server when needed.

  4. **Database Server**

     - **Database servers** offer database services to client computers. Users can access, modify, store, and retrieve data from a database by executing a query; for example, an SQL query.
     - **Database servers** are responsible for handling the security and recovery of **database management systems** (**DBMS**). They store digital files, application files, and non-database files. Large organizations use these servers to safeguard their sensitive and valuable corporate data.
     - Some examples of database servers include:
       1. Microsoft SQL
       2. MySQL
       3. MongoDB, and
       4. SQLite.

  5. **DNS Server**:

     - **DNS servers** are domain name servers. These computers resolve server names that reside in a network. **DNS servers** are an integral part of the internet as they translate user-understandable URLs (for example, www.google.com) into their corresponding **IP addresses**.

  6. **Dynamic Host Configuration Protocol** (**DHCP**) **server**

     - **DHCP** servers refer to computer systems that dynamically assign **IP addresses** to clients. The advantage of this automatic process is that it minimizes the errors that manual handling may bring along, such as typo errors or IP conflicts.
     - **DHCP** servers maintain configuration updates of network devices; for example, they update or change expired IP addresses or manage the IP addresses of devices that move from location to location. These servers also play a key role in network administration since they can simultaneously address multiple client requests.

  7. **File server**:

     - A **file server** refers to a machine that provides shareable disks that can be accessed by the workstations on a network. The disk holds computer files such as text files, images, graphic files, audio & video files, and so on. File servers are typically used for storage purposes. Hence, they neither run computer programs nor perform computational tasks.
     - **File servers** use different protocols to access files depending on the computing environment. For example, internet file servers are accessible via **FTP** and **HTTP** protocols, while file servers on **LAN**, such as the ones used in offices and schools, are accessed using **SMB** or **NFS** protocol

  8. **Gaming server**

     - **Gaming servers** connect the global online gaming community. They support multiplayer games such as Counter-Strike, Minecraft, etc. Moreover, these servers manage player and game data while synchronizing player activity in the virtual world. **ScalaCube**, **HostHavoc**, and **Cloudzy** are popular game server hosting solutions that rent game servers for games such as ARK, Rust, and others.

  9. **Print server**
     - **Print servers** connect printing devices to clients on a network. They accept print tasks from users and queue them in anticipation that printers can fail to cope with the number of requests received in a certain timeframe.
     - These servers use different protocols to accomplish print jobs, such as **Internet Printing Protocol**, **Line Printer Daemon protocol**, or **JetDirect**.
     - Popular brands in the print server market include **IOGEAR** and **HP**.

## 6. Proxy Server

- A **proxy server** acts as an intermediary between **local networks** and **worldwide networks**. It provides a communication interface between interacting networks by accepting requests from one network and forwarding them using its own IP address. These servers cache frequently accessed web pages, which helps faster loading when accessed in the future. As a result, the network’s bandwidth is reduced significantly.
- Moreover, **proxy servers** filter network communication and are always available, which is crucial for network load balancing. These servers also keep clients anonymous as their original IP address is replaced with a proxy.
- **Forward Proxy Server**

  - Sits between user devices and the internet.
  - A forward proxy is commonly used for:
    1. Protect clients
    2. Avoid browsing restrictions
    3. Block access to certain content

- **Reverse Proxy Server**
  - A reverse proxy is a server that accepts a request from the client, forwards the request to web servers, and returns the results to the client as if the proxy server had processed the request.
  - A reverse proxy is good for:
    1. Protect servers
    2. Load balancing
    3. Cache static contents
    4. Encrypt and decrypt SSL communications

# Resources and Further Reading

1. [What Is a Server? Definition, Types, and Features](https://www.spiceworks.com/tech/tech-general/articles/what-is-a-server/)
