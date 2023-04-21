# Protocol Buffers (Protobuf)

## Table Of Contents
- [Protocol Buffers (Protobuf)](#protocol-buffers-protobuf)
  - [Table Of Contents](#table-of-contents)
- [What is Protobuf?](#what-is-protobuf)
- [Why Not XML?](#why-not-xml)
- [Further Reading](#further-reading)

# What is Protobuf?
* __Protobuf__ an open source project developed by __Google__, to provide a _language-neutral_, _platform-neutral_ and _extensible mechanism_ for serializing structured data. It supports many popular languages such as C++, C#, Dart, Go, Java and Python.

* The neutral language used by __Protobuf__ allows you to model messages in a structured format through __.proto__ files:
    ```proto
        message Person {
            required string name = 1;
            required int32 age = 2;
            optional string email = 3;
        }
    ```
* _Remarks_: 
  * _In the example above we use a structure that represents a person’s information, where it has mandatory attributes, such as name and age, as well as having the optional email data. Mandatory fields, as the name already says, must be filled when a new message is constructed, otherwise, a runtime error will occur._
  * _In the first line, we define that we’re using protobuf version 3_
  * _Each field is assigned a so-called field number, which has to be unique in a message type. These numbers identify the fields when the message is serialized to the Protobuf binary format._
  * _Google suggests using numbers 1 through 15 for most frequently used fields because it takes one byte to encode them._

* Protobuf supports common scalar types like:
  *  string, 
  *  int32, 
  *  int64 (long), 
  *  double, 
  *  bool etc.
  
* Besides scalar types, it is possible to use complex data types. Below we see two schemas, Order and Product, where Order can contain zero, one or more Products:
  
    ```proto
        message Order {
            int64 order_id = 1;
            int64 date_time = 2;
            repeated Product product = 3;
        }

        message Product {
            int64 product_id = 1;
            string name = 2;
            string description = 3;
        }
    ```
# Why Not XML?
* __Protobuf__ has many advantages for serialization that go beyond the capacity of __XML__. It allows you to create a simpler description than using __XML__. Even for small messages, when requiring multiple nested messages, reading XML starts to get difficult for human eyes.
* Another advantage is the size, as the __Protobuf__ format is simplified, the files can reach 10 times smaller compared to __XML__.
* But the great benefit is its __speed__, which can reach 100 times faster than the standard XML serialization, all due to its optimized mechanism
*  In addition to size and speed, __Protobuf__ has a compiler capable of processing a __.proto__ file to generate multiple supported languages, unlike the traditional method where it is necessary to arrange the same structure in multiple source files.

# Further Reading 
- [Official Documentation - Protocol Buffers Documentation](https://protobuf.dev/overview/)