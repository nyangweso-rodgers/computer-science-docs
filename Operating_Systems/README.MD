# Operating Systems (OS)

## Table of Contents
- [Introduction to Operating Systems](#Introduction-to-Operating-Systems)
- [Evolution of O.S](#Evolution-of-O.S)
- [Types of Operating System](#Types-of-Operating-System)
- [Types of Operating System](#Types-of-Operating-System)
- [Comparison of Windows, Mac & Linux OS](#Comparison-of-Windows,-Mac-&-Linux-OS)
- [References](#References)


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

# Types of Operating System
1. __Windows__: Microsoft developed the Windows operating system. It was developed so as to overcome the limitation of the MS-DOS operating system.
2. __Mac__: MAC is an OS that focuses on the graphical user interface and was developed by __Apple, Inc__, for their Macintosh systems
3. __Linux__: Linux is __UNIX__ like a source software and can use an operating system that provides full memory protection and multi-tasking operations. It is an open d by anyone.

_Remark:_
* __Linux__ and __Mac__ are built based off of __Unix__. Unix came before windows, mac, etc…. In __unix based systems__ you have whats called __kernel modules__ where in windows they’re called __kernel drivers__.
* __Windows__ is all closed source where __linux__ is fully open and mac is partially open.
* __Linux__ is free and the other two cost money.
* __Windows__ and __Mac__ are best for the general population where __linux__ is best suited for developers(Mac is good for this because it’s required for IOS programming).

# Comparison of Windows, Mac & Linux OS
   The basis of comparison | Windows | Mac | Linux
   |:----:|:----:|:-----:|:----:|
   Basic difference and history | Windows first released in 1985. It was supposed to be a graphical user interface on top of MS-DOS. All features of MS-DOS were later integrated with Windows 95 release. It was a huge success in and led to the Windows transition. | This operating system from Apple stands older than Windows. It was first released in 1984. It began as a graphical user interface right from its inception. In 2005 the design and structure of MAC OS were changed to Intel x86 based architecture.| It was initially developed at Finnish University. It was released in 1991 and designed for GNU developers. GNU developers later integrated it into Linux. It is open to consumers, and everyone can use it as per their specifications.
   File Structure | Windows follows a directory structure to store the different kinds of files of the user. It has logical drives and cabinet drawers. It also has folders. Some common folders like documents, pictures, music, videos, and downloads. All these files can be stored in these folders, and also new folders can be created. It also has files which can be a spreadsheet or an application program. It can have extensions as .txt, .jpg etc. In addition to this, Windows also provides a recycle bin where all deleted files can be stored. Recycle bin can be configured to increase its size. | The file structure of MAC is commonly known as MAC OS X. If you go to dig into your MAC’s hard disk through the finder, you will see many directories. The root directory of MAC may encounter when they visit their own MAC book. You can explore the file system and directory structure by going to directories like /Application, /Developer, /sbin, /tmp, etc. | Linux has a completely different file structure form Windows and MAC. It was developed with a different code base. It stores data in the form of a tree. There is a single file tree, and all your drives are mounted over this tree.
   Registry | Windows registry is a master database that is used to store all settings on your computer. It is responsible for storing all user information with its passwords, and device relate information. The registry also has an editor which allows you to view all keys and values or even drivers if necessary. | MAC stores all application settings in a series of .plist files, which have the various preferences folder in MAC. This .plist file contains all properties in either plain text or binary format. These are stored at: /Library/Preferences folder | Linux also does not have a specific registry of its own. All application setting is stored on a program basis under the different users in the same hierarchy format of the files being stored. There is no centralized database for storing these details, and so periodic cleaning is also not required.
   | Interchangeable Interfaces | Windows interface was not interchangeable until Windows 8. Windows XP had some improvements but not par. Start menu, taskbar, system tray, and Windows Explorer. | MAC has a facility to bridge virtual network interfaces. This can be done by going to system preferences and managing the interfaces. | Linux is easy to switch interfaces. You can switch the environment without having to carry all installations. There are utilities like GNOME and KDE which help in catering to these needs. They help in focusing on different aspects.
   | Command terminal | A terminal or command prompt is a black box ideally used to execute commands. It is also called the Windows Command Processor. It is used to execute commands and different batch files. It can also be used for administrative functions and troubleshoot and solve all windows issues. | MAC provides a console as a terminal application. It has a console, command line, prompt and terminal. A Command-line is used to type your commands. Prompt will provide you with some information and also enable you to run commands. A terminal is an actual interface that will provide the modern graphical user interface as well. You can find the terminal at Applications -> Utilities. | Linux also provides a terminal. You can find terminal at: Applications -> System or Applications -> Utilities. In addition to this, there is also a shell prompt. The most common shell used in bash. It defines how the terminal will behave and look when it is run. 

# References
1. [Evolution of Operating Systems](https://www.notesjam.com/2017/09/evolution-of-operating-system.html)
2. [Comparison between Windows, Mac and Linx OS](https://www.educba.com/linux-vs-mac-vs-windows/)