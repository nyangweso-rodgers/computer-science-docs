# A System Design: Load Balancer Concepts

## What is a Load Balancer?
__Load Balancer__ is a critical component of any distributed system which sits between a client and server, accepts incoming requests, and routes them across a cluster of servers to handle the load.

A __load balancer__ keeps track of health status of all the servers connected. If a particular server is unhealthy, then it will not send incoming requests  to that server.

## Benefits of a load balancer
1. Faster user experience
2. Less downtime and high thorughput. If a particular server is down, LB takes care of routing the traffic to the ones which are up.
3. Reduces individual server load and prevents any one application server from becoming a single point of failure.
4. Improves response time
5.  Improves overall system availability.

## Routing algorithm used:
A __load balancer__ can use any of the below algorithms to decide where to route the next incoming request. The algorithms used depend on the use case:

## 1. Least Connection Method
Route traffic to the server with the fewest active connections.
## 2. Least Response Time Method.
Route traffic to the server with the fewest active connections and the lowest average response time.
## 3. Least Bandwidth Method
Route traffic to the server that is currently serving the least amount of traffic measured in megabits per second (Mbps)
## 4. Round Robin
Routes through a list of servers and sends each new requst to the next server. When it reaches the end of the list, it starts over at the beginning.
## 5. Weighted Rounded Robin Method
The weighted round robin scheduling is designed to better handle servers with different processing capacities. Each server is assigned a weight (an integer that indicates the processing capacity). Servers with higher weights receive new connections before those with less weight and servers with higher weights get more connections than those with less weights.
## 6. IP Hash
Under this method, a hash of the IP address of the client is calculated to redirect the request.