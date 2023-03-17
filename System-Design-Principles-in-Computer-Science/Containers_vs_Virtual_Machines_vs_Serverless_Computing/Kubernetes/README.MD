# Kubernetes

## Table Of Contents
- [References]()
    - [Introduction to Kubernetes — Tutorial](https://blog.getambassador.io/an-introduction-to-kubernetes-tutorial-370789e09505)
    - [What Problem Is Kubernetes Actually Trying To Solve?](https://dev.to/thenjdevopsguy/what-problem-is-kubernetes-actually-trying-to-solve-3g1n)
    - [Kubernetes Core Concepts - Deployments](https://blog.learncodeonline.in/kubernetes-core-concepts-deployments)
    - [Kubernetes 101 - Introduction](https://dev.to/dailydevtips1/kubernetes-101-introduction-5d9)
    - [Introduction to Kubernetes](https://medium.com/@SaadJafar/introduction-to-kubernetes-a408bc848f95)
    - [What is Kubernetes?](https://medium.com/@hassanakram61/what-is-kubernetes-8051484938dd)

# What is K8s?
* __Kubernetes__ is an open-source platform for automating the __deployment__, __management__, __networking__, and __scaling__ of __containerized applications__ across a fleet of machines within a cluster environment. It creates an abstraction layer on a group of host machines (known as nodes), where software teams can deploy their applications while it manages the orchestration (automated configuration, coordination, and management).

* The core problem that Kubernetes is solving is the ability to manage containerized apps at scale.

# What Kubernetes Does
* __Technology Over Platform__: __Kubernetes__ scales and manages __Pods__, which consist of __containers__, and __containers run applications__. The applications could be frontend apps, backend apps, scripts, or pretty much anything you’d like. Kubernetes orchestrates Pods for us by:
    - Scheduling the Pods to run on certain nodes.
    - Auto-scaling up or down, horizontally or vertically, the Pods for us.
    - Allowing the same application to run in multiple Pods with replicas.
    - Exposing Pods in the form of services so users and other Pods running inside of the Kubernetes cluster can access them.

# Key Kubernetes features
1. __Self-healing__: K8s enables the killing and restarting of containers that fail user-defined health checks while isolating them from end-users reachability until they are ready to receive traffic.

2. __Automated rollouts and rollbacks__: Changes to a container application are progressively rolled out while monitoring the application health to ensure it doesn’t kill all your instances simultaneously. If something goes wrong, Kubernetes will roll back the changes.

3. __Service discovery__: Kubernetes can expose a container using the DNS name or using their own IP address. It can also automatically manage DNS records by specifying and transferring services to their required hosts.

4. __Load balancing__: Kubernetes load balances and distribute network traffic to containers to maintain stable deployment.

5. __Scaling__: Kubernetes scales your application up and down (stateful application) or in and out (stateless applications) through CLI commands, a web UI, or performance metric.

6. __Resource Monitoring and Logging__: Kubernetes monitors the state of resources within the cluster and logs their operations.

7. __Secret and configuration management__: Kubernetes allows developers to store and manage sensitive information (passwords, OAuth tokens, and SSH keys) without rebuilding container images and exposing secrets in their stack configuration.


# Definition Of Terms
* __Kubernetes Cluster__: The first step in using Kubernetes is the provisioning (creation) of a cluster. A __Kubernetes cluster__ is a collection of virtual or physical machines, called __nodes__, which manage and run containerized applications. The [nodes](https://blog.getambassador.io/getting-edgy-clusters-nodes-pods-and-containers-oh-my-f363fe4cf0c0) that make up a Kubernetes cluster are grouped into two categories: __master nodes__ and __worker nodes__. The __master nodes__ manage the operations within the Kubernetes cluster, while the __worker nodes__ are responsible for running containerized applications.