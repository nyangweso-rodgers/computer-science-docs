# GitHub Pages


## Table Of Contents
- [Further Reading]()
    - [GitHub Pages - Website for you and Your Projects](https://pages.github.com/)
# Introduction to GitHub Pages
* __GitHub pages__ are hosting sites which host static pages like personal websites, blog or company webpage. No server-side code.

# How to Create Your First GitHub Page
* __Step 1__: Go to [GitHub]() and create a new public repository named `test-repo.github.io`
* __Step 2__: On the terminal, clone the repository by running the following command:

    ```sh
        # clone the test-repo.github.io repo
        git clone https://github.com/username/test-repo.github.io
    ```
* __Step 3__: On the terminal, enter the project folder and add `index.html` file:

    ```sh
        cd test-repo.github.io
        echo index.html
    ```
* Edit the `index.html` file, add, commit and push the changes:

    ```sh
        git add index.html
        git commit -m"initial commit"
        git push -u origin main 
    ```
* And you are done.