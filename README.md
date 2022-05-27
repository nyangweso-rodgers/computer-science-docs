# Computer Science
## Table of Contents
- [Computer Science vs. Software Engineering](#Computer-Science-vs-Software-Engineering)
- [Definition of Terms in Computer Science](#Definition-of-Terms-in-Computer-Science)
    - browser
    - LocalHost
    - Secure Shell (SSH)
    - Algorithm
    - Computer Program
    - Source Code
    - Translators
    - Bytecode
- [IP Addresses](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/IP_Addresses)
- [Algorithms & Data Structures in Computer Science](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Algorithms_and_Data_Structures_in_Computer_Science)
- [Big O Notation](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Big_O_Notation)
- [Recursion in Computer Science](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Recursion_in_Computer_Science)
- [Object Oriented Programming in Computer Science](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Object_Oriented_Programming)
    - [Servers](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Servers)
        - [Web Servers](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Servers/Web_Servers  )
- [How Web Works](#How-Web-Works)
- [Microservices](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Microservices)
- [Cloud Computing](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing)
- [Data Engineering & Databases](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases)
- [Git & GitHub](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Git_and_GitHub)

# Computer Science vs Software Engineering
__Computer Science__ is the study of how computers work, mostly the theoratical and mathematical perspective. __Software Engineering__ is the study of how software systems are built, including topics such as Project Management, Quality Assurance, and Software Testing.

# Definition of Terms in Computer Science
1. __browser__: medium that allows you to make a request and lets a server serve you. It’s software installed and running on your computer that lets you search the Internet. It takes your input, creates and sends a request, gets the response and serves you.
2. __LocalHost__: refers to “_this computer_” or even more accurately “_the computer I’m working on_.” 
3. __Secure Shell (SSH)__: open-source _protocol_ used to secure network communication which is less expensive and complex than the hardware based __VPN__ solutions. i.e., it offers _authentication_, _encryption_ and _data integrity_ for securing network communicationsy. By Implementing __SSH__, we get some of the capabilities like:
    - secure command-shell
    - secure file transfer
    - remote access to a variety of __TCP/IP__ applications via a secure tunnel
4. __algorithm__ is a step by step procedure to resolve a problem. It's an effective method expressed a finite set of well-defined instructions.
5. __Computer Program__ is a sequence of instructions written using a Computer Programming Language to perform a specified task by the computer. A __computer program__ is also called a __computer software__, which can range from  two lines to millions of lines of instructions.

6. __Source Code__ is a code written in a particular programming language.

7. __Translators__: responsible for converting the __source code__ to a machine language (__binary__). __Translators__ can be any of:
    - __Interpreters__: processes the source code line by line and runs every line in the final program or app. Interpreted source code start running until it encounters an error. Then the interpreter stops to report such an error. _Python_ is a good example of an _interpreted programming language_
    - __Compilers__: convert the __source code__ in its entirety via a compilation process to binary. The __binary__ is then executed. If there were errors in the __source code__, they are detected during the compilation time and flagged. This interrupts the compilation process, and no binary is generated.
    - __Hybrid Translators__: combination of the __interpreter__ and __compiler__. A popular hybrid programming language is __Java__ which first compiles the source code to an intermediate format known as __Bytecode__. The __bytecode__ is then interpreted and executed by a runtime engine (also known an a __virtual machine__). This enables the __hybrid translators__ to run the __bytecode__ on various operating systems.
    - __Assemblers__: for translating low-level Assembly language to __binary__

8. __Bytecode__ is a program that has been _compiled_ from a _source code_ into low-level code designed for a software __interpreter__. It may be executed by a virtual machine (e.g., Java Virtual Machine) or further compiled into machine code, which is recognized by the processor. __NOTE__: _Bytecode_ is similar to __assembly language__ in that it is not a high-level language, but it is still somewhat readable, unlike __machine language__. Both may be considered "intermediate languages" that fall between source code and machine code. The primary difference between the two is that __bytecode__ is generated for a virtual machine (software), while __assembly language__ is created for a CPU (hardware).
9. __Common bugs__
    * __Syntactic Errors__: caused when one breaks the expected form or structure of the language.
    * __Semantic Errors (Logical Errors)__: the program fails to produce the desired output.
    * __Run - time Errors__: Unlike __semantic errors__, this type of error interrupt the program ad prevents it from executig further - they are usually  caused by unexpected result of some computation within the source code. e.g.,
        - ZeroDivisionError
        - StackOverflowError
        - IndexOutofBoundError
10. __Software Development Methodologies__:
    * __Waterfall Development__: You figure out everything you need to do and document them (requirements). Like a _waterfall_, there's no way to go back up unless you start over again. You move on to the next phase when current phase is completed.
    * __Agile Development__: In __Agile Development__, you figure out some of the things you need to do at the beginning. Then continously improve, evolve, collaborate and adapt as the development goes on. Some of the popular implementations of __Agile Development__ methodology include:
        - Scrum
        - Extreme Programming
        - Kanban

# References