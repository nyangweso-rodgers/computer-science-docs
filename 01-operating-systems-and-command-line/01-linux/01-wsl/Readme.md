# WSL

## Table Of Contents

# Windows Subsystem for Linux (WSL)

- **WSL** lets you run a **Linux** environment directly on your **Windows** machine, without needing a separate virtual machine or dual-booting. It's like having two operating systems in one, seamlessly integrated!

## Similarities between Linux and WSL

- **Core**: Both **WSL** and **Linux** are based on the **Linux kernel**, which means they share the same fundamental building blocks. This translates to a familiar experience for **Linux** users, as many commands and tools work the same way in both environments.
- **Command-line**: Both offer access to the powerful **Linux** command-line, allowing you to manage files, install software, and automate tasks with scripts.
- Both WSL and Linux are open source

## Differences between Linux and WSL

- **Architecture**: **WSL 1**, the earlier version, emulated the **Linux kernel** within **Windows**, while **WSL 2** uses a lightweight virtual machine to run a real **Linux kernel**. This makes **WSL 2** faster and more compatible with a wider range of Linux software.
- **Integration**: **WSL** integrates seamlessly with the Windows file system, allowing you to easily access and modify files from both environments. You can also run some Linux GUI applications using **WSLg**, a graphical interface extension.
- **Applications**: While **WSL** provides access to a vast library of **Linux** tools and applications, it may not run every single program available for native Linux. However, the compatibility is constantly improving.

# How to Download and Setup WSL

## Step 1: Enable WSL and Virtual Machine features:

- Open **PowerShell** or **Command Prompt** as administrator and run the following command:
  ```sh
    dism /online /enable-optional-feature -FeatureName Microsoft-Windows-Subsystem-Linux
    # or
    dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  ```
- Restart your computer.

## Step 3 (Optional): Set WSL 2 as the default version:

- Open **PowerShell** or **Command Prompt** as administrator and Run the following command:
  ```sh
  wsl --set-default-version 2
  ```

# WSL Commands

## List available WSL distributions

- There are several distributions, that you can install directly from either Microsoft store or through terminal commands.
  ```sh
  wsl --list --online
  ```

## Install Ubuntu, the default distribution

- In **WSL**, **Ubuntu** is set as the default distribution. So, if you want to install **Ubuntu**, you can open a terminal in **Admin** mode and run the command:
  ```sh
      wsl --install
  ```

## Install Debian or some other distribution

- Not a fan of **Ubuntu**? Don't worry! You can install the other distributions, that are available by using the command:
  ```sh
    wsl --install --distribution <distribution_name>
    # or
    wsl --install -d <distribution_name>
  ```
- You should make sure that, the distribution_name should be same as the name shown in the output of the `wsl --list --online` command.

## List installed distributions

- If you have multiple distributions installed, it is important to list those for future management. In order to do that, use the command:
  ```sh
   wsl --list --verbose
   # or
   wsl -l -v
  ```

## Run a distribution from Windows terminal

- If you have installed the distribution from the store, you can launch it from the start menu. But that's not always the case. Sometimes, you may need to rely on the terminal to run a distribution.
- In that case, you can run a distribution by using:
  ```sh
    wsl -d <distribution_name>
  ```
- Remember: The distribution_name is the one that appears on the output of `wsl -l -v`.

## Terminate a running distribution

- if you want to terminate a running **WSL** distribution, run:
  ```sh
      wsl --terminate <running_distribution_name>
  ```
- Or, if you intend to shut down the entire WSL system, use:
  ```sh
    wsl --shutdown
  ```

## Get the WSL version installed on your system

- There are two major versions for **WSL**; **WSL 1** and **WSL 2**. WSL version 2 has several advanced features and is better compared to WSL 1.
  ```sh
      wsl --version
  ```

## Check WSL Status

- You can check the status of WSL, its configuration, etc. using the --status option.
  ```sh
      wsl --status
  ```

## Change the WSL version of a distribution

- Let's say you are running a distribution using WSL 1, and you want to change the WSL version to 2 so that you can install Linux GUI apps with that system. For this, you can open a terminal in Admin mode and use the command below:
  ```sh
      wsl --set-version <distribution name> <versionNumber>
  ```
- Example:
  ```sh
    wsl --set-version Ubuntu 2
  ```

## Export a distribution

- Backing up data is always important, if you are dealing with critical information. In Linux distributions, we have tools like Timeshift, to create comprehensive system backups.
- WSL provides a built-in method to take a backup of your installed distribution along with all the data.
- **Remark**:
  - It is better to create a two separate folders called `WSL_Exports` and `WSL_Imports` to keep the exported files and imported distributions. This way, you can avoid cluttering and easy data retrieval.
- To export a distribution, use the command inside the `WSL_Exports` folder (for convenience):
  ```sh
    wsl --export <distribution_name> <file_name.tar>
  ```
- You are exporting the distribution along with the data to a tar file. The distribution_name should be the proper name, as in the output of the command `ws -l -v`.

## Import a distribution

- You have exported a distribution. Now, how will you restore it so that you can work with the data it carries? For this, on an elevated terminal, run the command:
  ```sh
      wsl --import <Distribution Name> <Import location> <exported file>
  ```

## Unregister a distribution

- To remove a distribution from the system, you can use the `--unregister` option of **WSL**. First, list the distribution using `wsl -l -v`. Note the name of the distribution and then perform the command:
  ```sh
    wsl --unregister <distribution_name>
  ```
- If you have installed the distribution from the list of available distributions (`wsl --list --online`), you may also need to uninstall the app from the system too.

## Update WSL

- To update **WSL** from the command line, you can use the command below on an elevated terminal:
  ```sh
    wsl --update
  ```

## Get help

- There are many options and sub commands for WSL, that you can utilize to get the most out of WSL. So, if you need any assistance regarding some options, always use the built-in help mechanism.
  ```sh
      wsl --help
  ```

# Resources and Further Reading

1. [Ubuntu WSL](https://canonical-ubuntu-wsl.readthedocs-hosted.com/en/latest/)
2. [How to Install WSL 2 on Windows 10 (Updated)](https://www.omgubuntu.co.uk/how-to-install-wsl2-on-windows-10)
3. [https://itsfoss.com/wsl-commands/?ref=dailydev](https://itsfoss.com/wsl-commands/?ref=dailydev)
