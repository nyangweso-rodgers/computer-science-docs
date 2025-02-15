# How to Set Up a Kubernetes

## 1. How to Set Up a Kubernetes Cluster on Docker Desktop

- If you are developing or testing locally, setting up a full **Kubernetes** cluster can be complex. That’s where [Docker Desktop](https://www.docker.com/products/docker-desktop/) comes in — it lets you run **Kubernetes** directly on your local machine, making it easy to test microservices, CI/CD pipelines, and containerized apps without needing a remote cluster.
- **Note**: Docker Desktop’s Kubernetes cluster is designed specially for local development and testing; it is not for production use.
- **Benefits of running Kubernetes in Docker Desktop**

  1. **Easy local Kubernetes cluster**: A fully functional **Kubernetes** cluster runs on your local machine with minimal setup, handling network access between the host and **Kubernetes** as well as storage management.
  2. **Easier learning path and developer convenience**: For developers familiar with **Docker** but new to **Kubernetes**, having Kubernetes built into **Docker Desktop** offers a low-friction learning path.
  3. **Testing Kubernetes-based applications locally**: **Docker Desktop** gives developers a local environment to test Kubernetes-based microservices applications that require **Kubernetes** features like **services**, **pods**, **ConfigMaps**, and secrets without needing access to a remote cluster. It also helps developers to test CI/CD pipelines locally.

- How to start Kubernetes cluster on Docker Desktop in three steps
  1. Step 1: Download the latest [Docker Desktop]() release.
  2. Step 2: Install **Docker Desktop** on the OS of your choice. Currently, the supported operating systems are macOS, Linux, and Windows.
  3. Step 3: In the **Settings** menu, select **Kubernetes > Enable Kubernetes** and then **Apply & restart** to start a one-node Kubernetes cluster. Typically, the time it takes to set up the Kubernetes cluster depends on your internet speed to pull the needed images.
- Once the **Kubernetes** cluster is started successfully, you can see the status from the Docker Desktop dashboard or the command line.

# Resources and Further Reading

1. [docker - How to Set Up a Kubernetes Cluster on Docker Desktop](https://www.docker.com/blog/how-to-set-up-a-kubernetes-cluster-on-docker-desktop/?ref=dailydev)
