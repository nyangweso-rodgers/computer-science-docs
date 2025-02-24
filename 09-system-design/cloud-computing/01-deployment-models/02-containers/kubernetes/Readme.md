# Kubernetes

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
