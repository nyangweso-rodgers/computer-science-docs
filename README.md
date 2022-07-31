# Computer Science
## Table of Contents
1. [Computer Science vs. Software Engineering](#Computer-Science-vs-Software-Engineering)
2. [Definition of Terms in Computer Science](#Definition-of-Terms-in-Computer-Science)
    - LocalHost
    - Secure Shell (SSH)
    - Algorithm
    - Computer Program
    - Source Code
    - Translators
    - Bytecode
    - Common Bugs
    - Software Development Methodologies
    - Test Driven Development
    - Scrum
    - Software Testing
    - Cyber Security
    - DevOps

3. [Operating Systems & Command Line](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Operating_Systems_and_Command_Line)
    - [Operating Systems](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Operating_Systems_and_Command_Line)
    - [Command Line](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Operating_Systems_and_Command_Line/Command_Line)

4. [IP Addresses](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/IP_Addresses)

5. [Algorithms & Data Structures](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Algorithms_and_Data_Structures_in_Computer_Science)
    - [Data Structures & Algorithms with Python]()
    - [Data Structures & Algorithms with JavaScript]()
    - [Data Structures & Algorithms with Java]()4

6. [Big O Notation](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Big_O_Notation)
- [Recursion in Computer Science](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Recursion_in_Computer_Science)
    - [Recursion in JavaScript](https://github.com/nyangweso-rodgers/JavaScript_Projects/tree/main/Recursion_in_JavaScript)
    - [Recursion in Python]()

- [Object Oriented Programming](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Object_Oriented_Programming)
    - [OOP with Python]()
    - [OPP with JavaScript](https://github.com/nyangweso-rodgers/JavaScript_Projects/tree/main/Object_Oriented_Programming_in_JavaScript)

- [Servers](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Servers)
     - [Web Servers](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Servers/Web_Servers)

- [Microservices](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Microservices)

- [Data Serialization Languages](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Serialization_Languages)
    - [JSON](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Serialization_Languages/JSON)
    - [XML](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Serialization_Languages/XML)
    - [YAML](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Serialization_Languages/YAML)
    
- [APIs & Web Services]()
    - [How the Web Works]()
    - [Servers]()
        - [Web Servers]()
    - [HTTPS]()
    - [Web Servers]()
    - [REST APIs]()
    - [SOAP APIs]()
    - [GraphQL]()
    - [Curl]()
    - [Webhooks]()
    - [APIs with Python]()
    - [APIs with JavaScript]()


- [Cloud Computing](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing)
    - [GCP]()
        - [BigQuery](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/Google_BigQuery)
    - [Microsoft Azure]()
    - [AWS]()

- [Data Engineering & Databases](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases)
    - [Apache Kafka](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/Apache_Kafka)
    - [ERPNext](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/ERPNext)
    - [Google BigQuery](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/Google_BigQuery)
    - [MariaDB](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/MariaDB)
    - [MySQL](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/MySQL)
    - [PostgreSQL](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/PostgreSQL)
    - [SQL Servers](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/SQL_Servers)
    - [Snowflake](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Engineering_and_Databases/Snowflake)

- [Virtual Envrionments]()   
    - [Python Virtual Environment]()
    - [JavaScript Virtual Environment]()
    
- [Git & GitHub](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Git_and_GitHub)
- [References](#References)

# Computer Science vs Software Engineering
__Computer Science__ is the study of how computers work, mostly the theoratical and mathematical perspective. __Software Engineering__ is the study of how software systems are built, including topics such as Project Management, Quality Assurance, and Software Testing.

# Definition of Terms in Computer Science
2. __LocalHost__: refers to “_this computer_” or even more accurately “_the computer I’m working on_.” 
3. __Secure Shell (SSH)__: open-source _protocol_ used to secure network communication which is less expensive and complex than the hardware based __VPN__ solutions. i.e., it offers _authentication_, _encryption_ and _data integrity_ for securing network communicationsy. By Implementing __SSH__, we get some of the capabilities like:
    - secure command-shell
    - secure file transfer
    - remote access to a variety of __TCP/IP__ applications via a secure tunnel
4. __Algorithm__ is a step by step procedure to resolve a problem. It's an effective method expressed a finite set of well-defined instructions.
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
11. __Test Driven Development (TDD)__: means that you write tests before you write the code, which is why you cannot retroactively apply TDD to an existing project. __Steps in TDD__ involves:
    * Write a test that tests a specific part of the user story or feature you are developing
    * Run the test. It should fail right now, because you haven't written any code yet. If your test doesn't fail your existing code already behaves correctly or more likely your test doesn't test anything.
    * Make the simplest possible change to your code that ensures the test succeeds. It's important that you do not make changes that go beyond your test, even if you know that you're going to change that later. This ensures that you do not introduce behavior that is untested because in TDD your tests are a major part of your documentation. It is also important that you do not touch anything that is unrelated to the test your trying to satisfy.
    * Run your test again. It should now succeed. But if it fails go back to 1. Make sure that your test is actually correct before you try to find the problem in your code.
    * When your test is satisfied refactor your code. Since in step 3 you did not touch anything unrelated to the test you may have introduced code smells. But because all of your existing code is now fully covered by tests (one of the reasons why TDD would be used in the first place) you can now safely reorganize it, and as long as your tests still succeed you're doing it right.
12. __Scrum__: is a _lightweight framework that helps people, teams and organizations generate value through adaptive solutions for complex problems._ i.e., __Scrum__ requires a __Scrum Master__ to foster an environment where:
    * A __Product Owner__ orders the work for a complex problem into a __Product Backlog__.
    * The __Scrum Team__ turns a selection of the work into an Increment of value during a Sprint.
    * The __Scrum Team__ and its stakeholders inspect the results and adjust for the next Sprint.
    * Repeat

    _Remarks_:
    * __Scrum__ employs an iterative, incremental approach to optimize predictability and to control risk. Scrum engages groups of people who collectively have all the skills and expertise to do the work and share or acquire such skills as needed.
    * __Scrum Values__:These 5 values give direction to the __Scrum Team__ with regard to their work, actions, and behavior.
        - __Commitment__: _The Scrum Team commits to achieving its goals and to supporting each other._
        - __Focus__: _Their primary focus is on the work of the Sprint to make the best possible progress toward these goals_
        - __Openness__: _The Scrum Team and its stakeholders are open about the work and the challenges._ 
        - __Respect__: _Scrum Team members respect each other to be capable, independent people, and are respected as such by the people with whom they work_
        - __Courage__: _The Scrum Team members have the courage to do the right thing, to work on tough problems._
    * __Scrum Team__ consists of:
        - __Scrum Master__: is _accountable for establishing Scrum as defined in the Scrum Guide_. They do this by helping everyone understand Scrum theory and practice, both within the Scrum Team and the organization. 
        - __Product Owner__: _accountable for maximizing the value of the product resulting from the work of the Scrum Team_ 
        - __Developers__: _are the people in the __Scrum Team__ that are committed to creating any aspect of a usable Increment each Sprint._
13. __Software Testing__: there are two type of Software Testing:
    * __Unit Testing__: is done by developers - once the __Unit Testing__ status is passed they will share the build with the __QA team__ for further testing. __UNIT TESTING__ is a level of software testing where individual units/ components of a software are tested. The purpose is to _validate that each unit of the software performs as designed_. A __unit__ is the _smallest testable part of any software_. It usually has one or a few inputs and usually a single output. In procedural programming, a unit may be an individual program, function, procedure, etc.

        __Benefits of Unit Testing__:
        * Improves the quality of code
        * Restructuring and changes in the code are made easier by the developer and makes the integration easier
        * Bugs in the software are identified and resolved in the early stage in the software development lifecycle
        * As the bugs are identified and resolved at the earliest, time and costs are reduced

    * __Regression Testing__: Let’s assume that there is an application which maintains the details of all the students in school. This application has four buttons __Add__, __Save__, __Delete__ and __Refresh__. All the buttons functionalities are working as expected. Recently a new button ‘__Update__’ is added in the application. This ‘__Update__’ button functionality is tested and confirmed that it’s working as expected. But at the same time, it becomes very important to know that the introduction of this new button should not impact the other existing buttons functionality. Along with the ‘__Update__’ button, all the other buttons functionality are tested in order to find any new issues in the existing code. This process is known as __regression testing__.
14. __Cyber Security__ is the ability to protect or defend the use of an enterprse's internet-connected systems and data from attack.
15. __DevOps__ Cultural thing and a new way of working.

# References
1. [Scrum Guide](https://scrumguides.org/scrum-guide.html)