# Serverless Computing

## Table Of Contents

# Concepts

## AWS VPC – Regional Networking

- **AWS** uses a **regional VPC model**. When you create a **VPC** in AWS, it’s tied to one region, and it cannot span multiple regions. This means:

  - If you have deployments in `us-east-1`, `us-west-1`, and `eu-west-1`, you must create three separate VPCs.
  - Each **VPC** has its own CIDR block (for example, `10.0.0.0/16` in `us-east-1`, `10.1.0.0/16` in `us-west-1`, `10.2.0.0/16` in `eu-west-1`).
  - Cross-region communication requires VPC Peering or an AWS Transit Gateway.

- **Key Characteristics of AWS VPC**:

  1. One VPC per region
  2. **Subnets** belong to Availability Zones within that region
  3. Manual setup required for cross-region routing
  4. Security groups and NACLs (network ACLs) are managed on a per-VPC basis

- **Limitations of AWS’s Regional Model**:

  1.  Scaling to new regions requires creating a new VPC and repeating network configuration.
  2.  Overlapping CIDRs can prevent direct VPC Peering.
  3.  Inter-region traffic is billed per GB, increasing costs for global apps.
  4.  Security rules must be duplicated in each region.

- **Remarks**:
  - Despite the above challenges, **AWS VPC** is popular for fine-grained control and region-specific isolation, which can be useful for certain compliance needs.

# AWS Services

# 1. Container Services

- **AWS** provides three primary options for running containers:
  1. ECS (Elastic Container Service),
  2. EKS (Elastic Kubernetes Service),
  3. Fargate.

## 1.1 ECS (Elastic Container Service)

- A fully managed container orchestration service designed to run Docker containers on AWS using **EC2** or **AWS Fargate**.
- **When to Use ECS**

  1. When you want a simple way to run containers without managing Kubernetes complexity.
  2. When your workloads are primarily on AWS and don’t require multi-cloud portability.
  3. If you need deep integration with AWS services like ALB, IAM, and CloudWatch.
  4. If you prefer managing infrastructure with AWS-native services rather than Kubernetes.

- **Pros of ECS**

  1. Fully managed by AWS, reducing operational overhead.
  2. Deep integration with AWS services (IAM, CloudWatch, ELB, etc.).
  3. Simpler than **Kubernetes**, making it easier for teams unfamiliar with K8s.
  4. Supports both **EC2** launch type (self-managed instances) and **Fargate** launch type (**serverless**).

- **Cons of ECS**

  1.  Limited to AWS, making multi-cloud deployments harder.
  2.  Less flexibility compared to Kubernetes in managing containerized workloads.

- When you run **ECS**, you have two launch types:

  1. **EC2 launch type** → you manage the EC2 instances.
  2. **Fargate launch type** → AWS manages compute for you.

- **Cost Implications**
  - **ECS** on **EC2**: Pay for EC2 instances + EBS storage + networking.
  - **ECS** on **Fargate**: Pay per vCPU and memory usage (serverless).
  - Lower operational costs compared to EKS due to simplified management.

## 1.2 Amazon EKS (Elastic Kubernetes Service)

- A fully managed **Kubernetes** service to run and scale containerized applications using Kubernetes.
- **When to Use EKS?**
  ✔️ If you need Kubernetes’ flexibility, portability, and ecosystem support.
  ✔️ When running multi-cloud or hybrid Kubernetes clusters.
  ✔️ If you require Kubernetes-native tools (kubectl, Helm, Istio, etc.).
  ✔️ When you have existing Kubernetes workloads and want to migrate to AWS.

- **Pros of Amazon EKS**:

  - Kubernetes-native, allowing multi-cloud portability.
  - Strong ecosystem of Kubernetes tools and extensions.
  - Provides full control over networking, security, and storage.
  - Integrates with AWS services (IAM, ALB, CloudWatch) while maintaining Kubernetes compatibility.

- **Cons of Amazon EKS**:

  - More complex than **ECS**; requires Kubernetes expertise.
  - Higher operational overhead (managing nodes, upgrades, etc.).

- **Cost Implications**
  - EKS Control Plane: $0.10 per hour per cluster (~$72/month).
  - Worker Nodes on EC2: Pay for EC2 instances + EBS storage + networking.
  - EKS on Fargate: Pay per vCPU and memory, no EC2 costs.
  - Generally more expensive than **ECS** due to additional overhead and control plane costs.

## 1.3 AWS Fargate (Serverless for Containers)

- A serverless compute engine that runs **containers** without managing infrastructure. Works with both **ECS** and **EKS**.
- **When to Use Fargate?**
  ✔️ If you want serverless containers without managing **EC2** instances.
  ✔️ When you need fast autoscaling for unpredictable workloads.
  ✔️ If your team lacks infrastructure management expertise.
  ✔️ For short-lived, bursty workloads or microservices that scale up and down frequently.

- **Pros**:

  - No need to manage underlying **EC2** instances.
  - Auto-scales without worrying about instance provisioning.
  - Reduces operational complexity and infrastructure maintenance.

- **Cons**:

  - Higher cost than self-managed **EC2** instances.
  - Limited control over underlying infrastructure.
  - Not ideal for high, predictable workloads due to cost.

- **Cost Implications**
  - Pay for vCPU and memory used per second.
  - More expensive than EC2-based deployments but eliminates ops costs.
  - No control plane fee for ECS on Fargate, but EKS on Fargate still incurs the $0.10/hour control plane charge.

## EC2 (Elastic Compute Cloud)

- It’s AWS’s raw virtual machine service. You launch and manage servers (instances) directly.

# Resources and Further Reading
