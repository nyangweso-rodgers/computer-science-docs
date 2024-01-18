# Containerization

## Table Of Contents

# What is Containerization?

- **Containerization** technologies (Docker is just one of them) use a standard, to isolate the application with all:
  - dependencies
  - configuration
  - code, in something called **images**. Based on these images, **containers** can be created and started.

# What are Containers?

- A **container** is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. **Containers** can be used to speed up the development process by allowing developers to work on code in a consistent environment without worrying about dependencies.

- **Containers** can be described as creating a virtualization of the operating system. **Containers** unlike **VMs** are lightweight and portable and do not take as much of the system’s resources as a VM does.

- The open-source project, **Docker**, is one of the leading platforms for managing containers. **Docker containers** provide an efficient, lightweight approach to application deployment because they allow different components of the application to be deployed independently into different containers. Multiple containers can be run on a single machine, and containers can be moved between machines. The portability of the container makes it easy for applications to be deployed in multiple environments, either on-premises or in the cloud, often with no changes to the application.

## Advantages Of Containers

- Containers require less system resources than VMs because they don’t include operating system images.
- They are very **portable**. Applications running in containers can be easily deployed to different OS and hardware platforms.
- They are **more efficient**. They can be rapidly deployed, patched or scaled.
- Containers simplify the **build/test/deploy** pipelines in DevOps.
- DevOps teams know that the applications made in containers will work the same, regardless of where they are deployed.

## Cons Of Containers

- Not all applications benefit from containers.
- It cannot run applications as fast as a bare-metal rates.
- The container ecosystem is split But the core Docker platform is open source, some container products don’t work with other ones.
- **Graphical applications** do not operate well.

# Containers vs Virtual Machines

- **VMs** runs on top of an emulating software called the **hypervisor** which sit between the hardware and the virtual machine. The **hypervisor** is the key to enable **virtualization**. It manages the sharing of physical resources into virtual machines. Each virtual machine runs its own guest operating system.

- **Containers**: sits on the top of a physical server and its host operating system. They share a common operating system. Inside the container each app encapsulates itself means no app knows what's happening outside the app.

- **VM** is an entire copy of the OS while the **container** will have minimal resources (less memory, less disl space, less usage of CPU) that are required to run a service. Therefore we can have many more containers running on a host machine than VMs.

- A **VM** emulates the hardware it runs. **container** just emuates an OS, usually Linux. That's why it doesn't contain a virtual copy of the hardware it's running on.

- Like **VMs**, **Containers** can't go without an OS, an application and its libraries and dependencies. But letting go of the hardware emulation results in the fact that containers are even more lightweight, fast, and portable. That's why containers only take seconds to start, while **VMs** usually need a few minutes.

## Containers vs Serverless

- With **serverless**, developers don't even have to worry about when and how their application gets executed, which **containers** they ought to put it in, or how many compute resources it will consume. They still need to write applications, of course, but after they've uploaded it to their AWS Lambda, Aurora, or CloudFront, they can call it a day. Their code will then lie dormant until it gets executed. You only pay for the machine-time that you really used, which makes the whole thing pretty economic. In contrast, you need to pay a monthly fee for Docker, and a per-cluster-per-hour fee for Kubernetes, regardless of how much you use it.

# Resources

1. [Virtualization vs Containerization](https://zohaibbashir.medium.com/virtual-machines-vs-docker-6101b2d762cd)
2. [Dockers vs Kubernetes: Choosing Your Container Orchestrator](https://medium.com/@i191731/dockers-vs-kubernetes-choosing-your-container-orchestrator-cab4a17b5faa)
