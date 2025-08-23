# Computer Networking

## Table Of Contents

# Protocols

## SSH (Secure Shell)

- SSH Port Forwarding

  - **Port forwarding** is a technique that allows network traffic to be redirected from one **address/port** to another **address/port**. It is commonly used in **networking**, **SSH tunneling**, and **firewall configurations** to allow access to services that are otherwise unreachable.
  - **Local Port forwarding**

    - It forwards traffic from remote server (to which we’re ssh’ing) to our local machine on specified port.
    - You can use this technique to get access to management port to application server, because it’s not exposed through network. Similarly you can use it for example to get access to database (but please be cautions if you want to do this on production environment if you really need to)
    - So, how to do this ?
      ```sh
        ssh -L 19999:localhost:9990 user@myserver.local
      ```
    - I.e.,
      - `ssh -L` tells that we want to create **SSH** connection with server with **local** port forwarding
      - `19990:localhost:9990`
        - `19990` – it’s port on our local machine to which traffic should be forwarded from server – remember about colon after local port!
        - `localhost:9990` – it’s service/port that we want to forward to local machine. Important here is fact that address is from server perspective. Few paragraphs below I’ll explain it, but here you need to point to service/port from server perspective
      - `user@myserver.local` User and server name to which we’re ssh’ing. Like in “normal” SSH connection.
    - After issuing this command and connecting to server, you should have access to port from server under your local port that you provided in command above. In this example when I go to browser and go to `localhost:19990` I will see my management console that is hosted on `myserver.local:9990`.

    - **Remote Port forwarding**
      - It works similar, but now we’re forwarding our local port to server.

# Resources and Further Reading
