# SQL Servers

## What is SQL Server?
__SQL Server__ is a __relational database management system__ (__RDBMS__) developed by _Microsoft_. It is primarily designed and developed to compete with __MySQL__ and __Oracle__ database.

## History SQL Server
__Microsoft__ and __Sybase__ released version 1.0 in 1989. However, the partnership between these two ended in the early 1990s. Microsoft maintained ownership rights to the name SQL Server. Since the 1990s, subsequent versions of SQL Server have been released including SQL Server 2000, 2005, 2008, 2012, 2014, 2016 and 2017.

## SQL Server Editions
Following editions are available

1. __SQL Server Enterprise__: It is used in the high end, large scale and mission Critical business. It provides _High-end security_, _Advanced Analytics_, _Machine Learning_, etc.

2. __SQL Server Standard__: It is suitable for Mid-Tier Application and Data marts. It includes basic reporting and analytics.

3. __SQL Server WEB__: It is designed for a low total-cost-of-ownership option for Web hosters. It provides scalability, affordability, and manageability capabilities for small to large scale Web properties.

4. __SQL Server Developer__: It is similar to an enterprise edition for the non-production environment. It is mainly used for build, test, and demo.

5. __SQL Server Express__: It is for small scale applications and free to use.

## Key Components and Services of SQL Server
1. __Database Engine__: This component handle storage, Rapid transaction Processing, and Securing Data.

2. __SQL Server__: This service starts, stops, pauses, and continues an instance of Microsoft SQL Server. Executable name is sqlservr.exe.
3. __SQL Server Agent__: It performs the role of Task Scheduler. It can be triggered by any event or as per demand. Executable name is sqlagent.exe.
4. __SQL Server Browser__: This listens to the incoming request and connects to the desired SQL server instance. Executable name is sqlbrowser.exe.
5. __SQL Server Full-Text Search__: This lets user running full-text queries against Character data in SQL Tables. Executable name is fdlauncher.exe.
6. __SQL Server VSS Writer__: This allows backup and restoration of data files when the SQL server is not running. Executable name is sqlwriter.exe.
7. __SQL Server Analysis Services (SSAS)__: Provide Data analysis, Data mining and Machine Learning capabilities. SQL server is integrated with R and Python language for advanced analytics. Executable name is msmdsrv.exe.
8. __SQL Server Reporting Services (SSRS)__: Provides reporting features and decision-making capabilities. It includes integration with Hadoop. Executable name is ReportingServicesService.exe
9. __SQL Server Integration Services (SSIS)__: Provided Extract-Transform and Load capabilities of the different type of data from one source to another. It can be view as converting raw information into useful information. Executable name is MsDtsSrvr.exe

## Importance of SQL Server Instances
The following are the advantages of SQL Server instances:
1. __For installation of different versions on one machine__:
You can have different versions of SQL Server on a single machine. Each installation works independently from the other installations.
2. __For cost reduction__:
Instances can help us reduce the costs of operating SQL Server, especially in purchasing the SQL Server license. You can get different services from different instances, hence no need for purchasing one license for all services.
3. __For maintenance of development, production and test environments separately__:
This is the main benefit of having many SQL Server instances on a single machine. You can use different instances for development, production and test purposes.
4. __For reducing temporary database problems__:
When you have all services running on a single SQL Server instance, there are high chances of having problems with the problems, especially problems that keep on recurring. When such services are run on different instances, you can avoid having such problems.
5. __For separating security privileges__:
When different services are running on different SQL Server instances, you can focus on securing the instance running the most sensitive service
6. __For maintaining a standby server__:
A SQL Server instance can fail, leading to an outage of services. This explains the importance of having a standby server to be brought in if the current server fails. This can easily be achieved using SQL Server instances.

## How to Download and Install SQL Server
#### Reference:
https://www.guru99.com/download-install-sql-server.html

### References
https://www.guru99.com/sql-server-introduction.html