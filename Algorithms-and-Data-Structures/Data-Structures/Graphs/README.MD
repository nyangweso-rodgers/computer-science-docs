# Graphs

## Table Of Contents

# Graphs Data Strucure
* are used to represent many real-life applications like networks, transportation paths of a city and social networks like __facebook__ where each person represent a single __node__.

* A __graph__ is a set of connected __nodes__ where each node is called a __vertex__ and the connection between two of them is called an __Edge__.


# undirected vs. directed graphs
* In __undirected graphs__, the __edges__ do not have directions (==>) id the vertex __u__ is connected to __v__, then __v__ is connected to __u__. They are usually drawn with straigh lines between the verteces (no arrows). __example__: on __facebook__, if a user A friend to user B, then automatically menas user B is a friend of user A.

* In __directed graphs__, each __edge__ has a defined direction which is usually represented with arrays. Having __u__ connected to __v__ does not necessarily mean that __v__ is connected to __u__. __example__: on __twitter__, if user A follows user B, then B does not necessarily follow user A back.

# Implementation of graphs
* Adjacency Matrix
* Adjacency List