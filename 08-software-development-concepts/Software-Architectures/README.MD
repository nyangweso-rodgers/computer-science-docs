# Software Architectures

## Table Of Contents
- [What is software architecture?](#What-is-software-architecture?)

- [What is Modularity?](#What-is-Modularity?)

- [Challenges Involved in Designing & Developing a Software Architecture](#Challenges-Involved-in-Designing-&-Developing-a-Software-Architecture)

- [Types Of Software Architecture]
    - [Microservices Architecture](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Software-Development-Concepts/Software-Architectures/Microservices-Architectures)
    - [Monotholic Architecture](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Software-Development-Concepts/Software-Architectures/Monotholic-Architectures)

- [Further Reading]()
    - [Microservices Explained – All You Ever Wanted to Know About Microservices Architecture](https://www.vsourz.com/blog/microservices-explained-all-you-ever-wanted-to-know-about-microservices-architecture/)
    - [The Software Architecture Handbook](https://www.freecodecamp.org/news/an-introduction-to-software-architecture-patterns/)

# What is software architecture?
* The __software architecture__ of a system represents the design decisions related to overall _system structure_ and _behavior_. i.e., __software architecture__ refers to how you organize stuff in the process of creating software. And "stuff" here can refer to:
    - _Implementation details_ (that is, the folder structure of your repo)
    - _Implementation design_ decisions (Do you use server side or client side rendering? Relational or non-relational databases?)
    - The _technologies_ you choose (Do you use REST or GraphQl for your API? Python with Django or Node with Express for your back end?)
    - _System design_ decisions (like is your system a monolith or is it divided into microservices?)
    - _Infrastructure_ decisions (Do you host your software on premise or on a cloud provider?)

# What is Modularity?
* When we talk about "__modularity__" in __software architecture__, we refer to the practice of dividing big things into smaller pieces. This practice of breaking things down is performed to simplify big applications or codebases.

* __Modularity__ has the following advantages:
    - It's good for dividing concerns and features, which helps with the visualization, understanding, and organization of a project.
    - The project tends to be easier to maintain and less prone to errors and bugs when it's clearly organized and subdivided.
    - If your project is subdivided into many different pieces, each can be worked on and modified separately and independently, which is often very useful.
# Challenges Involved in Designing & Developing a Software Architecture
* Known unknowns. for example, how much load will the system face in the next 3 months, year, 5 years? You know the question, but probably not the answer.

* Unknown unknowns. That is, not only do you not know all the answers that may be relevant, but you don’t even know all the questions yet.

* You are limited by your own knowledge and experience.

* It’s extremely difficult to know when to introduce an architectural element. If you act too soon, you delay the early version(s) of the product. Too late, and you suffer problems with security, maintainability, performance, scalability.

* You are often stuck supporting legacy systems that may not fully participate in the overall architecture