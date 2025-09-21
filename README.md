# Computer Science

## Table of Contents

1. [Overview Of Computer Science](#Overview-Of-Computer-Science)

2. [Software Development Concepts](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Software_Development)

3. [Operating Systems & Command Line](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Operating_Systems_and_Command_Line)

4. [Algorithms & Data Structures](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Algorithms_and_Data_Structures_in_Computer_Science)

   - [Data Structures & Algorithms with Python]()
   - [Data Structures & Algorithms with JavaScript]()
   - [Data Structures & Algorithms with Java]()4

5. [Big O Notation](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Big_O_Notation)

- [System Design Concepts](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/System_Design_Principles)

  - [APIs & Web Services](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/System_Design_Principles/APIs_and_Web_Services)
    - [RESTful APIs](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/System_Design_Principles/APIs_and_Web_Services/APIs/RESTful-APIs)
    - [WebHooks](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/System_Design_Principles/APIs_and_Web_Services/WebHooks)

- [Version Control](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Version-Control)
  - [Git](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Version-Control/Git)
    - [Git Workflows](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Version-Control/Git/Git-Workflows)
      - [Feature Branch Workflows](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Version-Control/Git/Git-Workflows/Feature-Branch-Workflow)
  - [GitHub](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Version-Control/GitHub)

# Overview Of Computer Science

- **Computer Science** is the study of how computers work, mostly the theoratical and mathematical perspective.

# Definition of Terms in Computer Science

4. **Algorithm** is a step by step procedure to resolve a problem. It's an effective method expressed a finite set of well-defined instructions.
5. **Computer Program** is a sequence of instructions written using a Computer Programming Language to perform a specified task by the computer. A **computer program** is also called a **computer software**, which can range from two lines to millions of lines of instructions.

6. **Source Code** is a code written in a particular programming language.

7. **Translators**: responsible for converting the **source code** to a machine language (**binary**). **Translators** can be any of:

   - **Interpreters**: processes the source code line by line and runs every line in the final program or app. Interpreted source code start running until it encounters an error. Then the interpreter stops to report such an error. _Python_ is a good example of an _interpreted programming language_
   - **Compilers**: convert the **source code** in its entirety via a compilation process to binary. The **binary** is then executed. If there were errors in the **source code**, they are detected during the compilation time and flagged. This interrupts the compilation process, and no binary is generated.
   - **Hybrid Translators**: combination of the **interpreter** and **compiler**. A popular hybrid programming language is **Java** which first compiles the source code to an intermediate format known as **Bytecode**. The **bytecode** is then interpreted and executed by a runtime engine (also known an a **virtual machine**). This enables the **hybrid translators** to run the **bytecode** on various operating systems.
   - **Assemblers**: for translating low-level Assembly language to **binary**

8. **Bytecode** is a program that has been _compiled_ from a _source code_ into low-level code designed for a software **interpreter**. It may be executed by a virtual machine (e.g., Java Virtual Machine) or further compiled into machine code, which is recognized by the processor. **NOTE**: _Bytecode_ is similar to **assembly language** in that it is not a high-level language, but it is still somewhat readable, unlike **machine language**. Both may be considered "intermediate languages" that fall between source code and machine code. The primary difference between the two is that **bytecode** is generated for a virtual machine (software), while **assembly language** is created for a CPU (hardware).
9. **Common bugs**
   - **Syntactic Errors**: caused when one breaks the expected form or structure of the language.
   - **Semantic Errors (Logical Errors)**: the program fails to produce the desired output.
   - **Run - time Errors**: Unlike **semantic errors**, this type of error interrupt the program ad prevents it from executig further - they are usually caused by unexpected result of some computation within the source code. e.g.,
     - ZeroDivisionError
     - StackOverflowError
     - IndexOutofBoundError
