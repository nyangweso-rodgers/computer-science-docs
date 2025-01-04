# Commend Line (CLI)

## Table of Contents

# Difference between console, command line (CLI), terminal and Shell

# Definition of Terms

## 1. Console

- Console is a physical device that allows you to interact with the computer.

## 2. Terminal

- **Terminal** is a **CLI** program that allows you to interact with your computer using text commands. It provides a way to execute commands on your computer, navigate the file system, and manage files and directories.
- **Terminal** is a program, just like any other. And like any program, you can install it and uninstall it as you please. It's also possible to have many terminals installed in your computer and run whichever you want whenever you want.
- All os come with a default terminal installed, but there are many options out there to choose from, each with its own functionalities and features.
- Why should I even care about using the terminal?

  - Improves **efficiency**: on the CLI tasks can be executed with a single command. In this sense, being comfortable with the command line will help you save time and be able to execute your tasks quicker.
  - **Tasks automation**: we can build scripts with our shell and later on execute those scripts whenever we want. This is incredibly useful when dealing with repetitive tasks that we don't want to do over and over again.
  - The third reason is that sometimes the CLI will be the only way in which we'll be able to interact with a computer. e.g., the case when you would need to interact with a cloud platform server. In most of these cases, you won't have a GUI available, just a CLI to run commands in.

## 3. Shell

- Shell is a program that acts as **command-line interpreter**. It **processes commands** and **outputs the results**. It interprets and processes the commands entered by the user.
- Same as the **terminal**, the **shell** is a program that comes by default in all os, but can also be installed and uninstalled by the user.
- Different **shells** come with different syntax and characteristics as well. It's also possible to have many shells installed at your computer and run each one whenever you want.
- In most **Linux** and **Mac** os the default **shell** is **Bash**. While on **Windows** it's **Powershell**. Some other common examples of shells are **Zsh** and **Fish**.
- **Shells** work also as **programming languages**, in the sense that with them we can build scripts to make our computer execute a certain task.

- **Remarks**:

  - keep in mind that the **terminal** is the program in which the **shell** will run. But both programs are independent. That means, I can have any shell run on any terminal. There's no dependance between both programs in that sense.
  - keep in mind that the shell is the program your computer uses to "understand" and execute your commands, and that you can also use it to program tasks.

- Types of shell:
  1. **Bash**:
     - **Bash** is the most widely used and comes installed by default on **Mac** and **Linux**.
  2. Zsh
     - **Zsh** is very similar to **Bash**, but it was created after it and comes with some nice improvements over it.
  3. Fish
     - Fish is another commonly used shell that comes with some nice built-in features and configurations such as autocompletion and syntax highlighting.
     - The thing about Fish is that it's not Posix complaint, while **Bash** and **Zsh** are. This means that some of the commands you'll be able to run on Bash and Zsh won't run on Fish and viceversa. This makes Fish scripting less compatible with most computers compared to Bash and Zsh.
  4. Ash
  5. Dash

## 4. Command line (CLI)

- The **CLI** is the interface in which we enter commands for the computer to process. One interesting thing to mention here is that most OS have two different types of interfaces:

  - The **CLI**, which takes commands as inputs in order for the computer to execute tasks.
  - The other is the **GUI** (**graphical user interface**), in which the user can see things on the screen and click on them and the computer will respond to those events by executing the corresponding task.

# Shell Commands

## 1. How do I know what shell I'm running?

- To know what **shell** you're currently running, just open your terminal and enter `echo $0`.
- This will print the current running program name, which in this case is the actual shell.

  ```shell
      echo $0
  ```

## Command 2. Print to the Terminal

- `echo` prints in the terminal whatever parameter we pass it.
  ```sh
    echo hello
  ```

## Command 3. Print Working Directory

- `pwd` stands for print working directory and it prints the "place" or directory we are currently at in the computer.
  ```sh
    pwd
  ```

## Command 4. List Contents of the Directory

- `ls` presents you the contents of the directory you're currently in. It will present you with both the files and other directories your current directory contains.
  ```sh
    ls
  ```
- If you pass this command the flag or paremter `-a` It will also show you hidden files or directories. Like .git or .gitignore files
  ```sh
    ls -a
  ```

## Command 5. Change Directory

- `cd` is short for Change directory and it will take you from your current directory to another.
  ```sh
    cd
  ```
- While on my home directory, I can enter `cd Desktop` and it will take me to the Desktop Directory.
  ```sh
    cd Desktop
  ```
- If I want to go up one directory, meaning go to the directory that contains the current directory, I can enter:
  ```sh
    cd ..
  ```
- If you enter `cd` alone, it will take you straight to your home directory.

## Command 6. Make Directory

- `mkdir` stands for **make directory** and it will create a new directory for you. You have to pass the command the directory name parameter.
  ```sh
    mkdir directory-name
  ```

## Command 7. Remove Directory

- `rmdir` stands for **Remove directory** and it does just that. It needs the directory name parameter:
  ```sh
    rmdir directory-name
  ```

## Command 8. Create Empty File

- `touch` allows you to create an empty file in your current directory. As parameters it takes the file name, like:
  ```sh
    touch test.txt
  ```

## Command 9. Remove Files

- `rm` allows you to delete files, in the same way `rmdir` allows you to remove directories.
  ```sh
    rm test.txt
  ```

## Command 10. Copy Files and Directories

- `cp` allows you to copy files or directories. This command takes two parameters: the first one is the file or directory you want to copy, and the second one is the destination of your copy (where do you want to copy your file/directory to).
- If I want to make a copy of my txt file in the same directory, I can enter the following:
  ```sh
    cp test.txt testCopy.txt
  ```
- If I wanted to copy the file into a diferent directory, but keep the same file name, I can enter this:
  ```sh
    cp test.txt ./testFolder/
  ```
- And if I wanted to copy to a different folder changing the field name, of course I can enter this:
  ```sh
    cp test.txt ./testFolder/testCopy.txt
  ```

## Command 11. Move File or Directory

- `mv` is short for move, and lets us move a file or directory from one place to another. That is, create it in a new directory and delete it in the previous one (same as you could do by cutting and pasting).
- this command takes two paremers, the file or directory we want to move and the destination.
  ```sh
    mv test.txt ./testFolder/
  ```
- We can change the name of the file too in the same command if we want to:
  ```sh
    mv test.txt ./testFolder/testCopy.txt
  ```

## Command 12. View The Beginning of a File

- `head` allows you to view the beginning of a file or piped data directly from the terminal.
  ```sh
    head test.txt
  ```

## Command 13. View The End of a File

- `tail` works the same but it will show you the end of the file.
  ```sh
    tail test.txt
  ```

## Command 14. The `--help` Command

- The `--help` flag can be used on most commands and it will return info on how to use that given command.
  ```sh
    cd --help
  ```

## Command 15. Open Code Editor

- `code` will open your default code editor. If you enter the command alone, it just opens the editor with the latest file/directory you opened.
- You can also open a given file by passing it as parameter:
  ```sh
    code test.txt
  ```

## Command 16. Open Text Files on Default Code Editor

- `edit` will open text files on your default command line text editor

# Resource and Further Reading

1. [freecodecamp - Command Line for Beginners – How to Use the Terminal Like a Pro [Full Handbook]](https://www.freecodecamp.org/news/command-line-for-beginners/)
