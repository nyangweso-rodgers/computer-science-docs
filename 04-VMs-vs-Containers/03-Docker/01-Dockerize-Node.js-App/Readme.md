# How to Dockerize a Node.js App

# Task

- Create a simple Node.js App that sends and gets requests.

# Introduction

- Dockerizing is the process of packing, deploying, and running applications using Docker containers.

# Requirements

- For VS Code users, install [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) extension.
- The Docker extension makes it easy to build, manage, and deploy containerized applications from Visual Studio Code. It also provides one-click debugging of Node.js, Python, and .NET inside a container.

# Environment Setup

- To create a node.js app from scratch, you just need to run
  ```sh
    npm init
  ```
- a `package.json` file is generated. Now you can create a new file named `app.js` and this is going to be the file where we will be dockerizing it.
- To send/get the http request we need to set up express too, so also need to install `express.js`. To do that simply run
  ```sh
    npm i express
  ```
- Create a simple get request:

  ```js
  const express = require("express");

  const app = express();

  app.get("/", (req, res) => {
    res.send({
      message: "Server is successfully listening",
    });
  });
  const port = process.env.PORT || 3000;
  app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
  ```

- Run this app by running `node app.js` and your server will start on port 3000.
- Open browser and go to port 3000 in which the app is running and you will see outpu an output.

# Dockerfile

- A `Dockerfile` is a text file that contains all of the commands that a user may use to construct an image from the command line.
- Step 1:

  - create a `Dockerfile` inside of your project directory.
  - The first thing we need to do is define from what image we want to build from

    ```Dockerfile
        FROM node:14

        WORKDIR /app

        COPY package*.json ./

        RUN npm install

        COPY . .

        ENV PORT=8080

        EXPOSE 8080

        CMD ["node", "start"]
    ```

  - `FROM` initializes a new build stage and sets the Base Image for subsequent instructions
  - `WORKDIR` is used to set the working directory for all the subsequent instructions
  - `COPY` let you copy files from a specific location into a Docker image
  - `RUN` allows you to install your application and packages required for it
  - `EXPOSE` is a way to keep track of which ports are in use, but it does not map or open any ports.
  - `CMD` ​ specifies the instruction that is to be executed when a Docker container starts

- Step 2: We now have a full set of instructions to build a **docker image**:
  - To build a Docker image, use the below command
    ```sh
        docker build [OPTIONS] PATH | URL | -
    ```
  - In this case, it will be:
    ```sh
        docker build -t <username>/01-dockerize-node.js-app . # change dockerhub username
    ```
  - After building the Docker image, you can run the **container** using the `docker run` command. Remember that you can specify the port mappings, volumes, and other options as needed based on your application configuration.
    ```sh
      docker run -p 8080:8080 your-dockerhub-username/01-dockerize-node.js-app
    ```
  - After the completion of this process, a docker image will be created. To see all your docker images, run the following command in your terminal
    ```sh
        docker images
    ```
- Step 3: **Docker Containers**:
  - Now that we have your docker images, we can use them as a base image to create other images or we can use it to run containers.
  - Usually, we use this image to push it to a container registry that might be docker hub or any cloud provider.
    ```sh
      docker push nyangwesorodgers/01-dockerize-node.js-app
    ```
- Note:
  - If you got an access denied error, then you need to login into your docker hub account, to do that run
    ```sh
      docker login
    ```
