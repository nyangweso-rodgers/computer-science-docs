# Containerization

## Table Of Contents
- [What is Containerization?](#What-is-Containerization?)
- [What are Containers?](#What-are-Containers?)
    - [Advantages Of Containers](#Advantages-Of-Containers)
    - [Cons Of Containers](#Cons-Of-Containers)

- [References]()
    - [Learning Containers From The Bottom Up](https://t.co/gZt4N8OL0E)
    - [Getting Edgy: Clusters, Nodes, Pods, and Containers — Oh My!](https://blog.getambassador.io/getting-edgy-clusters-nodes-pods-and-containers-oh-my-f363fe4cf0c0)
    - [What is a Container? Containers are not Virtual Machines!](https://medium.com/@armishmmunir244/docker-vs-virtual-machines-aff2bce0dc4)

# What is Containerization?
* __Containerization__ technologies (Docker is just one of them) use a standard, to isolate the application with all:
    - dependencies
    - configuration
    - code

in something called __images__. Based on these images, __containers__ can be created and started.

# What are Containers?
* A __container__ is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. __Containers__ can be used to speed up the development process by allowing developers to work on code in a consistent environment without worrying about dependencies.

* __Containers__ can be described as creating a virtualization of the operating system. __Containers__ unlike __VMs__ are lightweight and portable and do not take as much of the system’s resources as a VM does.

* The open-source project, __Docker__, is one of the leading platforms for managing containers. __Docker containers__ provide an efficient, lightweight approach to application deployment because they allow different components of the application to be deployed independently into different containers. Multiple containers can be run on a single machine, and containers can be moved between machines. The portability of the container makes it easy for applications to be deployed in multiple environments, either on-premises or in the cloud, often with no changes to the application.

* _Remarks_:
    * _To make an analogy with the world of programming, an image is a class, and a container is an instance of that class._
    * _Containers run inside a virtual machine_
    * _Containers have less overhead and faster startup time than virtual machine._
    * _Containers have been popularized with the excitment around Docker containers._
    * _Since __containers__ are lightweight and fast, it’s quicker to create new instances to meet the demand._

# Advantages Of Containers
* Containers require less system resources than VMs because they don’t include operating system images.
* They are very __portable__. Applications running in containers can be easily deployed to different OS and hardware platforms.
* They are __more efficient__. They can be rapidly deployed, patched or scaled.
* Containers simplify the __build/test/deploy__ pipelines in DevOps.
* DevOps teams know that the applications made in containers will work the same, regardless of where they are deployed.

# Cons Of Containers
* Not all applications benefit from containers.
* It cannot run applications as fast as a bare-metal rates.
* The container ecosystem is split But the core Docker platform is open source, some container products don’t work with other ones.
* __Graphical applications__ do not operate well.

# Why use Containers?
* For developers, __Containers__ mean they can focus on the code and not be concerned where it is deployed. You can get things working the way you want in your own development environment on your workstation and when you are ready to ship, you package the entire thing  up in a __container__ and deploy that to your infrastructure.
* Repeatability
* Deploy the same container
* Deployments and rollbacks are easier
* Operations Team can focus more on the platform
* Scalability

# Risks of Containers
Comtainers are a security risks. i.e.,
* Vulnerable dependency packages
* Container implementation risks
* Orchestration tooling access control

# Containers vs Serverless
* With __serverless__, developers don't even have to worry about when and how their application gets executed, which __containers__ they ought to put it in, or how many compute resources it will consume. They still need to write applications, of course, but after they've uploaded it to their AWS Lambda, Aurora, or CloudFront, they can call it a day. Their code will then lie dormant until it gets executed. You only pay for the machine-time that you really used, which makes the whole thing pretty economic. In contrast, you need to pay a monthly fee for Docker, and a per-cluster-per-hour fee for Kubernetes, regardless of how much you use it.

* That doesn't mean serverless is king. It's fairly a new technology, and at the moments there are still are limits wherever you go

# Definitions of Terms
1. __Orchestration__: The fundamental task of a __Container Orchestartion__ is to automatically manage the state of your container to meet incoming work load. It covers things like: 
    * scaling and load balancing.
    * Networking and storage
    * Scheduling, deployment, and so on.
1. __NAMESPACES__: when you run a __container__, __Docker__ creates __Namespaces__ for the __container__. The __Namespaces__ used by __Docker__ for __containers__ are:
    * PID: for process ID
    * NET: to manage Network Interfaces
    * IPC: to manage access to interprocess
    * MNT: to manage filesystem mount points
    * UTS: to isolate kernel/version identifiers
2. __CGROUPS__: it's a Linx feature to limit the resources for a set of processes. __Docker__ relies on __Cgroups__ to limit the usage of resources for containers. It's used to limits and monitors system resources:
    * CPU
    * memory
    * network bandwidth
    * disk
3. __UNION FS__: it's a filesystem service. It implements a Union Mount for different file systems. It allows files/dirs of seperate file systems, to be transparanetly overlaid, forming a single coherent one. __Docker__ engine uses __Union FS__ to provide the building blocks for __containers__.