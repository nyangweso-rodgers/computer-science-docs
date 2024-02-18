# Docker

## Table Of Contents

# What is Docker?

- **Docker** is a software containerization platform which allows developers to package their applications into **containers**, which can then be run on any machine that has Dockers installed. This makes it easier for developers to move their applications between different environments, such as **development**, **testing**, and **production**. Docker has become so popular that when the word container is mentioned, it is automatically assumed docker will be used to manage it.

# Why Docker?

- **Docker** is an open source tool that uses **containers** to create, deploy, and manage distributed applications.
- Many organizations now opt to use **Docker** over **VMs** because of the performance benefits that it offers.
- **Remarks**:

  - A misconception among many people is that **Docker** created the concept of **containers** but that is wrong Docker only brought it to critically acclaimed status. Containers existed very well before Docker.

  - **Docker** has many different tools and technologies such as [docker hub](), [docker engine](), [docker desktop]() etc. But when we’re talking about Kubernetes and Docker, there is only one tool that we’re interested in; and that’s known as [Docker Swarm]().

# Definition Of Terms

## 1. Dockerfile

- The first step in using Docker is writing a Dockerfile. It is an essential blueprint for constructing **Docker images**. It is a text file, is usually named “Dockerfile” without any extension, and contains a series of instructions.
- Each line in this file represents a new instruction, forming a stack of layers. Each layer is cache-able. When you build an image twice, it will use the cache. When you change a line in the file, it rebuilds all instructions after and including the change.

### How to Create a Dockerfile

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

## 2. Docker Image

- Building a Dockerfile outputs a **Docker image**. You can start an image to launch a container.
- The Docker image encapsulates your application code and all its dependencies. This includes the runtime and system libraries. It is a self-contained unit that ensures consistency and portability across various environments. For example, your development machine and your production server.

### How to Create a Docker Image

- We use the Docker CLI to build images out of our Dockerfiles.
- Creating an image from a `Dockerfile` only requires the `docker build` command. Without specifying a name and tag, you can reference the image only by its image ID.

## How Do You List All Images?

```sh
  # list all local images on the client (your server or your development machine)
  docker image ls
  # find your image ID
```

- If you want to give your image a name, you need to use the `--tag` (shorthand syntax: `-t`) flag while building the image. You will need this if you are working with a registry like [Docker Hub]().

## 3. Docker Container

- This is a dynamic, running instance of a **Docker image**. An executed image spawns a container with the command in the Dockerfile.
- **Remarks**:

  - one image can give life to many containers.
  - If Linux is your OS, the **Docker container** will run as a process on the host machine. If you have a Windows or macOS machine, docker will run in a VM.
  - The container will use the same kernel, either the kernel of Linux or the VM on Windows or macOS.
  - The container itself is not a virtual machine. The container cannot see other processes of the host and has its own file system. This is why it seems as it is a virtual machine. But in reality, it shares the kernel of the host machine (or the kernel of the VM).

### How to Create A Container

- A **container** is a running image. You can run images with the CLI command `docker run <image-name>`:

## Remarks

- In conclusion: the **Dockerfile** is the base for an **image**, and an **image** is used to create a **container**. A **container** is running as a process on the host machine. Yet, it has its own file system and is separated from the other processes.

## 1. Docker (Active) Host

- A computer with Docker installed and the daemon running. It can process Docker and non-Docker workloads.

## Docker Client

- The main way of interacting with Docker. When you use commands such as "`docker run`", the client sends these commands to **dockerd**, which carries them out. The "docker" command uses the Docker API.

## 2. Docker Daemon (dockerd)

- is a process, which runs in the background, that manages the docker objects (images, containers, networks, volumes). It processes Docker API requests

## Docker Engine

- A Client-Server application. It has 3 components:

  - _CLI_: A command-line interface client.
  - _daemon process_: A server that is a type of long-running program.
  - _Rest API_: to specify interfaces that programs can use to talk and interact with the daemon.

## Docker Network

- It's how to link different containers and how they can communicate with each other on single/multiple hosts, agnostically. You can have different behaviors using different drivers.

## Docker Compose

- It's a tool for defining and running multi-container Docker applications, called **services**. You use a YAML file to configure the services, that can be created/started/stopped with a single command. It works well in development, testing, and production.

## Docker Registry

- It's a stateless server-side application to store Docker images where the images can be pulled/pushed (as GitHub for repositories). It can be public or private. **Docker Hub** is a public Docker registry.

# Setup

## Docker Desktop

- [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)

## Docker Swarm

- **Docker Swarm** is a group of either physical or virtual machines that are running the Docker application which have been configured to join together in a cluster. **Docker swarm** is a container orchestration tool, meaning that it allows the user to manage multiple containers deployed across multiple host machines.

- One of the major benefits of docker swarm is the high level of availability offered for applications. In a docker swarm, there are typically several worker nodes and at least one manager node that is responsible for handling the worker nodes’ resources efficiently and ensuring that the cluster operates efficiently.

- **Docker Swam** is also relatively easy to install, and is easily understandable for those starting out with container orchestration. It is lightweight and easy to use. Also, Docker Swarm takes less time to understand than more complex orchestration tools.
  
# Resources

1. [The Ultimate Docker Cheat Sheet](https://devopscycle.com/blog/the-ultimate-docker-cheat-sheet/?mkt_tok=NzkwLVNTQi0zNzUAAAGQiPdekjcDh3HVPGYJIzKB936CcoVM7WS2-TQr3Wh-9d0C3MLx8CwcrTfclpj6x8ue3hxOgCkcdRFkS-q9Yez85eZwMUXWRpiVsJsFJlFiW04)
2. [A Complete Beginner's Guide to Docker](https://blog.suhailkakar.com/a-complete-beginners-guide-to-docker)
3. [How to Dockerize a Flask Application](https://www.freecodecamp.org/news/how-to-dockerize-a-flask-app/)
4. [How to Build Docker Image : Comprehensive Beginners Guide](https://devopscube.com/build-docker-image/)
5. [Learn How to Deploy 12 Apps to AWS, Azure, & Google Cloud](https://www.freecodecamp.org/news/learn-how-to-deploy-12-apps-to-aws-azure-google-cloud/)
6. [What Is Docker and How Does It Work? – Docker Explained](https://www.hostinger.in/tutorials/what-is-docker)
