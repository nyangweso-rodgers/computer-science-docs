# Docker

## Table Of Contents

- [References]()
    - [](https://www.youtube.com/watch?v=pTFZFxd4hOI)
    - [What is Docker? Learn How to Use Containers – Explained with Examples](https://www.freecodecamp.org/news/what-is-docker-learn-how-to-use-containers-with-examples/)
    - [A Complete Beginner's Guide to Docker](https://blog.suhailkakar.com/a-complete-beginners-guide-to-docker)
    - [How to Dockerize a Flask Application](https://www.freecodecamp.org/news/how-to-dockerize-a-flask-app/)

#

# Why Docker?
* __Docker__ is an open source tool that uses __containers__ to create, deploy, and manage distributed applications. 
* Many organizations now opt to use __Docker__ over __VMs__ because of the performance benefits that it offers. Companies like Visa and Paypal now use Docker to manage their applications.

_Remarks_:
* _A misconception among many people is that __Docker__ created the concept of __containers__ but that is wrong Docker only brought it to critically acclaimed status as stated before. Containers existed very well before Docker._


# Definitions
1. __Docker (Active) Host__: A computer with Docker installed and the daemon running. It can process Docker and non-Docker workloads.

2. __Docker Engine__: A Client-Server application. It has 3 components:
    - _CLI_:  A command-line interface client.
    - _daemon process_: A server that is a type of long-running program.
    - _Rest API_: to specify interfaces that programs can use to talk and interact with the daemon.

3. __Docker Client__: The main way of interacting with Docker. When you use commands such as "docker run", the client sends these commands to dockerd, which carries them out. The "docker" command uses the Docker API. 

4. __Docker Daemon (dockerd)__: is a process, which runs in the background, that manages the docker objects (images, containers, networks, volumes). It processes Docker API requests

5. __Dockerfile__: It's a text document (capital D, no extensions). You can use a different name. It contains KEY VALUES pairs with all the commands a user could call on the command line to build an image. During the build, the lines are executed in order

6. __Docker Image__: It's a file, composed of multiple layers, often based on another image, that contains everything you need to run your application. E.g., 
    - dependencies
    - configuration
    - binaries
    - environment variables

    _NOTE_: Containers run on top of existing images.

7. __Docker Container__: It's a single unit of working software, with all its configurations and dependencies, packaged. From a technical point of view, the container is just a process, that runs on the machine, isolated from the other processes.

8. __Docker Network__: It's how to link different containers and how they can communicate with each other on single/multiple hosts, agnostically. You can have different behaviors using different drivers.

9. __Docker Volumes__: They are file systems mounted on Docker containers to save data. You need this because containers are ephemerals, and when they are removed, all their data is lost, and this happens often.

10. __Docker Compose__: It's a tool for defining and running multi-container Docker applications, called __services__. You use a YAML file to configure the services, that can be created/started/stopped with a single command. It works well in development, testing, and production.

11. __Docker Registry__: It's a stateless server-side application to store Docker images where the images can be pulled/pushed (as GitHub for repositories). It can be public or private. __Docker Hub__ is a public Docker registry.
