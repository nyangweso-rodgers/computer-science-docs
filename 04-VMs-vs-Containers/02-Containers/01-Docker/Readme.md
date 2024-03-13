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

  1. Run a database locally using docker
  2. run your application locally and in production using Docker, and
  3. run automated tests using a dockerized database,

- Using Docker, you can start many types of databases in seconds. By searching, [hub.docker.com](https://hub.docker.com/) you can find ready-to-use containers for many databases.

# Installing Docker

- Install Docker engine for windows, linux or mac OS from the [official Docker website](https://www.docker.com/)

## Install Docker Desktop

- **Docker Desktop** can be used to see which containers are running, manage containers, and perform other Docker-related tasks.
- [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)

# Docker Concepts

- The **Dockerfile** is the base for an **image**, and an **image** is used to create a **container**. A **container** is running as a process on the host machine. Yet, it has its own file system and is separated from the other processes.

## Two Important Docker Concepts

- At its core, **Docker** has two concepts that are useful to understand: the `Dockerfile` and **Docker Images**.

### Docker Concept #1: `Dockerfile`

- A `Dockerfile` contains the set of instructions for building a **Docker Image**.
- The first step in using **Docker** is writing a `Dockerfile`. It is an essential blueprint for constructing **Docker images**. It is a text file, is usually named `“Dockerfile”` without any extension, and contains a series of instructions.
- Each line in this file represents a new instruction, forming a stack of layers. Each layer is cache-able. When you build an image twice, it will use the cache. When you change a line in the file, it rebuilds all instructions after and including the change.
- **Steps** to creating a `Dockerfile`:
  - We use a plain text to create a `Dockerfile`.
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

### Docker Concept #2: Docker Image

- A **Docker Image** serves as a template for creating **Docker Containers**. It contains all the necessary code, runtime, system tools, libraries, and settings required to run a software application.
- So, a `Dockerfile` is used to build a **Docker Image** which is then used as the template for creating one or more **Docker containers**.
- Once created, **Docker images** are immutable, meaning they cannot be changed. If you need to make changes to an application, you need to modify the `Dockerfile` and create a new image. This immutability ensures consistency and reproducibility in application deployment.

## Other Docker Concepts

### Docker Concept #3: Docker Container

- This is a dynamic, running instance of a **Docker image**. An executed image spawns a container with the command in the `Dockerfile`.
- **Remarks**:

  - one image can give life to many containers.
  - If Linux is your OS, the **Docker container** will run as a process on the host machine. If you have a Windows or macOS machine, docker will run in a VM.
  - The container will use the same kernel, either the kernel of Linux or the VM on Windows or macOS.
  - The container itself is not a virtual machine. The container cannot see other processes of the host and has its own file system. This is why it seems as it is a virtual machine. But in reality, it shares the kernel of the host machine (or the kernel of the VM).

## Docker Concept #4: Docker Compose

- **Docker Compose** makes it possible for an application to run multiple containers. While `Dockerfile` are used to create individual container images, **Docker Compose** provides a way to manage the configuration of multiple containers, their dependencies, networks, and volumes in a single `YAML` file.

- Here's how **Docker Compose** comes into play:

  - **Simplified Configuration**: Instead of managing multiple docker run commands for each container, **Docker Compose** allows you to define all the containers, their configurations, networks, and volumes in a single `YAML` file. This makes it easier to manage complex applications with multiple interconnected services.
  - **Service Definitions**: Docker Compose `YAML` file (`docker-compose.yml`) allows you to define each service/container, along with its build context (if applicable), image, environment variables, ports, volumes, dependencies, and other configurations.
  - **Dependency Management**: Docker Compose helps manage dependencies between services. For example, if one service relies on another (like a web application depending on a database), Docker Compose ensures that dependent services are started in the correct order.
  - **Networking**: Docker Compose automatically creates a default network for your application, allowing containers defined within the same docker-compose.yml file to communicate with each other using their service names as hostnames.
  - **Volume Management**: Docker Compose simplifies volume management by allowing you to define named volumes or bind mounts for your services. This ensures data persistence and sharing between containers.
  - **Environment Management**: Docker Compose allows you to specify environment variables for your services, making it easier to configure and customize your containers without modifying Dockerfiles.
  - **Command Line Interface**: Docker Compose provides a command-line interface (docker-compose) that allows you to perform various operations such as building images, starting containers, stopping containers, viewing logs, and managing the overall lifecycle of your multi-container application.

- Overall, **Docker Compose** simplifies the development, deployment, and management of multi-container applications, providing a unified way to define, run, and scale complex Dockerized environments.

## Docker Concept #4.1: The Compose File

- The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory. Compose also supports `docker-compose.yaml `and `docker-compose.yml` for backwards compatibility of earlier versions.
- In this file, we need to specify the version of the Compose file format, at least one **service**, and optionally **volumes** and **networks**:

  ```yml
  #docker-compose.yml structure
  version: "3"
  services:
    #...
  volumes:
    #...
  networks:
    #...
  ```

  - `version`: Specifies the version of the **Docker Compose** file syntax being used.

### 4.2: Setting Up `services`

- `service-*` The name of the service. You can choose any name you want, and it will be used to refer to this service within the **Docker Compose** file
- `services` refer to the **containers’ configuration**. For example, let’s take a dockerized web application consisting of a **front end**, a **back end**, and a **database**. We’d likely split these components into three images, and define them as three different services in the configuration:

  ```yml
  #docker-compose.yml structure
  version: "3"
  services:
    frontend:
      image: my-vue-app
      #...
    backend:
      image: my-springboot-app
      #...
    db:
      image: postgres
      #...
  volumes:
    #...
  networks:
    #...
  ```

- Sometimes, the image we need for our service has already been published (by us or by others) in [Docker Hub](), or another **Docker Registry**. If that’s the case, then we refer to it with the image attribute by specifying the image name and tag:

  ```yml
  #docker-compose.yml structure
  version: "3"
  services:
    my-app:
      image: my-vue-app:latest
      #...
  ```

- Alternatively, we might need to build an image from the source code by reading its `Dockerfile`. This time, we’ll use the build keyword, passing the path to the `Dockerfile` as the value:

  ```yml
  #docker-compose.yml structure
  version: "3"
  services:
    my-app:
      build: /path/to.dockerfile/
      #...
  ```

- We can also use a URL instead of a path:

  ```yml
  #docker-compose.yml structure
  version: "3"
  services:
    my-app:
      build: https://github.com/my-project.git
      #...
  ```

- Additionally, we can specify an image name in conjunction with the build attribute, which will name the image once created, making it available for use by other services:

  ```yml
  #docker-compose.yml structure
  version: "3"
  services:
    my-app:
      build: https://github.com/my-project.git
      image: my-image-name
      #...
  ```

### Step #4.3: Setting Up `volumnes`

- In Docker, **volumes** are a way to persist data generated by and used by Docker containers. They are separate from the container's file system and can exist independently of the container's lifecycle. Volumes allow you to share data between containers, store persistent data, and facilitate data backup and migration.
- `volumes` are physical areas of disk space shared between the host and a container, or even between containers.
- **Remarks**:
  - If you want to know Where is Docker storing your data when you use a `volume`, you can use the `docker volumne inspect` command:
    ```sh
      #understand where data is stored
      docker volume inspect
    ```

### Step #4.4: Configuring `networks`

- `networks` define the communication rules between containers, and between a container and the host.
  ```yml
  #docker-compose.yml structure
  version: "3"
  services:
    my-app:
      build: https://github.com/my-project.git
      image: my-image-name
      ports:
        - "8080:3000"
      #...
  ```

### Step #4.5: Declaring the Dependencies

- Often, we need to create a dependency chain between our services so that some services get loaded before (and unloaded after) other ones. We can achieve this result through the depends_on keyword:
  ```yml
  #docker-compose.yml structure
  version: "3"
  services:
    kafka:
      image: wurstmeister/kafka:2.11-0.11.0.3
      depends_on:
        - zookeeper
      #...
    zookeeper:
      image: wurstmeister/zookeeper
      #...
  ```
- We should be aware, however, that Compose won’t wait for the zookeeper service to finish loading before starting the kafka service; it’ll simply wait for it to start.

### Step #4.6: Managing Environment Variables

- We can define static environment variables, as well as dynamic variables, with the `${}` notation:
  ```yml
  #docker-compose.yml structure
  services:
    database:
      image: "postgres:${POSTGRES_VERSION}"
      environment:
        DB: mydb
        USER: "${USER}"
  ```
- There are different methods to provide those values to Compose. For example, one method is setting them in a `.env` file in the same directory, structured like a `.properties` file, `key=value`:
  ```env
    POSTGRES_VERSION=alpine
    USER=foo
  ```
- we might also find it easy to use a simple one-liner in the shell:
  ```sh
    POSTGRES_VERSION=alpine USER=foo docker-compose up
  ```

### Step #4.7: Start and Run Docker Containers

- Using `docker-compose up -d`:
  - This command will not rebuild the Docker images if there are no changes to the `Dockerfile` or any of the files referenced in the build context. It uses the existing images if they exist, otherwise, it builds new images.
  - Detached mode means that the containers will run in the background, and you'll get your terminal prompt back immediately.
    ```sh
      docker-compose up -d
    ```
- Using `docker-compose up`:

  - This command starts your Docker containers defined in the docker-compose.yml file in attached mode (i.e., it keeps the containers running in the foreground and shows their output in the terminal).
  - Similar to `docker-compose up -d`, this command does not rebuild the **Docker images** if there are no changes to the `Dockerfile` or any of the files referenced in the build context.
    ```sh
      docker-compose up
    ```

- Using `docker-compose up --build`:
  - This command also starts your Docker containers defined in the `docker-compose.yml` file, but it rebuilds the images before starting the containers, regardless of whether there are any changes to the Dockerfile or build context files.
  - It's useful when you want to ensure that your containers are using the latest version of the images, even if there haven't been any changes to the Dockerfile or build context since the last build.
    ```sh
      docker-compose up --build
    ```
- After the first time, however, we can simply use `start` to start the services:
  ```sh
    #start
    docker-compose start
  ```
- Compose can also run in the background as a daemon when launched with the `-d` option:
  ```sh
    #run docker-compose in the background.
    docker-compose up -d
  ```

### Step #4.8: Shutdown

- To safely stop the active services, we can use stop, which will preserve containers, volumes, and networks, along with every modification made to them:
  ```sh
    #stop active servuces
    docker-compose stop
  ```
- To reset the status of our project, we can simply run `down`, which will destroy everything with the exception of external volumes:
  ```sh
    #reset
    docker-compose down
  ```

### Step #4.9: Example of `docker-compose.yml` File

- Example:

  ```yml
  # compose.yaml
  version: "3"
  services:
    service-1:
      build:
        context: .
        dockerfile: Dockerfile
      ports:
        - "80:80"
      volumes:
        - ./:/app
      environment:
        - NODE_ENV=development
    service-2:
      build:
        context: .
        dockerfile: Dockerfile
      ports:
        - "8000:8000"
      volumes:
        - ./:/app
      environment:
        - NODE_ENV=development
    service-3:
      build:
        context: .
        dockerfile: Dockerfile
      ports:
        - "3000:3000"
      volumes:
        - ./:/app
      environment:
        - NODE_ENV=development
  ```

- `build`: Specifies how to build the Docker image for this service.
  - `context`: .: Indicates the build context, i.e., the path to the directory containing the `Dockerfile` and any other files required for building the image. In this case, it's the current directory.
  - `dockerfile` Specifies the name of the `Dockerfile` to use for building the image. It assumes there's a file named `Dockerfile` in the build context directory.
- `ports`: Maps ports from the container to the host machine.
  - `"3000:3000"`: Maps port `3000` on the host to port `3000` on the container. This allows you to access the service running inside the container via port `3000` on your `localhost`.
- `volumes`: Mounts volumes from the host machine into the container.
  - `./:/app`: Mounts the current directory (where the `docker-compose.yml` file is located) into the `/app` directory inside the container. This is useful for development when you want changes to your code on the host to be reflected inside the container without rebuilding the image.
- `environment`: Sets environment variables for the container.

  - `NODE_ENV=development`: Sets the `NODE_ENV` environment variable to development within the container. You can add more environment variables as needed, separated by commas.

## Docker Concept #6: Docker Registry

- A **Docker registry** is a repository for the storage and distribution of **Docker images**. **Docker registry** allows users to "pull" or "push" **Docker images**.
- [Docker Hub](https://hub.docker.com/) is the official docker registry.

## Docker Concept #7: Docker Hub

- [Docker Hub](https://hub.docker.com/) is a centralized repository for storing and sharing **Docker images**. All the components required to run an application are included in a **docker image**, which serves as the container's architectural blueprint.

# Popuar Docker Commands

- Docker commands should be executed in the root folder where `Dockerfile` is located.

## Command #1: Check if Docker is Installed

- Syntax:
  ```sh
    #check if Docker is installed
    docker version
  ```

## Commands for Working with Docker Images

### Command #2: Lists Docker Images

- To list all the docker images on your system, run:
  ```sh
    #list all docker images
    docker images
  ```
- or,
  ```sh
    #list all docker images
    docker images ls
  ```

### Command #3: Create Docker Image from `Dockerfile`

- Syntax:
  ```sh
    docker build -t <dockerhub_user_id>/<image_name>:<version>
  ```
- Example:
  ```sh
    #create a docker image
    docker build -t test-image
  ```
- If you want to give your image a name, you need to use the `--tag` (shorthand syntax: `-t`) flag while building the image. You will need this if you are working with a registry like [Docker Hub](https://hub.docker.com/).

### Command #4: Review the Image Metadata

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

### Command #5: Push Docker Image to [Docker Hub](https://hub.docker.com/)

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

### Command #12: Delete an Image

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

## Commands for Working with Docker Containers

### Command #6: Run a Docker Container from an Image

- Syntax:
  ```sh
    docker run -p <external_port>:<internal_port> -d <dockerhub_user_id>/<image_name>
  ```
- Example:

### Command #7: Lists All Docker Containers (Running/Stopped)

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

### Command #8: Start a Container

- Syntax:
  ```sh
    docker start <container_id>
  ```
- Example

### Command #9: Stop Running Container

- Syntax
  ```sh
    docker stop <container_id>
  ```
- Example

### Command #10: Check Container Logs

- While a container is running, we can check what is being logged in the container log:
- Syntax:
  ```sh
    docker logs <CONTAINER_NAME or CONTAINER_ID>
  ```

### Command #11: Delete a Container

- To delete a container, it must not be running
- Syntax:
  ```sh
    docker stop <container_name>
  ```
- Once the container is stopped, we can then delete it:
  ```sh
    docker rm <container_name>
  ```

# Bonus

## Docker Image Best Practices

- To ensure optimal performance, scalability, and security, it’s essential to follow best practices when creating and managing **Docker images**.

### Choose the Right Base Image

- Consider using official images from trusted sources like Docker Hub, as they are regularly updated and maintained by the community.
- Choose a minimalistic base image to reduce the attack surface and optimize the image size. Alpine Linux is a popular choice for its lightweight nature.
  ```Dockerfile
    FROM Alpine:latest
  ```

### Use `.dockerignore`

- Similar to `.gitignore`, a `.dockerignore` file allows you to specify files and directories to exclude from the build context.
- By preventing unnecessary files from being added to the image, you can further reduce its size. Common exclusions include `node_modules`, `.git`, and temporary files.
  ```dockerignore
    node_modules
    .git
    *.log
  ```

# Resources

1. [The Ultimate Docker Cheat Sheet](https://devopscycle.com/blog/the-ultimate-docker-cheat-sheet/?mkt_tok=NzkwLVNTQi0zNzUAAAGQiPdekjcDh3HVPGYJIzKB936CcoVM7WS2-TQr3Wh-9d0C3MLx8CwcrTfclpj6x8ue3hxOgCkcdRFkS-q9Yez85eZwMUXWRpiVsJsFJlFiW04)
2. [How to Build Docker Image : Comprehensive Beginners Guide](https://devopscube.com/build-docker-image/)
3. [What Is Docker and How Does It Work? – Docker Explained](https://www.hostinger.in/tutorials/what-is-docker)
4. [freecodecamp - How Docker Containers Work – Explained for Beginners](https://www.freecodecamp.org/news/how-docker-containers-work/)
5. [Optimize Your Deployments: Docker Image Best Practices](https://www.javacodegeeks.com/2024/01/optimize-your-deployments-docker-image-best-practices.html?ref=dailydev)
6. [Introduction to Docker Compose](https://www.baeldung.com/ops/docker-compose)
