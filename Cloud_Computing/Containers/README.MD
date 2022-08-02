# Containers

## Table of Contents
1. [Introduction to Containers](#Introduction-to-Containers)
2. [Containers vs Virtual Machines](#Containers-vs-Virtual-Machines)
3. [Advantages of VMs over Containers](#Advantages-of-VMs-over-Containers)
4. [Advantages of Containers over VMs](#Advantages-of-Containers-over-VMs)
5. [Containers vs Serverless](#Containers-vs-Serverless)
6. [Why use Containers?](#Why-use-Containers?)
7. [Risks of Containers](#Risks-of-Containers)

# Introduction to Containers
* __Containers__ are packages of software that contain all of the necessary elements to run in any environment. In this way, __containers__ virtualize the o.s and run anywhere on any system.
* In computing terms, __containerization__ is an efficient method for running, deploying and scaling applications.
* A __container__ has its own dedicated filesystem, provided by an __image__ which contains:
    * dependencies
    * configuration
    * binaries
    * environment variables
    * other important data related to the container to be instantiated.
* _Remarks_:
    * _Containers run inside a virtual machine_
    * _Containers have less overhead and faster startup time than virtual machine._
    * _Containers have been popularized with the excitment around Docker containers._
    * _Since __containers__ are lightweight and fast, it’s quicker to create new instances to meet the demand._

* The open-source project, __Docker__, is one of the leading platforms for managing containers. __Docker containers__ provide an efficient, lightweight approach to application deployment because they allow different components of the application to be deployed independently into different containers. Multiple containers can be run on a single machine, and containers can be moved between machines. The portability of the container makes it easy for applications to be deployed in multiple environments, either on-premises or in the cloud, often with no changes to the application.
# Containers vs Virtual Machines 
* __VMs__ runs on top of an emulating software called the __hypervisor__ which sit between the hardware and the virtual machine. The __hypervisor__ is the key to enable __virtualization__. It manages the sharing of physical resources into virtual machines. Each virtual machine runs its own guest operating system.

* __Containers__: sits on the top of a physical server and its host operating system. They share a common operating system. Inside the container each app encapsulates itself means no app knows what's happening outside the app.

* __VM__ is an entire copy of the OS while the __container__ will have minimal resources  (less memory, less disl space, less usage of CPU) that are required to run a service. Therefore we can have many more containers running on a host machine than VMs.

* A __VM__ emulates the hardware it runs.  __container__ just emuates an OS, usually Linux. That's why it doesn't contain a virtual copy of the hardware it's running on.

* Like __VMs__, __Containers__ can't go without an OS, an application and its libraries and dependencies. But letting go of the hardware emulation results in the fact that containers are even more lightweight, fast, and portable. That's why containers only take seconds to start, while __VMs__ usually need a few minutes.

# Advantages of VMs over Containers
* __VMs__ keep different OS seperate from one another. So even if malware gets through to the OS of a VM, all other VMs on the machine remain untouched from the attack. This adds an extra level of security that can be crucial when dealing with confidential data. In the contrary, __containers__ aren't always as secure as __VMs__. If a malevolent software gets onto a containerised system and makes it through to the OS, it can potentially hijack the whole machine.

* Another advantage of __VMs__ over __containers__ is that you can use differnt OS. This is more work, of course, because you might need to implement bug fixes on each OS seperately. But if you have an application that ought to run on anything else than Linux, container's aren't the way to go.

# Advantages of Containers over VMs
* __Containers__ tend to run faster than the __VM__, and they tend to boot a lot faster than VM.

* __containers__ are great for anything with a microservice architecture, i.e., whether a single application is composed of many smaller services that are only loosely coupled and can be executed independently. Each individual service can be put in it's own container. Then, the only thing that developers need to watch out for is that the containers communicate properly among each other.

# Containers vs Serverless
* With __serverless__, developers don't even have to worry about when and how their application gets executed, which __containers__ they ought to put it in, or how many compute resources it will consume. They still need to write applications, of course, but after they've uploaded it to their AWS Lambda, Aurora, or CloudFront, they can call it a day. Their code will then lie dormant until it gets executed. You only pay for the machine-time that you really used, which makes the whole thing pretty economic. In contrast, you need to pay a monthly fee for Docker, and a per-cluster-per-hour fee for Kubernetes, regardless of how much you use it.

* That doesn't mean serverless is king. It's fairly a new technology, and at the moments there are still are limits wherever you go

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