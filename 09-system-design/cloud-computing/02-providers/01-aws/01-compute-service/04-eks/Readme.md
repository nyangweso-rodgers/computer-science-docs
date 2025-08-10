# Amazon EKS (Elastic Kubernetes Service)

## Table Of Contents

# The Traditional EC2 Approach:

- Running applications directly on **EC2** instances is like being your own personal chef. Sure, you have complete control over every ingredient and cooking method, but you’re also responsible for grocery shopping, prep work, cooking, and cleanup — every single night.
- With EC2-only setups, you’re:
  - Manually provisioning servers
  - Worrying about capacity planning
  - Handling scaling events yourself (often at 2 AM, because that’s when things break)
  - Managing server updates and patches
  - Implementing your own high availability solutions

# Introduction to EKS

- **Amazon EKS** brings Kubernetes to the table.
- **Why EKS?**
  1. **Automated scaling**: **EKS** can automatically scale your applications based on actual usage patterns. No more late-night alerts because someone posted your app on Reddit and suddenly you have 100x traffic.
  2. **Self-healing capabilities**: If a container fails in **EKS**, it automatically gets replaced. It’s like having containers with nine lives.
  3. **Declarative infrastructure**: With **EKS**, you describe what you want your application environment to look like, and Kubernetes makes it happen.
  4. **Resource efficiency**: **EKS** manages bin-packing of your containers, optimizing resource utilization. Your finance team will love this part.

# Resources and Further Reading

1. [Medium - EKS vs. EC2: Why Kubernetes Might Be Your New Best Friend (And Don’t Forget About ECS!)](https://medium.com/@bhongaleprathamesh/eks-vs-ec2-why-kubernetes-might-be-your-new-best-friend-and-dont-forget-about-ecs-b1ad937257aa)
