















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
