# Kubernetes (K8s)

## Table of Contents

# Kubernetes

- **Kubernetes** has made **container orchestration** a game-changer, allowing businesses to scale and automate their systems. **Kubernetes**, often called **K8s**, is an open-source container orchestration platform that automates the **deployment**, **scaling**, and **management** of containerized applications.

# What Kubernetes Does

- **Technology Over Platform**: **Kubernetes** scales and manages **Pods**, which consist of **containers**, and **containers run applications**. The applications could be frontend apps, backend apps, scripts, or pretty much anything you’d like. Kubernetes orchestrates Pods for us by:
  - Scheduling the Pods to run on certain nodes.
  - Auto-scaling up or down, horizontally or vertically, the Pods for us.
  - Allowing the same application to run in multiple Pods with replicas.
  - Exposing Pods in the form of services so users and other Pods running inside of the Kubernetes cluster can access them.

# Challenges with Kubernetes

1. **Complexity**: Kubernetes demands expertise in managing components like pods, services, and controllers.
2. **Overhead**: The platform is resource-intensive, often requiring substantial hardware and support tools.
3. **Tooling Ecosystem**: Additional tools like **Helm**, **Prometheus**, and **Grafana** are often needed, complicating setup and maintenance.
4. **Overkill for Small Workloads**: Kubernetes can be too complex for smaller, straightforward use cases.

# Kubernetes Features

1. **Self-healing**: K8s enables the killing and restarting of containers that fail user-defined health checks while isolating them from end-users reachability until they are ready to receive traffic.
2. **Automated rollouts and rollbacks**: Changes to a container application are progressively rolled out while monitoring the application health to ensure it doesn’t kill all your instances simultaneously. If something goes wrong, Kubernetes will roll back the changes.
3. **Service discovery**: Kubernetes can expose a container using the DNS name or using their own IP address. It can also automatically manage DNS records by specifying and transferring services to their required hosts.
4. **Load balancing**: Kubernetes load balances and distribute network traffic to containers to maintain stable deployment.
5. **Scaling**: Kubernetes scales your application up and down (stateful application) or in and out (stateless applications) through CLI commands, a web UI, or performance metric.
6. **Resource Monitoring and Logging**: Kubernetes monitors the state of resources within the cluster and logs their operations.
7. **Secret and configuration management**: Kubernetes allows developers to store and manage sensitive information (passwords, OAuth tokens, and SSH keys) without rebuilding container images and exposing secrets in their stack configuration.

# Kubernetes Concepts

## 1. Kubernetes Cluster

- The first step in using Kubernetes is the provisioning (creation) of a cluster. A **Kubernetes cluster** is a collection of virtual or physical machines, called **nodes**, which manage and run containerized applications.
- The [nodes](https://blog.getambassador.io/getting-edgy-clusters-nodes-pods-and-containers-oh-my-f363fe4cf0c0) that make up a Kubernetes cluster are grouped into two categories: **master nodes** and **worker nodes**. The **master nodes** manage the operations within the Kubernetes cluster, while the **worker nodes** are responsible for running containerized applications.

# Kubernetes Alternatives

## 1. Docker Swarm

- [Docker Swarm](https://docs.docker.com/engine/swarm/) offers container orchestration that’s tightly integrated with **Docker**, emphasizing simplicity and speed.
- **Features** include:
  - Straightforward setup with the Docker CLI.
  - Built-in load balancing and service discovery.
  - Minimal resource requirements, making it ideal for lightweight apps.
- **Ideal Use Cases**: Teams managing small-scale deployments or those already familiar with Docker.
- **Pricing**: Free as part of **Docker**, making it an excellent choice for cost-conscious teams.

## 2. Nomad by HashiCorp

- [Nomad](https://www.nomadproject.io/) is a flexible orchestrator that supports containerized and non-containerized applications, offering versatility unmatched by most competitors.
- **Features** include:
  - A single-binary architecture that minimizes operational overhead.
  - Integration with other HashiCorp tools, including **Consul** and **Vault**.
  - Support for multi-cloud environments and mixed workloads.
- **Ideal Use Cases**: Organizations already using the HashiCorp ecosystem or managing diverse workloads, such as VMs and standalone apps alongside containers.
- **Pricing**:
  - Open source: Free.
  - Enterprise: Starts at $5,000/year.

## 3. OpenShift

- [OpenShift](https://docs.openshift.com/) is a **Kubernetes**-based platform that adds enhanced developer tools and enterprise-grade security, making it a great option for businesses looking to implement Kubernetes without diving into its complexities.
- **Features** include:
  - Built-in CI/CD pipelines, making it ideal for DevOps workflows.
  - Enterprise-grade security with enhanced compliance tools.
  - Integrated logging and monitoring features to help track and manage workloads effectively.
- **Ideal Use Cases**: Enterprises looking for a Kubernetes solution with added security, compliance, and developer tools.
- **Pricing**:
  - OpenShift Origin (the community version): Free.
  - OpenShift Container Platform: Starts at approximately $10,000/year (enterprise version).

## 4. Rancher

- [Rancher](https://www.rancher.com/) simplifies **Kubernetes** management with an intuitive UI, making it easier for organizations to manage multi-cluster Kubernetes environments across multiple cloud providers.
- **Features** include:
  - Supports multi-cluster management with a focus on Kubernetes distributions.
  - Native monitoring and logging integrations.
  - Streamlined DevOps workflows that reduce management overhead.
- **Ideal Use Cases**: Teams that need to manage multiple Kubernetes clusters or use hybrid cloud environments.
- **Pricing**: Free and open-source, but support plans start at $120 per node/year.

## 5. Apache Mesos

- [Apache Mesos](https://mesos.apache.org/) is an open-source project that abstracts away the underlying infrastructure, making it a powerful solution for managing both containers and non-containerized workloads across large-scale clusters.
- **Features** include:
  - Highly scalable architecture, ideal for handling large datasets and complex workloads.
  - Supports containers, VMs, and other types of applications.
  - Provides frameworks for batch processing, analytics, and more.
- **Ideal Use Cases**: Large enterprises with varied workloads (e.g., containers, virtual machines) and massive scale.
- **Pricing**: Free and open-source.

## 6. AWS ECS (Elastic Container Service)

- [AWS ECS](https://aws.amazon.com/ecs/) is a fully managed service for running containers, primarily geared towards organizations heavily integrated with **Amazon Web Services**.
- **Features** include:
  - Fully managed service with minimal setup required.
  - Native integration with AWS services like CloudWatch and IAM.
  - Serverless compute capabilities with AWS Fargate.
- **Ideal Use Cases**: Teams that are already heavily invested in AWS and want a simplified container orchestration experience.
- **Pricing**:
  - AWS ECS: Free, but you pay for the resources used (e.g., EC2 instances or Fargate).
  - AWS Fargate: Starts at $0.04048 per vCPU per hour.

## 7. Docker Compose

- [Docker Compose](https://docs.docker.com/compose/) is a tool that allows you to define and manage multi-container **Docker** applications with ease, providing an alternative to **Kubernetes** for simpler container orchestration.
- **Features** include:
  - Define multi-container applications using a simple YAML file.
  - Supports running both development and production environments.
  - Great for local development or small-scale production environments.
- **Ideal Use Cases**: Perfect for teams that need a simple, local solution for container orchestration or small-scale production deployments where Kubernetes might be overkill.
- **Pricing**: Free, included with Docker.

# Resources and Further Reading

1. [Introduction to Kubernetes — Tutorial](https://blog.getambassador.io/an-introduction-to-kubernetes-tutorial-370789e09505)
2. [https://last9.io/blog/kubernetes-alternatives/?ref=dailydev](https://last9.io/blog/kubernetes-alternatives/?ref=dailydev)
