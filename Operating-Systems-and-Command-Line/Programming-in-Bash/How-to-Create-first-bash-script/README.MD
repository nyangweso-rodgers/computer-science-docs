# How to Create Your First Bash Script

* Let's create a simple script in bash that outputs __Hello World__.

* Create a file named __hello_world.sh__

    ```sh
        touch hello_world.sh
    ```

# Find the path to your bash shell.
```sh
    which bash
    # output: /usr/bin/bash
    # In my case, the path is /usr/bin/bash and I will include this in the shebang.
```

# Write the command.
* We will echo "hello world" to the console.

* Our script will look something like this:
    ```sh
        #! usr/bin/bash
        echo "Hello World"
    ```

# Provide execution rights to your user.
* Modify the file permissions and allow execution of the script by using the command below:

    ```sh
        chmod u+x hello_world.sh
    ```

* __chmod__ modifies the existing rights of a file for a particular user. We are adding __+x__ to user __u__.

# Run the script