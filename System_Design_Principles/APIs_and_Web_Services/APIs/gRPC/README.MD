# gRPC

## Table of Contents
1. [Overview of gRPC](#Overview-of-gRPC)
2. [Pros](#Pros)
3. [Cons](#Cons)
4. [Use Cases of gRPC](#Use-Cases)

# Overview of gRPC
* In __gRPC__, RPC stands for __Remote Procedure Call__ and refers to something that can execute a function housed elsewhere but in a different context. 
* The ‘g’ appended at the beginning narrows things down to the most advanced version developed by Google back in 2015. A user on one side will select a remote procedure to execute, serialize the necessary parameters and then append any additional information into the message. This will then be sent to the server, which interacts with the other application, decoding the message and executing the operation. A result then comes back to the initial user.

# Pros
* This is a powerful form of API because of its simplicity. It’s straightforward, using GET to fetch information and POST for everything else. This means that functions are easy to add, and for lightweight payloads, you get great performance overall. The ability to define any type of function makes it infinitely configurable. Essentially you’re limited only by your imagination.

# Cons
* Where gRPC falls short is in the fact that it’s tightly coupled to the underlying system, which restricts its reusability in many cases. In addition, there is no abstraction layer sitting between the API and the actual system functions, which can raise security concerns.

# Use Cases
* Typical use cases include command APIs that send simple requests to remote systems and customer-specific APIs, which help manage internal microservices at scale with great speed. By simplifying otherwise complex remote calls, gRPC has also become a staple of the Docker-based application world, proving its value when you have massive numbers of remote calls to execute.