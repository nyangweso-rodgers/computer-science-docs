# Domain Name System (DNS)

- **DNS** is a **distributed database** which keeps track of computer’s **domain names** and their corresponding **IP addresses** on the Internet. **DNS** exists so users can enter www.github.com instead of an **IP address.** i.e., **DNS** is a protocol used for translating domain names into IP Addresses. i.e, from human-readable website names into **IP addresses**.

- The **DNS protocol** allows getting the website's address in **5 steps**:

  1. Step 1: The browser checks its **local cache** to see if it already has the corresponding **IP address**. If the **IP address** isn't cached, it sends a **DNS request** to the **DNS resolver**. An **Internet Service Provider** (**ISP**) usually hosts this dedicated server.
  2. Step 2: The **DNS resolver** checks its local cache. If the corresponding **IP address** isn't cached, it tries to solve the request iteratively. Iteratively means it tries to contact different servers until it doesn't get the IP address.
  3. Step 3: First, the **DNS resolver** sends a request to a **root name server**. This is a server mapping the top-level domain ".com" to the address of the name server responsible for that domain. The address of the ".com" name server is sent back to the DNS resolver.
  4. Step 45: The **DNS resolver** sends a resolution request for "mywebsite .com" to the ".com" name server. The ".com" name server maps "mywebsite.com" to the address of the authoritative name server responsible for it. This address is sent back to the **DNS resolver**.
  5. Step 5: The **DNS resolver** sends a resolution request for "www. mywebsite .com" to the **authoritative name server**. The authoritative name server then returns the destination IP address.

# DNS Record Types

- Here are the 8 most commonly used **DNS Record Types**:
  1. **A** (**Address**) **Record**
     - Maps a domain name to an **IPv4 address**. It is one of the most essential records for translating human-readable domain names into **IP addresses**.
  2. **CNAME** (**Canonical Name**) **Record**
     - Used to alias one domain name to another.
     - Often used for **subdomains**, pointing them to the main domain while keeping the actual domain name hidden.
  3. **AAAA Record**
     - Similar to an **A record** but maps a domain name to an **IPv6 address**. They are used for websites and services that support the **IPv6 protocol**.
  4. **PTR Record**
     - Provides reverse **DNS lookup**, mapping an **IP address** back to a domain name. It is commonly used in verifying the authenticity of a server.
  5. **MX Record**
     - Directs email traffic to the correct mail server.
  6. **NS (Name Server) Record**
     - Specifies the authoritative **DNS servers** for the domain. These records help direct queries to the correct DNS servers for further lookups.
  7. **SRV (Service) Record**
     - SRV record specifies a host and port for specific services such as VoIP. They are used in conjunction with **A records**.
  8. **TXT (Text) Record**
     - Allows the administrator to add human-readable text to the **DNS records**. It is used to include verification records, like SPF, for email security.
