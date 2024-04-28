# Docker Commands

# Docker Commands

- Docker commands should be executed in the root folder where `Dockerfile` is located.

# Command #1: Check if Docker is Installed

- check if Docker is installed by running:
  ```sh
    #check if Docker is installed
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

## Remark

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

- To reset the status of our project, we can simply run `down`, which will destroy everything with the exception of external volumes:
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

# Command #: Stop Running Container

- Syntax
  ```sh
    docker stop <container_id>
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

# Resources
