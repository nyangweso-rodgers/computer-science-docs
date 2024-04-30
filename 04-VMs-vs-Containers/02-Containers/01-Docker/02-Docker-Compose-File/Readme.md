# `docker-compose-yml` File

## Table Of Contents

# What is Docker Compose?

- **Docker Compose** makes it possible for an application to run multiple **containers**. While `Dockerfile` are used to create individual container images, **Docker Compose** provides a way to manage the configuration of multiple containers, their dependencies, networks, and volumes in a single `YAML` file.

- Here's how **Docker Compose** comes into play:

  - **Simplified Configuration**: Instead of managing multiple docker run commands for each container, **Docker Compose** allows you to define all the containers, their configurations, networks, and volumes in a single `YAML` file. This makes it easier to manage complex applications with multiple interconnected services.
  - **Service Definitions**: Docker Compose `YAML` file (`docker-compose.yml`) allows you to define each service/container, along with its build context (if applicable), image, environment variables, ports, volumes, dependencies, and other configurations.
  - **Dependency Management**: Docker Compose helps manage dependencies between services. For example, if one service relies on another (like a web application depending on a database), Docker Compose ensures that dependent services are started in the correct order.
  - **Networking**: Docker Compose automatically creates a default network for your application, allowing containers defined within the same docker-compose.yml file to communicate with each other using their service names as hostnames.
  - **Volume Management**: Docker Compose simplifies volume management by allowing you to define named volumes or bind mounts for your services. This ensures data persistence and sharing between containers.
  - **Environment Management**: Docker Compose allows you to specify environment variables for your services, making it easier to configure and customize your containers without modifying Dockerfiles.
  - **Command Line Interface**: Docker Compose provides a command-line interface (docker-compose) that allows you to perform various operations such as building images, starting containers, stopping containers, viewing logs, and managing the overall lifecycle of your multi-container application.

- Overall, **Docker Compose** simplifies the development, deployment, and management of multi-container applications, providing a unified way to define, run, and scale complex Dockerized environments.

# `docker-compose-yml` File

- The default path for a Compose file is `compose.yaml` (preferred) or `compose.yml` that is placed in the working directory. Compose also supports `docker-compose.yaml `and `docker-compose.yml` for backwards compatibility of earlier versions.
- In this file, we need to specify the `version` of the Compose file format, at least one `service`, and optionally `volumes` and `networks`:
- Example:

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

# Components Of `docker-compose-yml` File

## Component #1: `services`

- `service-*` The name of the service. You can choose any name you want, and it will be used to refer to this service within the **Docker Compose** file. `services` refer to the **containers’ configuration**.
- **Example**, let’s take a dockerized web application consisting of a **front end**, a **back end**, and a **database**. We’d likely split these components into three images, and define them as three different services in the configuration:

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

- **Remarks**:

  - Sometimes, the **image** we need for our service has already been published (by us or by others) in [Docker Hub](), or another **Docker Registry**. If that’s the case, then we refer to it with the `image` attribute by specifying the `image name` and `tag`:

    ```yml
    #docker-compose.yml structure
    version: "3"
    services:
      my-app:
        image: my-vue-app:latest
        #...
    ```

  - Alternatively, we might need to build an **image** from the source code by reading its `Dockerfile`. This time, we’ll use the `build` keyword, passing the path to the `Dockerfile` as the value:

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

  - Additionally, we can specify an **image name** in conjunction with the `build` attribute, which will name the image once created, making it available for use by other services:

    ```yml
    #docker-compose.yml structure
    version: "3"
    services:
      my-app:
        build: https://github.com/my-project.git
        image: my-image-name
        #...
    ```

## Component #2: `volume`

- In Docker, **volumes** are a way to persist data generated by and used by **Docker containers**. They are separate from the container's file system and can exist independently of the container's lifecycle. `Volumes` allow you to share data between **containers**, store persistent data, and facilitate data backup and migration.
- `volumes` are physical areas of disk space shared between the **host** and a **container**, or even between **containers**.

## Component #3: `networks`

- `networks` define the communication rules between **containers**, and between a **container** and the **host**.

## Component #4: Declaring the Dependencies with `depends_on`

- Often, we need to create a dependency chain between our **services** so that some **services** get loaded before (and unloaded after) other ones. We can achieve this result through the `depends_on` keyword:
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

## Component #5: Managing Environment Variables

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

# Resources
