# Docker Commands

# Docker Commands

- Docker commands should be executed in the root folder where `Dockerfile` is located.

# Command #1: Check if Docker is Installed

- check if Docker is installed by running:
  ```sh
    docker version
  ```

# Commands #2: Start and Run Docker Containers

## `docker-compose up`

- Command starts your **Docker containers** defined in the `docker-compose.yml` file in attached mode (i.e., it keeps the containers running in the foreground and shows their output in the terminal).
- Similar to `docker-compose up -d`, this command does not rebuild the **Docker images** if there are no changes to the `Dockerfile` or any of the files referenced in the build context.
  ```sh
    docker-compose up
  ```

## `docker-compose up -d`

- This command will not rebuild the **Docker images** if there are no changes to the `Dockerfile` or any of the files referenced in the build context. It uses the existing images if they exist, otherwise, it builds new images.
- Detached mode means that the containers will run in the background, and you'll get your terminal prompt back immediately.
  ```sh
    #run docker-compose in the background.
    docker-compose up -d
  ```

## `docker-compose up --build`

- This command also starts your **Docker containers** defined in the `docker-compose.yml` file, but it rebuilds the images before starting the containers, regardless of whether there are any changes to the `Dockerfile` or build context files.
- It's useful when you want to ensure that your containers are using the latest version of the images, even if there haven't been any changes to the `Dockerfile` or build context since the last build.
  ```sh
    docker-compose up --build
  ```

## Remarks

- There are two ways you can specify specific services to run with `docker-compose`:

  1. Using service names
     ```sh
      docker-compose up -d --build <service_name1> <service_name2> ...
     ```
     - This command will only build and start the services you specify. Any dependent services will not be started unless explicitly included.
  2. Using the `--no-deps` flag:
     ```sh
      docker-compose up -d --build --no-deps <service_name>
     ```
     - This approach combines the `--build` flag to rebuild the image before running and the `--no-deps` flag.
     - `--no-deps` tells Docker Compose to not automatically start any services that the specified service depends on.

- After the first time, however, we can simply use `start` to start the services:
  ```sh
    #start
    docker-compose start
  ```

# Command #3: Shutdown

## `docker-compose stop`

- To safely stop the active services, we can use `stop`, which will preserve containers, `volumes`, and `networks`, along with every modification made to them:
  ```sh
    #stop active servuces
    docker-compose stop
  ```

## `docker-compose down`

- To reset the status of our project, we can simply run `down`, which will destroy everything with the **exception of external volumes**:
  ```sh
    #reset
    docker-compose down
  ```

# Command #: Lists Docker Images

- To list all the docker images on your system, run:

  ```sh
    #list all docker images
    docker images

    #or, list all docker images
    docker images ls
  ```

# Command #: Docker Image Metadata

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

# Command #: Lists Docker Containers

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

# Command #: Container Logs

- While a **container** is running, we can check what is being logged in the container log:
- Syntax:
  ```sh
    docker logs <CONTAINER_NAME or CONTAINER_ID>
  ```
- Example:
  ```sh
    docker logs postgres
  ```

# Command #: Execute Commands in a Running Container

- `docker exec` Docker command used to execute commands in a running container
  - `-it`: These are options passed to the docker exec command:
    - `-i` or `--interactive`: This option allows you to interact with the container's standard input, allowing you to provide input to the executed command.
    - `-t` or `--tty`: This option allocates a pseudo-TTY (terminal) for the command being executed, allowing you to see the command's output as if you were running it directly in a terminal.

# Command #: Stop Running Container

- Syntax
  ```sh
    docker stop <container_id>
  ```
- Example:
  ```sh
    docker stop postgres
  ```

# Command #: Remove Containers

- Use `docker-compose rm -sf` command to remove stopped service containers defined in a `docker-compose.yml` file.

  - The `-s` flag stands for `--stop`. When used, it stops the containers before removing them. This ensures that any running containers will be stopped before the removal process begins.
  - The `f` flag stands for `--force`. It forces the removal of containers without asking for confirmation. Normally, `docker-compose rm` will prompt you to confirm the removal of each container, but with the `-f` flag, it will proceed without any prompts.

- This command is useful for quickly cleaning up your Docker environment by stopping and removing containers defined in the Compose file.

# Command #: Delete a Container

- To delete a **container**, it must not be running
- Syntax:
  ```sh
    docker stop <container_name>
  ```
- Once the container is stopped, we can then delete it:
  ```sh
    docker rm <container_name>
  ```

# Command #: Delete Docker Images

- To delete an image, you have to ensure no **container** is using that `image`; if a container is using the image, we'd have to delete the container before we would be able to delete the image
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

# Command #: Docker Volumes

- List all your volumes with `docker volume ls`:
  ```sh
    docker volume ls
  ```
- If you want to know Where is **Docker** storing your data when you use a `volume`, you can use the `docker volumne inspect` command:
- **Syntax**:
  ```sh
    #understand where data is stored
    docker volume inspect <volume_name>
  ```
- **Example**:
  ```sh
    docker volume inspect postgres_volume
  ```
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

# Command #: Docker Prune

- Remove unused data (Removes unused Docker data (images, containers, networks, volumes).):
  ```sh
    docker system prune
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

# Resources

1. [https://www.digitalocean.com/community/tutorials/how-to-use-docker-exec-to-run-commands-in-a-docker-container?ref=dailydev](https://www.digitalocean.com/community/tutorials/how-to-use-docker-exec-to-run-commands-in-a-docker-container?ref=dailydev)
