# Curl - client URL

## Table of Contents
- [Curl - client URL](#curl---client-url)
  - [Table of Contents](#table-of-contents)
- [Getting Started with curl](#getting-started-with-curl)
- [Installimg curl](#installimg-curl)
- [Working with curl](#working-with-curl)

# Getting Started with curl
* __curl__ is used to establish communication between the __client__ and the __server__. You can fetch data and transfer data to the server using __curl__. 
* __curl__ is nothing but a command-line tool that provides a more programmatic way to interact with APIs.

# Installimg curl
* The latest modern OS has __curl__ pre-installed so you don't need to install it to work with it. Or you can install it from here: https://curl.se/download.html

# Working with curl
* Working with __curl__ is super fast and convenient. Open your terminal and run the following command.
    ```curl
        curl --version
    ```
* Let's try to understand the syntax of sending requests using __curl__. We are using the __HTTP protocol__ as it is widely used. A typical HTTP request has four different components:
  * Method
  * Endpoint
  * HTTP headers
  * Body

* You can pass all of these using __curl__. Before that, let's try to make a simple __GET request__ without any headers and body.
* _Remarks_:
  * Run the following command in your terminal.
      ```curl
          curl https://jsonplaceholder.typicode.com/users
      ```
  * Not just that, you can also attach __HTTP headers__ and __body__ with the request. __curl Options__ allow you to do that.
  * Options give you the flexibility of passing an extra bit of information.
  * There are over 200 options but a few of them are widely used.
  * Options start with one (-) or two (--) dashes.
  * You can get the list of all options by running the following command in your terminal.
      ```curl
          curl --help
      ```
  * Let's try to put curl options in action. In order to pass the __HTTP headers__, you can either use `--header` or `-H` option.