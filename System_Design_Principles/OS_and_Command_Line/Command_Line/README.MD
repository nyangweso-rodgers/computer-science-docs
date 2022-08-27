# Commend Line (CLI)

## Table of Contents
- [Difference between console, command line (CLI), terminal and Shell](#Difference-between-console,-command-line-(CLI),-terminal-and-Shell)
- [Command line or CLI](#Command-line-or-CLI)
- [Why should I even care about using the terminal?](#Why-should-I-even-care-about-using-the-terminal?)
- [Different kinds of shells](#Different-kinds-of-shells)
    - [How do I know what shell I'm running?](#How-do-I-know-what-shell-I'm-running?)
- [Most common and useful commands to use](#Most-common-and-useful-commands-to-use)
- [References](#References)


# Difference between console, command line (CLI), terminal and Shell
1. __Console__: physical device that allows you to interact with the computer.
2. __Terminal__: text input and output environment. It is a program that acts as a wrapper and allows us to enter commands that the computer processes. __Note__:
    - terminal is a program, just like any other. And like any program, you can install it and uninstall it as you please. It's also possible to have many terminals installed in your computer and run whichever you want whenever you want. 
    - All operating systems come with a default terminal installed, but there are many options out there to choose from, each with its own functionalities and features.
3. __Shell__: program that acts as __command-line interpreter__. It __processes commands__ and __outputs the results__. It interprets and processes the commands entered by the user. __Note__:
    - Same as the terminal, the shell is a program that comes by default in all operating systems, but can also be installed and uninstalled by the user.
    - Different shells come with different syntax and characteristics as well. It's also possible to have many shells installed at your computer and run each one whenever you want.
    - In most __Linux__ and __Mac__ os the default __shell__ is __Bash__. While on __Windows__ it's __Powershell__. Some other common examples of shells are Zsh and Fish.
    - Shells work also as __programming languages__, in the sense that with them we can build scripts to make our computer execute a certain task.

_Remarks_:
    - keep in mind that the __terminal__ is the program in which the shell will run. But both programs are independent. That means, I can have any shell run on any terminal. There's no dependance between both programs in that sense.
    - keep in mind that the shell is the program your computer uses to "understand" and execute your commands, and that you can also use it to program tasks.

# Command line or CLI
The CLI is the interface in which we enter commands for the computer to process. One interesting thing to mention here is that most OS have two different types of interfaces:
* The __CLI__, which takes commands as inputs in order for the computer to execute tasks.
* The other is the __GUI__ (graphical user interface), in which the user can see things on the screen and click on them and the computer will respond to those events by executing the corresponding task.

# Why should I even care about using the terminal?
* Improves __efficiency__: on the CLI tasks can be executed with a single command. In this sense, being comfortable with the command line will help you save time and be able to execute your tasks quicker.
* __Tasks automation__: we can build scripts with our shell and later on execute those scripts whenever we want. This is incredibly useful when dealing with repetitive tasks that we don't want to do over and over again.
* The third reason is that sometimes the CLI will be the only way in which we'll be able to interact with a computer. e.g., the case when you would need to interact with a cloud platform server. In most of these cases, you won't have a GUI available, just a CLI to run commands in.

# Different kinds of shells
# How do I know what shell I'm running?
To know what shell you're currently running, just open your terminal and enter echo $0. This will print the current running program name, which in this case is the actual shell.
```shell
    echo $0
```
# Most common and useful commands to use
command | meaning | illustration
|:-----------:|:----------:|:--------------:|
echo | prints in the terminal whatever parameter we pass it. | echo hello world! // Output: echo hello world!
pwd | stands for print working directory and it prints the "place" or directory we are currently at in the computer.| pwd // Output: /c/Users/HP
ls | presents you the contents of the directory you're currently in. It will present you with both the files and other directories your current directory contains.| ls
ls -a | It will also show you hidden files or directories. | ls -a
cd | is short for Change directory and it will take you from your current directory to another.| cd Documents
mkdir | stands for make directory and it will create a new directory for you. You have to pass the command the directory name parameter.| mkdir New_Directory
rmdir | stands for Remove directory and it does just that. | rmdir New_Directory
touch | allows you to create an empty file in your current directory. As parameters it takes the file name | touch test.txt
rm | allows you to delete files, in the same way rmdir allows you to remove directories. | rm test.txt
cp | allows you to copy files or directories. This command takes two parameters: the first one is the file or directory you want to copy, and the second one is the destination of your copy (where do you want to copy your file/directory to). | 
mv | is short for move, and lets us move a file or directory from one place to another. That is, create it in a new directory and delete it in the previous one (same as you could do by cutting and pasting). We can change the name of the file too in the same command if we want to: | 
head | allows you to view the beginning of a file or piped data directly from the terminal. | 
tail | works the same but it will show you the end of the file. | 
--help | flag can be used on most commands and it will return info on how to use that given command. | cd --help
code | will open your default code editor. If you enter the command alone, it just opens the editor with the latest file/directory you opened. | 
edit | will open text files on your default command line text editor (which if you're on Mac or Linux will likely be either Nano or Vim). | 

# References
1. [Command Line for Beginners](https://www.freecodecamp.org/news/command-line-for-beginners/)