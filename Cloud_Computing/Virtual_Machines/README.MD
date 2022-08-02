# Virtual Machines

## Table of Contents
1. [Overview of Virtualization](#Overview-of-Virtualization)
2. [Hypervisor](#Hypervisor)
3. [Introduction to Virtual Machines](#Introduction-to-Virtual-Machines)
4. [Virtual Machines vs Containers](#Virtual-Machines-vs-Containers)
5. [Advantages of VMs over Containers](#Advantages-of-VMs-over-Containers)
6. [Advantages of Containers over VMs](#Advantages-of-Containers-over-VMs)
7. [References]()

# Overview of Virtualization
* __Virtualization__ is the logical division of physical computing resources. __Vurtualization__ makes a physical server into a _virtual host machine_ so that _virtual host_ can then run _guest virtual machines_. 
* __Virtualization__ started in 1960's as a way to slice up mainframe resources. There are many resources that can be virtualized:
    * server (compute), 
    * storage, and 
    * network. 
* There are many forms of _virtualization_ - including server and desktop.

# Hypervisor
* __Hypervisor__ is loaded on the virtual host to run virtual machines. (i.e., _is in charge of allocating compute resources to the __VMs__ and making sure that the __VMs__ don't interfere with one another._)

_REMARK:_
* A _Virtual Machine_ runs on top of a _hypervisor_ that is loaded on a physical server.  
* _Virtual guests_ run on a _virtual host_, which provides the physical resources.
* An _operating system_ and _applications_ are loaded in the guest.

# Introduction to Virtual Machines
* Running on a __hypervisor__, a __virtual machine__ is a software-based instance of a physical server where a guest operating system has access to emulated virtual hardware.
* __VM__ is a virtual environment that works like a computer within a computer. It runs on an isolated partition of its host computer with its own resources of CPU power, memory, an operating system (e.g. Windows, Linux, macOS), and other resources. This allows end-users to run applications on __VMs__ and use them as they normally would on their workstation. 
* The main purpose of __VMs__ is to operate multiple _operating systems_ at the same time, from the same piece of hardware. Without virtualization, operating multiple systems like Windows and Linux would require two separate physical units. Because applications run based on specific OS capabilities, businesses that use a wide array of applications might find themselves deploying many different consoles and hardware installations to manage their apps. This can become unwieldy and expensive. Hardware requires physical space that isn’t always available. Hardware also requires plenty of upkeep costs repair costs when hardware fails, maintenance costs to make sure your hardware stays in shape, and energy costs for power and cooling. Virtualization keeps costs down by placing all your OSes into a cloud-like structure, with multiple instances running on the same underlying, local hardware which eliminates the need for hardware accumulation and excessive overhead.

# Virtual Machines vs Containers
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