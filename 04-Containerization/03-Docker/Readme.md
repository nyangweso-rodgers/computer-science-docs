# Docker

## Table Of Contents

# What is Docker?

- **Docker** is a software containerization platform which allows developers to package their applications into **containers**, which can then be run on any machine that has Dockers installed. This makes it easier for developers to move their applications between different environments, such as **development**, **testing**, and **production**. Docker has become so popular that when the word container is mentioned, it is automatically assumed docker will be used to manage it.

# Why Docker?

- **Docker** is an open source tool that uses **containers** to create, deploy, and manage distributed applications.
- Many organizations now opt to use **Docker** over **VMs** because of the performance benefits that it offers.

# Remarks

- A misconception among many people is that **Docker** created the concept of **containers** but that is wrong Docker only brought it to critically acclaimed status as stated before. Containers existed very well before Docker.

- **Docker** has many different tools and technologies such as [docker hub](), [docker engine](), [docker desktop]() etc. But when we’re talking about Kubernetes and Docker, there is only one tool that we’re interested in; and that’s known as [Docker Swarm]().

# Definition Of Terms

## 1. Docker (Active) Host

- A computer with Docker installed and the daemon running. It can process Docker and non-Docker workloads.

## Docker Client

- The main way of interacting with Docker. When you use commands such as "`docker run`", the client sends these commands to **dockerd**, which carries them out. The "docker" command uses the Docker API.

## 2. Docker Daemon (dockerd)

- is a process, which runs in the background, that manages the docker objects (images, containers, networks, volumes). It processes Docker API requests

## 3. Dockerfile

- It's a text document (capital D, no extensions). You can use a different name. It contains KEY VALUES pairs with all the commands a user could call on the command line to build an image. During the build, the lines are executed in order

## Docker Engine

- A Client-Server application. It has 3 components:

  - _CLI_: A command-line interface client.
  - _daemon process_: A server that is a type of long-running program.
  - _Rest API_: to specify interfaces that programs can use to talk and interact with the daemon.

## Docker Container

- It's a single unit of working software, with all its configurations and dependencies, packaged.
- From a technical point of view, the container is just a process, that runs on the machine, isolated from the other processes.

## Docker Network

- It's how to link different containers and how they can communicate with each other on single/multiple hosts, agnostically. You can have different behaviors using different drivers.

## Docker Compose

- It's a tool for defining and running multi-container Docker applications, called **services**. You use a YAML file to configure the services, that can be created/started/stopped with a single command. It works well in development, testing, and production.

## Docker Image

- It's a file, composed of multiple layers, often based on another image, that contains everything you need to run your application. E.g.,

  - dependencies
  - configuration
  - binaries
  - environment variables

- _NOTE_: Containers run on top of existing images.

## Docker Registry

- It's a stateless server-side application to store Docker images where the images can be pulled/pushed (as GitHub for repositories). It can be public or private. **Docker Hub** is a public Docker registry.

# Docker Desktop

- [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)

# Docker Swarm

- **Docker Swarm** is a group of either physical or virtual machines that are running the Docker application which have been configured to join together in a cluster. **Docker swarm** is a container orchestration tool, meaning that it allows the user to manage multiple containers deployed across multiple host machines.

- One of the major benefits of docker swarm is the high level of availability offered for applications. In a docker swarm, there are typically several worker nodes and at least one manager node that is responsible for handling the worker nodes’ resources efficiently and ensuring that the cluster operates efficiently.

- **Docker Swam** is also relatively easy to install, and is easily understandable for those starting out with container orchestration. It is lightweight and easy to use. Also, Docker Swarm takes less time to understand than more complex orchestration tools.

# Resources

1. [What is Docker? Learn How to Use Containers – Explained with Examples](https://www.freecodecamp.org/news/what-is-docker-learn-how-to-use-containers-with-examples/)
2. [A Complete Beginner's Guide to Docker](https://blog.suhailkakar.com/a-complete-beginners-guide-to-docker)
3. [How to Dockerize a Flask Application](https://www.freecodecamp.org/news/how-to-dockerize-a-flask-app/)
4. [How to Build Docker Image : Comprehensive Beginners Guide](https://devopscube.com/build-docker-image/)
5. [Learn How to Deploy 12 Apps to AWS, Azure, & Google Cloud](https://www.freecodecamp.org/news/learn-how-to-deploy-12-apps-to-aws-azure-google-cloud/)
6. [What Is Docker and How Does It Work? – Docker Explained](https://www.hostinger.in/tutorials/what-is-docker)
