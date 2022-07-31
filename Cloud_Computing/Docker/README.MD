# Docker

## Table of Contents
1. [About Docker](#About-Docker)
- [How Docker Works](#How-Docker-Works)
- [What Docker Does](#What-Docker-Does)
- [Useful Docker Commands](#Useful-Docker-Commands)
- [References](#References)
    - [Introduction to Docker Part-1](https://atharvbobade.hashnode.dev/introduction-to-docker-part-1)
    - [Introduction to Docker Part-2](https://atharvbobade.hashnode.dev/introduction-to-docker-part-2)

# About Docker
* Let's say you created an application which is working fine on your machine. But in __Production__, it doesn't work properly. The _reasons_ could be due to:
    * Dependencies
    * Libraries and versions
    * Framework
    * OS level feature
    * Microservices

* That the developers machinee has but not there in the __production environment__. We need a standardized way to package the application with its __dependencies__  and deploy it on any environment. __Docker__ is a tool designed to make it easier to __create__, __deploy__ and __run__ applications using __containers__.

* __Docker__ is a a __container__ platform that allows you to build, test and deploy applications quickly. A developer defines all the applications and it’s dependencies in a __Dockerfile__ which is then used to build __Docker images__ that defines a __Docker container__. Doing this ensures that your application will run in any environment.

# How Docker Works
* __Docker__ packages an application and all its __dependencies__ in a __virtual container__ that can run on any linux server. Each __container__ runs as an __isolated process__ in the user space and take up __less space__ than regular VMs due to their layered architecture. So it will always work the same regardless of its environment

# What Docker Does
* Carves up a computer into a sealed containers that run developer's code.
* Gets the code to and from your computers
* Build the containers for developers
* Social platform for you to find and share __containers__, which are different from __virtual machines__.

# Definition of Terms
1. __Docker Swarm__ is an __orchestartion__ solution provided by __docker__. Features include:
    * Decentralized
    * Geared toward developers
    * Seamless experience
    * Swarm and standalone

# How to Install Docker on:
1. __On Windows__: By using Docker Desktop + WSL (Windows Subsystem for Linux).
2. __On Mac__: Docker Desktop or you can use Docker Desktop inside Virtual Machine.
3. __On Linux__: Can Download it as it is.

_Remarks_:
* _If any application containerized on Windows system then it wont work on Linux and mac system. And similarly to the Mac and Linux system._

# Docker Architecture
* __Docker Daemon__: Daemon is a engine of container. It takes request from client and work on it. It works on building, running, and distributing the containers. It also manages the Docker images and the containers.
* __Rest API__: Client communicate with the engine or daemon with the help of Rest API request. It Deals with the interaction of applications with their server.
* __Client CLI__: By using CLI (Command Line Interface) client makes API request to the Daemon.
* __Docker Image__: file which contains all the required things to create the __container__. It is similar in concept to a snapshot of a VM. Image consist of source code, operating system files to run the application along with its other dependencies. Images are immutable.
* __Docker Registries__: this is similar to GitHub. Registry stores all the images. Docker Hub is a public registry that anyone can use. When you pull an image, it will search by default on public registry and stores in the system locally.
* __Dockerfile__:  file which contains the steps to create a images. These images can be pulled to create containers in any environment. These images can also be store online at docker hubs.

# Docker Commands
Command | Meaning
|---------------- | --------------|
docker run hello-world | run a container on our system
docker image ls | lists all docker images
docker image rm <image> | delete a docker image
docker image rm -f <image> | force delete a docker if it's still in use
docker system df | show docker disk usage
docker system prune | free up space: read docs first, so you don't lose data