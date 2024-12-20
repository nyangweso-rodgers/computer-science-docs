# Docker Commands

# Table of Contents

# Setup

- check if **Docker** is installed by running:
  ```sh
    docker version
  ```

# Docker Commands

- Docker commands should be executed in the root folder where `Dockerfile` is located.

## Command 1. Start and Run Docker Containers

- Start **Docker Containers** defined in the `docker-compose.yml` file by:
  ```sh
    docker-compose up
  ```
- **Remarks**:

  - This keeps the containers running in the foreground and shows their output in the terminal.
  - Similar to `docker-compose up -d`, this command does not rebuild the **Docker images** if there are no changes to the `Dockerfile` or any of the files referenced in the build context.
  - Detached mode means that the containers will run in the background, and you'll get your terminal prompt back immediately.
    ```sh
      docker-compose up -d
    ```
  - The below command also starts your **Docker containers** defined in the `docker-compose.yml` file, but it rebuilds the images before starting the containers, regardless of whether there are any changes to the `Dockerfile` or build context files.
    ```sh
      docker-compose up -d --build
    ```
  - It's useful when you want to ensure that your containers are using the latest version of the images, even if there haven't been any changes to the `Dockerfile` or build context since the last build.
  - There are two ways you can specify specific services to run with `docker-compose`:
    1.  Using service names
        ```sh
          docker-compose up -d --build <service_name1> <service_name2> ...
        ```
    2.  Using the `--no-deps` flag:
        ```sh
          docker-compose up -d --build --no-deps <service_name>
        ```
    - This approach combines the `--build` flag to rebuild the image before running and the `--no-deps` flag.
    - `--no-deps` tells **Docker Compose** to not automatically start any services that the specified service depends on.

- After the first time, however, we can simply use `start` to start the services:
  ```sh
    docker-compose start
  ```

## Command 1.2: Custom Hostnames

- While **Docker** uses **container names** as **hostnames** by default, you can set custom ones:
  ```sh
    docker run --name api --hostname custom-api --network myapp hello-world-go
  ```
- Now other containers on the network can reach this container using either `api` or `custom-api` as the **hostname**.
- You can verify the **hostname** from inside the container:
  ```sh
    docker exec -it api hostname
  ```

## Command 2. Shutdown Docker Containers

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

# Docker Images

## Command 3.1: Lists Docker Images

- To list all the docker images on your system, run:

  ```sh
    #list all docker images
    docker images

    #or, list all docker images
    docker images ls
  ```

## Command 3.2: Docker Image Metadata

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

## Command 3.3: Delete Docker Images

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

# Docker Containers

## Command 4.1: Lists Docker Containers

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

## Command 4.2: Execute Commands in a Running Container

- `docker exec` Docker command used to execute commands in a running container
  - `-it`: These are options passed to the docker exec command:
    - `-i` or `--interactive`: This option allows you to interact with the container's standard input, allowing you to provide input to the executed command.
    - `-t` or `--tty`: This option allocates a pseudo-TTY (terminal) for the command being executed, allowing you to see the command's output as if you were running it directly in a terminal.

## Command 4.3: Stop Running Container

- Syntax
  ```sh
    docker stop <container_id>
  ```
- Example:
  ```sh
    docker stop postgres
  ```

## Command 4.4: Remove Containers

- Use `docker-compose rm -sf` command to remove stopped service containers defined in a `docker-compose.yml` file.

  - The `-s` flag stands for `--stop`. When used, it stops the containers before removing them. This ensures that any running containers will be stopped before the removal process begins.
  - The `f` flag stands for `--force`. It forces the removal of containers without asking for confirmation. Normally, `docker-compose rm` will prompt you to confirm the removal of each container, but with the `-f` flag, it will proceed without any prompts.

- This command is useful for quickly cleaning up your Docker environment by stopping and removing containers defined in the Compose file.

## Command 4.5: Delete a Container

- To delete a **container**, it must not be running
- Syntax:
  ```sh
    docker stop <container_name>
  ```
- Once the container is stopped, we can then delete it:
  ```sh
    docker rm <container_name>
  ```

# Docker Volumes

## Command 5.1: Lists Docker Volumes

- List all your volumes with `docker volume ls`:
  ```sh
    docker volume ls
  ```

## Command 5.2: Inspect Docker Volumes

- If you want to know Where is **Docker** storing your data when you use a `volume`, you can use the `docker volumne inspect` command:
- Syntax
  ```sh
    docker volume inspect <volume_name>
  ```
- Example:
  ```sh
    docker volume inspect postgres_volume
  ```

## Command 5.3: Delete Docker Volumes

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

# Docker Exec Commands

## How To Use docker exec to Run Commands in a Docker Container

- When developing or deploying **containers** you’ll often need to look inside a running container to inspect its current state or debug a problem. To this end, **Docker** provides the `docker exec` command to run programs in already running containers.
- To use the `docker exec` command, you will need a running **Docker container**.

## Running an Interactive Shell in a Docker Container

- If you need to start an interactive shell inside a **Docker Container**, perhaps to explore the filesystem or debug running processes, use `docker exec` with the `-i` and `-t` flags. The `-i` flag keeps input open to the container, and the `-t` flag creates a pseudo-terminal to which the shell can attach. These flags can be combined like this:
  ```sh
    docker exec -it container-name sh
  ```
- This will run the `sh` shell in the specified container, giving you a basic shell prompt. To exit back out of the container, type `exit` then press `ENTER`:
- If your container image includes a more advanced shell such as `bash`, you could replace `sh` with `bash` above.

## Running a Non-interactive Command in a Docker Container

- If you need to run a command inside a running `Docker container`, but don’t need any interactivity, use the `docker exec` command without any flags:
  ```sh
    docker exec container-name tail /var/log/date.log
  ```

# Docker Compose Logs

- Docker Compose logs are a unified way to view the logs of all services defined in your `docker-compose.yml` file.
- Instead of inspecting logs service by service, `docker-compose logs` aggregates them, making debugging and monitoring more efficient.
- By default, these logs capture **standard output** (`stdout`) and **standard error** (`stderr`) streams from your running containers.
- Depending on your configuration, you can route these logs to specific drivers for storage, analysis, or further processing. These logs are crucial when analyzing service logs across multi-container applications.

## 6.1: How to View Docker Compose Logs

- The command to access logs is
  ```sh
    docker-compose logs
  ```
- **Key Options** include:
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

## 6.2: Configuring Logging in Docker Compose

- Docker Compose uses the Docker logging drivers to control how logs are handled. You can specify logging options in your `docker-compose.yml` file under the logging key.
- Example Configuration
  ```yml
  services:
    web:
      image: nginx
      logging:
        driver: "json-file"
        options:
          max-size: "10m"
          max-file: "3"
  ```
  - Supported Logging Drivers:
    - `json-file`: Default driver, stores logs locally as JSON.
    - `syslog`: Sends logs to a syslog server.
    - `journald`: Integrates with systemd.
    - `fluentd`: Streams logs to Fluentd.\
  - Each driver offers unique advantages and trade-offs. For instance, `fluentd` is useful for centralized logging in kubernetes or large-scale environments. Choose one based on your environment and requirements.

## 3. Managing Container Logs Effectively

1. Implement Log Rotation
   - Prevent disk space issues by configuring log rotation.
   - For example:
     ```yml
     services:
       web:
         image: nginx
         logging:
           driver: "json-file"
           options:
             max-size: "10m"
             max-file: "3"
     ```
2. Use Centralized Logging

   - Tools like **Elasticsearch**, **Fluentd**, **Kibana** (**EFK**), or **Grafana Loki** can aggregate and visualize logs from multiple containers for a more comprehensive analysis. **Centralized logging** is critical for DevOps teams monitoring distributed systems.

3. Monitor Log Volume
   - High log volumes can affect application performance. Use delivery modes like non-blocking to mitigate this risk:
     ```yml
     services:
       web:
         image: nginx
         logging:
           driver: "json-file"
           options:
             mode: "non-blocking"
     ```
   - Additionally, monitor directories like `/var/lib/docker` to ensure your system doesn’t run out of space.

## 4. Debugging and Troubleshooting Container Logs

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

## 5. Advanced Techniques For Container Logs

1. Collecting Logs via API
   - Docker API provides endpoints for fine-grained control over log collection. For example, to retrieve logs in real-time:
     ```sh
      curl --unix-socket /var/run/docker.sock http://v1.40/containers/<container_id>/logs?stdout=true&stderr=true&follow=true
     ```
2. Sidecar Containers for Logging
   - A **sidecar container** dedicated to logging can centralize log management. For example, when working with **redis** or **postgresql**, sidecars can route log files to centralized systems:
     ```yml
     logging:
       driver: "fluentd"
       options:
         fluentd-address: "localhost:24224"
     ```
   - **Sidecar** configurations also streamline log outputs for tools like **Prometheus** or open-source log visualization platforms.

## 6. Integrating Logs with GitHub Actions

- To enhance CI/CD pipelines, logs can be integrated with GitHub Actions. Use the following configuration file to capture logs during build or deployment:
  ```yml
  jobs:
    build:
      runs-on: ubuntu-latest
      steps:
        - name: Check out code
          uses: actions/checkout@v3
        - name: Build and run containers
          run: |
            docker-compose up -d
            docker-compose logs --tail=50 > logs.txt
        - name: Upload Logs
          uses: actions/upload-artifact@v2
          with:
            name: container-logs
            path: logs.txt
  ```
- This approach makes log files available for post-build analysis.
- Example Dockerfile for Enhanced Logging
  - Here’s an example of a `Dockerfile` for a Python web server with enhanced logging:
    ```Dockerfile
      FROM python:3.9
      WORKDIR /app
      COPY . .
      RUN pip install -r requirements.txt
      ENV FLASK_APP=app.py
      ENV FLASK_ENV=development
      CMD ["flask", "run", "--host=0.0.0.0"]
    ```

# Docker Networks Commands

- Docker supports several **network types**:
  1. **bridge**: The default network driver. Good for containers on a single host.
  2. **host**: Removes network isolation, container uses host’s network directly
  3. **none**: Disables networking completely
  4. **overlay**: For connecting containers across multiple **Docker hosts**
  5. **macvlan**: Assigns a MAC address to containers, making them appear as physical devices

## 1. Get the list of docker Networks

```sh
  docker network ls
```

## 2. Inspect each network and find corresponding containers

```sh
  docker network inspect [Network Name]
```

## 3. Disconnet Container From Its Network

- Containers which must communicate with each other must be in a same network.
- Example: disconnect server container from its network and reconnect it to the mongodb-network:
  ```sh
    docker network disconnect [Network Name] [Container Name]
    docker network connect [Network Name] [Container Name]
  ```

# Resources

1. [https://www.digitalocean.com/community/tutorials/how-to-use-docker-exec-to-run-commands-in-a-docker-container?ref=dailydev](https://www.digitalocean.com/community/tutorials/how-to-use-docker-exec-to-run-commands-in-a-docker-container?ref=dailydev)
2. [Docker Compose Logs: An In-Depth Guide for Developers](https://last9.io/blog/docker-compose-logs/?ref=dailydev)
