# Docker

## Table Of Contents

# Introduction to Docker

- **Docker** is the most popular technology to run containers. It is a software containerization platform which allows developers to package their applications into **containers**, which can then be run on any machine that has **Dockers** installed. This makes it easier for developers to move their applications between different environments, such as **development**, **testing**, and **production**.
- **Docker** has become so popular that when the word **container** is mentioned, it is automatically assumed docker will be used to manage it.

# Why Docker?

- **Docker** is an open source tool that uses **containers** to create, deploy, and manage distributed applications.
- Many organizations now opt to use **Docker** over **VMs** because of the performance benefits that it offers.
- **Remarks**:

  - A misconception among many people is that **Docker** created the concept of **containers** but that is wrong, **Docker** only brought it to critically acclaimed status. **Containers** existed very well before **Docker**.

  - **Docker** has many different tools and technologies such as [docker hub](), [docker engine](), [docker desktop]() etc. But when we’re talking about Kubernetes and Docker, there is only one tool that we’re interested in; and that’s known as [Docker Swarm]().

# Use Cases of Docker

- Three most essential use cases of Docker:

  1. Fast, consistent delivery of your application
  2. Responsive deployment and scaling
  3. Running more workload on the same hardware

# The Underlying Technology

- Docker is written in Go
- It takes advantage of several features of the Linux kernel to deliver its functionality.
- Docker Engine is similar to LXC
- The Linux Techonlogy it uses are
  - **LXC**: Linux Containers (LXC) enables running multiple independent Linux systems on a single computer. Acting as isolated spaces, LXC containers share host resources like memory and processing power, without needing their own full operating system copy, ensuring lightweight and fast startup. Portable across compatible Linux systems, they find utility in diverse tasks such as running separate applications, testing software, or deploying cloud services. With user-friendly management tools available, LXC simplifies container creation, monitoring, and management.
  - Control Groups (cgroups): Control Groups (cgroups) is a Linux kernel feature that allows the allocation and management of resources like CPU, memory, and I/O to a set of processes. Docker leverages cgroups to limit the resources used by containers and ensure that one container does not monopolize the resources of the host system.
  - Union File Systems (UnionFS): UnionFS is a file system service that allows the overlaying of multiple file systems in a single, unified view. Docker uses UnionFS to create a layered approach for images and containers, which enables better sharing of common files and faster container creation.
  - Namespaces: Namespaces are another Linux kernel feature that provides process isolation. They allow Docker to create isolated workspaces called containers. Namespaces ensure that processes within a container cannot interfere with processes outside the container or on the host system. There are several types of namespaces, like PID, NET, MNT, and USER, each responsible for isolating a different aspect of a process.

# Docker Concepts

## 1. Docker Architecture

- Client - Server Architecture
- Docker Client - Docker Daemon

### 1.1 Docker daemon

- Listen's for docker api requests and manages docker objects
- Communicates with other daemon to manage docker services.

### 1.2 Docker Client

- simply `docker` sends docker commands to dockerd the docker daemon which carries them out.
- docker uses docker API

### 1.3 Docker Desktop

- An application that enables to build and share containerized application and microservices.
- Includes the **Docker daemon** (**docker**), the Docker client (docker`), Docker Compose, Docker Content trust, Kubernetes and Credential Helps.

### 1.4 Docker Registries

- A **Docker registry** is a server-side application that stores and distributes **Docker images**. A **Docker registry** is a central repository where **Docker images** are stored and managed. It allows developers to upload, store, and share their Docker images with other developers and team members, making it easier to collaborate and deploy applications.

- There are two types of **Docker registries**:

  1. **Public registries** are open to anyone and are typically used to store open-source images.
  2. **Private registries** are only accessible by authorized users and are commonly used by organizations to store proprietary images.

- [Docker Hub](https://hub.docker.com/) is the most popular **public Docker registry**, while private registries can be hosted on-premises or in the cloud, using solutions such as
  1. **Docker Trusted Registry**,
  2. Amazon Elastic Container Registry (ECR),
  3. Google Container Registry, or
  4. Microsoft Azure Container Registry.

## 2. Docker Objects

### 2.1 Docker Image

- A **Docker Image** serves as a template for creating **Docker Containers**. It contains all the necessary code, runtime, system tools, libraries, and settings required to run a software application.
- So, a `Dockerfile` is used to build a **Docker Image** which is then used as the template for creating one or more **Docker containers**.
- Once created, **Docker images** are immutable, meaning they cannot be changed. If you need to make changes to an application, you need to modify the `Dockerfile` and create a new image. This immutability ensures consistency and reproducibility in application deployment.

### 2.2 Dockerfile

- A `Dockerfile` is a text file contains the set of instructions for building a **Docker Image**.
- The first step in using **Docker** is writing a `Dockerfile`. It is an essential blueprint for constructing **Docker images**.
- Each line in this file represents a new instruction, forming a stack of layers. Each layer is cache-able. When you build an image twice, it will use the cache. When you change a line in the file, it rebuilds all instructions after and including the change.
- `Dockerfile` instructions include:
  1. `FROM:`- for a base image the command must be on top of the docker
  2. `COPY:` Copy files from the local system (docker VM) we need to provide a source, destination(We cant download file from the internet and any remote directory)
  3. `WORKDIR:` To set a working directory for a container.
  4. `ADD:` Similar to `copy` but, it provides a feature to download files from the internet, also we extract files at the docker image side.
  5. `RUN`: used in `Dockerfile` to execute commands that build and configure the **Docker image**.
  6. `CMD`: specifies the default command to run when a container is started from the **Docker image**.
     - If no command is specified during the container startup (i.e., in the `docker run` command), this default is used. `CMD` can be overridden by supplying command-line arguments to `docker run`.
  7. `ENTRYPOINT`: sets the default executable for the container.
     - It is similar to `CMD` but is overridden by the command-line arguments passed to `docker run`. Instead, any command-line arguments are appended to the `ENTRYPOINT` command.
     - **NOTE**: Use `ENTRYPOINT` when you need your **container** to always run the same base command, and you want to allow users to append additional commands at the end.
  8. `ENV:`- Environment Variables
  9. `EXPOSE:` - To Expose ports such as port 80 for Nginx, etc.
  10. `MAINTAINER`: Author/owner/description

### 2.3 Docker Container

- This is a dynamic, running instance of a **Docker image**. An executed image spawns a container with the command in the `Dockerfile`.
- **Remarks**:
  - one image can give life to many containers.
  - If Linux is your OS, the **Docker container** will run as a process on the host machine. If you have a Windows or macOS machine, docker will run in a VM.
  - The container will use the same kernel, either the kernel of Linux or the VM on Windows or macOS.
  - The container itself is not a virtual machine. The container cannot see other processes of the host and has its own file system. This is why it seems as it is a virtual machine. But in reality, it shares the kernel of the host machine (or the kernel of the VM).

## 1. Docker Host

- A **Docker host** refers to the machine or system where **Docker** is installed and running. It is the environment where you can create and manage Docker containers, images, networks, and volumes.
- A **Docker host** can be any physical or virtual machine that meets the minimum requirements for Docker installation, which include:
  1. A 64-bit operating system (Linux, macOS, or Windows)
  2. A compatible CPU architecture (x86-64 or ARM64)
  3. Sufficient memory and disk space
  4. A compatible Docker version
- Once **Docker** is installed on a host, you can use the **Docker client** to manage Docker resources on that host. For example, you can use the Docker client to run commands to create and start containers, build and push images, and manage networks, and volumes.

# Installing Docker

1. Step 1: Install Docker engine for windows, linux or mac OS from the [official Docker website](https://www.docker.com/)
2. Step 2: Install Docker Desktop
   - **Docker Desktop** can be used to see which containers are running, manage containers, and perform other Docker-related tasks.
   - [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)

# Docker Concepts

## Docker Concept 7: Ports (Publishing and Exposing Ports)

- **Publishing** a port provides the ability to break through a little bit of networking isolation by setting up a forwarding rule. As an example, you can indicate that requests on your host’s port `8080` should be forwarded to the container’s port `80`.
  - `HOST_PORT`: The port number on your host machine where you want to receive traffic
  - `CONTAINER_PORT`: The port number within the container that's listening for connections
- Examples:
  - Using **Docker Compose**:
    ```yml
    services:
      app:
        image: my-image
        ports:
          - 8080:80
    ```
    - Here,
      - We are using the `HOST_PORT:CONTAINER_PORT` mapping

## Docker Concept #7: Docker Hub

- [Docker Hub](https://hub.docker.com/) is a centralized repository for storing and sharing **Docker images**. All the components required to run an application are included in a **docker image**, which serves as the container's architectural blueprint.

# Bonus

## Docker Image Best Practices

- To ensure optimal performance, scalability, and security, it’s essential to follow best practices when creating and managing **Docker images**.

### 1. Choose the Right Base Image

- Consider using official images from trusted sources like Docker Hub, as they are regularly updated and maintained by the community.
- Choose a minimalistic base image to reduce the attack surface and optimize the image size. Alpine Linux is a popular choice for its lightweight nature.
  ```Dockerfile
    FROM Alpine:latest
  ```

### 2. Use `.dockerignore`

- Similar to `.gitignore`, a `.dockerignore` file allows you to specify files and directories to exclude from the build context.
- By preventing unnecessary files from being added to the image, you can further reduce its size. Common exclusions include `node_modules`, `.git`, and temporary files.
  ```dockerignore
    .git
    *.md
    *.log
    node_modules
    test
  ```
- Where:
  - `.git`: Excludes the entire Git repository, which is usually not needed in the Docker image.
  - `*.md`: Ignores all Markdown files, typically documentation that's not required for running the application.
  - `*.log`: Prevents any log files from being included in the image.
  - `node_modules`: For Node.js projects, this excludes all dependencies, which should be installed fresh during the build process.
  - `test`: Excludes the test directory, as tests typically aren't needed in production images.

### 3. Implement Health Checks in Your `Dockerfiles`

- [Health checks](https://docs.docker.com/reference/dockerfile/#healthcheck) are an important feature in Docker that help you make sure that your containers are not only running, but actually working as expected. They allow Docker to regularly check if your application is functioning correctly.
- Example:
  1. healthcheck for an Nginx server:
     ```Dockerfile
      FROM nginx:latest
      HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
        CMD curl -f http://localhost/ || exit 1
     ```
     - Where:
       - `--interval=30s`: Docker will run the health check every 30 seconds.
       - `--timeout=3s`: The health check must complete within 3 seconds, or it's considered failed.
       - `--start-period=5s`: Docker will wait 5 seconds before running the first health check, giving the application time to start up.
       - `--retries=3`: If the health check fails 3 times in a row, the container is considered unhealthy.
     - The actual health check command (`curl -f http://localhost/ || exit 1`) attempts to make an HTTP request to the server. If the request fails, the health check fails.

### 4. Use Docker Compose for Local Development

- [Docker Compose]() is a tool for defining and running multi-container Docker applications. It's especially useful for local development environments where you might need to run several interconnected services.

# Resources

1. [docs.docker.com/guidesdocker-concepts - publishing-ports](https://docs.docker.com/guides/docker-concepts/running-containers/publishing-ports/)
2. [The Ultimate Docker Cheat Sheet](https://devopscycle.com/blog/the-ultimate-docker-cheat-sheet/?mkt_tok=NzkwLVNTQi0zNzUAAAGQiPdekjcDh3HVPGYJIzKB936CcoVM7WS2-TQr3Wh-9d0C3MLx8CwcrTfclpj6x8ue3hxOgCkcdRFkS-q9Yez85eZwMUXWRpiVsJsFJlFiW04)
3. [How to Build Docker Image : Comprehensive Beginners Guide](https://devopscube.com/build-docker-image/)
4. [What Is Docker and How Does It Work? – Docker Explained](https://www.hostinger.in/tutorials/what-is-docker)
5. [freecodecamp - How Docker Containers Work – Explained for Beginners](https://www.freecodecamp.org/news/how-docker-containers-work/)
6. [Optimize Your Deployments: Docker Image Best Practices](https://www.javacodegeeks.com/2024/01/optimize-your-deployments-docker-image-best-practices.html?ref=dailydev)
7. [Introduction to Docker Compose](https://www.baeldung.com/ops/docker-compose)
