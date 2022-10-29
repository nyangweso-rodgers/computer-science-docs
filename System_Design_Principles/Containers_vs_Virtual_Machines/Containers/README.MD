# Containerization

## Table Of Contents
- [What is Containerization?](#What-is-Containerization?)
- [What are Containers?](#What-are-Containers?)
    - [Advantages Of Containers](#Advantages-Of-Containers)
    - [Cons Of Containers](#Cons-Of-Containers)

- [References]()
    - [Learning Containers From The Bottom Up](https://t.co/gZt4N8OL0E)
    - [Getting Edgy: Clusters, Nodes, Pods, and Containers — Oh My!](https://blog.getambassador.io/getting-edgy-clusters-nodes-pods-and-containers-oh-my-f363fe4cf0c0)

# What is Containerization?
* __Containerization__ technologies (Docker is just one of them) use a standard, to isolate the application with all:
    - dependencies
    - configuration
    - code

in something called __images__. Based on these images, __containers__ can be created and started.

# What are Containers?
* A __container__ is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

* __Containers__ can be described as creating a virtualization of the operating system. __Containers__ unlike __VMs__ are lightweight and portable and do not take as much of the system’s resources as a VM does.

_Remarks_:
* _To make an analogy with the world of programming, an image is a class, and a container is an instance of that class._

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