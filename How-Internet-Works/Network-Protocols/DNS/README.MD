# DNS - Domain Name System

* DNS is a protocol used for translating domain names into IP Addresses. i.e, from human-readable website names into __IP addresses__.

# Theory - How DNS works
* Consider a user that types the address of the www. xyz .com website in a browser.
  
* In this scenario, the browser represents a DNS client that needs the website's address.
  
* The DNS protocol allows getting the website's address in 5 steps.
    1.  The browser checks its __local cache__ to see if it already has the corresponding IP address. If the IP address isn't cached, it sends a DNS request to the __DNS resolver__. An __Internet Service Provider__ (ISP) usually hosts this dedicated server.
   
    2. The __DNS resolver__ checks its local cache. If the corresponding IP address isn't cached, it tries to solve the request iteratively. Iteratively means it tries to contact different servers until it doesn't get the IP address.

    3. First, the DNS resolver sends a request to a __root name server__. This is a server mapping the top-level domain ".com" to the address of the name server responsible for that domain. The address of the ".com" name server is sent back to the DNS resolver.
   
    4. The DNS resolver sends a resolution request for "mywebsite .com" to the  ".com" name server. The ".com" name server maps "mywebsite .com" to the address of the authoritative name server responsible for it. This address is sent back to the DNS resolver.
   
    5. The __DNS resolver__ sends a resolution request for "www. mywebsite .com" to the __authoritative name server__. The authoritative name server then returns the destination IP address.

* If the request also includes a subdomain, a further step is required.
* The authoritative name server returns the server's IP address responsible for the subdomain.
* And an additional request by the DNS resolver is then performed.