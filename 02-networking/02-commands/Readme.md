# Common Networking Commands

## 1. `ipconfig` (Windows)

- **Purpose**: Displays the current TCP/IP configuration of the machine (IP address, subnet mask, gateway, etc.).
- Example Usage:
  1. `ipconfig` — Display basic IP address information.
  2. `ipconfig /all` — Show all network configuration details, including DNS, MAC addresses, etc.
  3. `ipconfig /release` — Release the IP address of the machine (disconnects it from the network).
  4. `ipconfig /renew` — Renew the IP address (requests a new address from the DHCP server).

## 2. `ifconfig` (Linux/Unix):

- **Purpose**: Similar to `ipconfig` on Windows, it shows the network interfaces and their configuration on a Linux/Unix machine.
- Example usage
  1. `ifconfig` — Display all network interfaces and their IP addresses.
  2. `ifconfig eth0 down` — Disable the `eth0` network interface.
  3. `ifconfig eth0 up` — Enable the eth0 network interface.

## 3. `ping`

- **Purpose**: Sends ICMP Echo Request packets to a host to test connectivity between two machines.
- Example usage:
  1. `ping www.google.com` — Check if Google’s website is reachable.
  2. `ping 192.168.1.1` — Check if a specific IP address is reachable.

## 4. `tracert` (Windows) / `traceroute` (Linux/Unix)

- **Purpose**: Traces the path packets take to a destination host, showing each hop along the way and how long each hop takes.
- Example usage
  1. `tracert www.google.com` (Windows)
  2. `traceroute www.google.com` (Linux/Unix)

## 5. `nslookup`

- **Purpose**: Queries **DNS servers** to resolve domain names into IP addresses or vice versa.
- Example usage:
  1. `nslookup www.google.com` — Resolve the domain name "www.google.com" to an IP address.
  2. `nslookup 8.8.8.8` — Find the domain name associated with the IP address.

## 6. `netstat`

- **Purpose**: Displays network connections, routing tables, and network interface statistics.
- Example usage:
  1. `netstat` — Show active connections and listening ports.
  2. `netstat -a` — Display all connections and listening ports.
  3. `netstat -n` — Show addresses and ports in numerical form (without DNS lookup).

## 7. `route`

- **Purpose**: Displays or modifies the routing table on a machine. You can add, delete, or change network routes.
- Example usage:
  1. `route print` — Display the current routing table.
  2. `route add 192.168.1.0 mask 255.255.255.0 192.168.0.1` — Add a route to the network `192.168.1.0`.

## 8. `curl`

- **Purpose**: Used to transfer data to or from a server, supporting multiple protocols (**HTTP**, **FTP**, etc.).
- Installimg `curl`:
  - The latest modern OS has **curl** pre-installed so you don't need to install it to work with it. Or you can install it from here: https://curl.se/download.html
- Example usage
  1. `curl --version` - check the version of curl installed
  2. `curl http://www.google.com` — Fetch the content of a webpage.
  3. `curl -I http://www.google.com` — Fetch the HTTP headers of the webpage.
  4. `curl https://jsonplaceholder.typicode.com/users` - fetch JOSN Placeholder API Content

## 9. `arp`

- **Purpose**: Displays or modifies the Address Resolution Protocol (ARP) cache, which maps IP addresses to MAC addresses.
- Example usage
  1. `arp -a` — Display the current ARP cache.
  2. `arp -d 192.168.1.1` — Delete a specific entry from the ARP cache.

## 10. `nmap` (Network Mapper)

- **Purpose**: A powerful network scanning tool to discover hosts and services on a computer network.
- Example usage:
  1. `nmap 192.168.1.0/24` — Scan all hosts in the `192.168.1.x` subnet.
  2. `nmap -p 80,443 192.168.1.1` — Scan ports 80 and 443 on a specific IP address.
