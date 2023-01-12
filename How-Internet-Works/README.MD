# How Internet Works

## Table Of Contents
- [Further Reading]()
    - [How the Web Works: A Primer for Newcomers to Web Development (or anyone, really)](https://www.freecodecamp.org/news/how-the-web-works-a-primer-for-newcomers-to-web-development-or-anyone-really-b4584e63585c/)

# Defining parts of the web
1. __Client__: application that runs on a computer and is connected to the internet. Its primary role is to take user interactions and translate them into requests to another computer called a web server. Although we typically use a browser to access the web, you can think of your whole computer as the “Client” piece of the client-server model. Every client computer has a _unique address_ called an __IP address__ that other computers can use to identify it.

2. __Server__: A machine that is connected to the internet and also has an IP address. A server waits for requests from other machines (e.g. a client) and responds to them. The primary function of a web server is to store, process and deliver web pages to clients. There are many types of servers, including web servers, database servers, file servers, application servers, and more. (In this post, we’re talking about web servers.)

4. __ISP__: (_Internet Service Provider_). ISP is the middle man between the client and servers. For the typical homeowner, the ISP is usually a “cable company.” When your browser gets a request from you to go to www.github.com, it doesn’t know where to look for www.github.com. So it’s the ISP’s job to do a DNS (Domain Name System) lookup to ask what IP address the site you’re trying to visit is configured to.

5. __DNS__: (_Domain Name System_). A distributed database which keeps track of computer’s domain names and their corresponding IP addresses on the Internet. DNS exists so users can enter www.github.com instead of an IP address.

6. __Domain Name__: Used to identify one or more IP addresses. Users use the domain name (e.g. www.github.com) to get to a website on the internet. When you type the domain name into your browser, the DNS uses it to look up the corresponding IP address for that given website.

7. __TCP/IP__: Transmission Control Protocol/Internet Protocol. The most widely used communications protocol. A “protocol” is simply a standard set of rules for doing something. TCP/IP is used as a standard for transmitting data over networks.

8. __Port Number__: A 16-bit integer that identifies a specific port on a server and is always associated with an IP address. It serves as a way to identify a specific process on a server that network requests could be forwarded to. Some common __port__ examples include:
    - __Port 25__: SMTP (e-mail routing)
    - __Port 80__: HTTP (web requests)
    - __Port 143__: IMAP (email management)

9. __Host__: A computer connected to a network — it can be a client, server or any other type of device. Each host has a unique IP address. For a website like www.google.com, a host could be the web server that serves the pages for the website. There’s often some mix up between a host and server but note they are two different things. Servers are a type of host — they are a specific machine. On the other hand, a host could refer to an entire organization that provides a hosting service to maintain multiple web servers. You can run a server from a host in that sense.

11. __URL__: Uniform Resource Locators. URLs identify a particular web resource. A simple example is https://github.com/someone. The URL specifies the protocol (“https”), host name (github.com) and file name (someone’s profile page). A user can obtained the web resource identified by this URL via HTTP from a network host whose domain name is github.com. (tongue twister much?!)