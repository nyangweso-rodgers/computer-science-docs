# Docker

## Table Of Contents

# Introduction to Docker

- **Docker** is the most popular technology to run containers.

# Popuar Docker Commands

- Docker commands should be executed in the root folder where `Dockerfile` is located.

## Command #1: Create Docker Image from `Dockerfile`

- Syntax:
  ```sh
    docker build -t <dockerhub_user_id>/<image_name>:<version>
  ```
- Example:

## Command #2: Push Docker Image to Docker Hub

- Syntax:
  ```sh
    docker push <dockerhub_user_id><image_name>:<version>
  ```
- Example:

## Command #3: Run a Docker Container from an Image

- Syntax:
  ```sh
    docker run -p <external_port>:<internal_port> -d <dockerhub_user_id>/<image_name>
  ```
- Example:

## Command #4: List Running Docker Containers

- Syntax:
  ```sh
    docker ps
  ```
- Example

## Command #5: Lists All Docker Containers (Running/Stopped)

- Syntax:
  ```sh
    docker ps -a
  ```
- Example

## Command #6: Start a Container

- Syntax:
  ```sh
    docker start <container_id>
  ```
- Example

## Command #7: Stop Running Container

- Syntax
  ```sh
    docker stop <container_id>
  ```
- Example

# Resources
