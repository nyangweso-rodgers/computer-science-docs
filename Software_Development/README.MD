# Software Development

## Table Of Contents
- [Overview Of Software Development](#Overview-Of-Software-Development)
- [Principles Of Software Development](#Principles-Of-Software-Development)
    - Software Release
    - Test Driven Development (TDD)
    - Software Testing

- [Software Development Methodologies](#Software-Development-Methodologies)
    - Waterfall Development
    - Agile Development
        - [Scrum](#Scrum)
        - Kanban
        - Extreme Programming
- [Software Deployment Strategies](#Software-Deployment-Strategies)

- [References]()
    - [Software Deployment Strategies](https://shabarish033.medium.com/software-deployment-strategies-how-companies-deploy-their-applications-d1fb14cb6ab9)

# Overview Of Software Development
__Software Engineering__ is the study of how software systems are built, including topics such as Project Management, Quality Assurance, and Software Testing.

# Principles Of Software Development
1. __Software release__ is the process of “shipping” a set of new __features__, __bugfixes__ or __software performance improvement__ strategies to the users. A software release can be a __major version__, __hotfix version__ or a __patch fix__.  When a software is released, it goes through several environments like :__Development →Test → Staging →Pre-Production →Production environments.__

2. __Test Driven Development (TDD)__: means that you write tests before you write the code, which is why you cannot retroactively apply TDD to an existing project. __Steps in TDD__ involves:
    * Write a test that tests a specific part of the user story or feature you are developing
    * Run the test. It should fail right now, because you haven't written any code yet. If your test doesn't fail your existing code already behaves correctly or more likely your test doesn't test anything.
    * Make the simplest possible change to your code that ensures the test succeeds. It's important that you do not make changes that go beyond your test, even if you know that you're going to change that later. This ensures that you do not introduce behavior that is untested because in TDD your tests are a major part of your documentation. It is also important that you do not touch anything that is unrelated to the test your trying to satisfy.
    * Run your test again. It should now succeed. But if it fails go back to 1. Make sure that your test is actually correct before you try to find the problem in your code.
    * When your test is satisfied refactor your code. Since in step 3 you did not touch anything unrelated to the test you may have introduced code smells. But because all of your existing code is now fully covered by tests (one of the reasons why TDD would be used in the first place) you can now safely reorganize it, and as long as your tests still succeed you're doing it right.

3. __Software Testing__: there are two type of Software Testing:
    * __Unit Testing__: is done by developers - once the __Unit Testing__ status is passed they will share the build with the __QA team__ for further testing. __UNIT TESTING__ is a level of software testing where individual units/ components of a software are tested. The purpose is to _validate that each unit of the software performs as designed_. A __unit__ is the _smallest testable part of any software_. It usually has one or a few inputs and usually a single output. In procedural programming, a unit may be an individual program, function, procedure, etc.

        __Benefits of Unit Testing__:
        * Improves the quality of code
        * Restructuring and changes in the code are made easier by the developer and makes the integration easier
        * Bugs in the software are identified and resolved in the early stage in the software development lifecycle
        * As the bugs are identified and resolved at the earliest, time and costs are reduced

    * __Regression Testing__: Let’s assume that there is an application which maintains the details of all the students in school. This application has four buttons __Add__, __Save__, __Delete__ and __Refresh__. All the buttons functionalities are working as expected. Recently a new button ‘__Update__’ is added in the application. This ‘__Update__’ button functionality is tested and confirmed that it’s working as expected. But at the same time, it becomes very important to know that the introduction of this new button should not impact the other existing buttons functionality. Along with the ‘__Update__’ button, all the other buttons functionality are tested in order to find any new issues in the existing code. This process is known as __regression testing__.

# Software Development Methodologies
* __Waterfall Development__: You figure out everything you need to do and document them (requirements). Like a _waterfall_, there's no way to go back up unless you start over again. You move on to the next phase when current phase is completed.
* __Agile Development__: In __Agile Development__, you figure out some of the things you need to do at the beginning. Then continously improve, evolve, collaborate and adapt as the development goes on. Some of the popular implementations of __Agile Development__ methodology include:
    - Scrum
    - Extreme Programming
    - Kanban

# Scrum
__Scrum__: is a _lightweight framework that helps people, teams and organizations generate value through adaptive solutions for complex problems._ i.e., __Scrum__ requires a __Scrum Master__ to foster an environment where:
* A __Product Owner__ orders the work for a complex problem into a __Product Backlog__.
* The __Scrum Team__ turns a selection of the work into an Increment of value during a Sprint.
* The __Scrum Team__ and its stakeholders inspect the results and adjust for the next Sprint.
* Repeat

_Remarks_:
* __Scrum__ employs an iterative, incremental approach to optimize predictability and to control risk. Scrum engages groups of people who collectively have all the skills and expertise to do the work and share or acquire such skills as needed.
* __Scrum Values__:These 5 values give direction to the __Scrum Team__ with regard to their work, actions, and behavior.
    - __Commitment__: _The Scrum Team commits to achieving its goals and to supporting each other._
    - __Focus__: _Their primary focus is on the work of the Sprint to make the best possible progress toward these goals_
    - __Openness__: _The Scrum Team and its stakeholders are open about the work and the challenges._ 
    - __Respect__: _Scrum Team members respect each other to be capable, independent people, and are respected as such by the people with whom they work_
    - __Courage__: _The Scrum Team members have the courage to do the right thing, to work on tough problems._
* __Scrum Team__ consists of:
    - __Scrum Master__: is _accountable for establishing Scrum as defined in the Scrum Guide_. They do this by helping everyone understand Scrum theory and practice, both within the Scrum Team and the organization. 
    - __Product Owner__: _accountable for maximizing the value of the product resulting from the work of the Scrum Team_ 
    - __Developers__: _are the people in the __Scrum Team__ that are committed to creating any aspect of a usable Increment each Sprint._


# Software Deployment Strategies
__Deployment strategy__ is a method used by the __DevOps__ teams to release a new version of their software, there are several methods available, one must take into consideration the downtime, traffic flows, and operational cost for each method chosen. Depending on the companies priorities and requirements one of the methods listed below can be chosen.
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

4. __A/B Testing__: In this method, the new version of the software is release along with the older version because it helps the developers compare the performance of the newer version over the older version, this type of deployment also helps the developers to test the user behavior on the newer features. The newer version is released to a small subset of users. If the newer version of the software meets the acceptable standards then it is released to the entire user base.
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

6. __Rolling Deployment__: This method is applicable for those applications deployed on containers. It is similar to the Ramped Deployment, however one replaces the Pods containing the older application version with the Pods containing the new application version.

7. __Shadow Deployment__: In this method the newer version of the software is deployed along with the older version of the software, a copy of the user requests is then forked/copied and sent to the newer version of the software. Once the developers are confident on the performance of the newer software version with the user traffic it receives, then the traffic is completely switched to the newer version of the software.
    - _Advantages_:
        - _Developers can get a good feedback of the application of how the newer software version works in production._
        - _Higher application availability, because the entire application does not need to go down._

    - _Disadvantages_:
        - _It is complicated to set up and maintain this deployment strategy._ 
