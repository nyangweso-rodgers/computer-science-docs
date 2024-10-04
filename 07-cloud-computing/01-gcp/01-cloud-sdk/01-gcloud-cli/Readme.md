# Google Cloud Command Line Interface (gcloud CLI)

- As part of the [Google Cloud SDK](), the Google Cloud CLI is available at no charge for users with a Google Cloud account.

# Features

## 1. `gsutil`

- The `gsutil` tool provides access to **Cloud Storage**, including a wide range of bucket and object management tasks, directly from the command line.

## 2. `bq`

- The `bq` tool enables running queries and manipulating datasets, tables, and entities in **BigQuery** through the command line.

## 3. `kubectl`

- The `kubectl` tool provides commands for greater control over **Kubernetes clusters**. With `kubectl`, you can deploy applications, inspect and manage cluster resources, and view logs, among a wide set of operations.

## 4. Emulators

- Google Cloud CLI comes with emulators for products like Bigtable, Datastore, Firestore, Spanner, and Pub/Sub, for local development, testing, and validation.

## 5. Interactive Mode

- The gcloud interactive shell produces suggestions and auto-completion for commands, sub-commands, flags, and file and resource arguments. Inline help is displayed in the lower section.

## 6. Cloud Console command construction

# How to download gcloud cli

## 1. Install gcloud cli on windows

- Step 1:
  - Download Google Cloud SDK Installer:
    - Open a web browser and go to the Google Cloud SDK download page: https://cloud.google.com/sdk/docs/install
    - Download the Google Cloud CLI installer.
    - Alternatively, you can open a PowerShell terminal and run the following commands:
      ```sh
          (New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe") & $env:Temp\GoogleCloudSDKInstaller.exe
      ```
- Step 2:
  - Launch the Installer:
    - Launch the installer and follow the prompts. The installer is signed by Google LLC.

## 2. Installing Google Cloud CLI on Linux (Ubuntu)

## 3. Installing Google Cloud CLI on Mac

# Initializing the gcloud CLI

- Use the `gcloud init` command to perform several common gcloud CLI setup tasks. These include authorizing the gcloud CLI to access Google Cloud using your user account credentials and setting up the default configuration.
  1. Initialize the gcloud CLI:
  ```sh
      gcloud init
  ```
  2. Accept the option to sign in using your Google user account:
  ```sh
      To continue, you must log in. Would you like to log in (Y/n)? Y
  ```
  3. In your browser, sign in to your Google user account when prompted and click **Allow** to grant permission to access Google Cloud resources.
  4. At the command prompt, select a Google Cloud project from the list of projects where you have Owner, Editor or Viewer permissions:

# Resources and Further Reading

1. [https://cloud.google.com/cli?hl=en](https://cloud.google.com/cli?hl=en)
