# IP Addresses

## Table of Contents
- [Introduction to IP Address](#Introduction-to-IP-Address)

- [Getting IP Addresses]()
    - [Get IP Address from command prompt 1](#Get-IP-Address-from-command-prompt-1)
    - [Get IP Address from command prompt 2](#Get-IP-Address-from-command-prompt-2)
    - [Get IP Address from command prompt 3](#Get-IP-Address-from-command-prompt-3)

- [IPv4 Address](#IPv4-Address)
- [IPv6 Address](#IPv6-Address)
- [Using nslookup on the command line](#using-nslookup-on-the-command-line)
- [DNS Caching](#DNS-Caching)

- [Further Reading]()
    - [IP Address](https://whatismyipaddress.com/ip-address)

# Introduction to IP Address
* The __IP address__ is a fascinating product of modern computer technology designed to allow one connected computer (or “smart” device) to communicate with another device over the __Internet__. Because, in the same way you to need a mailing address to receive a letter in the mail from a friend, a remote computer needs your __IP address__ to communicate with your computer.

# Get IP Address from command prompt 1
```shell
    ipconfig
```
# Get IP Address from command prompt 2
```shell
    ipconfig/all
```
# Get IP Address from command prompt 3
```shell
    ipconfig/all!more
```

# IPv4 Address
* The common type of __IP address__ (is known as __IPv4__, for “__version 4__”). Here’s an example of what an __IP address__ might look like: __66.171.248.170__. 

* An __IPv4__ address consists of __four numbers__, each of which contains one to three digits, with a single dot (.) separating each number or set of digits. Each of the four numbers can range from 0 to 255. This versatile group of segmented numbers create the addresses that lets you and everyone around the globe to send and retrieve data over our __Internet__ connections. Without this numeric protocol, sending and receiving data over the World Wide Web would be impossible.

# IPv6 Address
* __IPv6__ offers a maximum number of __IP address__ for today and for the future. Whereas __IPv4__ supports a maximum of approximately 4.3 billion unique IP addresses, __IPv6__ supports, in theory, a maximum number that will never run out. An __IPv6__ address consists of __eight groups__ of four hexadecimal digits. If a group consists of four zeros, the notation can be shortened using a colon to replace the zeros. Here’s an example IPv6 address: __2001:0db8:85a3:0000:0000:8a2e:0370:7334__

* __REMARK:__ 
    * _Your IP address is your passport to the Internet. But it also gives away your location and is used to profile your individual online activity. That’s why you might consider hiding it._

    * _A main advantage of __IPv6__ is increased address space. The 128-bit length of IPv6 addresses is a significant gain over the 32-bit length of __IPv4 addresses__, allowing for an almost limitless number of unique IP addresses. The size of the __IPv6 address__ space makes it less vulnerable to malicious activities such as IP scanning. __IPv6 packets__ can support a larger payload than __IPv4 packets__ resulting in increased throughput and transport efficiency_


# using nslookup on the command line
* __nslookup__ allows you to do __DNS__ queries on the command line
    ```shell
        # returns the IP Addresses for Pluralsight.com
        nslookup pluralsight.com
    ```
# DNS Caching
```shell
    # display all the cached dns server on the local machine
    ipconfig/displaydns
```