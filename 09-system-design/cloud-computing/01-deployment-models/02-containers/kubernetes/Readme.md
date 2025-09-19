# Kubernetes

## Table of Contents

# Kubernetes

- **Kubernetes**, also known as **K8s** (where 8 represents the number of letters between K and S!) is the most widely used and trending open source tool nowadays. It has made **container orchestration** a game-changer, allowing businesses to scale and automate their systems. **Kubernetes** is an open-source container orchestration platform that automates the **deployment**, **scaling**, and **management** of containerized applications.

- **What Kubernetes Does**

  - **Technology Over Platform**: **Kubernetes** scales and manages **Pods**, which consist of **containers**, and **containers run applications**. The applications could be frontend apps, backend apps, scripts, or pretty much anything you’d like. Kubernetes orchestrates Pods for us by:

    - Scheduling the Pods to run on certain nodes.
    - Auto-scaling up or down, horizontally or vertically, the Pods for us.
    - Allowing the same application to run in multiple Pods with replicas.

  - Exposing Pods in the form of services so users and other Pods running inside of the Kubernetes cluster can access them.

- **Challenges with Kubernetes**

  1. **Complexity**: Kubernetes demands expertise in managing components like pods, services, and controllers.
  2. **Overhead**: The platform is resource-intensive, often requiring substantial hardware and support tools.
  3. **Tooling Ecosystem**: Additional tools like **Helm**, **Prometheus**, and **Grafana** are often needed, complicating setup and maintenance.
  4. **Overkill for Small Workloads**: Kubernetes can be too complex for smaller, straightforward use cases.

- **Kubernetes Features**:

  - **Kubernetes** provides a lot of out-of-the-box features that make deployment and monitoring easier (when compared to installing and managing applications directly on physical/virtual machines), and with more power than a single container runtime such as **Docker**.
    1. **Self-healing**: K8s enables the killing and restarting of containers that fail user-defined health checks while isolating them from end-users reachability until they are ready to receive traffic.
    2. **Automated rollouts and rollbacks**: Changes to a container application are progressively rolled out while monitoring the application health to ensure it doesn’t kill all your instances simultaneously. If something goes wrong, Kubernetes will roll back the changes.
    3. **Service discovery**: Kubernetes can expose a container using the DNS name or using their own IP address. It can also automatically manage DNS records by specifying and transferring services to their required hosts.
    4. **Load balancing**: Kubernetes load balances and distribute network traffic to containers to maintain stable deployment.
    5. **Scaling**: Kubernetes scales your application up and down (stateful application) or in and out (stateless applications) through CLI commands, a web UI, or performance metric.
    6. **Resource Monitoring and Logging**: Kubernetes monitors the state of resources within the cluster and logs their operations.
    7. **Secret and configuration management**: Kubernetes allows developers to store and manage sensitive information (passwords, OAuth tokens, and SSH keys) without rebuilding container images and exposing secrets in their stack configuration.

- **K8s Architecture**:
  - When you deploy **Kubernetes**, you get a **cluster**. A **K8s cluster** consists of many different components including:
    1. Control Plane
    2. Nodes

# Kubernetes Concepts

## 1. Kubernetes Cluster

- The first step in using Kubernetes is the provisioning (creation) of a cluster. A **Kubernetes cluster** is a collection of virtual or physical machines, called **nodes**, which manage and run containerized applications.
- The [nodes](https://blog.getambassador.io/getting-edgy-clusters-nodes-pods-and-containers-oh-my-f363fe4cf0c0) that make up a Kubernetes cluster are grouped into two categories: **master nodes** and **worker nodes**. The **master nodes** manage the operations within the Kubernetes cluster, while the **worker nodes** are responsible for running containerized applications.

## 2. Control Plane (Master Node)

- The **Control Plane** controls your **K8s cluster**, and it consists of multiple components that are responsible of managing that cluster.
- Usually, all the components are installed on the same machine for simplicity, but of course control plane components can be distributed among machines within the cluster. The main components that form K8s and are related to your control plane are:
  1. **kube-api-server**: Interacting with K8s cluster is done through the **kube-api-serer** which is the primary interface to the control plane and the cluster.
  2. **etcd**: A key-value store that K8s uses as its data store for the cluster. It is high available and reliable storage for fast data access and retrieval.
  3. **kube-scheduler**: When creating and running containers, **kube-scheduler** makes sure to select the right available node to run the container.
  4. **kube-controller-manager**: Contains multiple logical controllers that handle the state of K8s objects. Some of those controllers are node-controller, job-controller, and service-account-controller.
  5. **cloud-controller-manager**: Provides an interface between K8s and different cloud platforms. It’s only used when using cloud-based resources alongside K8s.

## 3. Nodes

- One or more **nodes** can be installed, whether it be on a virtual or physical machine, depending on the cluster. Each node is managed by the **control plane**, and contains the necessary services to run **pods** and communicate directly with the control plane. These are made up of:
  1. **kubelet**: An agent that runs on each node––it communicates with the control plane to ensure that the containers run on the node as required by the control plane. Also, it reports back the state of the running containers to the control plane.
  2. **kube-proxy**: A network proxy that runs on each node and that handles network rules on nodes. These network rules allow network communication between your Pods, from network sessions inside or outside of your cluster.
  3. **container runtime**: The container runtime is the software that is responsible for running containers: you need to install a container runtime in each node within the cluster so that Pods can run there. K8s supports several container runtimes, the most popular of which are Docker & containerd.

## 4. Pods

- Every application deployed to **Kubernetes** runs inside a **pod**. A **pod** is the tiniest component of **Kubernetes**. Each **pod** gets its unique IP address assigned to it.
- When you deploy an application, you use a deployment object that creates multiple **pods** of the same application.
- Notes:
  - A **pod** is ephemeral, meaning it can get deleted at any moment. When the pod is recreated, the IP address on the pod also changes.
  - If you wanted to make a request to the specific pod, you would send a request to its designated IP address. However, once the pod gets recreated, you need to find out what’s the new IP address of the pod. Similarly, if there are multiple instances of the pod that are created with a deployment object, you would require each IP address and manually load balance them.

## 5. Kubernetes Service

- A **Kubernetes service** is an API object that helps expose the **pods** over the network. It creates a network endpoint for the different **pods** which is then used to communicate to a group of pods.
- As we discussed, **pods** are ephemeral and their IP addresses keep changing when pods are recreated. A service remains static in nature i.e, its IP addresses do not change. When we want to expose a pod to the network, we assign a service with a static IP address, which then routes the network request to the pod.

- **How does a Kubernetes Service Work?**

  - Services make use of the labels that are assigned to the pod or deployment to select the correct pod. A service object can even be configured to target a deployment, so all the pods created by a deployment will be exposed by the service object. A single service can also be used to target a group of different pods. You just need to ensure that the correct labels are being selected.
  - Let’s say that you have three different pods, with different labels. We want to create a single service that will expose all the different pods. You can create this service, by adding a common label to the pods. Let’s say that the common label is `app=demo`. The service will select and expose all the pods that have the label `app=demo`

- **Components of Kubernetes Services**:

  - When defining a **Kubernetes service**, there are a few different components that you need to configure. These configurations are defined within the YAML manifest of the service. A **service** contains the following components:
    1. **Label Selectors**: Used for selecting a single pod or a group of pods to route traffic to.
    2. **ClusterIP**: The ClusterIP is the IP address assigned to the service. This is the internal IP address that can be accessed within the cluster.
    3. **Port**: The port where their service is listening for external traffic
    4. **Target Port**: The port where the pod is listening. The traffic gets routed to the target port.
    5. **Service Type**: Defining the type of service.
    6. **Protocol**: Define the protocol that will be used by the service to handle traffic. This can be TCP, UDP, or SCTP.

- **Types of Kubernetes Services**:

  1. **ClusterIP**:

     - The **ClusterIP** is the default service type used in **Kubernetes**. When a pod is exposed to a **ClusterIP type of service**, the pod can only communicate with other pods inside the cluster. Network requests from outside the cluster will not be able to reach the pod directly.
     - The service gets exposed as a static IP address which is unique in the cluster. When other pods want to talk to the exposed pod, they will send the request to the static IP address of the service. Once the request hits the service’s endpoint, it will get forwarded to the pods selected by the service.
     - Let’s say that we have a pod called `cluster-ip-pod` and it has the labels `app=cluster-ip-demo`. We want to expose this pod within the cluster i.e, only other pods should be able to access this pod. External traffic should not be able to reach the pod. We can create this type of network by exposing this pod using a ClusterIP service.
     - We can use the following YAML to create the required service. Let’s create the service and also test if the pod is accessible or not. We will call this service as `cluster-ip-svc` and give it the proper selector i.e. `app=cluster-ip-demo`. We’ll also ensure that this service is exposed on port 80.
       ```yml
       apiVersion: v1
       kind: Service
       metadata:
       name: cluster-ip-svc
       spec:
       selector:
         app: cluster-ip-demo
       ports:
         - protocol: TCP
           port: 80
       type: ClusterIP
       ```
     - Where:
       - `name`: The name of the service
       - `selector`: The selector for the label that we want to target. In this case, we are selecting every pod that has the label `app=cluster-ip-demo`.
       - `ports`: The port and protocols where the service should expose the pod.
       - `type`: The type of service. In this case, it’s a ClusterIP service.
     - We can save the above manifest in a file called `service.yaml`, and create it using the following command
       ```sh
        kubectl apply -f service.yaml
       ```
     - The IP service has now been created and is exposing the application on port 80. But how do we ensure that the pod is actually exposed? Earlier we discussed that the ClusterIP service only enabled pod-to-pod communication. In order to validate that this pod can actually receive requests, we will have to create a new temporary pod and run a curl command through the pod.
       ```sh
        kubectl run curl-pod --image curlimages/curl --rm -it --restart=Never -- curl cluster-ip-svc
       ```
     - If the service is properly exposing the pod, you will get a response from the pod.
     - The **ClusterIP service** is useful when you wish to enable inter-pod connectivity. The different microservices that make up an entire application can be connected by using the ClusterIP service. Each microservice would have its own unique ClusterIP service. To communicate with a different microservice, it will have to talk with the ClusterIP service of that microservice.

  2. **NodePort**:

     - A **NodePort** is a type of service that lets you expose the pod to external traffic. This is one of the most basic ways to publicly expose a pod. When a **NodePort service** is created, it opens a port from the range of port 30,000 to 32,767 where the pod can be accessed.
     - Let’s try to understand how a NodePort exposes the pod by using an example.
     - Assume that the IP address of the Kubernetes cluster is `182.231.092.121`. To expose one of your pods, you create a **NodePort service**. Kubernetes automatically chooses port `31525` to expose the pod. Now, if you want to curl the pod, or access the application from a browser, you can simply use the Cluster’s IP address along with the NodePort number. Taking curl as an example, you can run the following curl command to access the pod.
       ```sh
        curl 182.231.092.121:31525
       ```
     - Similarly, you can use the same IP address `182.231.092.121:31525` to access the application from your web browser.
     - Similar to how we created **ClusterIPs**, we need to ensure that the **NodePort service** is selecting the correct labels. Let’s say that this time our application has the label `app=node-port-demo`. We can use the same YAML as before, with one key change. We will change the type of the service to a **NodePort** and update the values of the selector as well.
       ```yml
       apiVersion: v1
       kind: Service
       metadata:
       name: nodeport-svc
       spec:
       selector:
         app: node-port-demo
       ports:
         - protocol: TCP
           port: 80
       type: NodePort
       ```
     - When it comes to testing this service, we can directly run the curl command without creating a pod first. This is because a NodePort exposes the pod outside the cluster, whereas a ClusterIP service only exposes the pod internally.
     - As we discussed earlier, we only need to curl the IP address of the cluster. To find out the cluster’s IP address, you can use `kubectl get nodes -o wide`. Say that the IP address of your Kubernetes cluster is `36.173.11.4`. You can run the below curl command to test the connection to the service.
       ```sh
        curl 36.173.11.4:31843
       ```

  3. **LoadBalancer**

     - A **LoadBalancer** is also a type of service that exposes the **pod** to external traffic. As the name implies, a **LoadBalancer service** distributes the traffic between the **pods** that are targeted by the service. So for example, if you had 5 pods of the same application which were targetted by the load balancer service, the traffic would get distributed equally among the five pods. When you use a **NodePort service**, there are no such load-balancing capabilities. The traffic must be manually distributed.
     - Whenever we talk about a **LoadBalancer**, we are referring to an **External Load Balancer**. A **LoadBalancer** is usually provided by the cloud provider. It is not a **Kubernetes**, but rather, you can think of it as a VM that bridges the external world and the Kubernetes cluster.
     - If you have a Managed Kubernetes cluster that is running on a public cloud, creating a **LoadBalancer** is similar to how we created a **NodePort** and **ClusterIP service**. You need to ensure that the correct application labels are selected and that the `type` of service is set to `LoadBalancer`.
     - Let’s say that you have an application that has the label `app=loadbalancer-demo`. To create a LoadBalancer for this application, you can use the following manifest.
       ```yml
       apiVersion: v1
       kind: Service
       metadata:
       name: loadbalancer-svc
       spec:
       selector:
         app: loadbalancer-demo
       ports:
         - protocol: TCP
           port: 80
       type: LoadBalancer
       ```

  4. **ExternalName**:

     - **Kubernetes** also has a special type of service called **ExternalName** which is unique as it does not use **labels** and **selectors** like the other types of services. Instead, the service maps to a DNS name using a CNAME record.
     - Within the manifest file of the **ExternalName** service, we will have to define a DNS endpoint in the field called as `externalName`. Whenever a request is made to this service, the traffic gets routed to the DNS record that is defined in the manifest file.
     - The **ExternalName service** type is particularly useful when you wish to access a service that is hosted outside the **Kubernetes cluster**. It’s also helpful when you are trying to migrate your applications to **Kubernetes**. The **ExternalName service** helps maintain dependencies on external applications while you are migrating the applications to **Kubernetes**.

  5. **Kubernetes Ingress**:
     - **Kubernetes ingress** acts similar to a **LoadBalancer**, but it is a resource that exists within the **Kubernetes cluster** itself. It can act as the single entry point for external traffic and route the traffic to the appropriate services based on the path of the URL

## 6. Kubernetes Objects

- **Kubernetes Objects** are persistent entities in the Kubernetes system. **Kubernetes** uses these entities to represent the state of your cluster.
  ```yml
  apiVersion: v1
  kind: Pod
  metadata:
    name: nginx-pod
    namespace: dev-ns
    labels:
      type: backend
  specs:
    containers:
      - image: nginx
        name: nginx-pod
    dnsPolicy: ClusterFirst
    restartPolicy: Always
  status:
  ```

# Installing a K8s Cluster

- There are many ways to install **K8s cluster** for production, either on premise, or you can choose from many of the available public cloud K8s services, like **AKS** from **Microsoft Azure**, or **GKE** provided by **Google Cloud**. Deciding on these will depend on what your cluster needs, as well as the requirements, use case and project you are working on.
- Some ways to spin up a local K8s cluster include:
  1. [Kind](https://kind.sigs.k8s.io/): Kind is a simple tool to create and manage local Kubernetes cluster––I advise you to start with for its simplicity, and it uses Docker for spinning up the cluster.
  2. [minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download): Another Kubernetes SIG project, but quite different when compared to Kind. Kind is faster and lighter, so don’t use minikube if you have limited resources on your machine.
  3. [Kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/): Kubeadm is a tool built that provide `kubeadm init` and `kubeadm join` for starting master and worker nodes.
  4. [The hard way](https://github.com/kelseyhightower/kubernetes-the-hard-way): if you are a confident CLI user and appreciate a good challenge, this part includes installing your Kubernetes cluster from scratch, though you will need a GCP account.
  5. [K3s](https://k3s.io/): A certified Kubernetes distribution, which is highly available and lightweight with less than 40MB binary, that reduces the dependencies and steps needed to install, run and auto-update a production Kubernetes cluster, making it a great option for deploying to IoT and edge devices.

# Kubectl — The CLI

- kubectl is a tool used for accessing Kubernetes cluster. It uses the Kubernetes API to communicate with the cluster and carry out commands, it is better than using curl.
- Popular commands are:
  1. `kubectl get`: lists objects within the Kubernetes cluster.
     ```sh
      $ kubectl get <object type> <object name> -o <output> --sort-by <JSONPath> --selector <selector>
     ```
  2. `kubectl describe`: get detailed information about a given object.
     ```sh
      $ kubectl describe <object type> <object name>
     ```
  3. `kubectl create`: to create objects by providing a YAML file, with -f to create an object from a YAML descriptor stored in the file.
     ```sh
      $ kubectl create -f <file name>
     ```
  4. `kubectl apply`: same as create, but will update the object if it exists. It also stores the last-applied-configuration annotation.
     ```sh
      $ kubectl apply -f <file name>
     ```
  5. `kubectl delete`: delete objects from the cluster.
     ```sh
      $ kubectl delete <object type> <object name>
     ```

# Kubernetes Alternatives

1. **Docker Swarm**

   - [Docker Swarm](https://docs.docker.com/engine/swarm/) offers container orchestration that’s tightly integrated with **Docker**, emphasizing simplicity and speed.
   - **Features** include:
     - Straightforward setup with the Docker CLI.
     - Built-in load balancing and service discovery.
     - Minimal resource requirements, making it ideal for lightweight apps.
   - **Ideal Use Cases**: Teams managing small-scale deployments or those already familiar with Docker.
   - **Pricing**: Free as part of **Docker**, making it an excellent choice for cost-conscious teams.

2. **Nomad by HashiCorp**

   - [Nomad](https://www.nomadproject.io/) is a flexible orchestrator that supports containerized and non-containerized applications, offering versatility unmatched by most competitors.
   - **Features** include:
     - A single-binary architecture that minimizes operational overhead.
     - Integration with other HashiCorp tools, including **Consul** and **Vault**.
     - Support for multi-cloud environments and mixed workloads.
   - **Ideal Use Cases**: Organizations already using the HashiCorp ecosystem or managing diverse workloads, such as VMs and standalone apps alongside containers.
   - **Pricing**:
     - Open source: Free.
     - Enterprise: Starts at $5,000/year.

3. **OpenShift**

   - [OpenShift](https://docs.openshift.com/) is a **Kubernetes**-based platform that adds enhanced developer tools and enterprise-grade security, making it a great option for businesses looking to implement Kubernetes without diving into its complexities.
   - **Features** include:
     - Built-in CI/CD pipelines, making it ideal for DevOps workflows.
     - Enterprise-grade security with enhanced compliance tools.
     - Integrated logging and monitoring features to help track and manage workloads effectively.
   - **Ideal Use Cases**: Enterprises looking for a Kubernetes solution with added security, compliance, and developer tools.
   - **Pricing**:
     - OpenShift Origin (the community version): Free.
     - OpenShift Container Platform: Starts at approximately $10,000/year (enterprise version).

4. **Rancher**

   - [Rancher](https://www.rancher.com/) simplifies **Kubernetes** management with an intuitive UI, making it easier for organizations to manage multi-cluster Kubernetes environments across multiple cloud providers.
   - **Features** include:
     - Supports multi-cluster management with a focus on Kubernetes distributions.
     - Native monitoring and logging integrations.
     - Streamlined DevOps workflows that reduce management overhead.
   - **Ideal Use Cases**: Teams that need to manage multiple Kubernetes clusters or use hybrid cloud environments.
   - **Pricing**: Free and open-source, but support plans start at $120 per node/year.

5. **Apache Mesos**

   - [Apache Mesos](https://mesos.apache.org/) is an open-source project that abstracts away the underlying infrastructure, making it a powerful solution for managing both containers and non-containerized workloads across large-scale clusters.
   - **Features** include:
     - Highly scalable architecture, ideal for handling large datasets and complex workloads.
     - Supports containers, VMs, and other types of applications.
     - Provides frameworks for batch processing, analytics, and more.
   - **Ideal Use Cases**: Large enterprises with varied workloads (e.g., containers, virtual machines) and massive scale.
   - **Pricing**: Free and open-source.

6. **AWS ECS** (**Elastic Container Service**)

   - [AWS ECS](https://aws.amazon.com/ecs/) is a fully managed service for running containers, primarily geared towards organizations heavily integrated with **Amazon Web Services**.
   - **Features** include:
     - Fully managed service with minimal setup required.
     - Native integration with AWS services like CloudWatch and IAM.
     - Serverless compute capabilities with AWS Fargate.
   - **Ideal Use Cases**: Teams that are already heavily invested in AWS and want a simplified container orchestration experience.
   - **Pricing**:
     - AWS ECS: Free, but you pay for the resources used (e.g., EC2 instances or Fargate).
     - AWS Fargate: Starts at $0.04048 per vCPU per hour.

7. **Docker Compose**

   - [Docker Compose](https://docs.docker.com/compose/) is a tool that allows you to define and manage multi-container **Docker** applications with ease, providing an alternative to **Kubernetes** for simpler container orchestration.
   - **Features** include:
     - Define multi-container applications using a simple YAML file.
     - Supports running both development and production environments.
     - Great for local development or small-scale production environments.
   - **Ideal Use Cases**: Perfect for teams that need a simple, local solution for container orchestration or small-scale production deployments where Kubernetes might be overkill.
   - **Pricing**: Free, included with Docker.

# K8s Tools

1. [Devtron Kubernetes Dashboard](https://github.com/devtron-labs/devtron?ref=devtron.ai)

   - An open-source modern Kubernetes management solution that provides operational efficiency for your multiple Kubernetes clusters. It provides a 360-degree view of the resources of your multiple **Kubernetes clusters** enabling better oversight and control
   - With the intuitive dashboard, you can take immediate actions like visualizing and editing live manifests, checking Kubernetes events, and reviewing logs.
   - Some key highlights of Devtron's Kubernetes dashboard are:
     1. Multi-Cluster Management
     2. Advance Troubleshooting
     3. Robust Resource Base Access Control
     4. Unified Application Management

2. [OpenCost](https://github.com/opencost/opencost?ref=devtron.ai)

   - An open-source project built for monitoring and allocating cloud infrastructure and costs in real-time.
   - It is designed to help organizations monitor and manage the cost of running their applications in Kubernetes and to identify opportunities for cost savings. OpenCost can provide a detailed cost breakdown for the individual applications, components, and also the cost associated with every container, pod, and deployment. The feature of providing real-time cost visibility allows organizations to monitor and visualize the cost of large Kubernetes environments where understanding resource utilization becomes a challenge. The detailed breakdown of cost OpenCost helps users to identify opportunities for cost savings and to make informed decisions.
   - Some features of OpenCost are:
     1. Real-time cost visibility for Kubernetes cluster, node, namespace, controller kind, service, and pod.
     2. Supports multi-cloud cost monitoring.
     3. Dynamic on-demand k8s asset pricing enabled by integrations with AWS, Azure, and GCP billing APIs.
     4. Supports on-prem Kubernetes clusters with custom CSV pricing

3. [vClusters](https://github.com/loft-sh/vcluster?ref=devtron.ai)

   - **vCluster** aka **Virtual Cluster** is a tool that creates fully functional multiple **Kubernetes clusters** inside your physical Kubernetes cluster. Unlike physical Kubernetes clusters, vClusters are lightweight and share the underlying host cluster's resources while maintaining complete logical separation. The virtual cluster enables teams to run multiple, isolated Kubernetes control planes on a single host cluster, making it ideal for development environments, testing, and multi-tenant scenarios. vCluster reduces infrastructure costs and complexity by eliminating the need for separate physical clusters while providing users with full administrative capabilities and a native Kubernetes experience.
   - Some features of vCluster are:
     1. **Isolation**: vCluster provides complete logical isolation between virtual clusters while running within shared boundaries. Each vCluster operates with its control plane components, allowing teams full administrative access without affecting other virtual clusters or the host cluster.
     2. **Resource Efficiency**: vCluster significantly reduces infrastructure costs by eliminating the overhead of running separate physical clusters. It intelligently shares the host cluster's compute resources, storage, and networking infrastructure while maintaining only essential control plane components for each virtual cluster.
     3. **Scalability**: **vClusters** can be rapidly created and destroyed on demand, making them highly scalable for dynamic environments. Organizations can easily spin up new development environments, testing spaces, or temporary clusters without provisioning additional infrastructure.
     4. **Lightweight**: The vCluster architecture is intentionally minimalistic, running only essential Kubernetes components. Each virtual cluster maintains a small footprint by using a streamlined control plane and sharing the host cluster's worker nodes.

4. [Silver Surfer](https://github.com/devtron-labs/silver-surfer?ref=devtron.ai)

   - **Silver Surfer** is an open-source **Kubernetes** utility that simplifies the critical process of Kubernetes version upgrades. It acts as an intelligent API version validator and migration assistant, helping DevOps teams identify and resolve deprecated API versions across their Kubernetes manifests and resources. By automatically analyzing your Kubernetes objects and providing clear migration paths, Silver Surfer ensures smooth cluster upgrades while minimizing the risk of version incompatibility issues. This tool is particularly valuable for organizations managing large-scale Kubernetes deployments where manual API version verification would be time-consuming and error-prone

5. [Neuvector](https://github.com/neuvector/neuvector?ref=devtron.ai)

   - **NeuVector** is an open-source container security platform that provides full lifecycle container security, focusing on cloud-native applications and Kubernetes environments. It offers real-time vulnerability scanning, compliance monitoring, and network security through a zero-trust security model. The platform is particularly known for its container firewall capabilities and ability to protect containerized applications from development through production.
   - Key features of NeuVector include:
     1. CI/CD Vulnerability Management
     2. Violation Protection
     3. Threat Detection
     4. Run-time Vulnerability Scanning
     5. Multi-cluster Management
     6. Compliance & Auditing

6. [Autocert](https://github.com/neuvector/neuvector?ref=devtron.ai)

   - **Autocert** is a Kubernetes add-on that injects the TLS/HTTPS certificates into your containers, to let them communicate with each other in a secure way. It emerged as a response to the growing complexity of managing certificates in modern, distributed systems and cloud environments. The tool automates the entire certificate lifecycle, from initial request and validation to installation, monitoring, and renewal.
   - Autocert addresses several critical challenges like Certificate Management Overhead, Security Compliance, and Scalability.
   - Some features of Autocert are:
     1. Fully Featured Private CA: Provides a complete private Certificate Authority for managing certificates across Kubernetes and other environments.
     2. RFC5280 Compliance: Issues certificates that adhere to RFC5280 and CA/Browser Forum standards, ensuring compatibility for TLS.
     3. Namespaced Installation: Installs in a dedicated namespace, enhancing security by allowing easy access control to the CA.
     4. Short-Lived Certificates: Automatically generates and renews short-lived certificates, streamlining certificate management.
     5. Secure Key Management: Ensures private keys are never sent over the network or stored in etcd, enhancing security

7. [Stern](https://github.com/stern/stern?ref=devtron.ai)

   - **Stern** is an open-source tool designed for Kubernetes that simplifies the process of tailing logs from multiple pods and containers in real time. It aggregates logs into a single stream, featuring advanced filtering options and color-coded outputs for easier debugging and monitoring. Stern dynamically adapts to changes in the pod environment, automatically adding new logs and removing those from deleted pods, making it an essential tool for DevOps engineers looking to enhance their log management workflows.

8. [Sloop](https://github.com/salesforce/sloop?ref=devtron.ai)

   - **Sloop** is a **Kubernetes** history visualization tool that records and visualizes changes in events and resource states, aiding in the debugging of past incidents. Key features include the ability to inspect non-existent resources, timeline displays for resource rollouts, and support for debugging transient errors. Sloop operates as a self-contained service without dependencies on distributed storage, making it easy to install via Helm charts or precompiled binaries. It also offers advanced features like backup and restore capabilities, event filtering, and integration with Prometheus for performance metrics.

9. [Winter Soldier](https://github.com/devtron-labs/winter-soldier?ref=devtron.ai)

   - **Winter Soldier** is an open-source tool that enables time-based scaling of your **Kubernetes** infrastructure. The time-based autoscaling of Winter Soldier scales your workloads according to the pre-defined time. The most effective way to use Winter Soldier and its time-based autoscaling is where you know the exact pattern of incoming traffic for your services. The time-based scaling also aligns with the goal of cost optimization where by utilizing the pattern of your traffic the Kubernetes infrastructure can be scaled.
   - The Winter Soldier can be deployed to execute things such as:
     1. Batch deletion of the unused resources
     2. Time-based Scaling of Kubernetes workloads

10. [Harbor](https://github.com/goharbor/harbor?ref=devtron.ai)
    - **Harbor** is an open-source artifact registry that helps you to securely store your container images. What makes Harbor special is its policies and role-based access control which ensures the images are scanned for vulnerabilities and image signatures are trusted. With Harbor, you can set policies for your images, scan them for vulnerabilities, and manage access through role-based controls. This makes it an essential tool for developers looking to ensure their container images are both secure and well-managed.
    - Key features of Harbor include:
      1. Self-Hosting: Users can deploy their own Harbor registry instance, allowing for complete control over their container images and security policies. Also by configuring a Self-hosted harbor registry users can execute secure deployments to air-gapped environments.
      2. Security Features: Implements access policies, vulnerability scanning, and image signing to ensure that only trusted images are used in production

# Resources and Further Reading

1. [devtron - 11 Promising Kubernetes Tools in 2025](https://devtron.ai/blog/11-promising-kubernetes-tools-in-2025/?ref=dailydev)
2. [Introduction to Kubernetes — Tutorial](https://blog.getambassador.io/an-introduction-to-kubernetes-tutorial-370789e09505)
3. [https://last9.io/blog/kubernetes-alternatives/?ref=dailydev](https://last9.io/blog/kubernetes-alternatives/?ref=dailydev)
4. [devtron - Kubernetes Services: What it is, Types and Examples](https://devtron.ai/blog/understanding-kubernetes-services/?ref=dailydev)
5. [Medium - Getting Started with K8s: Core Concepts](https://edgehog.blog/getting-started-with-k8s-core-concepts-135fb570462e)
