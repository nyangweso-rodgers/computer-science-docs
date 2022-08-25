# System Design

## Table of Contents
- [Vertical vs. Horizontal Scaling](#Vertical-vs.-Horizontal-Scaling)
    - [Disadvantages to Vertical Scaling](#Disadvantages-to-Vertical-Scaling)

# Vertical vs. Horizontal Scaling
* __Vertical scaling__ involves adding more resources to a machine. E.g., suppose you have a traditional database server which is starting to get overloaded. The way to get this solved is to simply increase the resources (CPU, RAM, SSD) on the server.

* __Horizontal scalability__ is solving the same problem by throwing more machines at it. Adding a new machine does not require downtime nor are there any limits to the amount of machines you can have in your cluster. The catch is that not all systems support horizontal scalability, as they are not designed to work in a cluster and those that are are usually more complex to work with.

# Disadvantages to Vertical Scaling
* There are limits defined by the hardware. You cannot scale upwards indefinitely.
* It usually requires downtime, something which big corporations cannot afford.