# GitHub Actions

## Table of Contents

# CI/CD Pipeline

- An example of a real-life **CI/CD pipeline** could look like this:

  1. **Code commit**: A developer pushes code to the GitHub repository.
  2. **Automated build**: GitHub Actions triggers a workflow that builds the application.
  3. **Automated testing**: The workflow runs unit tests and integration tests.
  4. **Deployment to staging**: If tests pass, the application is deployed to a staging environment.
  5. **Approval for production**: A team member reviews and approves deployment.
  6. **Deployment to production**: The application is deployed to the production environment.

- Popular **CI/CD Platforms**, with more than 80% of the market share, are:
  1. GitHub Actions
  2. Jenkins
  3. Azure DevOps
  4. AWS CodePipeline
  5. Bitbucet

# GitHub Actions?

- **GitHub actions** are a GitHub-native CI/CD pipeline that allows you to **build**, **test** as well as **deploy** your applications. You can use GitHub actions to test the code in every PR and make sure that the new code changes are not negatively affecting your existing applications.
- Launched in 2018, **GitHub Actions** help developers automate their workflows—all within GitHub. Unlike other automation tools and features, **GitHub Actions** goes beyond the typical applications of testing, building, and deploying. Instead, it offers the flexibility to automate any **webhook**.

- **How do GitHub actions work?**

  - **GitHub actions** can be triggered whenever an event happens within the repository. For example, the action can get triggered when a PR is opened. **Actions** run as jobs with specific tasks assigned to them. These jobs run either in a VM or a container environment called **Runners**. The jobs can be configured either by using a custom script or using pre-defined actions.
  - You can have multiple **jobs** within your workflow, which either trigger sequentially or run parallel to each other, which allows for a lot of flexibility in the speed and efficiency of workflows. Each runner runs one job.

- **GitHub Actions Components**:

  1. **Workflow**:

     - Workflows are the complete pipeline that consists of several different **jobs**. Workflows are defined in **YAML files** and exist within the `.github/workflows` directory in any repository
     - It describes one or more jobs (related to **build**, **test**, and **deploy**) that can be triggered by events like code pushes, pull requests, releases, or scheduled times. You can use workflow files to configure pipelines to take a predefined series of actions on the code that has just been committed.

  2. **Events**:

     - An event is a specific activity that is triggered within your repository.
     - For example, an event could be a PR or issue being created, a commit or push being made, etc.
     - For example you can have an **event** set to run a **workflow** when a PR is created, or when an issue is opened. To define an **event** in a **workflow**, use the keyword `on` followed by the event names. _For example_:
       ```yml
       on:
           issues:
           types: [opened]
           pull_request_target:
           types: [opened]
       ```

  3. **Runner**:

     - A GitHub runner is a VM or container where your workflows will run after they are created. You can either use the GitHub runners or host your custom runners.
     - For example, when the `build-and-test` job is triggered based on some event, GitHub Actions will pull your code to that computer and execute the job.

  4. **Job**:

     - A **job** is a set of steps that runs in the same **runner**. Each step can be a custom shell script that can be run or a pre-defined action. These steps are dependent on each other and run in the defined order.
     - **Jobs** can run either in parallel or sequentially, depending on the dependencies defined in the workflow. **Jobs** that do not rely on the output of other jobs can run in parallel, which helps reduce the overall build time.
     - To define your **jobs** in a given **workflow**, use the keyword `jobs` followed by a unique identifier for each job and its configuration. _For example_:
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

  5. **Action**:

     - An **action** is a custom application for the **GitHub Actions** platform. It performs complex but often repetitive tasks such as building an application or building and pushing containers. Using an action reduces the amount of repetitive code you would need to write in your workflows.
     - You can use **actions** shared by the community/GitHub or create custom ones. **GitHub Actions** offers three types of custom actions:
       1. **JavaScript actions**, which run directly on the runner machine;
       2. **Docker container actions**, which run in a Docker environment;
       3. and **composite actions**, which combine multiple workflow steps into a single action.

  6. **GitHub Actions Artifacts**:

     - **GitHub Actions artifacts** are files or directories that are uploaded and stored after a job in a **GitHub Actions workflow** is completed. These artifacts enable you to retain and access the job’s output for further processing within the pipeline or by other services. Examples of artifacts include versioned executables, logs, and test results.

  7. **GitHub Actions Secrets**:
     - Build and deploy activities often require access to sensitive information such as API keys, tokens, and passwords. GitHub Actions provides a secure method to configure and store this sensitive information as secrets. These secrets are stored in encrypted form as environment variables, which are made available to the runners during each workflow run. Thus, workflows can access and use the necessary sensitive information securely.

# Creating the GitHub CI Workflow

- Goal:

  - Use Github Actions to create a CI/CD pipeline, and deploy the application to a Kubernetes cluster.
  - We will create a GitHub Actions workflow which will do the following:
    1. Building and testing the code
    2. Security Scans
    3. Create a Docker image and push it to DockerHub
    4. Deploy the application on a Kubernetes cluster

- **Prerequisites**:
  1. All of workflow files will be created in the `.github/workflows` directory. **GitHub** will use this directory to read and apply the workflow files. From the root directory of the project, run the below command to create the folders.
     ```sh
        mkdir -p .github/workflows
     ```
- **Step 1**: **Creating the build & test job**
  - **GitHub** provides us with a lot of different actions that make it easy to write workflow files. A lot of the pre-defined actions can be used out of the box, without many changes. However, for our purposes, we will be making the configuration files from scratch.
  - Create a YAML file with the name `build-and-test.yaml`. We will write the build instructions within this file.
  - Every GitHub workflow configuration file starts with a name. As we are going to be defining the actions needed for building the source code and running the tests, we will call this workflow as build and test.
    ```yml
    name: build and test
    ```
  - Whenever the action triggers, we will see this action running as build and test. Next, we want to define the trigger condition.
  - As per best practice, the only time when you will have new code that needs to be tested will be when either a push is created, or when a PR is opened. For this specific repository, we want the action to trigger whenever something is pushed to the main branch, or a PR is created to merge into the main branch. We can define it with the following:
    ```yml
    on:
      push:
        branches: ["main"]
      pull_request:
        branches: ["main"]
    ```
  - Whenever the workflow executes, we will run the various jobs that are defined within it. Within a single workflow file, we can define multiple different jobs, which will run sequentially. Each job has multiple steps which will run in the order that is defined.
  - Within our build and test workflow, we will define only a single job. To create our complete workflow, we will need to create multiple jobs, but we will separate them into different files.
  - Within the build job, we will do the following steps:-
    1. [Checkout action]():- We use the checkout action so that the GitHub runner knows which repository to access.
    2. **Set up Golang**:- Since the application is written in Go, we need to set up Golang within the runner. To make the setup process quick and easy, we have the setup-go action. This GitHub action installs Golang and fetches the dependencies required for the project.
    3. **Build**: Building the executable file for the go application.
    4. **Test**: Running the suite of tests that we have for the go application.
  - In the above steps, you can notice that we have 2 quite repetitive tasks, i.e. Checking out the repository, and installing and setting up Golang. To make it easier to create a pipeline for this, GitHub has created the actions/checkout and actions/setup-go which greatly reduces the amount of code we need for creating the pipeline.

# Resources and Further Reading

1. [Kubernetes CI/CD Pipelines with GitHub Actions - The Definitive Guide](https://devtron.ai/blog/create-ci-cd-pipelines-with-github-actions-for-kubernetes-the-definitive-guide/?ref=dailydev)
