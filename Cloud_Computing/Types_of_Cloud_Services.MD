# Types of Cloud Services
## IaaS vs. SaaS vs. PaaS

## 1. Infrastructure as a service (IaaS)
__Infrastructure as a Service__ is the most flexible category of cloud services. It aims to give you the most control over the provided hardware that runs your application (IT infrastructure servers and virtual machines (VMs), storage, and operating systems). Instead of buying hardware, with IaaS, you rent it. It's an instant computing infrastructure, provisioned and managed over the internet.

__Note__: _When using __IaaS__, ensuring that a service is up and running is a shared responsibility: the cloud provider is responsible for ensuring the cloud infrastructure is functioning correctly; the cloud customer is responsible for ensuring the service they are using is configured correctly, is up to date, and is available to their customers. This is referred to as the __shared responsibility__ model._

__IaaS__ is commonly used in the following scenarios:
1. __Migrating workloads__. Typically, IaaS facilities are managed in a similar way as on-premises infrastructure and provide an easy migration path for moving existing applications to the cloud.
2. __Test and development__. Teams can quickly set up and dismantle test and development environments, bringing new applications to market faster. IaaS makes scaling development and testing environments, fast and economical.
3. __Storage, backup, and recovery__. Organizations avoid the capital outlay and complexity of storage management, which typically requires skilled staff to manage data and meet legal and compliance requirements. IaaS is useful for managing unpredictable demand and steadily growing storage needs. IaaS can also simplify the planning and management of backup and recovery systems.

## 2. Platform as a service (PaaS)
__PaaS__ provides an _environment for building, testing, and deploying software applications_. The goal of PaaS is to help you create an application quickly without managing the underlying infrastructure. For example, when deploying a web application using PaaS, you don't have to install an operating system, web server, or even system updates.

__PaaS__ is a complete development and deployment environment in the cloud, with resources that enable organizations to deliver everything from simple cloud-based apps to sophisticated cloud-enabled enterprise applications. Resources are purchased from a cloud service provider on a pay-as-you-go basis and accessed over a secure Internet connection.

__PaaS__ is commonly used in the following scenarios:
1. __Development framework__. PaaS provides a framework that developers can build upon to develop or customize cloud-based applications. Just like Microsoft Excel macro, PaaS lets developers create applications using built-in software components. Cloud features such as scalability, high-availability, and multi-tenant capability are included, reducing the amount of coding that developers must do.
2. __Analytics or business intelligence__. Tools provided as a service with PaaS allow organizations to analyze and mine their data. They can find insights and patterns, and predict outcomes to improve business decisions such as forecasting, product design, and investment returns.

## 3. Software as a service (SaaS)
__SaaS__ is software that is centrally hosted and managed for the end customer. It is usually based on an architecture where one version of the application is used for all customers, and licensed through a monthly or annual subscription. _Office 365_, _Skype_, and _Dynamics CRM Online_ are perfect examples of SaaS software.

### Cost and Ownership
**|IaaS|PaaS|SaaS
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

## Combine cloud services to fit your needs
__IaaS__, __PaaS__, and __SaaS__ each contain different levels of managed services. You may easily use a combination of these types of infrastructure. You could use Office 365 on your company's computers (SaaS), and in Azure, you could host your VMs (IaaS) and use Azure SQL Database (PaaS) to store your data. With the cloud's flexibility, you can use any combination that provides you with the maximum result.