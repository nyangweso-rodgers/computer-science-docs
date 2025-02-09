# GitHub Actions for Django Project

- Prerequisites:
  1. A Django project setup locally with at least one view that returns some response defined.

# How to Configure GitHub Actions For Django Project

- Goals:

  1. GitHub trigger a build and run our tests each time we push or open a pull request on main/master. We

- Steps:

  1. Create a folder named `.github` in the root of your project directory.
  2. Create a folder named `workflows` in the `.github` directory: This is where you'll create all your YAML files.
  3. Let's create our first workflow that will contain our **build and test jobs**. We do that by creating a file with a .yml extension. Let's name this file `build_and_test.yml`. Add the content below in the yaml file you just created:

     ```yml
        name: Build and Test

        on:
            push:
                branches: [main]
            pull_request:
                branches: [main]

        jobs:
            test:
                runs-on: ubuntu-latest

                steps:
                - name: Checkout code
                uses: actions/checkout@v2
                - name: Set up Python Environment
                uses: actions/setup-python@v2
                with:
                    python-version: '3.x'
                - name: Install Dependencies
                run: |
                    python -m pip install --upgrade pip
                    pip install -r requirements.txt

                - name: Run Tests
                run: |
                    python manage.py test
     ```

- Remarks:

  - `name`: Build and Test This is the name of our workflow. When you navigate to the actions tab, each workflow you define will be identified by the name you give it here on that list.
  - `on`: This is where you specify the events that should trigger the execution of our workflow. In our config file we passed it two events. We specified the main branch as the target branch.
  - `jobs`: Remember, a workflow is just a collection of jobs.
  - `test`: This is the name of the job we've defined in this workflow. You could name it anything really. Notice it's the only job and the build job isn't there? Well, it's Python code so no build step is required. This is why we didn't define the build job.
  - `runs-on`: GitHub provides **Ubuntu Linux**, **Microsoft Windows**, and **macOS** runners to run your workflows. This where you specify the type of runner you want to use. In our case, we are using the **Ubuntu Linux** runner.
  - A job is made up of a series of `steps` that are usually executed sequentially on the same runner. In our file above, each step is marked by a hyphen. name represents the name of the step. Each step could either be a shell script that is being executed or an action . You define a step with uses if it's executing an action or you define a step with run if it's executing a shell script.

- Now that you've defined a workflow by adding the config file in the designated folder, you can commit and push your change to your remote repo.
- If you navigate to the **Actions** tab of your remote repo, you should see a workflow with the name **Build and Test** (the name which we've given it) listed there.

# Resources and Further Reading

1. [freeCodeCamp - How to Setup a CI/CD Pipeline with GitHub Actions and AWS](https://www.freecodecamp.org/news/how-to-setup-a-ci-cd-pipeline-with-github-actions-and-aws/?ref=dailydev)
