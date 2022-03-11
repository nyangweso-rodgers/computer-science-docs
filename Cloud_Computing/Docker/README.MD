# Docker

## Table of Contents
- [About Docker](#About-Docker)
- [How Docker Works](#How-Docker-Works)
- [What Docker Does](#What-Docker-Does)
- [Useful Docker Commands](#Useful-Docker-Commands)
- [References](#References)

# About Docker
Let's say you created an application which is working fine on your machine. But in __Production__, it doesn't work properly. The _reasons_ could be due to:
* Dependencies
* Libraries and versions
* Framework
* OS level feature
* Microservices

That the developers machinee has but not there in the __production environment__. We need a standardized way to package the application with its __dependencies__  and deploy it on any environment. __Docker__ is a tool designed to make it easier to __create__, __deploy__ and __run__ applications using __containers__.

# How Docker Works
__Docker__ packages an application and all its __dependencies__ in a __virtual container__ that can run on any linux server. Each __container__ runs as an __isolated process__ in the user space and take up __less space__ than regular VMs due to their layered architecture. So it will always work the same regardless of its environment

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

# Useful Docker Commands
* list all docker images
    ```docker
        docker image ls
    ```
* delete a docker image
    ```docker
        docker image rm <image>
    ```
* force delete a docker image if it;s still in use
    ```docker
        docker image rm -f <image>
    ```
* show docker disk usage
    ```docker
        docker system df
    ```
* free up disk space: caution: read docs first, so you don't lose data
    ```docker
        docker system prune
    ```

# References
