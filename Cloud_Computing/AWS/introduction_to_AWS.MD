# introduction to AWS
__AWS__ is a cloud computing service from __Amazon__ which provides all the necessary infrastructure to build your applications.

## AWS services
### 1. Elastic Cloud Compute (EC2)
This is basically a virtual machine with an operating system which can be used to run services, background jobs, websites, e.t.c. __AWS__ provides EC2 with different CPU, Memory and Storage capacity and can chhose one based on any use case.

You can SSH into an EC2 machine and can use it to:
* run applications
* run cron jobs
* launch a server
* router your server (localhost:8000) to outside world using NGINX

### 2. Amazon Simple Storage Service(S3)
As the name suggest it provides a storage service which can be used to store images, video, texts files and can even be used serve your entire website when used along with Cloud Front.

Common use cases for S3 is to store user uploaded documents, host static websites. e.t.c. These documents can be stored on a S3 bucket and then the corresponding URLs can be stored in a database table and refer to it later in your application.

### 3. Simple Queue Service(SQS)
__SQS__ is a message queuing service which helps in asynchronous communication between two services. This is one of the critical components which helps you to decouple services in distributed environment through pull based mechanism.

### 4. Load Balancers(LB)
__Load Balancers__ is a crucial componet any distributed system which sits between a client and a server, accepts incoming requests, and routes them across a cluster of servers to handle the load.

### 5. Lambda Functions
__AWS Lambda__ is a server-less compute service that lets you run your service without the need to maintain a server. The function executes your code only on some event when needed.

It is on demand service which utilises compute resources when needed.

### 6. Elastic Cache
__AWS Elastic Cache__ offers fully managed __Redis__ and __Memcached__. These provide high throughput and low latency in-memory data stores. It is a popular choice for real-time Caching, Session Stores, Gaming, Real-Time Analytics, and Queuing e.t.c

### 7. Route 53
__Amazon Route 53__ is a highly available and a scalable __Domain Name System__(DNS) web service. You can use Route 53 to perform three main functions in any combination:
* domain registration
* DNS routing
* health checking

### 8. Amazon Relational Database Service (RDS)
__RDS__ makes it easy to set up, operate and scale a relational database in the cloud. It provides you with six database engines to choose from including:
* Amazon Aurora
* PostgreSQL
* MySQL]
* MariaDB
* Oracle Database, and 
* SQL Server