# Azure Architecture and Service Guarantees

## Understand Datacenters and Regions in Azure
Microsoft Azure is made up of __datacenters__ located around the globe. When you leverage a service or create a resource such as a SQL database or virtual machine, you are using physical equipment in one or more of these locations.

## What is a region?
A __region__ is a geographical area on the planet containing at least one, but potentially multiple datacenters that are nearby and networked together with a low-latency network. Azure intelligently assigns and controls the resources within each region to ensure workloads are appropriately balanced.
When you deploy a resource in Azure, you will often need to choose the region where you want your resource deployed.

A few examples of regions are 
* West US, 
* Canada Central, 
* West Europe, 
* Australia East, and 
* Japan West

### Why is this important?
Azure has more global regions than any other cloud provider. This gives you the flexibility to bring applications closer to your users no matter where they are. It also provides better scalability, redundancy, and preserves data residency for your service.

### Special Azure regions
Azure has specialized regions that you might want to use when building out your applications for compliance or legal purposes. These include:

* _US DoD Central, US Gov Virginia, US Gov Iowa and more: These are physical and logical network-isolated instances of Azure for US government agencies and partners. These datacenters are operated by screened US persons and include additional compliance certifications._

* _China East, China North and more: These regions are available through a unique partnership between Microsoft and 21Vianet, whereby Microsoft does not directly maintain the datacenters._

Regions are what you use to identify the location for your resources, but there are two other terms you should also be aware of: geographies and availability zones.

## Understand Geographies in Azure
__Azure__ divides the world into __geographies__ that are defined by geopolitical boundaries or country borders. An Azure geography is a discrete market typically containing two or more regions that preserve data residency and compliance boundaries. 

This division has several benefits.
* _Geographies allow customers with specific data residency and compliance needs to keep their data and applications close._
* _Geographies ensure that data residency, sovereignty, compliance, and resiliency requirements are honored within geographical boundaries._
* _Geographies are fault-tolerant to withstand complete region failure through their connection to dedicated high-capacity networking infrastructure._

__REMARK__:_Data residency refers to the physical or geographic location of an organization's data or information. It defines the legal or regulatory requirements imposed on data based on the country or region in which it resides and is an important consideration when planning out your application data storage._

__Geographies__ are broken up into the following areas:
* Americas
* Europe
* Asia Pacific
* Middle East and Africa

## Understand Availability Zones in Azure
You want to ensure your services and data are redundant so you can protect your information in case of failure. When you are hosting your infrastructure, this requires creating duplicate hardware environments. Azure can help make your app highly available through Availability Zones.

### What is an Availability Zone?
__Availability Zones__ are physically separate datacenters within an Azure region.
Each Availability Zone is made up of one or more datacenters equipped with independent _power_, _cooling_, and _networking_. It is set up to be an isolation boundary. If one zone goes down, the other continues working. Availability Zones are connected through high-speed, private fiber-optic networks.

### Supported regions
Not every region has support for Availability Zones. The following regions have a minimum of three separate zones to ensure resiliency.
* Central US
* East US 2
* West US 2
* West Europe
* France Central
* North Europe
* Southeast Asia

## Using Availability Zones in your apps
You can use Availability Zones to run mission-critical applications and build high-availability into your application architecture by co-locating your compute, storage, networking, and data resources within a zone and replicating in other zones. Keep in mind that there could be a cost to duplicating your services and transferring data between zones.

Availability Zones are primarily for VMs, managed disks, load balancers, and SQL databases. Azure services that support Availability Zones fall into two categories:
* _Zonal services_ – you pin the resource to a specific zone (for example, virtual machines, managed disks, IP addresses)
* _Zone-redundant services_ – platform replicates automatically across zones (for example, zone-redundant storage, SQL Database).

## Understand Region Pairs in Azure
Availability zones are created using one or more datacenters, and there is a minimum of three zones within a single region. However, it's possible that a large enough disaster could cause an outage large enough to affect even two datacenters. That's why Azure also creates __region pairs__.

### What is a region pair?
Each __Azure region__ is always paired with another region within the same geography (such as US, Europe, or Asia) at least 300 miles away. This approach allows for the replication of resources (such as virtual machine storage) across a geography that helps reduce the likelihood of interruptions due to events such as natural disasters, civil unrest, power outages, or physical network outages affecting both regions at once. If a region in a pair was affected by a natural disaster, for instance, services would automatically fail over to the other region in its region pair.

Since the pair of regions is directly connected and far enough apart to be isolated from regional disasters, you can use them to provide reliable services and data redundancy. Some services offer automatic geo-redundant storage using region pairs.

Additional advantages of region pairs include:
* _If there's an extensive Azure outage, one region out of every pair is prioritized to make sure at least one is restored as quick as possible for applications hosted in that region pair._

* _Planned Azure updates are rolled out to paired regions one region at a time to minimize downtime and risk of application outage._
* _Data continues to reside within the same geography as its pair (except for Brazil South) for tax and law enforcement jurisdiction purposes._

Having a broadly distributed set of datacenters allows Azure to provide a high guarantee of availability.

## Understand Service-Level Agreements for Azure
Microsoft maintains its commitment to providing customers with high-quality products and services by adhering to comprehensive operational policies, standards, and practices. Formal documents called __Service-Level Agreements__ (SLAs) capture the specific terms that define the performance standards that apply to Azure.

* SLAs describe Microsoft's commitment to providing Azure customers with specific performance standards.
* There are SLAs for individual Azure products and services.
* SLAs also specify what happens if a service or product fails to perform to a governing SLA's specification.

### SLAs for Azure products and services
There are three key characteristics of SLAs for Azure products and services:
1. Performance Targets
2. Uptime and Connectivity Guarantees
3. Service credits