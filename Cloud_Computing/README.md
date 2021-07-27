# Cloud Computing
## Table of Contents
- [Economies of Scale](#Economies-of-Scale)
    - [Capital expenditure (CapEx) versus operational expenditure (OpEx)](#Capital-expenditure-versus-operational-expenditure)

- [Introduction to Cloud Computing](#Introduction-to-Cloud-Computing)
    - [Benefits of Cloud Computing](#Benefits-of-Cloud-Computing)
    - [Why Cloud Computing?](#Why-Cloud-Computing?)
    - [Traits of a Cloud](#Traits-(Qualities)-of-a-Cloud)
    - [Risks of Cloud Computing](#Risks-of-Cloud-Computing)
    - [Factors to Consider before migrating to the cloud](#Factors-to-consider-before-migrating-to-the-cloud)
    - [Compliance, Terms and Agreements](#Compliance-Terms-and-Requirements)

- [Types of Cloud Services](#Types-of-Cloud-Services)
    - [Software as a service (SaaS)]()
    - [Infrastructure as a service (IaaS)]()
    - [Platform as a service (PaaS)]()

- [AWS vs. Azure vs. GCP](#AWS-vs-Azure-vs-Google-Cloud)
- [Definiton of Terms in Cloud Computing](#Definition-of-Terms-in-Cloud-Computing)
    - [Virtualization]()
    - [VMs vs. Containers]()
    - [Kubernetes vs. Docker]()
    - [Load Balancer]()
    - [Containers vs Serverless]()

- [Cloud Deployment Models](#Cloud-Deployment-Models)
    - [Public Cloud]()
    - [Private Cloud]()
    - [Hybrid Cloud]()

# Economies of Scale
__Economies of Scale__: Ability to do things more efficiently or at a lower-cost per unit when operating at a large scale.

# Capital expenditure versus operational expenditure
In the past, companies needed to acquire physical premises and infrastructure to start their business. There was a substantial up-front cost in hardware and infrastructure to start or grow a business. __Cloud computing__ provides services to customers without significant upfront costs or equipment setup time.

These two approaches to investment are referred to as:
     - __Capital Expenditure__ (__CapEx__)
     - __Operational Expenditure__ (__OpEx__

__CapEx__ is the spending of money on physical infrastructure up front, and then deducting that expense from your tax bill over time. __CapEx__ is an upfront cost, which has a value that reduces over time. __OpEx__ is spending money on services or products now and being billed for them now. You can deduct this expense from your tax bill in the same year. There's no upfront cost. You pay for a service or product as you use it.

1. __CapEx Cloud Computing Costs__:  A typical on-premises __datacenter__ includes costs such as:
    - __Server costs__: This area includes all hardware components and the cost of supporting them. When purchasing servers, make sure to design fault tolerance and redundancy, such as server clustering, redundant power supplies, and uninterruptible power supplies. When a server needs to be replaced or added to a datacenter, you need to pay for the computer. This can affect your immediate cash flow because you must pay for the server up front.

    - __Storage costs__: This area includes all storage hardware components and the cost of supporting it. Based on the application and level of fault tolerance, centralized storage can be expensive. For larger organizations, you can create tiers of storage where more expensive fault‐tolerant storage is used for critical applications and lower expense storage is used for lower priority data.
    
    - __Network costs__:  Networking costs include all on-premises hardware components, including cabling, switches, access points, and routers. This also includes wide area network (WAN) and Internet connections.
    
    - __Backup and archive costs__: This is the cost to back up, copy, or archive data. Options might include setting up a backup to or from the cloud. There's an upfront cost for the hardware and additional costs for backup maintenance and consumables like tapes.
    
    - __Organization continuity and disaster recovery costs__: Along with server fault tolerance and redundancy, you need to plan for how to recover from a disaster and continue operating. Your plan should consist of creating a disaster recovery site. It could also include backup generators. Most of these are upfront costs, especially if you build a disaster recovery site, but there's an additional ongoing cost for the infrastructure and its maintenance.
    
    - __Datacenter infrastructure costs__: These are costs for construction and building equipment, as well as future renovation and remodeling costs that may arise as demands grow. Additionally, this infrastructure incurs operational expenses for electricity, floor space, cooling, and building maintenance.
    
    - __Technical personnel__: While not a capital expenditure, the personnel required to work on your infrastructure are specific to on-premises datacenters. You will need the technical expertise and workforce to install, deploy, and manage the systems in the datacenter and at the disaster recovery site.

2. __OpEx Cloud Computing Costs__: With __cloud computing__, many of the costs associated with an on-premises datacenter are shifted to the service provider. Instead of thinking about physical hardware and datacenter costs, cloud computing has a different set of costs. For accounting purposes, all these costs are __operational expenses__:

    - __Leasing software and customized features__: Using a _pay-per-use_ model requires actively managing your subscriptions to ensure users do not misuse the services, and that provisioned accounts are being utilized and not wasted. As soon as the provider provisions resources, billing starts. It is your responsibility to de-provision the resources when they aren't in use so that you can minimize costs.
    
    - __Scaling charges based on usage/demand instead of fixed hardware or capacity.__: Cloud computing can bill in various ways, such as the number of users or CPU usage time. However, billing categories can also include allocated RAM, I/O operations per second (IOPS), and storage space. Plan for backup traffic and disaster recovery traffic to determine the bandwidth needed.
    
    - __Billing at the user or organization level__: The subscription (pay-per-use) model is a computing billing method that is designed for both organizations and users. The organization or user is billed for the services used, typically on a recurring basis. You can scale, customize, and provision computing resources, including software, storage, and development platforms. For example, when using a dedicated cloud service, you could pay based on server hardware and usage.

## Benefits of CapEx
With __capital expenditures__, you plan your expenses at the start of a project or budget period. Your costs are fixed, meaning you know exactly how much is being spent. This is appealing when you need to predict the expenses before a project starts due to a limited budget.

## Benefits of OpEx
Demand and growth can be unpredictable and can outpace expectation, which is a challenge for the __CapEx model__. With the __OpEx model__, companies wanting to try a new product or service don't need to invest in equipment. Instead, they pay as much or as little for the infrastructure as required.

_Remark:_ _OpEx is particularly appealing if the demand fluctuates or is unknown. Cloud services are often said to be agile. Cloud agility is the ability to rapidly change an IT infrastructure to adapt to the evolving needs of the business. For example, if your service peaks one month, you can scale to demand and pay a larger bill for the month. If the following month the demand drops, you can reduce the used resources and be charged less. This agility lets you manage your costs dynamically, optimizing spending as requirements change._

# Introduction to Cloud Computing
__Cloud computing__ is renting resources, like __storage space__ or __CPU cycles__, on another company's computers. You only pay for what you use. The company providing these services is referred to as a __cloud provider__. Some example providers are: 
* Microsoft, 
* Amazon, and 
* Google.
* IBM
# Benefits of Cloud Computing
1. _It's elastic_: As your workload changes due to a spike or drop in demand, a cloud computing system can compensate by automatically adding or removing resources.

For example, imagine your website is featured in a news article, leading to a spike in traffic overnight. Since the cloud is elastic, it automatically allocates more computing resources to handle the increased traffic. When the traffic begins to normalize, the cloud automatically de-allocates the additional resources to minimize cost.

Another example is if you are running an application used by employees, you can have the cloud automatically add resources for the peak operating hours during which most people access the application, and remove the resources at the usual end of the day.

2. _It's cost effective_:You only pay for what you use. (i.e., pay-as-you-go or consumption model). This consumption-based model brings with it many benefits, including:
* No upfront infrastructure costs
* No need to purchase and manage costly infrastructure that you may not use to its fullest
* The ability to pay for additional resources only when they are needed
* The ability to stop paying for resources that are no longer needed

This also allows for better cost prediction. Prices for individual resources and services are provided so you can predict how much you will spend in a given billing period based on your expected usage.

3. _It's scalable_: You can increase or decrease the resources and services used based on the demand or workload at any given time. Cloud computing supports both __vertical__ and __horizontal__ scaling depending on your needs.

* __Vertical scaling__, (__"scaling up"__) , is the process of adding resources to increase the power of an existing server. Some examples of vertical scaling are: adding more CPUs, or adding more memory.
* __Horizontal scaling__, (__"scaling out"__), is the process of adding more servers that function together as one unit. For example, you have more than one server processing incoming requests.

Scaling can be done manually or automatically based on specific triggers such as CPU utilization or the number of requests and resources that can be allocated or de-allocated in minutes.

4. _It's current_: When you use the cloud, you're able to focus on what matters: building and deploying applications. Cloud usage eliminates the burdens of maintaining software patches, hardware setup, upgrades, and other IT management tasks. All of this is automatically done for you to ensure you're using the latest and greatest tools to run your business.

Additionally, the computer hardware is maintained and upgraded by the cloud provider. For example, if a disk fails, the disk will be replaced by the cloud provider. If a new hardware update becomes available, you don't have to go through the process of replacing your hardware. The cloud provider will ensure that the hardware updates are made available to you automatically.

5. _It's reliable_: When you're running a business, you want to be confident your data is always going to be there. Cloud computing providers offer _data backup_, _disaster recovery_, and _data replication_ services to make sure your data is always safe. In addition, redundancy is often built into cloud services architecture so if one component fails, a backup component takes its place. This is referred to as _fault tolerance_ and it ensures that your customers aren't impacted when a disaster occurs.

6. _It's global_: Cloud providers have fully redundant datacenters located in various regions all over the globe. This gives you a local presence close to your customers to give them the best response time possible no matter where in the world they are.
You can replicate your services into multiple regions for redundancy and locality, or select a specific region to ensure you meet data-residency and compliance laws for your customers.

7. _It's secure_: Think about how you secure your datacenter. You have physical security – who can access the building, who can operate the server racks, and so on. You also have digital security – who can connect to your systems and data over the network.
Cloud providers offer a broad set of policies, technologies, controls, and expert technical skills that can provide better security than most organizations can otherwise achieve. The result is strengthened security, which helps to protect data, apps, and infrastructure from potential threats.

When it comes to physical security – threats to cloud infrastructure, cloud providers invest heavily in walls, cameras, gates, security personnel, and so on, to protect physical assets. They also have strict procedures in place to ensure employees have access only to those resources that they've been authorized to manage.
Let us talk about digital security. You want only authorized users to be able to log into virtual machines or storage systems running in the cloud. Cloud providers offer tools that help you mitigate security threats, and you must use these tools to protect the resources you use

8. Deploy what you need, yourself, with _self service_
9. Allow IT staff to instead focus on the business.

The __cloud provider__ is responsible for the physical hardware required to execute your work, and for keeping it up-to-date. The computing services offered tend to vary by cloud provider. However, typically they include:
* __Compute power__ - such as Linux servers or web applications
* __Storage__ - such as files and databases
* __Networking__ - such as secure connections between the cloud provider and your company
* __Analytics__ - such as visualizing telemetry and performance data

# Why Cloud Computing?
1. _Cloud Computing is everywhere_ i.e., in use around the world in many forms by all types of people and companies.
2. _Cloud Computing is powerful_ i.e., it can run just any application anywhere, anytime and at any scale.
3. _Cloud Computing makes life easier_. i.e., it allows an individual to do more with less, be more efficient, save time and money.

# Traits (Qualities) of a Cloud
* _Elastic_: scales up and down quickly.
* _Metered_: you pay for what you use.i.e., no long-term contract in most cases.
* _Self - service_: No (or reduced) need for IT Experts.

# Risks of Cloud Computing
* Placing your trust in the cloud provider and if the provider goes down it means all your applications or data goes down.
* Potential for data loss.
* Potential for slow access to your data.
* Potential questions related to regularity/legal
* Potential for loss of customization.
* Potential for unkown costs.

# Factors to consider before migrating to the cloud
* costs associated with using the cloud
* Security, availability and performance
* Migrate vs. rebuild
* Enterprise-grade functionality
* Availability of the tools that can help

# Compliance Terms and Requirements
When selecting a cloud provider to host your solutions, you should understand how that provider can help you comply with regulations and standards. Some questions to ask about a potential provider include:
* How compliant is the cloud provider when it comes to handling sensitive data?
* How compliant are the services offered by the cloud provider?
* How can I deploy my own cloud-based solutions to scenarios that have accreditation or compliance requirements?
*  What terms are part of the privacy statement for the provider?
# Types of Cloud Services
1. __Software as a Service (SaaS)__

__SaaS__ is software that is centrally hosted and managed for the end customer. It is usually based on an architecture where one version of the application is used for all customers, and licensed through a monthly or annual subscription. _Office 365_, _Skype_, and _Dynamics CRM Online_ are perfect examples of SaaS software.
### Examples of SaaS
|----|CRM (Customer Relationship Management) | ERP (Enterprise Resource Planning) | Email | Storage | Productivity|
|:-----:|:-------------------------------------:| :------------------------------:| :------:| :-------:| :----------:|
Salesforce | CRM | - | - | - | - |
Oracle | CX Cloud | Cloud ERP | - | - | - |
SAP | Sales Cloud | S/4HANA Cloud, | - | - | - |
Microsoft | Dynamic 365 Sales, .. | Dynamic 365 Finance, .. | Dynamic 365 | Dynamic 365 | Dynamic 365 |
Google | - | - | Google Workspace | Google Workspace | Google Workspace |
Apple | - | - | iCloud | iCloud | - |
Dropbox | - | - | - | Dropbox | - |
e.t.c| 

### Evaluating SaaS (for Users)
| Benefits | Risks |
| :------: | :-----: | 
Faster deployment because no local installation is required unline on-premise applications | Requiring trusting SaaS provider for availability and security
Usage - based pricing - letting you pay for what you use | can raise legalregulatory concerns with storing data outside customer premises
Less financial risks with lower up-front costs and free trials | Can limit customization if customers share a multi-tenant applications
Reduced need for on-premises resources such as servers and IT staff |  can be harder to intergrate with on-premise applications 
Easier upgrades with no on-premise software to update | can have lower performance than on-premise applications

### Evaluating SaaS (for Software Vendors)
| Benefits | Risks |
| :------: | :-----: | 
Can provide more predictable revenue stream than traditional licensing | Must demonstrate real value up front due to try-before-you-buy options
Can sell directly to business decision makers without going through IT | Revenue comes in slowly because of typical SaaS pricing models
Can lower support costs due to shared multi-tenant applications | May lessen vendor's ability to sell customization services due to multi-tenant applications
Provides more knowledge about how customers use the applications | Can bring new challenges such as customer resistance to cloud
Offers potential to reach new customers in borader markets | Requires significant business changes e.g., pricing and sales

2.  __Infrastructure as a service (IaaS)__

__Infrastructure as a Service__ is the most flexible category of cloud services. It aims to give you the most control over the provided hardware that runs your application (IT infrastructure servers and virtual machines (VMs), storage, and operating systems). Instead of buying hardware, with IaaS, you rent it. It's an instant computing infrastructure, provisioned and managed over the internet.

__Note__: _When using __IaaS__, ensuring that a service is up and running is a shared responsibility: the cloud provider is responsible for ensuring the cloud infrastructure is functioning correctly; the cloud customer is responsible for ensuring the service they are using is configured correctly, is up to date, and is available to their customers. This is referred to as the __shared responsibility__ model._

__IaaS__ is commonly used in the following scenarios:
* __Migrating workloads__. Typically, IaaS facilities are managed in a similar way as on-premises infrastructure and provide an easy migration path for moving existing applications to the cloud.
* __Test and development__. Teams can quickly set up and dismantle test and development environments, bringing new applications to market faster. IaaS makes scaling development and testing environments, fast and economical.
* __Storage, backup, and recovery__. Organizations avoid the capital outlay and complexity of storage management, which typically requires skilled staff to manage data and meet legal and compliance requirements. IaaS is useful for managing unpredictable demand and steadily growing storage needs. IaaS can also simplify the planning and management of backup and recovery systems.

3. __Platform as a service (PaaS)__
__PaaS__ provides an _environment for building, testing, and deploying software applications_. The goal of __PaaS__ is to help you create an application quickly without managing the underlying infrastructure. For example, when deploying a web application using __PaaS__, you don't have to install an operating system, web server, or even system updates.

__PaaS__ is a _complete development and deployment environment in the cloud_, with resources that enable organizations to deliver everything from simple cloud-based apps to sophisticated cloud-enabled enterprise applications. Resources are purchased from a cloud service provider on a pay-as-you-go basis and accessed over a secure Internet connection.

__PaaS__ is commonly used in the following scenarios:
* __Development framework__. PaaS provides a framework that developers can build upon to develop or customize cloud-based applications. Just like Microsoft Excel macro, PaaS lets developers create applications using built-in software components. Cloud features such as scalability, high-availability, and multi-tenant capability are included, reducing the amount of coding that developers must do.
* __Analytics or business intelligence__. Tools provided as a service with PaaS allow organizations to analyze and mine their data. They can find insights and patterns, and predict outcomes to improve business decisions such as forecasting, product design, and investment returns.

## Cost and Ownership
Metric | IaaS | PaaS | SaaS
-------|---|---|--
Upfront Cost|There are no upfront costs. Users pay only for what they consume.| There are no upfront costs. Users pay only for what they consume.| Users have no upfront costs; they pay a subscription, typically on a monthly or annual basis.
--|--|--|--
User Ownership|The user is responsible for the purchase, installation, configuration, and management of their own software, operating systems, middleware, and applications.|The user is responsible for the development of their own applications. However, they are not responsible for managing the server or infrastructure. This allows the user to focus on the application or workload they want to run.|Users just use the application software; they are not responsible for any maintenance or management of that software.
--|--|--|--
Cloud Provider Ownership|The cloud provider is responsible for ensuring that the underlying cloud infrastructure (such as virtual machines, storage, and networking) is available for the user.|The cloud provider is responsible for operating system management, network, and service configuration. Cloud providers are typically responsible for everything apart from the application that a user wants to run. They provide a complete managed platform on which to run the application.|The cloud provider is responsible for the provision, management, and maintenance of the application software.

## Management Responsibilities
* __IaaS__ requires the most user management of all the cloud services. The user is responsible for managing the operating systems, data, and applications.
* __PaaS__ requires less user management. The cloud provider manages the operating systems, and the user is responsible for the applications and data they run and store.
* __SaaS__ requires the least amount of management. The cloud provider is responsible for managing everything, and the end user just uses the software.

# Definition of Terms in Cloud Computing
1. __Virtualization__ is the logical division of physical computing resources. __Vurtualization__ makes a physical server into a _virtual host machine_ so that _virtual host_ can then run _guest virtual machines_. __Virtualization__ started in 1960's as a way to slice up mainframe resources. There are many resources that can be virtualized:

    * server (compute), 
    * storage, and 
    * network. 

    There are many forms of _virtualization_ - including server and desktop.
2. __Virtual Machine__: Running on a __hypervisor__, a __virtual machine__ is a software-based instance of a physical server where a guest operating system has access to emulated virtual hardware.

3. __Hypervisor__ is loaded on the virtual host to run virtual machines. (i.e., _is in charge of allocating compute resources to the __VMs__ and making sure that the __VMs__ don't interfere with one another._)

    __REMARK:__
    * A _Virtual Machine_ runs on top of a _hypervisor_ that is loaded on a physical server.  
    * _Virtual guests_ run on a _virtual host_, which provides the physical resources.
    * An _operating system_ and _applications_ are loaded in the guest.


4. A __container__ is operating-system  level virtualization where the OS kernel provides isolated user spaces to run specific applications.
    * Containers run inside a virtual machine
    * Containers have less overhead and faster startup time than virtual machine.
    * Containers have been popularized with the excitment around Docker containers.

5. __VMs vs. Containers__
    * A __VM__ emulates the hardware it runs on while a __container__ just emuates an OS, usually Linux. That's why it doesn't contain a virtual copy of the hardware it's running on.

    * Like __VMs__, __Containers__ can't go without an OS, an application and its libraries and dependencies. But letting go of the hardware emulation results in the fact that containers are even more lightweight, fast, and portable. That's why containers only take seconds to start, while __VMs__ usually need a few minutes.

    * On the other hand, __containers__ aren't always as secure as __VMs__. If a malevolent software gets onto a containerised system and makes it through to the OS, it can potentially hijack the whole machine. In contrast, __VMs__ keep different OS seperate from one another. So even if malware gets through to the OS of a VM, all other VMs on the machine remain untouched from the attack. This adds an extra level of security that can be crucial when dealing with confidential data, for example.
    
    * Another advantage of __VMs__ over __containers__ is that you can use differnt OS. This is more work, of course, because you might need to implement bug fixes on each OS seperately. But if you have an application that ought to run on anything else than Linux, container's aren't the way to go.
    
    * On the other hand, __containers__ are great for anything with a microservice architecture, i.e., whether a single application is composed of many smaller services that are only loosely coupled and can be executed independently. Each individual service can be put in it's own container. Then, the only thing that developers need to watch out for is that the containers communicate properly among each other.

6. __Docker vs. Kubernetes__
    * __Docker__ is a file format for containers and open-source technology to run applications from anywhere. __Kubernetes__ coordinates and schedules  many containers, and ensures that they communicate properly with each other. 
    
    * __Docker__ has its own container orchestration service, __Docker Swarm__. Here, however, the winner is clear: __Kubernetes__ is way more extensive than __Docker Swarm__. Kubernetes can run across an entire cluster of machines, whereas Docker Swarm runs on a single node only.

7. __Load Balancer__ is a critical component of any distributed system which sits between a __client__ and __server__, accepts incoming requests, and routes them across a cluster of servers to handle the load. A __load balancer__ keeps track of health status of all the servers connected. If a particular server is unhealthy, then it will not send incoming requests  to that server.

    __Benefits of a load balancer__
    * Faster user experience
    * Less downtime and high thorughput. If a particular server is down, LB takes care of routing the traffic to the ones which are up.
    * Reduces individual server load and prevents any one application server from becoming a single point of failure.
    * Improves response time
    * Improves overall system availability.

    A __load balancer__ can use any of the below __algorithms__ to decide where to route the next incoming request. The __algorithms__ used depend on the use case:

    * __Least Connection Method__: Route traffic to the server with the fewest active connections.
    * __Least Response Time Method__: Route traffic to the server with the fewest active connections and the lowest average response time.
    * __Least Bandwidth Method__: Route traffic to the server that is currently serving the least amount of traffic measured in megabits per second (Mbps)
    * __Round Robin__: Routes through a list of servers and sends each new requst to the next server. When it reaches the end of the list, it starts over at the beginning.
    * __Weighted Rounded Robin Method__: The weighted round robin scheduling is designed to better handle servers with different processing capacities. Each server is assigned a weight (an integer that indicates the processing capacity). Servers with higher weights receive new connections before those with less weight and servers with higher weights get more connections than those with less weights.
    * __IP Hash__: Under this method, a hash of the IP address of the client is calculated to redirect the request.

8. __Containers vs. Serverless__
    * With __serverless__, developers don't even have to worry about when and how their application gets executed, which containers they ought to put it in, or how many compute resources it will consume. They still need to write applications, of course, but after they've uploaded it to their AWS Lambda, Aurora, or CloudFront, they can call it a day. Their code will then lie dormant until it gets executed. You only pay for the machine-time that you really used, which makes the whole thing pretty economic. In contrast, you need to pay a monthly fee for Docker, and a per-cluster-per-hour fee for Kubernetes, regardless of how much you use it.
    
    * That doesn't mean serverless is king. It's fairly a new technology, and at the moments there are still are limits wherever you go

# AWS vs Azure vs Google Cloud
### Pros
|AWS|GCP|Azure|
|:----:|:----:|:----:|
Relaibility - the best among the cloud provider |  Cost
Support - they understand customer pain points very well. Even their free tire support is helpful.|  Browser SSH for quick debugging (cloud shell)
Documentation - comprehensive and generally up to date.|  Instant resizing of disks, memory of the computer insatnces
They have never killed any existing service. Even depreciated ones are still around though customers are discouraged from using them.|Cloud Pub Sub is great
---| Firebase is useful for prototyping
---| __GCP__ dashboard are simpler and organized.

### Cons
|AWS|GCP|Azure|
|:----:|:----:|:----:|
Cost - AWS is generally more expensive than __GCP__ | Support - they need to improve this and be more customer focused|---
Calculating costs - difficulty in calculating AWS bill especially with Lambda, API Gateway, Cloudwatch.| Reliability - some instances of network beiing down.|---
Too many services with weired names or acronyms. Keeping track of them can become cumbersome | --- | ---


## Cloud Computing Services
### 1. Compute power
When you build solutions using cloud computing, you can choose how you want work to be done based on your resources and needs. For example, _if you want to have more control and responsibility over maintenance_, you could create a __virtual machine__ (VM). A __VM__ is an _emulation of a computer_ - just like your desktop or laptop. Each VM includes an __operating system__ and __hardware__ that appears to the user like a physical computer running Windows or Linux. You can then install whatever software you need to do the tasks you want to run in the cloud.

The difference is that you don't have to buy any of the hardware or install the OS. The cloud provider runs your __virtual machine__ on a physical server in one of their __datacenters__ - often sharing that server with other VMs (isolated and secure). With the cloud, you can have a VM ready to go in minutes at less cost than a physical computer.

__VMs__ aren't the only computing choice - there are two other popular options: __containers__ and __serverless__ computing.

### 2. What are containers?
__Containers__ provide a consistent, isolated execution environment for applications. They're similar to VMs except they don't require a guest operating system. Instead, the application and all its dependencies is packaged into a "container" and then a standard runtime environment is used to execute the app. This allows the container to start up in just a few seconds, because there's no OS to boot and initialize. You only need the app to launch.

The open-source project, __Docker__, is one of the leading platforms for managing containers. __Docker containers__ provide an efficient, lightweight approach to application deployment because they allow different components of the application to be deployed independently into different containers. Multiple containers can be run on a single machine, and containers can be moved between machines. The portability of the container makes it easy for applications to be deployed in multiple environments, either on-premises or in the cloud, often with no changes to the application.

### 3. What is serverless computing?
__Serverless computing__ lets you _run application code without creating, configuring, or maintaining a server_. The core idea is that your application is broken into separate functions that run when triggered by some action. This is ideal for automated tasks - for example, you can build a serverless process that automatically sends an email confirmation after a customer makes an online purchase.

The __serverless__ model differs from __VMs__ and __containers__ in that you _only pay for the processing time used by each function as it executes_. __VMs__ and __containers__ are _charged while they're running_ - even if the applications on them are idle. This architecture doesn't work for every app - but when the app logic can be separated to independent units, you can test them separately, update them separately, and launch them in microseconds, making this approach the fastest option for deployment.

![][2-vm-vs-container-vs-serverless]

### 4. Storage
Most devices and applications read and/or write data. Here are some examples:
* Buying a movie ticket online
*  Looking up the price of an online item
* Taking a picture
* Sending an email
* Leaving a voicemail

In all of these cases, data is either read (looking up a price) or written (taking a picture). The type of data and how it's stored can be different in each of these cases.

Cloud providers typically offer services that can handle all of these types of data. For example, if you wanted to store text or a movie clip, you could use a file on disk. If you had a set of relationships such as an address book, you could take a more structured approach like using a database.

The advantage to using cloud-based data storage is you can scale to meet your needs. If you find that you need more space to store your movie clips, you can pay a little more and add to your available space. In some cases, the storage can even expand and contract automatically - so you pay for exactly what you need at any given point in time.


# Cloud Deployment Models
A __cloud deployment model__ defines _where your data_ is stored and _how your customers interact with it_ – how do they get to it, and where do the applications run? It also depends on how much of your own infrastructure you want or need to manage. Three deployment methods of cloud computing:

1. __Public cloud__
This is the most common deployment model. In this case, you _have no local hardware to manage or keep up-to-date_ – everything runs on your cloud provider's hardware. In some cases, you can save additional costs by sharing computing resources with other cloud users. Businesses can use multiple public cloud providers of varying scale. __Microsoft Azure__ is an example of a public cloud provider.

__Advantages of Public Cloud__ | __Disadvantages of Public Cloud__
|:--------:|:--------------:|
High scalability/agility – you don't have to buy a new server in order to scale | There may be specific security requirements that cannot be met by using public cloud
Pay-as-you-go pricing – you pay only for what you use, no CapEx costs | There may be government policies, industry standards, or legal requirements which public clouds cannot meet
You're not responsible for maintenance or updates of the hardware | You don't own the hardware or services and cannot manage them as you may want to
Minimal technical knowledge to set up and use - you can leverage the skills and expertise of the cloud provider to ensure workloads are secure, safe, and highly available | Unique business requirements, such as having to maintain a legacy application might be hard to meet

    * A common use case scenario is deploying a web application or a blog site on hardware and resources that are owned by a cloud provider. Using a public cloud in this scenario allows cloud users to get their website or blog up quickly, and then focus on maintaining the site without having to worry about purchasing, managing or maintaining the hardware on which it runs.



2. __Private cloud__
In a __private cloud__, you create a cloud environment in your own datacenter and provide self-service access to compute resources to users in your organization. This offers a simulation of a public cloud to your users, but you remain completely responsible for the purchase and maintenance of the hardware and software services you provide.

__Advantages of Private Cloud__ | __Disadvantages of Private Cloud__
|:--------:|:--------------:|
You can ensure the configuration can support any scenario or legacy application | You have some initial CapEx costs and must purchase the hardware for startup and maintenance
You have control (and responsibility) over security | Owning the equipment limits the agility - to scale you must buy, install, and setup new hardware
Private clouds can meet strict security, compliance, or legal requirements | Private clouds require IT skills and expertise that's hard to come by

    * A use case scenario for a private cloud would be when an organization has data that cannot be put in the public cloud, perhaps for legal reasons. An example scenario may be where government policy requires specific data to be kept in-country or privately.
A private cloud can provide cloud functionality to external customers as well, or to specific internal departments such as Accounting or Human Resources.

3. __Hybrid cloud__
A __hybrid cloud__ combines __public__ and __private clouds__, allowing you to run your applications in the most appropriate location. For example, you could host a website in the public cloud and link it to a highly secure database hosted in your private cloud (or on-premises datacenter).

This is helpful when you have some things that cannot be put in the cloud, maybe for legal reasons. For example, you may have some specific pieces of data that cannot be exposed publicly (such as medical data) which needs to be held in your private datacenter. Another example is one or more applications that run on old hardware that can't be updated. In this case, you can keep the old system running locally, and connect it to the public cloud for authorization or storage.

__Advantages of Hybrid Cloud__ | __Disadvantages of Hybrid Cloud__
|:--------:|:--------------:|
You can keep any systems running and accessible that use out-of-date hardware or an out-of-date operating system | It can be more expensive than selecting one deployment model since it involves some CapEx cost up front
You have flexibility with what you run locally versus in the cloud | It can be more complicated to set up and manage
You can take advantage of economies of scale from public cloud providers for services and resources where it's cheaper, and then supplement with your own equipment when it's not |  -
You can use your own equipment to meet security, compliance, or legacy scenarios where you need to completely control the environment. | -
