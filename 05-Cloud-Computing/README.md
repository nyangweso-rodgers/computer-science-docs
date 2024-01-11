# Cloud Computing
## Table of Contents
1. [Overview of Cloud Computing](#Overview-of-Cloud-Computing)

2. [Types of Cloud Services](#Types-of-Cloud-Services)
    - [Software as a service (SaaS)](#Software-as-a-Service-(SaaS))
    - [Infrastructure as a service (IaaS)](#Infrastructure-as-a-service-(IaaS))
    - [Platform as a service (PaaS)](#Platform-as-a-service-(PaaS))
    
2. [Cloud Deployment Models](#Cloud-Deployment-Models)
    - [Public Cloud](#Public-Cloud)
    - [Private Cloud](#Private-Cloud)
    - [Hybrid Cloud](#Hybrid-Cloud)

3. [Cloud Computing Concepts]()
    - [Virtual Machines](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing/Virtual_Machines)
    - [Containers](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing/Containers)
    - [Docker](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing/Docker)
    - [Kubernetes](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing/Kubernetes)

4. [AWS vs. Azure vs. GCP]()
    - [GCP](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing/GCP)
    - [AZURE](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing/AZURE)
    - [AWS](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Cloud_Computing/AWS)

5. [Cloud Native Architecture](#Cloud-Native-Architecture)
    - [Traits of Cloud Natives](#Traits-of-Cloud-Natives)

6. [References](#References)

# Overview of Cloud Computing
* __Cloud computing__ is renting resources, like __storage space__ or __CPU cycles__, on another company's computers. You only pay for what you use.
* __Benefits__ of Cloud Computing include:
    - _It's elastic_: As your workload changes due to a spike or drop in demand, a cloud computing system can compensate by automatically adding or removing resources.

    - _It's cost effective_:You only pay for what you use. (i.e., pay-as-you-go or consumption model). This also allows for better cost prediction. Prices for individual resources and services are provided so you can predict how much you will spend in a given billing period based on your expected usage.

    - _It's scalable_: You can increase or decrease the resources and services used based on the demand or workload at any given time. Cloud computing supports both __vertical__ and __horizontal__ scaling depending on your needs.
        * __Vertical scaling__, (__"scaling up"__) , is the process of adding resources to increase the power of an existing server. Some examples of vertical scaling are: adding more CPUs, or adding more memory.
        * __Horizontal scaling__, (__"scaling out"__), is the process of adding more servers that function together as one unit. For example, you have more than one server processing incoming requests.

    -  _It's current_: When you use the cloud, you're able to focus on what matters: building and deploying applications. Cloud usage eliminates the burdens of maintaining software patches, hardware setup, upgrades, and other IT management tasks. All of this is automatically done for you to ensure you're using the latest and greatest tools to run your business.

    - _It's reliable_: When you're running a business, you want to be confident your data is always going to be there. Cloud computing providers offer _data backup_, _disaster recovery_, and _data replication_ services to make sure your data is always safe. In addition, redundancy is often built into cloud services architecture so if one component fails, a backup component takes its place. This is referred to as _fault tolerance_ and it ensures that your customers aren't impacted when a disaster occurs.

    - _It's global_: Cloud providers have fully redundant datacenters located in various regions all over the globe. This gives you a local presence close to your customers to give them the best response time possible no matter where in the world they are. You can replicate your services into multiple regions for redundancy and locality, or select a specific region to ensure you meet data-residency and compliance laws for your customers.

    - _It's secure_: Cloud providers offer a broad set of policies, technologies, controls, and expert technical skills that can provide better security than most organizations can otherwise achieve. The result is strengthened security, which helps to protect data, apps, and infrastructure from potential threats.

    - Deploy what you need, yourself, with _self service_
    - Allow IT staff to instead focus on the business.

* The __computing services__ offered tend to vary by cloud provider. However, typically they include:
    * __Compute power__ - such as Linux servers or web applications
    * __Storage__ - such as files and databases
    * __Networking__ - such as secure connections between the cloud provider and your company
    * __Analytics__ - such as visualizing telemetry and performance data

* __Traits__ (Qualities) of a Cloud
    * _Elastic_: scales up and down quickly.
    * _Metered_: you pay for what you use.i.e., no long-term contract in most cases.
    * _Self - service_: No (or reduced) need for IT Experts.

* __Risks of Cloud Computing__ include:
    * Placing your trust in the cloud provider and if the provider goes down it means all your applications or data goes down.
    * Potential for data loss.
    * Potential for slow access to your data.
    * Potential questions related to regularity/legal
    * Potential for loss of customization.
    * Potential for unkown costs.
* __Factors to consider before migrating to the cloud__ include:
    * costs associated with using the cloud
    * Security, availability and performance
    * Migrate vs. rebuild
    * Enterprise-grade functionality
    * Availability of the tools that can help
# Types of Cloud Services
# Software as a Service (SaaS)
* __SaaS__ is software that is centrally hosted and managed for the end customer. It is usually based on an architecture where one version of the application is used for all customers, and licensed through a monthly or annual subscription. _Office 365_, _Skype_, and _Dynamics CRM Online_ are perfect examples of SaaS software.

* __SaaS__ requires the least amount of management. The cloud provider is responsible for managing everything, and the end user just uses the software.

* Examples of __SaaS__ include:

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


# Infrastructure as a service (IaaS)
* __IaaS__ is the most flexible category of cloud services. It aims to give you the most control over the provided hardware that runs your application (IT infrastructure servers and virtual machines (VMs), storage, and operating systems). Instead of buying hardware, with __IaaS__, you rent it. It's an instant computing infrastructure, provisioned and managed over the internet.

* __Note__: _When using __IaaS__, ensuring that a service is up and running is a shared responsibility: the cloud provider is responsible for ensuring the cloud infrastructure is functioning correctly; the cloud customer is responsible for ensuring the service they are using is configured correctly, is up to date, and is available to their customers. This is referred to as the __shared responsibility__ model._

* __IaaS__ is commonly used in the following scenarios:
    * __Migrating workloads__. Typically, IaaS facilities are managed in a similar way as on-premises infrastructure and provide an easy migration path for moving existing applications to the cloud.
    * __Test and development__. Teams can quickly set up and dismantle test and development environments, bringing new applications to market faster. IaaS makes scaling development and testing environments, fast and economical.
    * __Storage, backup, and recovery__. Organizations avoid the capital outlay and complexity of storage management, which typically requires skilled staff to manage data and meet legal and compliance requirements. IaaS is useful for managing unpredictable demand and steadily growing storage needs. IaaS can also simplify the planning and management of backup and recovery systems.

* __IaaS__ requires the most user management of all the cloud services. The user is responsible for managing the operating systems, data, and applications.

# Platform as a service (PaaS)
* __PaaS__ provides an _environment for building, testing, and deploying software applications_. The goal of __PaaS__ is to help you create an application quickly without managing the underlying infrastructure. For example, when deploying a web application using __PaaS__, you don't have to install an operating system, web server, or even system updates.

* __PaaS__ is a _complete development and deployment environment in the cloud_, with resources that enable organizations to deliver everything from simple cloud-based apps to sophisticated cloud-enabled enterprise applications. Resources are purchased from a cloud service provider on a pay-as-you-go basis and accessed over a secure Internet connection.

* __PaaS__ is commonly used in the following scenarios:
    * __Development framework__. PaaS provides a framework that developers can build upon to develop or customize cloud-based applications. Just like Microsoft Excel macro, PaaS lets developers create applications using built-in software components. Cloud features such as scalability, high-availability, and multi-tenant capability are included, reducing the amount of coding that developers must do.
    * __Analytics or business intelligence__. Tools provided as a service with PaaS allow organizations to analyze and mine their data. They can find insights and patterns, and predict outcomes to improve business decisions such as forecasting, product design, and investment returns.

* __PaaS__ requires less user management. The cloud provider manages the operating systems, and the user is responsible for the applications and data they run and store.

# Cloud Deployment Models
* A __cloud deployment model__ defines _where your data_ is stored and _how your customers interact with it_ – how do they get to it, and where do the applications run? It also depends on how much of your own infrastructure you want or need to manage. Three deployment methods of cloud computing:

# Public Cloud
* This is the most common deployment model. In this case, you _have no local hardware to manage or keep up-to-date_ – everything runs on your cloud provider's hardware. In some cases, you can save additional costs by sharing computing resources with other cloud users. Businesses can use multiple public cloud providers of varying scale. __Microsoft Azure__ is an example of a public cloud provider.

* __Advantages of Public Cloud__ include:
    * High scalability/agility  – you don't have to buy a new server in order to scale
    * Pay-as-you-go pricing – you pay only for what you use, no CapEx costs
    * You're not responsible for maintenance or updates of the hardware
    * Minimal technical knowledge to set up and use - you can leverage the skills and expertise of the cloud provider to ensure workloads are secure, safe, and highly available
* __Disadvantages of Public Cloud__ include:
    * There may be specific security requirements that cannot be met by using public cloud
    * There may be government policies, industry standards, or legal requirements which public clouds cannot meet
    * You don't own the hardware or services and cannot manage them as you may want to
    * Unique business requirements, such as having to maintain a legacy application might be hard to meet

# Private cloud
* In a __private cloud__, you create a cloud environment in your own datacenter and provide self-service access to compute resources to users in your organization. This offers a simulation of a public cloud to your users, but you remain completely responsible for the purchase and maintenance of the hardware and software services you provide.

* __Advantages of Private Cloud__ include:
    * You can ensure the configuration can support any scenario or legacy application
    * You have control (and responsibility) over security
    * Private clouds can meet strict security, compliance, or legal requirements

* __Disadvantages of Private Cloud__ include:
    * You have some initial CapEx costs and must purchase the hardware for startup and maintenance
    * Owning the equipment limits the agility - to scale you must buy, install, and setup new hardware
    * Private clouds require IT skills and expertise that's hard to come by

# Hybrid Cloud
* A __hybrid cloud__ combines __public__ and __private clouds__, allowing you to run your applications in the most appropriate location. For example, you could host a website in the public cloud and link it to a highly secure database hosted in your private cloud (or on-premises datacenter).

* This is helpful when you have some things that cannot be put in the cloud, maybe for legal reasons. For example, you may have some specific pieces of data that cannot be exposed publicly (such as medical data) which needs to be held in your private datacenter. Another example is one or more applications that run on old hardware that can't be updated. In this case, you can keep the old system running locally, and connect it to the public cloud for authorization or storage.

* __Advantages of Hybrid Cloud__ include:
    * You can keep any systems running and accessible that use out-of-date hardware or an out-of-date operating system
    * You have flexibility with what you run locally versus in the cloud
    * You can take advantage of economies of scale from public cloud providers for services and resources where it's cheaper, and then supplement with your own equipment when it's not
    * You can use your own equipment to meet security, compliance, or legacy scenarios where you need to completely control the environment. 
* __Disadvantages of Hybrid Cloud__ include:
    * It can be more expensive than selecting one deployment model since it involves some CapEx cost up front
    * It can be more complicated to set up and manage
# Cloud Native Architecture
* __Cloud native__ technologies empower organizations to build and run scalable applications in modern, dynamic environments such as _public_, _private_ and _hybrid_ clouds.
* __Cloud-native__ is an approach to building and running applications that exploits the advantages of the cloud computing delivery model. _Cloud-native_ is about how applications are created and deployed, not where.
# Traits of Cloud Natives
Specifically, __cloud native applications__ are built around several small, self-contained services (referred to as ‘_Microservices_’) that are deployed on cloud infrastructure using __containers__. In summary, ‘cloud-native’ applications have the following __characteristics__:
* Can be deployed to any type of cloud
* Take full advantage of cloud computing environments and scale up on demand, very fast.
* Generally are composed of several ‘Microservices’, each providing a single business feature and communicate with each other via well-defined set of APIs. These services, when combined, provide the application, its functionality.
* Have an underlying infrastructure that supports continuous integration and continuous deployment (CI/CD), which helps developers to constantly add new features / functionality.
* Make use of containers (such as Docker) to host the above services. Each container maintains resource isolation. It is these containers that provide a fast and easy way to provide additional services on demand.
* Some way of managing the containers that host these services, the most popular being [Kubernetes](https://kubernetes.io/).