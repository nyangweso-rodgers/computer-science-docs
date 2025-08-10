# Amazon Elastic Compute Cloud ( EC2)

## Table Of Contents

# How to choose the EC2 instance types with cost optimization in mind

1. **Identify application’s requirements**

   - Identify the minimum requirements of your workload and pick **EC2 instance** types that meet them across these dimensions:
     1. vCPU Count
     2. vCPU architecture
     3. Memory
     4. SSD storage
     5. Network

2. **Shop around for EC2 instance types and families**

   - EC2 Instance Family include:

     1. **General purpose**

        - Balanced ratio of vCPU to memory
        - Use Cases:
          1. General-purpose applications that use vCPU and memory in equal proportions
          2. Scale-out workloads liem web servcers, containerized microservices, and small to mid-sized development environments
          3. Low-latency user interactive applications, small to medium database worloads
          4. Virtaul desktop machines, code repositories, application servers

     2. **Memory optimized: High ratio of memory to vCPU**

        - High ratio of memory to vCPU
        - Use Cases:
          1. High performance database clusters
          2. Dustributed web scale In-memory caches
          3. Mid-size-In-memory database and Enterprise applications
          4. applications that process unstructured big data in real-time
          5. high-performance computing (HPC) and Hadoop/Spark clusters

     3. **Storage optimized**

        - designed for workloads that need high, sequential read and write access to massive data sets on local storage
        - can deliver thousands of low-latency, random I/O operations per second (IOPS) to applications
        - Use Case:
          1. NoSQL database (Cassandra, MongoDB, Redis)
          2. In-memory database (SAP HANA, Aerospile)
          3. Massively Parallel Processing (MPP)
          4. MapReduce and Hadoop distributed computing
          5. Apache Kafka, and big data workfload clusters

     4. **Accelerated computing**

        - Uses hardware accelerators (co-processors) to power functions that machine and deep learning system require
        - **Use Cases**:
          1. ML/Deep Learning
          2. High-Performance computing (HPC)
          3. Computational finance
          4. Speech recognition and conversational agents
          5. Molecular moelling and genomics
          6. Recommendation engines
          7. 3D visualizations and rendering

     5. **Inference type**
        - Promoses up to 30% higher throughput and 45% lower cost per inference than EC2 G4 instance
        - Includes 16 AWS Inferential chips, second generation Intel Xeon Scaable Processors, and networking of up to 100Gbps
        - Use Cases:
          1. ML Applications
          2. Search recommendation
          3. Speech recognition and NLP
          4. Fraud detection

3. **Choose your instance size with cost savings in mind**

# Resources anf Further Reading

1. [EC2 Instance Types: How to Choose the Best One for Your Application](https://cast.ai/blog/400-ec2-instance-types/?ref=dailydev)
