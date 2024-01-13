# GitHub

# Introduction to GitHub

- **GitHub** is a web-based hosting service for **Git**. Main **Features** include:
  - code
  - Pull Requests
  - Issues
  - CI/CD - continuos build and continuos deployed features

# Repositories

- are the building blocks of **GitHub** and can be seen as a folder for your project. We can either create a repository on GitHub and clone it to the local machine or create a reposiory on the local machine, initialize it and push it to remotely. **Features of Repository** include:
  - Assign Topics to Repository
  - Work with **Projects**
  - See and Manage Issues
  - Pull Requests
  - Insights - information about project.
  - Settings to the Repository

# Special Files in GitHub

1. **README Files**: This is a special file known to **GitHub** and is automatically rendered on the landing page. It is typically written in **Markdown**(.md)
2. **Licence**: Contains your open source licence allowing a spying contributor to know what is the upright licence for the project.
3. **Contributing and Contributors**: Contain list of people/organizations who have contributed to the project.
4. **Change log**: Contains a list of all major changes between versions of the project.
5. **Support**: Exists to inform people about possible ways to get help with the project.
6. **Code - of -Conduct**: Contains guidelines for people on the rules that have to obey when interacting with the project
7. **Code Owners**: Used to specify which users are responsible for the code in a respository

## GitHub Concept 1: Gists

- A **Gist** is a simple way to share snippets and notes with others

## GitHub Concept 2: GitHub Wiki

- **Wiki** is a knowledge based site where people can collaborate on documentation and order content.
- **Wiki** can contain many pages and can be edited directly on GitHub or Offline.

## GitHub Concept 3: GitHub Pages

- **GitHub pages** are hosting sites which host static pages like personal websites, blog or company webpage. No server-side code.
- How to Create Your First GitHub Page

  - **Step 1**: Go to [GitHub]() and create a new public repository named `test-repo.github.io`
  - **Step 2**: On the terminal, clone the repository by running the following command:

    ```sh
        # clone the test-repo.github.io repo
        git clone https://github.com/username/test-repo.github.io
    ```

  - **Step 3**: On the terminal, enter the project folder and add `index.html` file:

    ```sh
        cd test-repo.github.io
        echo index.html
    ```

  - Edit the `index.html` file, add, commit and push the changes:

    ```sh
        git add index.html
        git commit -m"initial commit"
        git push -u origin main
    ```

  - And you are done.