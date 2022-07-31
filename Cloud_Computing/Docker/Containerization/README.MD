# Containerization
## Table of Contents
- [Introduction to Containers](#Introduction-to-Containers)
- [Why use Containers?](#Why-use-Containers?)
- [Risks of Containers](#Risks-of-Containers)
- [Differences between Containers and Virtual Machines](#Differences-between-Containers-and-Virtual-Machines)
- [Definition of Terms](#Definitions-of-Terms)

# Introduction to Containers
From a logical point of view, a __container__ can be considered as a single unit of working software, with all its configurations and dependencies, packed. In this way, it can run quickly and reliably from one computer to another.

A __container__ has its own dedicated filesystem, provided by an __image__ which contains:
* dependencies
* configuration
* binaries
* environment variables
* other important data related to the container to be instantiated.

To run a __container__, we need an __image__. Technically, a __container__ is first created, then started
_Remarks_:
* Many containers can be run from a single image

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

# Differences between Containers and Virtual Machines

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
# References