# Nginx (Engine-X)

- **Nginx** is a **web server** that is used as a:
  1. reverse proxy
  2. load balancer
  3. mail proxy, and
  4. HTTP cache

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
