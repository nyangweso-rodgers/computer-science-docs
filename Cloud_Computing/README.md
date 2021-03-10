# Fundamentals of Cloud Computing

__Cloud computing__ is renting resources, like __storage space__ or __CPU cycles__, on another company's computers. You only pay for what you use. The company providing these services is referred to as a __cloud provider__. Some example providers are: 
* Microsoft, 
* Amazon, and 
* Google.
* IBM
## Benefits of Cloud Computing
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

## Why Cloud Computing?
1. _Cloud Computing is everywhere_ i.e., in use around the world in many forms by all types of people and companies.
2. _Cloud Computing is powerful_ i.e., it can run just any application anywhere, anytime and at any scale.
3. _Cloud Computing makes life easier_. i.e., it allows an individual to do more with less, be more efficient, save time and money.

## Traits (Qualities) of a Cloud
1. _Elastic_: scales up and down quickly.
2. _Metered_: you pay for what you use.i.e., no long-term contract in most cases.
3. _Self - service_: No (or reduced) need for IT Experts.

## Risks of Cloud Computing
1. Placing your trust in the cloud provider and if the provider goes down it means all your applications or data goes down.
2. Potential for data loss.
3. Potential for slow access to your data.
4. Potential questions related to regularity/legal
5. Potential for loss of customization.
6. Potential for unkown costs.

## AWS vs Azure vs Google Cloud
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