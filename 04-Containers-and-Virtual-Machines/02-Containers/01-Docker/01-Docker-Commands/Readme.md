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



# Resources
