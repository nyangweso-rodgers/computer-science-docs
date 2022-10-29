# Virtual Machines

## Table Of Contents
- [What is Virtualization?](#What-is-Virtualization?)

- [What are Virtual Machines?](#What-are-Virtual-Machines?)
    - [Advantages Of VMs](#Advantages-Of-VMs)
    - [Cons Of VMs](#Cons-Of-VMs)

- [References]()
    - []()

# What is Virtualization?
* There are 2 main methods of __virtualization__, those being __Virtual Machine__ (VM) and __Docker__. Docker is more in use than virtual machines and has more uses than virtual machines but this does not mean Virtual Machines are in any way inferior today

# What are Virtual Machines?
* A __virtual machine__ is a form of __virtualization__ that uses the operating system’s resources to run another Operating System (OS). __VMs__ are isolated from the rest of the __OS__. The software running within the VM cannot interfere with the __Main OS__. VM nowadays are used to access virus infected files and are used for testing cybersecurity practices, if something is infected only the VM would be affected but not the main system.

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