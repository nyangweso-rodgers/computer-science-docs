# Virtual Machines

## Table of Contents

# What are Virtual Machines?

- A **virtual machine** is a form of **virtualization** that uses the operating system’s resources to run another Operating System (OS). **VMs** are isolated from the rest of the **OS**. The software running within the VM cannot interfere with the **Main OS**. VM nowadays are used to access virus infected files and are used for testing cybersecurity practices, if something is infected only the VM would be affected but not the main system.

- **VM** is a virtual environment that works like a computer within a computer. It runs on an isolated partition of its host computer with its own resources of CPU power, memory, an operating system (e.g. Windows, Linux, macOS), and other resources. This allows end-users to run applications on **VMs** and use them as they normally would on their workstation.

- The main purpose of **VMs** is to operate multiple OS at the same time, from the same piece of hardware. Without virtualization, operating multiple systems like Windows and Linux would require two separate physical units. Because applications run based on specific OS capabilities, businesses that use a wide array of applications might find themselves deploying many different consoles and hardware installations to manage their apps. This can become unwieldy and expensive.

# Advantages Of VMs

- **It lowers hardware costs**. A person or organization does not need to invest in other hardware resources. Instead they can use virtualization.
- It increases **data security**. VMs are isolated from the main system. Many Cybersecurity companies employ the use of VMs to test their antivirus/cybersecurity applications.

# Cons Of VMs

- It can only use the **resources allocated to it** by the system. If more than one VMs are running it can slow the system down to a halt.
- It has a slow boot up time.
- It is not very efficient. It cannot access the hardware directly.
- While a properly-structured VM can’t infect a host, a weak host system can infect its VMs. This usually happens when there are bugs in the operating system. If two or more virtual machines are connected with each other, the infections could spread to others as well.

# What is a Hypervisor?

- **Hypervisor** is loaded on the virtual host to run VMs. (i.e., is in charge of allocating compute resources to the **VMs** and making sure that the **VMs** don't interfere with one another.)

- **Remarks**

  - A VM runs on top of a _hypervisor_ that is loaded on a physical server.
  - Virtual guests run on a _virtual host_, which provides the physical resources.
  - An os and _applications_ are loaded in the guest.

# Advantages of VMs over Containers

- **VMs** keep different OS seperate from one another. So even if malware gets through to the OS of a VM, all other VMs on the machine remain untouched from the attack. This adds an extra level of security that can be crucial when dealing with confidential data. In the contrary, **containers** aren't always as secure as **VMs**. If a malevolent software gets onto a containerised system and makes it through to the OS, it can potentially hijack the whole machine.

- Another advantage of **VMs** over **containers** is that you can use differnt OS. This is more work, of course, because you might need to implement bug fixes on each OS seperately. But if you have an application that ought to run on anything else than Linux, container's aren't the way to go.

# Resources
