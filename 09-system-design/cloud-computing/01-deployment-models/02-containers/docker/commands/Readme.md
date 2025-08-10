# Docker Commands

## Table Of Contents

# `docker exec` Commands

- Docker’s `exec` command lets you run **shell commands** directly inside your running **containers** without forcing you to restart them. It’s useful when you want to **debug an error**, **adjust settings**, or quickly peek into a container’s environment

# How to Log Into a Docker Container

- Unlike traditional **servers**, **containers** usually don’t run **SSH daemons**. Instead, **Docker** gives you built-in tools to run commands or open a shell directly inside the **container**.
- **The Basic Method: Using** `docker exec`:
  - **Syntax**:
    ```sh
        docker exec -it container-name /bin.bash
    ```
    - `docker exec` tells **Docker** to run a command inside a running **container**
    - `-i` keeps the input stream open, and `-t` allocates a terminal
    - `container-name` can be the container’s name or ID
    - `/bin/bash` launches the Bash shell (or use `/bin/sh` if Bash isn’t available)
  - **What If Bash Isn't Installed?**
    - Not every **container** includes **Bash**, especially those built on minimal base images like `Alpine` or scratch. If you get a **“command not found**” error, try using `sh` instead:
      ```sh
        docker exec -it container-name /bin/sh
      ```
- **What to Do Once You're Inside a Docker Container**:

  - **Check Logs**:

    - Below commands show real-time log output so you can watch what's happening as requests come in or process fail:
      ```sh
        tail -f /var/log/application.log
        journalctl -f # if the container uses systemd
      ```

  - **Review Configuration Files**

    - Misconfigurations are a common cause of unexpected behavior. Double-check that config files exist, are readable, and contain the right values.
      ```sh
        cat /etc/nginx/nginx.conf
        ls -la /app/config/
      ```
    - These helps ensure the app is picking up the correct settings and paths

  - **Check Running Processes**

    - Sometimes the app isn’t running at all, or there may be zombie processes eating up resources.
      ```sh
        ps aux
        top
        htop # if available
      ```
    - These commands show what's running and how much CPU/memory each process is using:

  - **Test Network Connectivity**

    - Apps often fail because they can't connect to a dependent service. You can test network routes and endpoints from inside the container:
      ```sh
        ping google.com
        curl -I http://api.example.com
        netstart -tulpn
      ```
    - Use these to confirm DNS resolution, open ports, or response headers from APIs your app relies on.

  - **Check Disk Usage**:
    - If a **container** runs out of disk space, it can silently break logging, caching, or even crash altogether
      ```sh
        df -h
        du -sh /var/log/*
      ```
    - These commands show total and per-directory usage so you can identify what's taking up space.

- **Install Debugging Tools (If Needed)**
  - Minimal containers often lack even basic tools. If you need to poke around more, you can temporarily install utilities—just note these won’t persist unless baked into the image or saved with `docker commit`.
    ```sh
        apt-get update && apt-get install -y curl vim # Debian/Ubuntu
        yum install -y curl vim # CentOS/RHEL
        apk add curl vim # Alpine
    ```

# Resources anf Further Reading

1. [last9.io - How to Log Into a Docker Container](https://last9.io/blog/how-to-log-into-a-docker-container/?ref=dailydev)
