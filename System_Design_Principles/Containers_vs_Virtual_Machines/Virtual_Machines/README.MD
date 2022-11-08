# Virtual Machines

## Table Of Contents
- [What is Virtualization?](#What-is-Virtualization?)

- [What are Virtual Machines?](#What-are-Virtual-Machines?)
    - [Advantages Of VMs](#Advantages-Of-VMs)
    - [Cons Of VMs](#Cons-Of-VMs)

- [References]()
    - []()

# What is Virtualization?
* __Virtualization__ is the logical division of physical computing resources. __Vurtualization__ makes a physical server into a _virtual host machine_ so that _virtual host_ can then run _guest virtual machines_. 

* __Virtualization__ started in 1960's as a way to slice up mainframe resources. There are many resources that can be virtualized:
    * server (compute), 
    * storage, and 
    * network. 
* There are many forms of _virtualization_ - including server and desktop.

* There are 2 main methods of __virtualization__, those being __Virtual Machine__ (VM) and __Docker__. Docker is more in use than virtual machines and has more uses than virtual machines but this does not mean Virtual Machines are in any way inferior today.

# What are Virtual Machines?
* A __virtual machine__ is a form of __virtualization__ that uses the operating system’s resources to run another Operating System (OS). __VMs__ are isolated from the rest of the __OS__. The software running within the VM cannot interfere with the __Main OS__. VM nowadays are used to access virus infected files and are used for testing cybersecurity practices, if something is infected only the VM would be affected but not the main system.

* __VM__ is a virtual environment that works like a computer within a computer. It runs on an isolated partition of its host computer with its own resources of CPU power, memory, an operating system (e.g. Windows, Linux, macOS), and other resources. This allows end-users to run applications on __VMs__ and use them as they normally would on their workstation. 

* The main purpose of __VMs__ is to operate multiple _operating systems_ at the same time, from the same piece of hardware. Without virtualization, operating multiple systems like Windows and Linux would require two separate physical units. Because applications run based on specific OS capabilities, businesses that use a wide array of applications might find themselves deploying many different consoles and hardware installations to manage their apps. This can become unwieldy and expensive. Hardware requires physical space that isn’t always available. Hardware also requires plenty of upkeep costs repair costs when hardware fails, maintenance costs to make sure your hardware stays in shape, and energy costs for power and cooling. Virtualization keeps costs down by placing all your OSes into a cloud-like structure, with multiple instances running on the same underlying, local hardware which eliminates the need for hardware accumulation and excessive overhead.

# Advantages Of VMs
* __It lowers hardware costs__. A person or organization does not need to invest in other hardware resources. Instead they can use virtualization.
* It increases __data security__. VMs are isolated from the main system. Many Cybersecurity companies employ the use of VMs to test their antivirus/cybersecurity applications.

# Cons Of VMs
* It can only use the __resources allocated to it__ by the system. If more than one VMs are running it can slow the system down to a halt.
* It has a slow boot up time.
* It is not very efficient. It cannot access the hardware directly.
* While a properly-structured VM can’t infect a host, a weak host system can infect its VMs. This usually happens when there are bugs in the operating system. If two or more virtual machines are connected with each other, the infections could spread to others as well.

_Remarks_:
* _VMs cause more problems than they solve. That was what people had to deal with before Docker came into being._

# What is a Hypervisor?
* __Hypervisor__ is loaded on the virtual host to run virtual machines. (i.e., _is in charge of allocating compute resources to the __VMs__ and making sure that the __VMs__ don't interfere with one another._)

_REMARK:_
* A _Virtual Machine_ runs on top of a _hypervisor_ that is loaded on a physical server.  
* _Virtual guests_ run on a _virtual host_, which provides the physical resources.
* An _operating system_ and _applications_ are loaded in the guest.

# Advantages of VMs over Containers
* __VMs__ keep different OS seperate from one another. So even if malware gets through to the OS of a VM, all other VMs on the machine remain untouched from the attack. This adds an extra level of security that can be crucial when dealing with confidential data. In the contrary, __containers__ aren't always as secure as __VMs__. If a malevolent software gets onto a containerised system and makes it through to the OS, it can potentially hijack the whole machine.

* Another advantage of __VMs__ over __containers__ is that you can use differnt OS. This is more work, of course, because you might need to implement bug fixes on each OS seperately. But if you have an application that ought to run on anything else than Linux, container's aren't the way to go.

# Advantages of Containers over VMs
* __Containers__ tend to run faster than the __VM__, and they tend to boot a lot faster than VM.

* __containers__ are great for anything with a microservice architecture, i.e., whether a single application is composed of many smaller services that are only loosely coupled and can be executed independently. Each individual service can be put in it's own container. Then, the only thing that developers need to watch out for is that the containers communicate properly among each other.


