# Application Default Credentials (ADC)

## Table Of Contents
- [Further Reading]() 
  - [Google Cloud - Set up Application Default Credentials](https://cloud.google.com/docs/authentication/provide-credentials-adc)

# Description
* Describes how to set up ADC for use by:
  * Cloud Client Libraries, 
  * Google API Client Libraries, and 
  * the REST and RPC APIs in a variety of environments.

* You set up ADC by providing credentials to ADC in the environment where your code is running.

# What is ADC
* ADC is a strategy used by the Google authentication libraries to automatically find credentials based on the application environment.
* When you use ADC, your code can run in either a development or production environment without changing how your application authenticates to Google Cloud services and APIs.
* If you are using API keys, then you don't need to set up ADC.

# How to provide credentials to ADC
* How you provide credentials to ADC depends on where your code is running:
  * Local development environment


# Local development environment
# User Credentials
* When your code is running in a local development environment, such as a development workstation, the best option is to use credentials associated with your Google Account, also called _user credentials_.
* To provide your user credentials to ADC, you use the Google Cloud CLI:
    1. [Install and initialize the gcloud CLI](https://cloud.google.com/sdk/docs/install), if you haven't already
    2. Create your credential file:
       ```sh
            gcloud auth application-default login
       ```
    3. A login screen is displayed. After you log in, your credentials are stored in the [local credential file used by ADC](https://cloud.google.com/docs/authentication/application-default-credentials#personal)

* Using the gcloud CLI to provide credentials to ADC has the following limitations:
  * User credentials might not work for some methods and APIs, such as the Cloud Translation API or the Cloud Vision API, without extra parameters or configuration
  * This method stores your credentials in a file on your file system. Any user with access to your file system can use those credentials. When you no longer need these credentials, you should revoke them:
    
    ```sh
        gcloud auth application-default revoke
    ```
  * If your Google Account does not have the required Identity and Access Management (IAM) roles in your project, your code might not be able to access some resources. If this happens, ask your security administrator to grant you the required roles.