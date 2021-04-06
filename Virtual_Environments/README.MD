# Virtual Environments
At its core, the main purpose of __Python virtual environments__ is to create an isolated environment for Python projects. This means that each project can have its own __dependencies__, regardless of what dependencies every other project has.

## Why the Need for Virtual Environments?

## Using Virtual Environments
To get started, if you’re not using Python 3, you’ll want to install the virtualenv tool with __pip__:
```shell
pip install virtualenv
```
If you are using Python 3, then you should already have the __venv__ module from the standard library installed.

Start by making a new directory to work with:
```shell
# Start by making a new directory to work with:
mkdir python-virtual-environments && cd python-virtual-environments

# Create a new virtual environment inside the directory:
# Python 2
virtualenv env

# Python 3
python -m venv env
```
_The Python 3 venv approach has the benefit of forcing you to choose a specific version of the Python 3 interpreter that should be used to create the virtual environment. This avoids any confusion as to which Python installation the new environment is based on._

More interesting are the __activate scripts__ in the bin directory. These scripts are used to set up your shell to use the environment’s Python executable and its site-packages by default.

In order to use this environment’s packages/resources in isolation, you need to “activate” it. To do this, just run the following:
```shell
# activate the virtual environment
source env/Scripts/activate
```
You will Notice how your prompt is now prefixed with the name of your environment (env, in our case). This is the indicator that env is currently active, which means the python executable will only use this environment’s packages and settings.

```shell
# deactivating the virtual environment
(env) $ deactivate
```
Now your shell session is back to normal, and the python command refers to the global Python install. Remember to do this whenever you’re done using a specific virtual environment.

## How Does a Virtual Environment Work?
To explain how this works, let’s first check out the locations of the different python executables. With the environment “deactivated,” run the following:
```shell
which python # /c/Python/Python38-32/python
```

Now, activate it and run the command again:
```shell
# activate 
source env/Scripts/activate
which pyhton # /c/Users/RodgersNyangweso/Downloads/projects/Computer_Science_Concepts/Virtual_Environments/python_virtual_environments/\Users\RodgersNyangweso\Downloads\projects\Computer_Science_Concepts\Virtual_Environments\python_virtual_environments\env/Scripts/python
```
After activating the environment, we’re now getting a different path for the python executable because, in an active environment, the $PATH environment variable is slightly modified.


### References
1. https://realpython.com/python-virtual-environments-a-primer/