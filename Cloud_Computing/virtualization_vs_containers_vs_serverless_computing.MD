# Virtualization vs. Containers vs. Serverless Computing

__Hypervisor__ is in charge of allocating compute resources to the VMs and making sure that the VMs don't interfere with one another.

## VMs vs. Containers
 A __VM__ emulates the hardware it runs on while a __container__ just emuates an OS, usually Linux. That's why it doesn't contain a virtual copy of the hardware it's running on.

 Like __VMs__, __Containers__ can't go without an OS, an application and its libraries and dependencies. But letting go of the hardware emulation results in the fact that containers are even more lightweight, fast, and portable. That's why containers only take seconds to start, while VMs usually need a few minutes.

 On the other hand, __containers__ aren't always as secure as __VMs__. If a malevolent software gets onto a containerised system and makes it through to the OS, it can potentially hijack the whole machine. In contrast, __VMs__ keep different OS seperate from one another. So even if malware gets through to the OS of a VM, all other VMs on the machine remain untouched from the attack. This adds an extra level of security that can be crucial when dealing with confidential data, for example.

 Another advantage of VMs over containers is that you can use differnt OS. This is more work, of course, because you might need to implement bug fixes on each OS seperately. But if you have an application that ought to run on anything else than Linux, container's aren't the way to go.

 On the other hand, __containers__ are great for anything with a microservice architecture, i.e., whether a single application is composed of many smaller services that are only loosely coupled and can be executed independently. Each individual service can be put in it's own container. Then, the only thing that developers need to watch out for is that the containers communicate properly among each other.

 ## Docker vs. Kubernetes
 __Docker__ is a file format for containers and open-source technology to run applications from anywhere. __Kubernetes__ coordinates and schedules  many containers, and ensures that they communicate properly with each other.

 __Docker__ has its own container orchestration service, __Docker Swarm__. Here, however, the winner is clear: __Kubernetes__ is way more extensive than __Docker Swarm__. Kubernetes can run across an entire cluster of machines, whereas Docker Swarm runs on a single node only.

 ## Containers vs. Serverless
 With __serverless__, developers don't even have to worry about when and how their application gets executed, which containers they ought to put it in, or how many compute resources it will consume. They still need to write applications, of course, but after they've uploaded it to their AWS Lambda, Aurora, or CloudFront, they can call it a day.

 Their code will then lie dormant until it gets executed. You only pay for the machine-time that you really used, which makes the whole thing pretty economic. In contrast, you need to pay a monthly fee for Docker, and a per-cluster-per-hour fee for Kubernetes, regardless of how much you use it.

 That doesn't mean serverless is king. It's fairly a new technology, and at the moments there are still are limits wherever you go