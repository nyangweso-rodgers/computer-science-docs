# GitHub Actions

## Table Of Contents

# Overview Of GitHub Actions

- **GitHub Actions** is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your **build**, **test**, and **deployment pipeline**.
- You can create workflows that build and test every pull request to your repository, or deploy merged pull requests to production.
- Launched in 2018, **GitHub Actions** help developers automate their workflows—all within GitHub. Unlike other automation tools and features, **GitHub Actions** goes beyond the typical applications of testing, building, and deploying. Instead, it offers the flexibility to automate any **webhook**.

# How does GitHub Actions work?

- **GitHub Actions** workflows are configured using `YAML` files that define the sequence of tasks or actions to be executed when triggered by events like **code pushes**, **pull requests**, and **releases**.
- **Actions** are reusable units of code that perform specific tasks, such as setting up dependencies, running tests, and deploying to a cloud provider or on-premise servers. You can create and publish custom **Actions** for your specific requirements.

# GitHub Actions key concepts and features

## 1. GitHub Actions Workflows

- In **GitHub Actions**, a **workflow** is an automated process defined by a `YAML` file. It is usually placed in the `.github/workflows` directory of any repository. It describes one or more jobs (related to **build**, **test**, and **deploy**) that can be triggered by events like code pushes, pull requests, releases, or scheduled times. You can use workflow files to configure pipelines to take a predefined series of actions on the code that has just been committed.

## 2. GitHub Actions Events

- **GitHub Actions Events** are specific activities that trigger a **workflow** run. These events serve as trigger points for workflows, which help automate the build and deployment processes. Common event triggers include push, pull_request, schedule, and workflow_dispatch. Additionally, you can fine-tune these triggers by specifying further details such as branch names, commit messages, and more.
- For example you can have an **event** set to run a **workflow** when a PR is created, or when an issue is opened. To define an **event** in a **workflow**, use the keyword `on` followed by the event names. _For example_:

  ```yml
  on:
    issues:
      types: [opened]
    pull_request_target:
      types: [opened]
  ```

## 3. GitHub Actions runners

- **Runners** in **GitHub Actions** are virtual machines that execute jobs in a workflow. GitHub provides hosted runners for Ubuntu Linux, Windows, and macOS, and it also supports integration with self-hosted runners for private operations. GitHub-hosted runners are maintained by GitHub, so their environments cannot be customized. Organizations needing a custom build environment can provision and maintain self-hosted runners. Both GitHub-hosted and self-hosted runners can be used with private or public repositories.

## 4. GitHub Actions Jobs

- A **job** in **GitHub Actions** consists of a series of steps executed on the same runner. **Jobs** can run either in parallel or sequentially, depending on the dependencies defined in the workflow. **Jobs** that do not rely on the output of other jobs can run in parallel, which helps reduce the overall build time.
- To define your jobs in a given workflow, use the keyword `jobs` followed by a unique identifier for each job and its configuration. _For example_:

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

## 5. GitHub Actions steps

- **GitHub Actions** steps are the individual tasks or commands that make up a **job**. Each **job** consists of one or more steps that are executed sequentially. Steps can either run scripts or actions — the reusable code packages. The script allows you to run a series of shell or bash commands in the runner’s environment. Tasks like installing dependencies, running build commands, and testing are performed using scripts.

## 6. Actions

- **Actions** in **GtHub Action** are reusable code packages used as steps in a workflow. They perform tasks like setting up environments, running tests, deploying code, etc., which help automate various steps involved in the software development lifecycle.
- You can use **actions** shared by the community/GitHub or create custom ones. **GitHub Actions** offers three types of custom actions:
  1. **JavaScript actions**, which run directly on the runner machine;
  2. **Docker container actions**, which run in a Docker environment;
  3. and **composite actions**, which combine multiple workflow steps into a single action.

## 7. GitHub Actions artifacts

- **GitHub Actions artifacts** are files or directories that are uploaded and stored after a job in a **GitHub Actions workflow** is completed. These artifacts enable you to retain and access the job’s output for further processing within the pipeline or by other services. Examples of artifacts include versioned executables, logs, and test results.

## 8. GitHub Actions secrets

- Build and deploy activities often require access to sensitive information such as API keys, tokens, and passwords. GitHub Actions provides a secure method to configure and store this sensitive information as secrets. These secrets are stored in encrypted form as environment variables, which are made available to the runners during each workflow run. Thus, workflows can access and use the necessary sensitive information securely.

# How to create a GitHub Actions workflow

## 1. Continuous integration with GitHub Actions

- **Continuous Integration** (CI) is the practice of automating the **build** and **test jobs** and providing early feedback before integrating the new code changes into the central repository. This ensures the stability of the software being deployed/delivered. With **GitHub Actions**, you configure the sequence of jobs in a workflow to create an end-to-end build process.

### Step 1.1: Write the application code

- Write a simple simple application code managed in a GitHub repository.

### Step 1.2: Create a YAML file to define the actions

- In the project’s root directory, create a subdirectory, `.github/workflows`. Within this directory, create a file with the `.yml` extension. In this example, we have named it `python.yml`. This `.yml` file is automatically interpreted by **GitHub Actions** as a **workflow** file. Here, we begin by configuring the triggers.
- The `YAML` code below is placed at the very beginning of the `python.yml` file.

  ```yml
    name python

    on:
      push:
        branches: ["main"]
  ```

- The name parameter just names this workflow as `python`. `on: push: branches:` part of the **workflow** file mentions the list of branches for which the workflow should be triggered automatically. In this case, we want the workflow to trigger automatically for the `‘main’` branch.

### Step 1.3: Configure a build job

```yml
jobs:
  build:
    runs-on: ubuntu-latest
```

- First, we defined a **job** named `build`. The **job** name is not part of the syntax, and it could be anything that makes sense to you. Next, we need to specify the type of runner we want to use to perform this job. **GitHub Actions** supports various operating systems like **Ubuntu**, **Microsoft Windows**, or **MacOS**. For our purpose, we will use the **Ubuntu environment**.

### Step 1.4: Test your GitHub Action workflow

- For the next step, we want to test the application before we deliver the binary. The purpose of this test is to quickly identify any issues and provide feedback to the developers before the workflow proceeds to the next phase.

## 2. Continuous delivery with GitHub Actions

- Positive test results mean that we can now safely proceed to **deliver/deploy** the application to its target destination. **Delivery** is different from **deployment**. In **continuous delivery**, we build and deliver the **artifacts**, and a separate process is then responsible for the actual **deployment** of the **artifacts** on target servers. In **continuous deployment**, the **artifacts** are actually deployed on the servers.

### Step 2.1: Configure secrets for GitHub Actions

- Navigate to your **GitHub repository > Settings > Secrets and variables > Actions**, and configure these secrets

## 3. Continuous deployment with GitHub Actions

- **GitHub Actions** help deploy the application on **servers** or **Kubernetes clusters**. Typically, this is the final phase of the software development lifecycle and also means the end of an iteration.

### Step 3.1: Define the deployment job and access the artifact

# GitHub Actions Examples

- You can always check available actions on [GitHub Marketplace](https://github.com/marketplace/actions/setup-node-js-environment) to avoid repetition and save time

## GitHub Actions Examples 1

# Further Reading

1. [github.com/features/actions](https://github.com/features/actions)
2. [freeCodeCamp - How to Use GitHub Actions to Automate Open-Source Projects](https://www.freecodecamp.org/news/automate-open-source-projects-with-github-actions/)
3. [freeCodeCamp - What is CI/CD? Learn Continuous Integration/Continuous Deployment by Building a Project](https://www.freecodecamp.org/news/what-is-ci-cd/)
4. [https://spacelift.io/blog/github-actions-tutorial?ref=dailydev](https://spacelift.io/blog/github-actions-tutorial?ref=dailydev)
