# Serverless Computing - AWS Lambda

## Table of Contents

# What is AWS Lambda?

- You can use **AWS Lambda** to run code without provisioning or managing servers.
- **Features**:
  1. Environment Variables: Use environment variables to adjust your function's behavior without updating code.
  2. Versions: Manage the deployment of your functions with versions, so that, for example, a new function can be used for beta testing without affecting users of the stable production version.
  3. Container Images: Create a container image for a Lambda function by using an AWS provided base image or an alternative base image so that you can reuse your existing container tooling or deploy larger workloads that rely on sizable dependencies, such as machine learning.
  4. Lambda Layers: Package libraries and other dependencies to reduce the size of deployment archives and makes it faster to deploy your code.
  5. Lambda Extensions: Augment your Lambda functions with tools for monitoring, observability, security, and governance.
  6. Function URLs: Add a dedicated HTTP(S) endpoint to your Lambda function.
  7. Response Streaming: Configure your Lambda function URLs to stream response payloads back to clients from Node.js functions, to improve time to first byte (TTFB) performance or to return larger payloads.
  8. Concurrency and Scaling Control: Apply fine-grained control over the scaling and responsiveness of your production applications.
  9. Code Signing: Verify that only approved developers publish unaltered, trusted code in your Lambda functions
  10. Private Networking: Create a private network for resources such as databases, cache instances, or internal services.
  11. File System: Configure a function to mount an **Amazon Elastic File System** (**Amazon EFS**) to a local directory, so that your function code can access and modify shared resources safely and at high concurrency.
  12. Lambda SnapStart: Lambda SnapStart can provide as low as sub-second startup performance, typically with no changes to your function code.

# Deploying Lambda Functions

- When you create a **Lambda function**, you package your function code into a deployment package. **Lambda** supports two types of deployment packages: **container images** and **.zip file archives**.

## 1. Deploying Lambda Functions as .zip File

## 2. Deploying Lambda Function Using Container Image

# Resources and Further Reading
