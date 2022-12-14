# Operating Systems & Command Line

## Table Of Contents
- [Introduction to Operating Systems](#Introduction-to-Operating-Systems)
- [Evolution of O.S](#Evolution-of-O.S)
- [Types of Operating System](#Types-of-Operating-System)
   - [Windows]()
   - [Mac]()
   - [Linux](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Operating_Systems_and_Command_Line/Linux)
- [Comparison of Windows, Mac & Linux OS](#Comparison-of-Windows,-Mac-&-Linux-OS)
- [Further Reading]()
    - [Evolution of Operating Systems](https://www.notesjam.com/2017/09/evolution-of-operating-system.html)
    - [Comparison between Windows, Mac and Linx OS](https://www.educba.com/linux-vs-mac-vs-windows/)
    - [Introduction to Operating Systems](https://www.freecodecamp.org/news/an-introduction-to-operating-systems/)

# Introduction to Operating Systems
__Operating System__: set of programs that controls and supports hardware and provide various services which are used for better performance of computer. The __operating system__ acts as a link between __software__ and __hardware__. It controls and record of the execution of all other programs that are present in the computer including application programs and other system software. 

The major __functions of O.S__ are:
- it assigns processors to task
- manages memory and other storage areas
- acts as a command interpreter
- file management
- input-output management
- establish data security and integrity
- maintain account of processor time for billing purposes
- provides data and time services
- error detecting aids
- scheduling

# Evolution of O.S
1. __Distributed System__: In a __distributed operating system__, the processors cannot share a memory or a clock, each processor has its own local memory. The processor communicates with one another through various communication lines, such as high-speed buses. These systems are referred to as "Loosely Coupled" systems.
2. __Parallel System__. There is a trend multiprocessor system, such system have more than one processor in close communication, sharing the computer bus, the clock, and sometimes memory and peripheral devices. These systems are referred to as "Tightly Coupled" system. Then the system is called a __parallel system__. In the __parallel system__, a number of processors are executing there job in parallel.
3. __Time Sharing__ or __multitasking__ is a logical extension of __multiprogramming__. Multiple jobs are executed by the CPU switching between them. The CPU scheduler selects a job from the ready queue and switches the CPU to that job. When the time slot expires, the CPU switches from this job to another. In this method, the CPU time is shared by different processes. So, it is said to be "__Time-Sharing System__". Generally, time slots are defined by the operating system.
4. __Multiprogramming__ - technique to execute the number of programs simultaneously by a single processor.  In __multiprogramming__, a number of processes reside in main memory at a time. The OS(Operating System) picks and begins to execute one of the jobs in main memory. 
5. __Batch processing__: In a __Batch Operating System__, similar jobs are grouped together into __batches__ with the help of some operators and these batches are executed one by one.
6. __Serial Processing__:

# Definitions of Terms
1. __Kernel__: is the heart of any OS. It's the _piece of software that interacts the closest with the hardware and the rest of the OS sits on top of it_. The Kernel is responsible for low-level tasks such as disk management, memory management, task management, and so on.
2. __Package Manager__: piece of software that allows you to _install, update, and uninstall programs_ from the terminal, just by entering a few commands. All package managers function in a similar way, but there are some differences in the syntax used for each. It's also important to mention that you can install and run a different package manager than the default.

# Types of Operating System
1. __Windows__: Microsoft developed the Windows operating system. It was developed so as to overcome the limitation of the MS-DOS operating system.
2. __Mac__: MAC is an OS that focuses on the graphical user interface and was developed by __Apple, Inc__, for their Macintosh systems

_Remark:_
* __Linux__ and __Mac__ are built based off of __Unix__. Unix came before windows, mac, etc…. In __unix based systems__ you have whats called __kernel modules__ where in windows they’re called __kernel drivers__.
* __Windows__ is all closed source where __linux__ is fully open and mac is partially open.
* __Linux__ is free and the other two cost money.
* __Windows__ and __Mac__ are best for the general population where __linux__ is best suited for developers(Mac is good for this because it’s required for IOS programming).

# Comparison of Windows, Mac & Linux OS
1. __Release History__:
   - Windows first released in 1985. It was supposed to be a graphical user interface on top of MS-DOS. All features of MS-DOS were later integrated with Windows 95 release. It was a huge success in and led to the Windows transition.
   - This operating system from Apple stands older than Windows. It was first released in 1984. It began as a graphical user interface right from its inception. In 2005 the design and structure of MAC OS were changed to Intel x86 based architecture.
   - It was initially developed at Finnish University. It was released in 1991 and designed for GNU developers. GNU developers later integrated it into Linux. It is open to consumers, and everyone can use it as per their specifications.
2. __File systmes__: The way __Windows__ organizes files is different from the way __Mac__ and __GNU/Linux__ do. 
   - __Windows__ uses "__drives__". They're usually a __C__ and __D drive__ that store all the computer files, and separate drives for external devices such as __CDs__, __USBs__, and so on.
   - __Mac__ and __GNU/Linux__ have a similar file system that comes from __UNIX__. In these OSs there are no drives – everything in the computer is considered a file (even external devices) and all files are organized in directories that descend from a single root directory. The directory structure is formed as a tree that has a unique root.
   - This doesn't necessarily make much of a difference for the end user, but is something to keep in mind if you're used to navigating one type of file system or the other.
3. __Shells__: 
   - Both __GNU/Linux__ and __Mac__ have __Bash__ as their default shell, while Windows has its own shell that uses a different syntax. 
   - As developers and avid terminal users, learning Bash is probably the best choice as this knowledge can be more easily translated to all OSs than the Windows shell. Especially taking into account that GNU/Linux runs on most servers worldwide, which is one of the main occasions when you'd need to use the terminal to interact with the computer.
4. __Package Managers__: 
   - Mac and GNU/Linux come with package managers installed by default. They're super helpful, especially when you're installing and uninstalling things constantly, as it's much more efficient to install programs through package managers than manually. 
   - Mac's package manager is called __[homebrew](https://brew.sh/)__. On GNU/Linux, the default package manager depends on the distro. For example, __Ubuntu__ comes with [APT](https://ubuntu.com/server/docs/package-management), __Arch__ comes with [Pacman](https://wiki.archlinux.org/title/pacman), and so on.
   - __Windows__ doesn't come with a default package manager. If you want one, you need to install it first. One of the package managers available for Windows is [Chocolatey](https://docs.chocolatey.org/en-us/).
5. __Cost__:
   - most __GNU/Linux__ distros are completely free for anyone to use. 
   - Windows has a freemium model currently and 
   - MacOS runs only on Mac computers, which are quite pricey.
6. __Software compatibility__:
   - Windows is the most widely used OS, and thanks to that most software is adapted to it. Even though less popular, MacOS is similar to Windows in this regard
   - Back in the day, Linux wasn't compatible with many programs out there, but this has started to change recently, especially with the most popular distros like Ubuntu.
7. __Hardware quality and compatibility__:
   - When it comes to hardware, only Apple has direct responsibility for the computers that the OS runs on. And Apple's hardware is some of the best out there. As a company, Apple is focused on providing top quality products, so their newest computers tend to be the ones with best performance all across the market. Given that Apple designs and develops both hardware and software, it's possible that the compatibility between the machine and the OS is tuned finer than with Windows or GNU/Linux.
   - On the Windows and GNU/Linux side, hardware quality is completely up to what the user decides or can afford to buy. The good thing here is that you can install the OS wherever you want.
8. __Ease of use__: Windows and Mac are really simple and user-friendly OSs. Regarding GNU/Linux, it depends on the distro you choose. As mentioned, distros like Ubuntu are practically as easy as Windows or Mac, and others like Arch are intended for advanced computer users.
9. __Security and stability__: 
   - Some GNU/Linux distros are considered the most secure and stable ones nowadays. The fact that the code is available to everyone isn't a security threat as you may think at first – but rather it's an advantage. Bugs can be identified and worked on quicker, and when a security breach is identified lots of people can work on it and propose fixes.
   - Windows, on the other hand, is considered the least secure and stable of the three. Given that it's the most popular OS, most malware is developed to attack Windows OS too.
10. __Community and culture__: If you're interested in learning more about a particular OS, studying how it works, how to modify it and create projects based on it, GNU/Linux is definitely the way to go. It's the only one that has its code available to anyone and its online community is huge.