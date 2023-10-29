# Version Control

## Table Of Contents

- [Introduction to Version Control]()
- [Git]()
- [GitHub]()
- [Further Reading]()
    1. [GitHub Pages - Website for you and Your Projects](https://pages.github.com/)

# Introduction to Version Control

# Benefits of Version Control

1. Tracking Project's History. With >> git log, you are able to view the changes made at what point of the project.
2. Managing Multiple Versions of a Project
3. Sharing code amongst developers
4. Coordinating Teamwork

# GitHub

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
