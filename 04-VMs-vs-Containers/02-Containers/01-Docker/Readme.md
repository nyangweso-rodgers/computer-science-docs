# Docker

## Table Of Contents

# Introduction to Docker

- **Docker** is the most popular technology to run containers.
- **Docker** is a software containerization platform which allows developers to package their applications into **containers**, which can then be run on any machine that has **Dockers** installed. This makes it easier for developers to move their applications between different environments, such as **development**, **testing**, and **production**.
- **Docker** has become so popular that when the word **container** is mentioned, it is automatically assumed docker will be used to manage it.

# Why Docker?

- **Docker** is an open source tool that uses **containers** to create, deploy, and manage distributed applications.
- Many organizations now opt to use **Docker** over **VMs** because of the performance benefits that it offers.
- **Remarks**:

  - A misconception among many people is that **Docker** created the concept of **containers** but that is wrong, **Docker** only brought it to critically acclaimed status. **Containers** existed very well before **Docker**.

  - **Docker** has many different tools and technologies such as [docker hub](), [docker engine](), [docker desktop]() etc. But when we’re talking about Kubernetes and Docker, there is only one tool that we’re interested in; and that’s known as [Docker Swarm]().

# Use Cases of Docker

- Three most essential use cases of Docker:

  1. Run a database locally using docker
  2. run your application locally and in production using Docker, and
  3. run automated tests using a dockerized database,

- Using Docker, you can start many types of databases in seconds. By searching, [hub.docker.com](https://hub.docker.com/) you can find ready-to-use containers for many databases.

# Docker Concepts

- The **Dockerfile** is the base for an **image**, and an **image** is used to create a **container**. A **container** is running as a process on the host machine. Yet, it has its own file system and is separated from the other processes.

## Docker Concept #1: `Dockerfile`

- The first step in using **Docker** is writing a `Dockerfile`. It is an essential blueprint for constructing **Docker images**. It is a text file, is usually named `“Dockerfile”` without any extension, and contains a series of instructions.
- Each line in this file represents a new instruction, forming a stack of layers. Each layer is cache-able. When you build an image twice, it will use the cache. When you change a line in the file, it rebuilds all instructions after and including the change.
- **Steps** to creating a `Dockerfile`:
  - We use a plain text to create a Dockerfile.
  - Using a **Command Line**:
    - Step 1: create a new file in your current working directory called `Dockerfile`
      ```sh
        touch Dockerfile
      ```
    - open the file in VS Code
      ```sh
        code Dockerfile
      ```
- A `Dockerfile` holds all the instructions to **build**, **start** and **run** your application. Every command that you otherwise need to execute manually is written in a single file. It starts by using a base image.

## Docker Concept #2: Docker Image

- Building a `Dockerfile` outputs a **Docker image**. You can start an image to launch a container.
- The Docker image encapsulates your application code and all its dependencies. This includes the runtime and system libraries. It is a self-contained unit that ensures consistency and portability across various environments. For example, your development machine and your production server.

## Docker Concept #3: Docker Container

- This is a dynamic, running instance of a **Docker image**. An executed image spawns a container with the command in the `Dockerfile`.
- **Remarks**:

  - one image can give life to many containers.
  - If Linux is your OS, the **Docker container** will run as a process on the host machine. If you have a Windows or macOS machine, docker will run in a VM.
  - The container will use the same kernel, either the kernel of Linux or the VM on Windows or macOS.
  - The container itself is not a virtual machine. The container cannot see other processes of the host and has its own file system. This is why it seems as it is a virtual machine. But in reality, it shares the kernel of the host machine (or the kernel of the VM).

## Docker Concept #4: Docker Registry

- A **Docker registry** is a repository for the storage and distribution of **Docker images**. **Docker registry** allows users to "pull" or "push" **Docker images**.
- [Docker Hub](https://hub.docker.com/) is the official docker registry.

## Docker Concept #5: Docker Hub

- [Docker Hub](https://hub.docker.com/) is a centralized repository for storing and sharing **Docker images**. All the components required to run an application are included in a **docker image**, which serves as the container's architectural blueprint.

## Docker Concept #6: Docker Compose

- **Docker Compose** makes it possible for an application to run multiple containers.

## Docker Concept #7: Docker Volumes

- In Docker, **volumes** are a way to persist data generated by and used by Docker containers. They are separate from the container's file system and can exist independently of the container's lifecycle. Volumes allow you to share data between containers, store persistent data, and facilitate data backup and migration.

# Installing Docker

- Install Docker engine for windows, linux or mac OS from the [official Docker website](https://www.docker.com/)

# Popuar Docker Commands

- Docker commands should be executed in the root folder where `Dockerfile` is located.

## Command #1: Check if Docker is Installed

- Syntax:
  ```sh
    # check if Docker is installed
    docker version
  ```

## Command #2: Lists Docker Images

- To list all the docker images on your system, run:
  ```sh
    # list all docker images
    docker images
  ```
- or,
  ```sh
    # list all docker images
    docker images ls
  ```

## Command #3: Create Docker Image from `Dockerfile`

- Syntax:
  ```sh
    docker build -t <dockerhub_user_id>/<image_name>:<version>
  ```
- Example:
  ```sh
    # create a docker image
  ```
- If you want to give your image a name, you need to use the `--tag` (shorthand syntax: `-t`) flag while building the image. You will need this if you are working with a registry like [Docker Hub](https://hub.docker.com/).

## Command #4: Review the Image Metadata

- Before running a container, you can review the image metadata using:
  ```sh
    docker inspect <image_name>
  ```
- Example:
  ```sh
    docker inspect python
  ```
- `docker inspect <image_name>` return a `JSON` output.
- `inspect` command provides useful information about the image such as:
  - the layers information,
  - image size,
  - hardware architecture, e.t.c.,

## Command #5: Push Docker Image to [Docker Hub](https://hub.docker.com/)

- Syntax:
  ```sh
    docker push <dockerhub_user_id><image_name>:<version>
  ```
- Example:
- Remark:
  - you can log into [Docker Hub](https://hub.docker.com/) using the below command:
    ```sh
      docker login docker.io
    ```

## Command #6: Run a Docker Container from an Image

- Syntax:
  ```sh
    docker run -p <external_port>:<internal_port> -d <dockerhub_user_id>/<image_name>
  ```
- Example:

## Command #7: Lists All Docker Containers (Running/Stopped)

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

## Command #8: Start a Container

- Syntax:
  ```sh
    docker start <container_id>
  ```
- Example

## Command #9: Stop Running Container

- Syntax
  ```sh
    docker stop <container_id>
  ```
- Example

## Command #10: Check Container Logs

- While a container is running, we can check what is being logged in the container log:
- Syntax:
  ```sh
    docker logs <CONTAINER_NAME or CONTAINER_ID>
  ```

## Command #11: Delete a Container

- To delete a container, it must not be running
- Syntax:
  ```sh
    docker stop <container_name>
  ```
- Once the container is stopped, we can then delete it:
  ```sh
    docker rm <container_name>
  ```

## Command #12: Delete an Image

- To delete an image, you have to ensure no container is using that image; if a container is using the image, we'd have to delete the container before we would be able to delete the image
- Syntax:
  ```sh
    # delete an image using image name
    docker rmi <IMAGE_NAME or IMAGE_ID>
  ```
- Example:
  ```sh
    # delete python image
    docker rmi python
  ```

# Resources

1. [The Ultimate Docker Cheat Sheet](https://devopscycle.com/blog/the-ultimate-docker-cheat-sheet/?mkt_tok=NzkwLVNTQi0zNzUAAAGQiPdekjcDh3HVPGYJIzKB936CcoVM7WS2-TQr3Wh-9d0C3MLx8CwcrTfclpj6x8ue3hxOgCkcdRFkS-q9Yez85eZwMUXWRpiVsJsFJlFiW04)
2. [How to Build Docker Image : Comprehensive Beginners Guide](https://devopscube.com/build-docker-image/)
3. [What Is Docker and How Does It Work? – Docker Explained](https://www.hostinger.in/tutorials/what-is-docker)
