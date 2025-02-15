# Containers

#

- **Containers** are one of the building blocks of cloud native computing. They are similar to, but much more lightweight than **VMs**.

- **Elements of a container**:

  1. A **container image** is a lightweight, stand-alone, executable software package that includes everything an application needs to run: code, runtime, systems, tools, libraries and settings.
  2. **Containerization** involves a standard packaging format and an engine for running containers. Container images become containers at runtime when the container engine unpacks the application and runs it in a way that isolates the software from any other containers running on the same infrastructure.

- **Features of containers**:

  1. **Containers** are immutable, so if you need to make a change, you have to create a new container.

- **Differences Between Containers and Virtual Machines**:
  - **Containers** and **VMs** offer environments for running applications. They vary in architecture and resource usage. **VMs** operate on **hypervisors** with a guest OS, resulting in increased resource utilization. In contrast, **containers** share the **host OS kernel**, making them lighter and more efficient. This efficiency enables density and optimal use of computing resources.

# Core Components of Container Technology

## 1. What Is Containerization?

- **Containerization** involves packaging an application with its dependencies into a **container**. **Containers** use the **host OS kernel** and segregate the application processes within their own environment. This streamlined approach enables containers to launch, halt and operate swiftly.

- **Benefits of Containerization**
  1. **Portability**: Containers can run consistently across different environments, making them ideal for multicloud and hybrid cloud strategies.
  2. **Scalability**: Containers can be easily scaled up or down to handle varying loads, enhancing application performance and resource utilization.
  3. **Efficiency**: By sharing the host OS kernel, containers reduce overhead and improve the density of applications running on a single host.
  4. **Isolation**: Containers provide process and resource isolation, enhancing security and stability by ensuring that issues in one container do not affect others.

## 2. Container Engines

- **Container engines** serve as the software that enables **containers** to operate on a host system. They oversee the life cycle of **containers** from their inception and deployment to scaling and eventual shutdown.
- There are many **container engines**, including **Docker**, **RKT**, **CRI-O**, and **LXD**. In addition, many cloud providers, Platforms as a Service (PaaS), and container platforms have their own built-in container engines, which consume **Docker** or OCI-compliant container images.

## 3. Container Orchestration Tools

- As **containers** started gaining traction, many people started looking at solutions for how to manage containers across multiple machines. "**Docker** had two attempts at this (with **Docker Swarm** and **Docker Swarm Mode**, respectively); companies like [Rancher]() and [CoreOS]() came up with their own takes; and more general purpose platforms like [Mesos]() were used to run containers alongside other sorts of workloads. Ultimately, though, despite a lot of effort on these products, **Kubernetes** has in the last couple of years come to dominate this space."

## 4. Container Images and Registries

- **Container images** are self-contained bundles that encompass all components to execute a software application, such as the code, runtime environment, libraries and setup files. These image packages can be shared via container repositories that act as storage hubs for container images.
  1. [Docker Hub](): **Docker Hub** is the most popular **container registry**, providing a vast library of pre-built images that can be pulled and used in **Docker** environments. It allows developers to share and distribute containerized applications easily.
  2. **Google Container Registry**: Is a private container image storage service on GCP, offering secure, high-performance image storage.
  3. **Amazon Elastic Container Registry** (**ECR**): **Amazon ECR** is a fully managed **Docker container registry** that makes it easy for developers to store, manage, and deploy Docker container images.

# Popular Container Technologies

## 1. Docker

- **Docker** is the best-known container engine. Alongside the engine itself, Docker offers a suite of products including:
  1. **Docker Desktop**, which acts as a launchpad for container development.
  2. **Docker Hub**, the largest and most active registry of container images.
  3. **Docker Scout**, which provides insights on software supply chain vulnerabilities and company policy violations, from development to production.
  4. **Build Cloud**, which can dramatically speed up the building of containers.
  5. **Docker Debug**, which provides a built-in toolbox for developers working with containers.

## 2. Kubernetes, Cycle, Nomad and Tanzu Application Service

- **Kubernetes**, created by **Google**, stands out as the platform for orchestrating containers. It handles tasks like deploying, resizing and overseeing applications in containers across host clusters. **Kubernetes** offers an adaptable system, with capabilities such as automated resource allocation, self-recovery mechanisms, discovering services and balancing loads. Its versatility and broad range of tools make it the preferred option for overseeing container setups. It does, however, have a reputation for complexity.
- Of the current alternatives to **Kubernetes**, the main ones to consider are:
  1. [Cycle](): Sitting somewhere between a PaaS and an orchestrator, Cycle aims to simplify the management of containers. It doesn’t use Docker or Kubernetes, but it is OCI compliant, meaning the underlying containers are cross-compatible.
  2. [HashiCorp’s Nomad](): Deployed as a single binary, written in Go, it has a responsive community of maintainers on GitHub. Well-known users of the platform include Autodesk, Cloudflare and Roblox. It has a very flexible model for running different sorts of application workloads — including Java applications, virtual machines (VMs), Hadoop jobs and so on — and allows for a great deal of customization.
  3. [VMware Tanzu Application Service](): previously known as Pivotal Cloud Foundry (PCF), Tanzu Application Service is designed to run Microservice applications across clouds. It works on vSphere and all the major cloud providers and is particularly suited to .NET, Spring and Spring Boot-based applications.

## 3. Containerd

- **Containerd** is a container runtime that handles all aspects of the container life cycle, such as transferring images, executing containers and managing storage. It is meant to be integrated into systems like Docker, offering features for container operation. Containerd follows the standards set by the Open Container Initiative (OCI) for runtimes and images, promoting consistency and uniformity among container technologies.

## 4. runc

- **runc** is a lightweight, portable container runtime that directly implements the Open Container Initiative (OCI) runtime specification. It serves as the underlying runtime for Docker and Containerd, providing a standardized way to run containers. runc focuses on simplicity and performance, making it a critical component of modern container ecosystems.

## 5. Kata Containers

- **Kata Containers** strives to merge the advantages of **containers** and **VMs** by offering virtualized containers with security and isolation. By using a **hypervisor** to operate each container in its virtual machine, Kata Containers guarantees robust isolation while maintaining the speed and effectiveness of containers. This method proves beneficial for executing workloads or bolstering security in shared environments.

# Implementing Containers in Cloud Environments

## 1. Integration with Cloud Providers

- Most major cloud providers offer curated **Kubernetes** experiences such as **Azure Kubernetes Service** (**AKS**), **Amazon Elastic Kubernetes Service** (**EKS**) or **Google Kubernetes Engine** (**GKE**). For on-prem workloads, a Kubernetes distribution such as [Red Hat’s OpenShift]() or Tanzu Application Platform fulfills a similar purpose.

# Resources and Further Reading

1. [The New Stack - Introduction to Containers](https://thenewstack.io/introduction-to-containers/?ref=dailydev)
