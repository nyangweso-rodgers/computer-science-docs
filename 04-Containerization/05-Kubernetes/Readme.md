# What is K8s?

- **Kubernetes** is an open-source platform for automating the **deployment**, **management**, **networking**, and **scaling** of **containerized applications** across a fleet of machines within a cluster environment. It creates an abstraction layer on a group of host machines (known as **nodes**), where software teams can deploy their applications while it manages the orchestration (automated configuration, coordination, and management).

- The core problem that **Kubernetes** is solving is the ability to manage containerized apps at scale.

# What Kubernetes Does

- **Technology Over Platform**: **Kubernetes** scales and manages **Pods**, which consist of **containers**, and **containers run applications**. The applications could be frontend apps, backend apps, scripts, or pretty much anything you’d like. Kubernetes orchestrates Pods for us by:
  - Scheduling the Pods to run on certain nodes.
  - Auto-scaling up or down, horizontally or vertically, the Pods for us.
  - Allowing the same application to run in multiple Pods with replicas.
  - Exposing Pods in the form of services so users and other Pods running inside of the Kubernetes cluster can access them.

# Kubernetes Features

1. **Self-healing**: K8s enables the killing and restarting of containers that fail user-defined health checks while isolating them from end-users reachability until they are ready to receive traffic.

2. **Automated rollouts and rollbacks**: Changes to a container application are progressively rolled out while monitoring the application health to ensure it doesn’t kill all your instances simultaneously. If something goes wrong, Kubernetes will roll back the changes.

3. **Service discovery**: Kubernetes can expose a container using the DNS name or using their own IP address. It can also automatically manage DNS records by specifying and transferring services to their required hosts.

4. **Load balancing**: Kubernetes load balances and distribute network traffic to containers to maintain stable deployment.

5. **Scaling**: Kubernetes scales your application up and down (stateful application) or in and out (stateless applications) through CLI commands, a web UI, or performance metric.

6. **Resource Monitoring and Logging**: Kubernetes monitors the state of resources within the cluster and logs their operations.

7. **Secret and configuration management**: Kubernetes allows developers to store and manage sensitive information (passwords, OAuth tokens, and SSH keys) without rebuilding container images and exposing secrets in their stack configuration.

# Definition Of Terms

## Kubernetes Cluster

- The first step in using Kubernetes is the provisioning (creation) of a cluster. A **Kubernetes cluster** is a collection of virtual or physical machines, called **nodes**, which manage and run containerized applications.
- The [nodes](https://blog.getambassador.io/getting-edgy-clusters-nodes-pods-and-containers-oh-my-f363fe4cf0c0) that make up a Kubernetes cluster are grouped into two categories: **master nodes** and **worker nodes**. The **master nodes** manage the operations within the Kubernetes cluster, while the **worker nodes** are responsible for running containerized applications.

# Resources

1. [Introduction to Kubernetes — Tutorial](https://blog.getambassador.io/an-introduction-to-kubernetes-tutorial-370789e09505)
