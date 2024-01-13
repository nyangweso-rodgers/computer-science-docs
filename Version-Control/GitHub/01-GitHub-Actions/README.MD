# GitHub Actions

## Table Of Contents
- [Further Reading]()
  - [freeCodeCamp - How to Use GitHub Actions to Automate Open-Source Projects](https://www.freecodecamp.org/news/automate-open-source-projects-with-github-actions/)

# Overview Of GitHub Actions
* __GitHub Actions__ is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your:
  * _build_, 
  * _test_, and 
  * _deployment pipeline_. 
  
* You can create workflows that build and test every pull request to your repository, or deploy merged pull requests to production. 
* Launched in 2018, __GitHub Actions__ help developers automate their workflows—all within GitHub. Unlike other automation tools and features, GitHub Actions goes beyond the typical applications of testing, building, and deploying. Instead, it offers the flexibility to automate any __webhook__.

# Setting Up a New GitHub Action Workflow

# Method 1: Using GitHub Interface
* On the GitHub Repo, click on `Actions` on the top navigation bar. This will give you access to the lists of recommended workflows and also an option to create your own workflow.
* Depending on the nature of your project, you can either create a new workflow or use the existing workflow.
* To set up a new workflow, click on `Set up a workflow yourself`. This will take you to a workflow creation screen with a new YAML file named `main.yml`. Once you click on this option, two folders are created alongside the `main.yml` file.
* Inside the `main.yml` file is where you define your workflow, and after writing everything you commit the changes just like your would do when making changes to a repository.
* With this, you have your workflow set and it'll run based on the triggers defined within the YAML file.

# Method 2: Using VS Code
* Clone the repository on your local machine and create a `.github` folder on the root folder of your project.
* Create another folder within the `.github` folder named `workfloows`.
* Add a file with an extension of `.yml` and write your script to it.

# GitHub Actions Components
* __GitHub Actions__ consists of thee Components:
  1. __Workflows__: These are sets of rules that define the automation process. They are defined in the YAML file which is stored in the `.github/workflows` folder.


  2. __Events__: These are what initiate a workflow. For example you can have an event set to run a workflow when a PR is created, or when an issue is opened. To define an event in a workflow, use the keyword `on` followed by the event names. _For example_:

    ```yml
        on:
          issues: 
            types: [opened]
          pull_request_target:
            types: [opened]
    ```

  3. __Jobs__: These are what make up a workflow. Jobs are run concurrently by default. To define your jobs in a given workflow, use the keyword `jobs` followed by a unique identifier for each job and its configuration. _For example_:

    ```yml
      jobs:
        build:
          runs-on: ubuntu-latest
          steps:
            - name: Check out repository
              uses: actions/checkout@v2
            - name: Set up Python
              uses: actions/setup-python@v2
              with: 
                python-version: 3.10
            - name: Install dependencies
              run: |
                pip install -r requirements.txt
    ```

  * All of these components work together to ensure a given set of rules are successfully executed.