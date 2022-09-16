# Protocol Buffers (Protobuf)

## Table Of Contents
- [What is Protobuf?](#What-is-Protobuf?)
    - [Why Not XML?](#Why-Not-XML?)
- [References]()
    - https://developers.google.com/protocol-buffers/docs/overview

# What is Protobuf?
__Protobuf__ (__Protocol Buffers__) s an open source project developed by __Google__, to provide a _language-neutral_, _platform-neutral_ and _extensible mechanism_ for serializing structured data. It supports many popular languages such as C++, C#, Dart, Go, Java and Python.

The neutral language used by __Protobuf__ allows you to model messages in a structured format through .proto files:
```proto
    message Person {
        required string name = 1;
        required int32 age = 2;
        optional string email = 3;
    }
```
_Remark_: _In the example above we use a structure that represents a person’s information, where it has mandatory attributes, such as name and age, as well as having the optional email data. Mandatory fields, as the name already says, must be filled when a new message is constructed, otherwise, a runtime error will occur._

# Why Not XML?
* __Protobuf__ has many advantages for serialization that go beyond the capacity of __XML__. It allows you to create a simpler description than using __XML__. Even for small messages, when requiring multiple nested messages, reading XML starts to get difficult for human eyes.
* Another advantage is the size, as the __Protobuf__ format is simplified, the files can reach 10 times smaller compared to __XML__.
* But the great benefit is its __speed__, which can reach 100 times faster than the standard XML serialization, all due to its optimized mechanism
*  In addition to size and speed, __Protobuf__ has a compiler capable of processing a __.proto__ file to generate multiple supported languages, unlike the traditional method where it is necessary to arrange the same structure in multiple source files.