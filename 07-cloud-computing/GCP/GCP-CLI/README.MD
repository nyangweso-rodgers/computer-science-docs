# GCP - CLI

## Table Of Contents
- [Further Reading]()
  - [Google Cloud - Install the gcloud CLI](https://cloud.google.com/sdk/docs/install)


# Install the gcloud CLI
* The Google Cloud CLI includes the:
  * gcloud, 
  * gsutil and 
  * bq command-line tools.

# Installation instructions
* These instructions are for installing the Google Cloud CLI

# Windows Installation
1. Download [Google Cloud CLI Installer](https://cloud.google.com/sdk/docs/install)
2. Alternatively, open a PowerShell terminal and run the following PowerShell commands:

    ```sh
        (New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")
        & $env:Temp\GoogleCloudSDKInstaller.exe
    ```
3. Launch the installer and follow the prompts.
4. Cloud SDK requires Python; supported versions are Python 3 (3.5 to 3.9). By default, the Windows version of Cloud SDK comes bundled with Python 3. To use Cloud SDK, your operating system must be able to run a supported version of Python.
5. After installation is complete, the installer gives you the option to create Start Menu and Desktop shortcuts, start the Google Cloud CLI shell, and configure the gcloud CLI. Make sure that you leave the options to start the shell and configure your installation selected. The installer starts a terminal window and runs the gcloud init command.
6. The default installation doesn't include the __App Engine__ extensions required to deploy an application using __gcloud__ commands. These components can be installed using the [gcloud CLI component manager]().