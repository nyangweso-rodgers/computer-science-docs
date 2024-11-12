# Software Deployment Strategies

## Table Of Contents
- [Introduction to Software Deployment Strategies](#Introduction-to-Software-Deployment-Strategies)

- [Deployment Methods](#Deployment-Methods)
    - Recreate Deployment
    - Blue/Green Deployment
    - Canary Release
    - A/B Testing
    - Ramped Deployment
    - Rolling Deployment
    - Shadow Deployment

- [Further Reading]()
     - [Software Deployment Strategies](https://shabarish033.medium.com/software-deployment-strategies-how-companies-deploy-their-applications-d1fb14cb6ab9)

# Introduction to Software Deployment Strategies
* __Deployment strategy__ is a method used by the __DevOps__ teams to release a new version of their software, there are several methods available, one must take into consideration the downtime, traffic flows, and operational cost for each method chosen. Depending on the companies priorities and requirements one of the methods listed below can be chosen.

# Deployment Methods
1. __Recreate Deployment__: In this method the developers completely shut down the Prod environment containing the old version of the software. The developers then deploy the new version of the software and reboot the environment. The users loose complete access to the application when the environment is shut down.
    - _Advantages_:
        - _less expensive as there is no need of a load balancer to direct/manage traffic._
    - _Disadvantages_:
        - _This method is generally used when you would like to write the complete application ground up, and when the developers have no other choice._
        - _users loose complete access when the production environment is shut down. The users must be kept aware of the new software deployment activity in advance._

2. __Blue/Green Deployment__: In this method we have 2 Environments, a live Prod environment and a staging Prod Environment. We also have a load balancer that can direct traffic. When the new software is deployed the traffic is switched from the live to staging environment.
    - _Advantages_:
        - _Reduction in downtime because the Prod environment is always available._
        - _Ability to roll back to the older software version incase of problems in the new software version._

    - _Disadvantages_:
        - _It is costlier to maintain 2 environments._

3. __Canary Release__: In this method the new version of the software is tested on a small set of users and then the number of users is slowly increased until all the users receive the new version of the software.
    - _Advantages_:
        - _There is continous software performance monitoring on the new software release stability._
        - _The devops engineers get a chance to roll back a release if the performance of the new software version does not meet its standards._

    - _Disadvantages_:
        - _It requires more effort and the software deployment cycle is longer._

4. __A/B Testing__: In this method, the new version of the software is released along with the older version because it helps the developers compare the performance of the newer version over the older version, this type of deployment also helps the developers to test the user behavior on the newer features. The newer version is released to a small subset of users. If the newer version of the software meets the acceptable standards then it is released to the entire user base.
    - _Advantages_:
        - _It is easier and less risky to test the newer version of the software on a small subset of users and then make the newer version to the entire user base_
        - _One can roll back the newer version if it does not meet the performance standards._

    - _Disadvantages_:
        - _This method of release requires a higher user/developer coordination._

5. __Ramped Deployment__: In this method, the instances containing the older version of the software is slowly and gradually replaced with the new software until all the instances have the newer software version.
    - _Advantages_:
        - _The process is gradual, thus it is less risky._
        - _No need to take the entire application down, so the application availability is higher._

    - _Disadvantages_:
        - _Rollback can be complicated._
        - _It requires more effort and the deployment cycle is longer._
        - _One need a high number of instances with the software at a given time._

6. __Rolling Deployment__: This method is applicable for those applications deployed on containers. It is similar to the __Ramped Deployment__, however one replaces the Pods containing the older application version with the Pods containing the new application version.

7. __Shadow Deployment__: In this method the newer version of the software is deployed along with the older version of the software, a copy of the user requests is then forked/copied and sent to the newer version of the software. Once the developers are confident on the performance of the newer software version with the user traffic it receives, then the traffic is completely switched to the newer version of the software.
    - _Advantages_:
        - _Developers can get a good feedback of the application of how the newer software version works in production._
        - _Higher application availability, because the entire application does not need to go down._

    - _Disadvantages_:
        - _It is complicated to set up and maintain this deployment strategy._ 