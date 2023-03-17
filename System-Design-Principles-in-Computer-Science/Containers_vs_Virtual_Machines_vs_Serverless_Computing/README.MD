# Virtual Machines vs Containers

## Table Of Contents
- [Virtual Machines]()
    - []()

- [Container]()
    - []()

- [Docker]()
    -[]()

- [Kubernetes]()
    - []()

- [References]()
    - [Virtualization vs Containerization](https://zohaibbashir.medium.com/virtual-machines-vs-docker-6101b2d762cd)
    - [Dockers vs Kubernetes: Choosing Your Container Orchestrator](https://medium.com/@i191731/dockers-vs-kubernetes-choosing-your-container-orchestrator-cab4a17b5faa)

# Containers vs Virtual Machines 
* __VMs__ runs on top of an emulating software called the __hypervisor__ which sit between the hardware and the virtual machine. The __hypervisor__ is the key to enable __virtualization__. It manages the sharing of physical resources into virtual machines. Each virtual machine runs its own guest operating system.

* __Containers__: sits on the top of a physical server and its host operating system. They share a common operating system. Inside the container each app encapsulates itself means no app knows what's happening outside the app.

* __VM__ is an entire copy of the OS while the __container__ will have minimal resources  (less memory, less disl space, less usage of CPU) that are required to run a service. Therefore we can have many more containers running on a host machine than VMs.

* A __VM__ emulates the hardware it runs.  __container__ just emuates an OS, usually Linux. That's why it doesn't contain a virtual copy of the hardware it's running on.

* Like __VMs__, __Containers__ can't go without an OS, an application and its libraries and dependencies. But letting go of the hardware emulation results in the fact that containers are even more lightweight, fast, and portable. That's why containers only take seconds to start, while __VMs__ usually need a few minutes.

# Docker vs K8s
* While they are different technologies, __Kubernetes__ and __Docker__ can both be used for __container orchestration__ and are both quite powerful tools. __Docker__ has many different tools and technologies such as _docker hub_, _docker engine_, _docker desktop_ etc. But when we’re talking about __Kubernetes__ and __Docker__, there is only one tool that we’re interested in; and that’s known as __Docker Swarm__.

Features | K8s | Docker Swarm
|--------------|-----------|-------------|
Installation | Complex installation but a strong resultant cluster once set up | simple installation but the resultant cluster is not comparatively strong
Gui | Comes with an inbuilt dashboard | there is no dashboard which makes management complex
Scalability | Highly scalable services that can scale with requirements. 5000 node clusters with 150,000 pods | Very high scalability. Upto 5 times more scalable than K8s. 1000 node clusters with 30,000 containers.
Load Balancing | Manual load balancing is often needed to balance traffic between different containers in different pods. | Capability to execute auto load balancing of traffic between containers in the same cluster
Rollbacks | Automatic rollback with the ability to deploy rolling updates | Automatic rollback facility available in Docker 17.04 and higher if a service update fails to deploy
Logging & Monitoring | Inbuilt tools available for logging and monitoring | Lack of inbuilt tools. Needs 3rd party tools for the purpose
Node Support | Supports upto 5000 nodes | Supports 2000+ nodes
Optimization Target | Optimized for one single large cluster | Optimized for multiple smaller clusters
Updates | the in-place cluster updates have been constantly maturing | Cluster can be upgraded in place
Networking | an overlay network is used which lets pods communicate across multiple nodes. | The Docker Daemons is connected by overlay networks and the overlay network drivers is used
Availability | High availability. Health checks are performed directly on the pods | High availability. Containers are restaerted on a new host if a host failure is encountered.

# The Better Option?
* Both __Kubernetes__ and __Docker Swarm__ serve specific use cases. Which one is best for you depends on your personal needs; for beginners, __Docker Swarm__ is an easy-to-use and simple solution to manage your containers at scale. If you are just starting off with containers and don’t have complex workloads to manage, then Docker Swarm is the right choice for you.

* If your applications are more tricky and you are looking for a complete package that includes monitoring, security features, self-healing, high availability, and absolute flexibility, then Kubernetes is the right choice for you.