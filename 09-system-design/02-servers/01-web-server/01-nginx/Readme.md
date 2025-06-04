# Nginx (Engine-X)

## Table Of Contents

# Introduction to Nginx

- **Nginx** is a **web server** that is used as a:

  1. reverse proxy
  2. load balancer
  3. mail proxy, and
  4. HTTP cache

- **Features of Nginx** (**Why is Nginx So Popular?**):

  1. **Nginx’s Efficient Architecture**

     - **Nginx** uses an advanced **master-worker process model** that enhances efficiency and scalability.
     - **How It Works**

       - The **Master Process** handles configuration loading and manages worker processes.
       - Multiple **Worker Processes** execute client requests in parallel, utilizing **event-driven, asynchronous processing** instead of traditional thread-based models.

     - **Why It Matters?**
       - **High concurrency**: Nginx can handle thousands of simultaneous connections efficiently.
       - **Non-blocking architecture**: Unlike **Apache**, which spawns a new thread per request, **Nginx** processes multiple requests **asynchronously**.
       - **Low resource usage**: It consumes fewer CPU and memory resources compared to traditional web servers.

  2. **Nginx as a High-Performance Web Server**

     - **Nginx** is optimized to serve **static content** with minimal latency, making it ideal for high-traffic websites.
     - **How It Works**

       - Handles requests using an **event-driven approach** instead of spawning new processes for each request.
       - Caches frequently accessed static content, such as images, CSS, and JavaScript files, in memory.
       - Supports **gzip compression**, HTTP/2, and optimized connection handling for faster page loads.

     - **Why It Matters?**
       - **Handles high traffic effortlessly**: Unlike traditional web servers, Nginx scales without bottlenecks.
       - **Fast content delivery**: Caching and optimized request handling reduce load times.
       - **Ideal for microservices**: Nginx efficiently routes requests to backend services.

  3. **Nginx as a Reverse Proxy and Load Balancer**

     - **Nginx** is widely used as a **reverse proxy** to manage and distribute incoming traffic efficiently.
     - **How It Works**:

       - **Nginx** sits in front of multiple backend servers and **forwards client requests** to the appropriate server.
       - It **load balances traffic** across multiple backend instances to prevent any single server from being overloaded.
       - Supports **various load-balancing algorithms**, including **round-robin**, **least connections**, and **IP hash**.

     - **Why It Matters?**:
       - Distributes traffic efficiently, ensuring high availability.
       - Improves security by hiding backend servers from direct exposure to clients.
       - Reduces server load, enhancing performance.

  4. **SSL Termination with Nginx**

     - Managing SSL encryption and decryption can be CPU-intensive for backend servers. Nginx **offloads SSL/TLS processing**, improving performance.
     - **How It Works**

       - Nginx **terminates SSL connections** and forwards decrypted requests to backend servers over HTTP.
       - Supports **automatic HTTPS redirection**, helping secure applications.
       - Works with **Let’s Encrypt** for free SSL certificate management.

     - **Why It Matters?**
       - Reduces backend load by offloading SSL processing.
       - Enhances security with modern TLS encryption standards.
       - Simplifies SSL certificate management for applications.

  5. **Content Caching with Nginx**

     - Caching is critical for improving website performance and reducing server load. Nginx has built-in caching mechanisms that speed up content delivery.
     - **How It Works**

       - Stores frequently requested content in a **proxy cache**, reducing the need for repeated backend requests.
       - Uses a **cache manager** and **cache loader** to efficiently manage cache data.
       - Supports **cache expiration policies**, ensuring only fresh content is served.

     - **Why It Matters?**:
       - Accelerates website performance by serving cached content instantly.
       - Reduces backend server load, improving scalability.
       - Enhances user experience with faster response times.

# Nginx Architecture

- **Nginx** is designed with four major components:

  1. **Master Process** — Responsible for loading the server configuration and creating child processes (the next three types).
  2. **Cache Loader** — Loads the disk cache to memory and then exits.
  3. **Cache Manager** Runs at intervals and removes unneeded (or expired) entries from the disk cache to keep its size within the configured limit.
  4. **Worker Process** — Handles network connections, network, and disk I/O. It does all the work! Upon server start, the master process initializes multiple worker processes based on server configuration.

- **Why Nginx is Faster?**
  - In traditional servers, where a process is created per connection request, each process requires CPU cycles. **Context switches** provide these CPU cycles to each process. A context switch requires saving the current state of a running process to be restored later and then loading the state of another process to run it. Context Switching and the additional overhead and resources required to create a process for each connection request impact the server's overall performance.
  - This isn’t the case with **Nginx**, as a fixed number of worker processes (equal to the number of CPU cores) handle all the incoming requests. This reduces the context switches, as each worker is assigned a CPU core. As previously mentioned, this also avoids the additional resource consumption and overhead of process creation because worker processes are created at the start of the server. This allows Nginx to handle hundreds of thousands of connections per worker process.

# Setup

- Configuration Setup
  - nginx
    - content
      - item.txt
      - index.html
    - main
      - index.html
  - temp-nginx

# Nginx Proxy Manager (NPM)

- If you’re managing multiple web services or hosting applications at home or work, **Nginx Proxy Manager** can be your go-to solution. It simplifies the process of setting up a **reverse proxy** with an intuitive web interface.
- **Nginx Proxy Manager** is highly beneficial because it simplifies the complexities of managing web traffic and securing web services. It eliminates this hassle by providing an intuitive web interface for creating and managing reverse proxies, SSL certificates, and access controls. Its built-in support for Let’s Encrypt automates SSL certificate issuance and renewal, ensuring your services remain secure without constant maintenance. Additionally, its user-friendly features like logging, monitoring, and flexible routing make it accessible for small-scale personal projects. Another benefit is not exposing server directly to the Internet that can be attacke.

- **Features** include:
  1. **SSL Management**: Automated Let’s Encrypt integration for free SSL certificates.
  2. **Customizable Forwarding Rules**: Flexibility to route traffic to various backend servers.

# Setting Up Nginx Proxy Manager

- Possible options inlcude:
  1. Docker run
  2. Docker compose
  3. Using LXC Containter (Proxmox Setup)

## 1. Using Docker Compose

```yml
services:
npm:
  image: "jc21/nginx-proxy-manager:latest"
  restart: unless-stopped
  ports:
    # These ports are in format <host-port>:<container-port>
    - "80:80" # Public HTTP Port
    - "443:443" # Public HTTPS Port
    - "81:81" # Admin Web Port

  volumes:
    - ./data:/data
    - ./letsencrypt:/etc/letsencrypt
```

# Resources and Further Reading

1. [Inside NGINX: How We Designed for Performance & Scale](https://blog.nginx.org/blog/inside-nginx-how-we-designed-for-performance-scale)
2. [Medium - Why is Nginx So Popular? A Deep Dive into Its Key Features](https://medium.com/javarevisited/why-is-nginx-so-popular-a-deep-dive-into-its-key-features-5e55ae909c45)
