# Docker

## Table of Contents

# Introduction to Docker

- **Docker** is the most popular technology to run containers. It is a software containerization platform which allows developers to package their applications into **containers**, which can then be run on any machine that has **Dockers** installed. This makes it easier for developers to move their applications between different environments, such as **development**, **testing**, and **production**.
- **Docker** has become so popular that when the word **container** is mentioned, it is automatically assumed docker will be used to manage it.
- **Three most essential use cases of Docker**:
  1. Fast, consistent delivery of your application
  2. Responsive deployment and scaling
  3. Running more workload on the same hardware

# The Underlying Technology

- **Docker** is written in **Go**
- It takes advantage of several features of the **Linux kernel** to deliver its functionality.
- Docker Engine is similar to LXC
- The Linux Techonlogy it uses are
  - **Linux Containers** (**LXC**) enables running multiple independent Linux systems on a single computer. Acting as isolated spaces, LXC containers share host resources like memory and processing power, without needing their own full os copy, ensuring lightweight and fast startup. Portable across compatible Linux systems, they find utility in diverse tasks such as running separate applications, testing software, or deploying cloud services. With user-friendly management tools available, LXC simplifies container creation, monitoring, and management.
  - **Control Groups** (**cgroups**): **cgroups** is a Linux kernel feature that allows the allocation and management of resources like **CPU**, **memory**, and **I/O** to a set of processes. **Docker** leverages **cgroups** to limit the resources used by **containers** and ensure that one **container** does not monopolize the resources of the host system.
  - **Union File Systems** (**UnionFS**):is a file system service that allows the overlaying of multiple file systems in a single, unified view. Docker uses UnionFS to create a layered approach for images and containers, which enables better sharing of common files and faster container creation.
  - **Namespaces**: are another Linux kernel feature that provides process isolation. They allow Docker to create isolated workspaces called containers. Namespaces ensure that processes within a container cannot interfere with processes outside the container or on the host system. There are several types of namespaces, like PID, NET, MNT, and USER, each responsible for isolating a different aspect of a process.

# Docker Concepts

## Docker Daemon

- Listen's for docker api requests and manages docker objects
- Communicates with other daemon to manage docker services.

## Docker Desktop

- An application that enables to build and share containerized application and microservices.
- Includes the **Docker daemon** (**docker**), the **Docker client** (**docker**`), **Docker Compose**, Docker Content trust, Kubernetes and Credential Helps.

## Docker Host

- A **Docker host** refers to the machine or system where **Docker** is installed and running. It is the environment where you can create and manage **Docker containers**, **images**, **networks**, and **volumes**.
- A **Docker host** can be any physical or virtual machine that meets the minimum requirements for Docker installation, which include:
  1. A 64-bit OS (Linux, macOS, or Windows)
  2. A compatible CPU architecture (x86-64 or ARM64)
  3. Sufficient memory and disk space
  4. A compatible Docker version
- Once **Docker** is installed on a host, you can use the **Docker client** to manage Docker resources on that host. For example, you can use the Docker client to run commands to create and start containers, build and push images, and manage networks, and volumes.

## Dockerfile

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

## Docker Image

- A **Docker Image** serves as a template for creating **Docker Containers**. It contains all the necessary code, runtime, system tools, libraries, and settings required to run a software application.
- So, a `Dockerfile` is used to build a **Docker Image** which is then used as the template for creating one or more **Docker containers**.
- Once created, **Docker images** are immutable, meaning they cannot be changed. If you need to make changes to an application, you need to modify the `Dockerfile` and create a new image. This immutability ensures consistency and reproducibility in application deployment.
- **Docker Image Best Practices**:

  1.  **Choose the Right Base Image**

      - Consider using official images from trusted sources like **Docker Hub**, as they are regularly updated and maintained by the community.
      - Choose a minimalistic base image to reduce the attack surface and optimize the image size. Alpine Linux is a popular choice for its lightweight nature.
        ```Dockerfile
          FROM Alpine:latest
        ```

  2.  Use `.dockerignore`
      - Similar to `.gitignore`, a `.dockerignore` file allows you to specify files and directories to exclude from the build context.
      - By preventing unnecessary files from being added to the image, you can further reduce its size. Common exclusions include `node_modules`, `.git`, and temporary files.
        ```dockerignore
          .git
          *.md
          *.log
          node_modules
          test
        ```
  3.  Implement Health Checks in Your `Dockerfiles`
      - [Health checks](https://docs.docker.com/reference/dockerfile/#healthcheck) are an important feature in Docker that help you make sure that your containers are not only running, but actually working as expected. They allow Docker to regularly check if your application is functioning correctly.
      - Examples
        - healthcheck for Nginx Server:
          ```Dockerfile
            FROM nginx:latest
            HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
              CMD curl -f http://localhost/ || exit 1
          ```
          - where:
            - `--interval=30s`: Docker will run the health check every 30 seconds.
            - `--timeout=3s`: The health check must complete within 3 seconds, or it's considered failed.
            - `--start-period=5s`: Docker will wait 5 seconds before running the first health check, giving the application time to start up.
            - `--retries=3`: If the health check fails 3 times in a row, the container is considered unhealthy.
      - The actual health check command (`curl -f http://localhost/ || exit 1`) attempts to make an HTTP request to the server. If the request fails, the health check fails.

  4.  **Use Docker Compose for Local Development**
      - **Docker Compose** is a tool for defining and running multi-container Docker applications. It's especially useful for local development environments where you might need to run several interconnected services.

## Docker Container

- This is a dynamic, running instance of a **Docker image**. An executed image spawns a container with the command in the `Dockerfile`.
- **Remarks**:
  - one image can give life to many containers.
  - If Linux is your OS, the **Docker container** will run as a process on the host machine. If you have a Windows or macOS machine, docker will run in a VM.
  - The container will use the same kernel, either the kernel of Linux or the VM on Windows or macOS.
  - The container itself is not a virtual machine. The container cannot see other processes of the host and has its own file system. This is why it seems as it is a virtual machine. But in reality, it shares the kernel of the host machine (or the kernel of the VM).

## Docker Compose

## Docker Ports

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

## Docker Registry

- A **Docker registry** is a server-side application that stores and distributes **Docker images**. A **Docker registry** is a central repository where **Docker images** are stored and managed. It allows developers to upload, store, and share their Docker images with other developers and team members, making it easier to collaborate and deploy applications.

- There are two types of **Docker registries**:

  1. **Public registries** are open to anyone and are typically used to store open-source images.
  2. **Private registries** are only accessible by authorized users and are commonly used by organizations to store proprietary images.

- [Docker Hub](https://hub.docker.com/) is the most popular **public Docker registry**, while private registries can be hosted on-premises or in the cloud, using solutions such as
  1. **Docker Trusted Registry**,
  2. Amazon Elastic Container Registry (ECR),
  3. Google Container Registry, or
  4. Microsoft Azure Container Registry.

### Docker Compose Health Checks

- **Health checks** allow **Docker** to test if a container is working correctly before considering it “ready” and allowing dependent services to start.
- **Docker Compose** uses the `healthcheck` key in the service definition to define these checks.
- A health check consists of:

  1. **Test**: The command to check if the service is healthy.
  2. **Interval**: How often the check runs.
  3. **Timeout**: The maximum time a check can take before failing.
  4. **Retries**: The number of failed attempts before marking a container as **unhealthy**.
  5. **Start period**: The grace period before health checks begin (useful for services with a startup delay).

- **Health Check Commands for Common Services**

  1. For a web server (**Nginx/Apache**):

     - To check if the web server responds to HTTP requests.
       ```yml
       healthcheck:
         test: ["CMD", "curl", "-f", "http://localhost"]
       ```

  2. For MySQL
     - The `mysqladmin ping` command verifies that the MySQL server is up and responding to connections
       ```yml
       healthcheck:
         test:
           [
             "CMD",
             "mysqladmin",
             "ping",
             "-h",
             "localhost",
             "-u",
             "${MYSQL_USER}",
             "-p${MYSQL_PASSWORD}",
           ]
       ```
  3. For PostgreSQL

     - `pg_isready` is a PostgreSQL utility specifically designed to check if the server is accepting connections.
       ```yml
       healthcheck:
         test: ["CMD", "pg_isready", "-U", "postgres"]
       ```

  4. For Redis

     - The Redis `ping` command is the simplest way to verify the server is responding.
       ```yml
       healthcheck:
         test: ["CMD", "redis-cli", "ping"]
       ```

  5. For MongoDB
     - This executes a lightweight `ping` command against the MongoDB admin database to verify the server is responsive.
       ```yml
       healthcheck:
         test: ["CMD", "mongosh", "--eval", "db.adminCommand('ping')"]
       ```
  6. For RabbitMQ
     - The **RabbitMQ** diagnostics tool provides specific commands for health checking the message broker.
       ```yml
       healthcheck:
         test: ["CMD", "rabbitmq-diagnostics", "check_port_connectivity"]
       ```

- **Troubleshooting Health Checks**: If your health checks aren’t working as expected, try:
  1. **Check Docker Compose logs**: Use `docker-compose logs` to see health check output.
  2. **Manually run health check commands**: Execute the health check command inside the container to debug:
     ```sh
        docker-compose exec <service-name> curl -f http://localhost:8080/health
     ```

## Docker Logging

- **Docker logging drivers** are built-in mechanisms that determine how **container logs** are **collected**, **stored**, and **accessed**.
- By default, **Docker** uses the `json-file` driver, which saves logs as JSON files on the **host** machine. But that's just the beginning—Docker supports multiple logging drivers that can send your logs to various destinations.
- Why Docker Logging Drivers Matter
  1.  **Troubleshooting**: Find and fix issues faster by having logs in the right place
  2.  **Monitoring**: Keep an eye on container health and performance
  3.  **Compliance**: Meet regulatory requirements with proper log retention
  4.  **Resource Management**: Prevent logs from eating up your disk space
- Available **Docker Logging Drivers**:

  1.  `json-file`

      - Best for local development
      - Features:
        - Simple setup, easy access with `docker logs`

  2.  `local`

      - Best for: Production environments
      - Features:
        - Block I/O for better performance

  3.  `syslog`

      - Best for Unix/Linux environments
      - Features:
        - Integration with system logging

  4.  `journald`

      - Best for SystemD-based distros
      - Features:
        -     Structured logging with metadata

  5.  `fluentd`

      - Best for Distributed logging
      - Features:
        - Unified logging layer

  6.  `awslogs`

      - Best for AWS environments
      - Features:
        - Direct integration with **CloudWatch**

  7.  `splunk`

      - Best for Enterprise monitoring
      - Features:
        - Advanced search capabilities

  8.  `gelf`
      - Best for Graylog integration
      - **Features**:
        - Compressed log messages

- **How to Set Up the Default Logging Driver**

  - You can configure the default logging driver for all containers on your Docker daemon. Here's how to do it:
  - Edit the Docker daemon configuration file:
    ```json
    {
      "log-driver": "local",
      "log-opts": {
        "max-size": "10m",
        "max-file": "3"
      }
    }
    ```
  - Restart the Docker daemon:
    ```sh
      sudo systemctl restart docker
    ```
  - This configuration sets the `local` driver as default and limits log files to 10MB with a maximum of 3 files per container.

- **Choose a Logging Driver for Individual Containers**
  - We can override the default driver when running a container to set a different logging settings for specific containers. E.g.,
    ```sh
      docker run --log-driver=fluentd --log-opt fluentd-address=localhost:24224 nginx
    ```
  - For Docker Compose, add the logging configuration to your `docker-compose.yml` file:
    ```yml
    services:
      web:
        image: nginx
        logging:
          driver: "fluentd"
          options:
            fluentd-address: localhost:24224
            tag: web.{{.Name}}
    ```

# Resources and Further Reading

1. [Medium - Docker Compose Health Checks Made Easy: A Practical Guide](https://medium.com/@cbaah123/docker-compose-health-checks-made-easy-a-practical-guide-3a340571b88e)
2. [last9.io - How Docker Logging Drivers Work](https://last9.io/blog/docker-logging-drivers/?ref=dailydev)
