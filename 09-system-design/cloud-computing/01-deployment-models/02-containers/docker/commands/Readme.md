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

## Docker Images Commands

1. **Lists Docker Images**

   - To list all the **docker images** on your system, run:

     ```sh
       #list all docker images
       docker images

       #or, list all docker images
       docker images ls
     ```

2. **Docker Image Metadata**

   - Before running a container, you can review the image metadata using:
     ```sh
       docker inspect <image_name>
     ```
   - `docker inspect <image_name>` return a `JSON` output.
   - `inspect` command provides useful information about the image such as:
     - the layers information,
     - image size,
     - hardware architecture, e.t.c.,
   - Example:

     ```sh
       docker inspect postgres
     ```

3. **Delete Docker Images**

   - To delete an **image**, you have to ensure no **container** is using that `image`; if a container is using the image, we'd have to delete the container before we would be able to delete the image
   - Syntax:
     ```sh
       # delete an image using image name
       docker rmi <IMAGE_NAME or IMAGE_ID>
     ```
   - Example:
     ```sh
       #delete python image
       docker rmi python
     ```
   - **Remarks**:
     - We can also clean up all unused **images** with `docker image prune`. The command deletes images that aren’t mounted to at least one container.
     ```sh
       docker image prune
     ```

## Docker Containers Commands

1. **Command**: **Start and Run Docker Containers**

   - Start **Docker Containers** defined in the `docker-compose.yml` file by:
     ```sh
      docker compose up
     ```
   - **Remarks**
     - This keeps the **containers** running in the foreground and shows their output in the terminal.
     - Similar to `docker-compose up -d`, this command does not rebuild the **Docker images** if there are no changes to the `Dockerfile` or any of the files referenced in the build context.
     - Detached mode means that the containers will run in the background, and you'll get your terminal prompt back immediately.
       ```sh
        docker compose up -d --build
       ```

2. **Command 4.1**: **Lists Docker Containers**

   - To check the status and details of running containers on your system, you can use the `docker ps` command.
     ```sh
       # list running containers
       docker ps
     ```
   - If you want to see all containers, including those that are stopped, you can add the `-a` flag:

     ```sh
       # lists all containers (stopped and running containers)
       docker ps -a
     ```

3. **Command 4.2**: **Execute Commands in a Running Container**

- `docker exec` Docker command used to execute commands in a running container
  - `-it`: These are options passed to the docker exec command:
    - `-i` or `--interactive`: This option allows you to interact with the container's standard input, allowing you to provide input to the executed command.
    - `-t` or `--tty`: This option allocates a pseudo-TTY (terminal) for the command being executed, allowing you to see the command's output as if you were running it directly in a terminal.

3. **Command 4.3**: **Stop Running Container**

   - **Syntax**
     ```sh
       docker stop <container_id>
     ```
   - Example:
     ```sh
       docker stop postgres
     ```

4. **Command 4.4**: **Remove Containers**

- Use `docker-compose rm -sf` command to remove stopped service containers defined in a `docker-compose.yml` file.

  - The `-s` flag stands for `--stop`. When used, it stops the containers before removing them. This ensures that any running containers will be stopped before the removal process begins.
  - The `f` flag stands for `--force`. It forces the removal of containers without asking for confirmation. Normally, `docker-compose rm` will prompt you to confirm the removal of each container, but with the `-f` flag, it will proceed without any prompts.

- This command is useful for quickly cleaning up your Docker environment by stopping and removing containers defined in the Compose file.

5. **Command 4.5**: **Delete Docker Container**

   - To delete a **container**, it must not be running
   - Syntax:
     ```sh
       docker stop <container_name>
     ```
   - Once the container is stopped, we can then delete it:
     ```sh
       docker rm <container_name>
     ```

6. **Command**: **Shutdown Docker Containers**

   - To safely stop the active services, we can use `stop`, which will preserve containers, `volumes`, and `networks`, along with every modification made to them:

     ```sh
       #stop active servuces
       docker-compose stop
     ```

   - To reset the status of our project, we can simply run `down`, which will destroy everything with the **exception of external volumes**:
     ```sh
       #reset
       docker-compose down
     ```

## Docker Network Commands

1. **Get the list of docker Networks**

   - Get lists of docker networks by:
     ```sh
      docker network ls
     ```

2. **Inspect each network and find corresponding containers**

   - Check corresponding containers for docker networks
     ```sh
      docker network inspect <network-name>
     ```

3. **Disconnet Container From Its Network**
   - Containers which must communicate with each other must be in a same network.
   - Example: disconnect server container from its network and reconnect it to the mongodb-network:
     ```sh
       docker network disconnect [Network Name] [Container Name]
       docker network connect [Network Name] [Container Name]
     ```

## Docker Volumes Commands

1. **Command 5.1**: **Lists Docker Volumes**

   - List all your volumes with `docker volume ls`:
     ```sh
       docker volume ls
     ```

2. **Command 5.2**: **Inspect Docker Volumes**

   - If you want to know Where is **Docker** storing your data when you use a `volume`, you can use the `docker volumne inspect` command:
   - Syntax
     ```sh
       docker volume inspect <volume_name>
     ```
   - Example:
     ```sh
       docker volume inspect postgres_volume
     ```

3. **Command 5.3**: **Delete Docker Volumes**

   - Delete a volume with `docker volume rm`:
     ```sh
       docker volume rm postgres_volume
     ```
   - Volumes which are currently mounted to a container can’t be deleted unless you add the `-f` (force) flag:
     ```sh
       docker volume rm postgres_volume -f
     ```
   - We can also clean up all unused volumes with `docker volume prune`. The command deletes volumes that aren’t mounted to at least one container.
     ```sh
       docker volume prune
     ```

## Docker Logs Commands

- The command to access logs is

  ```sh
    docker-compose logs
  ```

  - Key Options include:
    - `--follow`: Streams logs in real-time, similar to tail `-f`.
      ```sh
        docker-compose logs --follow
      ```
    - `<service-name>`: View logs from a specific service.
      ```sh
        docker-compose logs <service-name>
      ```
    - `--tail`: Limits the number of log lines displayed.
      ```sh
        docker-compose logs --tail=100
      ```
    - `--timestamps`: Adds timestamps to each log entry for better context.
      ```sh
        docker-compose logs --timestamps
      ```

- **Debugging and Troubleshooting Container Logs**

  - Common Scenarios:

    - **Application Errors**: Look for error logs in the `stderr` stream to identify issues with your app.
    - **Service Failures**: Check for logs during container initialization to pinpoint configuration issues.
    - **Networking Problems**: Logs can reveal if services fail to connect due to network misconfiguration.

  - Using Filters:
    - If logs become overwhelming, use the `grep` command to filter entries:
      ```sh
        docker-compose logs | grep "ERROR"
      ```
    - Or specify a particular service to narrow the scope:
      ```sh
        docker-compose logs <service-name> | grep "connection"
      ```
    - Filtering log output is especially useful in large multi-container applications where individual service logs can quickly grow unwieldy.

## Docker `cp`

- The `docker cp` command is particularly invaluable for file operations between the **host** and **containers**.
- The `docker cp` command facilitates the transfer of files and directories to and from **Docker containers**. It mirrors the functionality of the Unix `cp` command but is tailored for the unique environment of **containers**. Whether you’re handling **configurations**, **logs**, or **data backups**, `docker cp` ensures that you can efficiently manage files without direct interaction within the container’s shell.

# Docker `cp` Commands

1. **Syntax**:

   ```sh
    docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH
    docker cp [OPTIONS] SRC_PATH CONTAINER:DEST_PATH
   ```

2. **Copying Files into a Container**

   - To copy a local file into a **container**, you might use:
     ```sh
      docker cp /path/to/local/file.txt mycontainer:/path/in/container/file.txt
     ```

3. **Extracting Files from a Container**

   - To copy a file from a **container** to the **host**:
     ```sh
      docker cp mycontainer:/path/in/container/file.txt /path/to/local/file.txt
     ```

4. **Inter-Container File Transfer**
   - While `docker cp` does not support direct file transfers between **containers**, you can achieve this by copying the file to the **host** first, then to the destination **container**:
     ```sh
      docker cp sourcecontainer:/file.txt /tmp/file.txt
      docker cp /tmp/file.txt destcontainer:/file.txt
     ```

# Resources anf Further Reading

1. [last9.io - How to Log Into a Docker Container](https://last9.io/blog/how-to-log-into-a-docker-container/?ref=dailydev)
