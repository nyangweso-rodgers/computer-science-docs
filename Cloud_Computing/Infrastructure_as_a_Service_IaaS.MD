# Infrastructure as a Service (IaaS)

## What is Virtualization?
__Virtualization__ is the logical division of physical computing resources. Vurtualization makes a physical server into a virtual host machine so that virtual host can then run guest virtual machines.

Virtualization started in 1960's as a way to slice up mainframe resources. There are many resources that can be virtualized - server (compute), storage, and network. There are many forms of _virtualization_ - including server and desktop.

## What is a Virtual Machine?
Running on a hypervisor, a virtual machine is a software-based instance of a physical server where a guest operating system has access to emulated virtual hardware.

A __hypervisor__ is loaded on the virtual host to run virtual machines.

A _Virtual Machine_ runs on top of a hypervisor that is loaded on a physical server.  

_Virtual guests_ run on a _virtual host_, which provides the physical resources.

An _operating system_ and _applications_ are loaded in the guest.

## What is a container?
A __container__ is operating-system  level virtualization where the OS kernel provides isolated user spaces to run specific applications.

1. Containers run inside a virtual machine
2. Containers have less overhead and faster startup time than virtual machine.
3. Containers have been popularized with the excitment around Docker containers.

## Different Types of IaaS Offerings
### Private Cloud, Hybrid Cloud, and Public Cloud
__Private Clouds__ are run on premises. i.e., are run on your own building, at your own datacenter. Those types of clouds are for your company to leverage.They run on your own infrastructure and you are not paying someone else and you are not accessing your data across the internet.

When we are talking about __IaaS__ we are talking about public clouds. This is like a natural assumption. Kind between __Private__ and __Public Cloud__ we have a __Hybrid Cloud__. What __Hybrid cloud__ means is that you've connected your __private cloud__ to your __public cloud__.

## Virtualization vs. Private Cloud
Virtualization | Private Cloud
------------------------------|---------------------
Required for cloud computing|On top of virtualization, Private cloud provides:
Virtualization provides: Scalability/elastic computing| Abstraction of underlying infrastructure layer
Provides Resource sharing & pooling | Provides secure multi-tenancy 
Provides load balancing for the compute|access to catalog of applications
Provides high availability|Chargeback/showback
Portability|Potential to burst to a __hybrid cloud__
cloning|

__Remark__: _public cloud_ requires _Virtualization_. But just because you have _virtualization_, does not mean you have cloud.

## Service Level Agreements (SLA)
__SLA__ defines what level of performance and availability the __IaaS__ provider will provide you.

## Migrating to the Cloud
### Factors to consider before migrating to the cloud
1. costs associated with using the cloud
2. Security, availability and performance
3. Migrate vs. rebuild
4. Enterprise-grade functionality
5. Availability of the tools that can help

## Infrastructure as a Service (IaaS) Networking
### IaaS Networking Options
#### 1. Public Networking
Just like the web servers, you're connecting to SaaS, with _Public Networking_ your _IaaS Virtual Machines_  or _containers_ , they have public IP network addresses. i.e., they are on the internet.
#### 2. Private Networking
Where you use _Virtual Private Network_ (VPNs) which are software-based virtual tunnels through the internet to connect to these _virtual machines_ running in the public cloud.


## Virtual Private Cloud (VPC) Networking
__Amazon VPC__ is __NOT__ a private cloud, but a private network that can be connected to your network. With VPC in place you have conntrol over-:
1. Private IP address networking
2. Routing
3. Network access list (basically, security - who can get in, who can't)
4. And VPN connectivity back to your on-premises infrastructure.

## Storage in the Cloud

### Understanding IaaS Storage Options
#### 1. Inside the Virtual Machine (VM)
They could be raw files sitting on a disk, or data stored in a database running on a virtual machine. So each VM has its own storage.

#### 2. Outside the Virtual Machine
Each VM can access external storage like _block_ or _object_  storage. For example, Amazon has __Elastic Block Storage (EBS)__ which is a shared storage solution that is running in _Amazon_ and that's where you can put your data and then share it between all of the different virtual machines running in the cloud. 

### Cloud File Storage
When it comes to storing files in the cloud, there's a handful of well-known cloud-file storage solutions such as: _Dropbox_, _Microsoft OneDrive_, and _Google Drive_.

### Object Storage
This is a storage for _unstructured data_ such as pictures, videos, and archival data. The most populat _object storage service in the world is _Amazon's S3_ or _Simple Storage Service_. The competitor is _Microsoft Azure Blob storage_.

## Infrastructure as a Service (IaaS) Security
### Cloud Security Concerns
1. Is my data safe?
2. Who can see my data?
3. Can my data be modifies?
4. Who is responsible for securing my data?

__Encryption__ is the process of converting information or data into _ciphertext_, which cannot be easily understood by anyone except by those who have the key.

### Vulnerabilities and Mitigation
1. Who keeps my operating system and applications up to date?
2. Who performs backups of the data, should something happen?
3. Who performs security scans of my virtual machines?

## Comparing Infrastructure as a Service (Iaas) and Platform as a Service (PaaS)

### What is Platform as a Service (PaaS)?
__PaaS__ is for developers. This is one of the big differences between _IaaS_ and _PaaS_. __PaaS__ is a cloud service for developers who want to develop, run, and manage applications in the public cloud. 

With __PaaS__, no servers, network, OS, middleware, or databases are needed. You don't need to stall any of those.

#### Examples of PaaS solutions:
1. AWS Elastic Beanstalk
2. Microsoft Azure App Service
3. Google App Engine
4. Cloud Foundry
5. Heroku

### How Do IaaS and PaaS Compare?
IaaS|PaaS
-------|-------------
All servers, storage and networking are provided|PaaS runs on top of IaaS
Developers must install their own software such as web servers, database servers e.t.c.|Developers have access to already installed web servers, database servers, and development libraries