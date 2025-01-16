# Internet Protocol (IP) Addresses

## Table of Contents

- [Internet Protocol (IP) Addresses](#internet-protocol-ip-addresses)
  - [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
- [What is an IP address?](#what-is-an-ip-address)
- [How does an IP address work?](#how-does-an-ip-address-work)
- [Static IP Address](#static-ip-address)
- [Dynamic IP addresses](#dynamic-ip-addresses)
- [IP Address Classes](#ip-address-classes)
- [Commands For IP Address From Command Prompt](#commands-for-ip-address-from-command-prompt)
  - [Command 1. Get IP Address](#command-1-get-ip-address)
- [IPv4 Address](#ipv4-address)
- [IPv6 Address](#ipv6-address)
- [using nslookup on the command line](#using-nslookup-on-the-command-line)
- [DNS Caching](#dns-caching)
- [Resources and Further Reading](#resources-and-further-reading)

# Introduction

- The **IP address** is a fascinating product of modern computer technology designed to allow one connected computer to communicate with another device over the **Internet**. Because, in the same way you to need a mailing address to receive a letter in the mail from a friend, a remote computer needs your **IP address** to communicate with your computer.
- Every device that connects to an internet network has an **IP address**, which means there are billions of **IP addresses** that exist.

# What is an IP address?

- **IP address**, is a **unique identifier** assigned to every device on a **TCP/IP network**. The **Internet Protocol** is the set of rules that outlines how data should be transported across the internet or local networks. **IP addresses** help identify devices and allow them to communicate with each other.
- Internally, **IP addresses** are stored as numbers. The **Domain Name System** (**DNS**) allows us to use words to identify different servers on the internet, such as an application, server, or website. When we type a URL into our search bar, **DNS** looks up that domain’s **IP address** and returns it to our network device. There are two main versions of **IP addresses**: **IPv4** and **IPv6**.
- **IP addresses** are strings of four numbers separated by characters. For example, an IP address could look like this: **152.132.4.23**. They’re produced by a division of the Internet Corporation for Assigned Names and Numbers to help make the internet more secure and accessible.

# How does an IP address work?

- All devices communicate with one another using the **Internet Protocol** (**IP**)
- Here is how it works:
  - Before our devices connect to the internet, they **connect to a network** that’s connected to the **internet**. This network gives us access to the internet. For example, the network that we use at home will most likely be our **Internet Service Provider** (**ISP**). After this, our **ISP** will assign an **IP address** to our device. Our internet activity will go through the **ISP** and then be routed back to us using our assigned **IP address**.
  - If we leave our home and take our personal device with us, our **IP address** from our home network doesn’t come with us. Let’s say we go to a hotel. When we want to use the internet at the hotel, we’d probably connect to their Wi-Fi network. Since we’re using a new network, we’re temporarily assigned a new **IP address**. This temporary IP address is assigned to us by the hotel’s **ISP**.
  - **Remark** (**Can our IP addresses change?**):
    - Yes, they can! If we turn our modem or router off, our IP address may change. We can also contact our **ISP** to change our **IP address**. This is one of the reasons why **DNS** is so important. Instead of directly informing others when our IP address changes, we can directly inform our **DNS server**. This means that any other device that contacts the DNS server will get the updated information for the new IP address.

# Static IP Address

- A **static IP address** is an **IP address** that doesn’t change. Our static IP addresses usually stay the same unless our network architecture changes or our devices are out of commission. Static IP addresses are typically used for **servers** or other important networking equipment. They’re popular within business settings because they ensure that the devices connected to them keep a consistent address. They also work well for remote access solutions.
- A static IP address is assigned to a device by an ISP. Typically, static IP addresses add to the cost of your internet service.

- **Pros** of **Static IP addresses**:

  - **Remote access**: **Static IP addresses** make it easy for us to work remotely using a **Virtual Private Network** (**VPN**).
  - **Server hosting**: **Static IP addresses** make it easy for people to find us using **DNS**.
  - **DNS support**: With **static IP**, it’s easier to manage **DNS servers**.
  - **Geolocation services**: With static IP addresses, our geolocation services are more accurate. This is because our services will match the IP address to its physical location.
  - **Reliable connection**: A **static IP** address is fixed, which typically results in a more reliable connection.
  - **Easy to find**: A static IP address can make it easier to find specific devices on a network.

- **Cons** of **Static IP addresses**:
  - **Security concerns**: With a **static IP address**, anyone with the proper tools can find where our devices are located. **VPNs** can help with this.
  - **Cost**: Static IP addresses are not as cost-effective as dynamic IP addresses. Typically, ISPs charge more for them.

# Dynamic IP addresses

- A **dynamic IP address** is an **IP address** that can regularly change. An **ISP** will buy a large number of dynamic IP addresses and assign them to their customer’s devices. **Dynamic IP addresses** are often reassigned. Reassigning IP addresses helps internet providers save money and ensure a higher level of security. It also means that they don’t need to take the time to reestablish any network connections if we go on a vacation or move to a new location.
- **Dynamic IP** addresses are more common for **consumer equipment** and **personal use**. A **dynamic IP address** is assigned to a device by our ISP’s **Dynamic Host Configuration Protocol** (**DHCP**) **servers**. The **DHCP server** typically uses network routers to assign addresses to devices.

- **Pros** of **Dynamic IP Address**

  - **Easy configuration**: **DHCP** servers automatically assign IP addresses to our devices, so we don’t need to worry about setting it up ourselves.
  - **Cost**: **Dynamic IP addresses** are usually cheaper than **static IP addresses**.
  - **Unlimited IP addresses**: **Dynamic IP addresses** can be reused. Whenever our devices need a new dynamic IP address, our network or router can automatically configure them for us.
  - **Security**: Dynamic IP addresses make it more difficult for potential attackers to locate our networked devices. This is because dynamic IP addresses can change frequently, so it’s harder to track a device. This helps with physical and online security. We can also increase our security measures by using a VPN.

- **Cons** of **Dynamic IP Addresses**:
  - **DNS compatibility**: If we wanted to host an email server, for example, it may be difficult to use a dynamic IP address because DNS doesn’t work well with dynamic IP addresses. We could use a dynamic DNS service, but those tend to be expensive.
  - **Remote connectivity**: If we don’t have the proper remote access software, it’ll be difficult to connect using a dynamic IP address. A VPN can help with this.
  - **Increased downtime**: Sometimes, our ISP can’t assign us a dynamic IP address. This can slow down our internet connection.
  - **Inaccurate geolocation**: Dynamic IP addresses may affect our geolocation services because our IP address may not reflect our physical location.

# IP Address Classes

- **IP Address** from **0.0.0.0** to **255.255.255.255.255** are classified into 5 classes based on the octet value:

  1. Class A: 0 - 127
  2. Class B: 128 - 191
  3. Class C: 192 - 223
  4. Class D: 224 - 239
  5. Class E: 240 - 255

- **Private IP Address**

  1. Class A: 10.0.0.0 to 10.255.255.255
  2. Class B: 172.16.0.0 to 172.31.255.255
  3. Class C: 192.168.0.0 to 192.168.255.255

- **Remarks**:
  - 0.0.0.0 Network is reserved for default routing
  - 127.0.0.0 is reserved for loop back
  - Class D Network are reserved for multicasting
  - Class E Network are reserved for Research and Development

# Commands For IP Address From Command Prompt

## Command 1. Get IP Address

```shell
    ipconfig
```

# IPv4 Address

- The common type of **IP address** (is known as **IPv4**, for “**version 4**”). Here’s an example of what an **IP address** might look like: **66.171.248.170**.

- An **IPv4** address consists of **four numbers**, each of which contains one to three digits, with a single dot (.) separating each number or set of digits. Each of the four numbers can range from 0 to 255. This versatile group of segmented numbers create the addresses that lets you and everyone around the globe to send and retrieve data over our **Internet** connections. Without this numeric protocol, sending and receiving data over the World Wide Web would be impossible.

# IPv6 Address

- **IPv6** offers a maximum number of **IP address** for today and for the future. Whereas **IPv4** supports a maximum of approximately 4.3 billion unique IP addresses, **IPv6** supports, in theory, a maximum number that will never run out. An **IPv6** address consists of **eight groups** of four hexadecimal digits. If a group consists of four zeros, the notation can be shortened using a colon to replace the zeros. Here’s an example IPv6 address: **2001:0db8:85a3:0000:0000:8a2e:0370:7334**

- **REMARK:**

  - _Your IP address is your passport to the Internet. But it also gives away your location and is used to profile your individual online activity. That’s why you might consider hiding it._

  - _A main advantage of **IPv6** is increased address space. The 128-bit length of IPv6 addresses is a significant gain over the 32-bit length of **IPv4 addresses**, allowing for an almost limitless number of unique IP addresses. The size of the **IPv6 address** space makes it less vulnerable to malicious activities such as IP scanning. **IPv6 packets** can support a larger payload than **IPv4 packets** resulting in increased throughput and transport efficiency_

# using nslookup on the command line

- **nslookup** allows you to do **DNS** queries on the command line
  ```shell
      # returns the IP Addresses for Pluralsight.com
      nslookup pluralsight.com
  ```

# DNS Caching

```shell
    # display all the cached dns server on the local machine
    ipconfig/displaydns
```

# Resources and Further Reading

1. [Medium - Computer networking in 5 minutes: Static IP vs dynamic IP](https://blog.devgenius.io/computer-networking-in-5-minutes-static-ip-vs-dynamic-ip-c9f60cdd1042)
