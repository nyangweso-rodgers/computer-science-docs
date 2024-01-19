# Containers

## Table Of Contents

# What is Containerization?

- **Containerization** technologies (Docker is just one of them) use a standard, to isolate the application with all:
  - dependencies
  - configuration
  - code, in something called **images**. Based on these images, **containers** can be created and started.

# What are Containers?

- A **container** is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. **Containers** can be used to speed up the development process by allowing developers to work on code in a consistent environment without worrying about dependencies.

- **Containers** can be described as creating a virtualization of the OS. **Containers** unlike **VMs** are lightweight and portable and do not take as much of the system’s resources as a VM does.

- The open-source project, **Docker**, is one of the leading platforms for managing containers. **Docker containers** provide an efficient, lightweight approach to application deployment because they allow different components of the application to be deployed independently into different containers. Multiple containers can be run on a single machine, and containers can be moved between machines. The portability of the container makes it easy for applications to be deployed in multiple environments, either on-premises or in the cloud, often with no changes to the application.

## Advantages Of Containers

- Containers require less system resources than VMs because they don’t include operating system images.
- They are very **portable**. Applications running in containers can be easily deployed to different OS and hardware platforms.
- They are **more efficient**. They can be rapidly deployed, patched or scaled.
- Containers simplify the **build/test/deploy** pipelines in DevOps.
- DevOps teams know that the applications made in containers will work the same, regardless of where they are deployed.

## Advantages of Containers over VMs

- **Containers** tend to run faster than the **VM**, and they tend to boot a lot faster than VM.

- **containers** are great for anything with a microservice architecture, i.e., whether a single application is composed of many smaller services that are only loosely coupled and can be executed independently. Each individual service can be put in it's own container. Then, the only thing that developers need to watch out for is that the containers communicate properly among each other.

## Cons Of Containers

- Not all applications benefit from containers.
- It cannot run applications as fast as a bare-metal rates.
- The container ecosystem is split But the core Docker platform is open source, some container products don’t work with other ones.
- **Graphical applications** do not operate well.
