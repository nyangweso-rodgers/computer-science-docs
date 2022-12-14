# Software Testing

## Table Of Contents
- [Introduction to TDD](#Introduction-to-TDD)
- [Steps in TDD involves:](#Steps-in-TDD-involves:)
- [Software Testing](#Software-Testing)
    - Unit Testing
    - Regression Testing

# Introduction to TDD
* __Test Driven Development (TDD)__: means that you write tests before you write the code, which is why you cannot retroactively apply TDD to an existing project. -

# Steps in TDD involves:
* Write a test that tests a specific part of the user story or feature you are developing

* Run the test. It should fail right now, because you haven't written any code yet. If your test doesn't fail your existing code already behaves correctly or more likely your test doesn't test anything.

* Make the simplest possible change to your code that ensures the test succeeds. It's important that you do not make changes that go beyond your test, even if you know that you're going to change that later. This ensures that you do not introduce behavior that is untested because in TDD your tests are a major part of your documentation. It is also important that you do not touch anything that is unrelated to the test your trying to satisfy.

* Run your test again. It should now succeed. But if it fails go back to 1. Make sure that your test is actually correct before you try to find the problem in your code.

* When your test is satisfied refactor your code. Since in step 3 you did not touch anything unrelated to the test you may have introduced code smells. But because all of your existing code is now fully covered by tests (one of the reasons why TDD would be used in the first place) you can now safely reorganize it, and as long as your tests still succeed you're doing it right.

# Software Testing
There are two type of __Software Testing__ namely:
    1. Unit Testing
    2. Regression Testing

# Unit Testing
* __Unit Testing__: is done by developers - once the __Unit Testing__ status is passed they will share the build with the __QA team__ for further testing. 

* __UNIT TESTING__ is a level of software testing where individual units/ components of a software are tested. The purpose is to _validate that each unit of the software performs as designed_. A __unit__ is the _smallest testable part of any software_. It usually has one or a few inputs and usually a single output. In procedural programming, a unit may be an individual program, function, procedure, etc.

* __Benefits of Unit Testing__ include:
    * Improves the quality of code
    * Restructuring and changes in the code are made easier by the developer and makes the integration easier
    * Bugs in the software are identified and resolved in the early stage in the software development lifecycle
    * As the bugs are identified and resolved at the earliest, time and costs are reduced

# Regression Testing
* Let’s assume that there is an application which maintains the details of all the students in school. This application has four buttons __Add__, __Save__, __Delete__ and __Refresh__. All the buttons functionalities are working as expected. Recently a new button ‘__Update__’ is added in the application. This ‘__Update__’ button functionality is tested and confirmed that it’s working as expected. But at the same time, it becomes very important to know that the introduction of this new button should not impact the other existing buttons functionality. Along with the ‘__Update__’ button, all the other buttons functionality are tested in order to find any new issues in the existing code. This process is known as __regression testing__.