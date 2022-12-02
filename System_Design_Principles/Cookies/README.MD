# Cookies

## Table Of Contents
- [Introduction to Cookies](#Introduction-to-Cookies)
- [Mechanism Behind Cookies](#Mechanism-Behind-Cookies)
- [Types of Cookies](#Types-of-Cookies)
- [References]()
    - [Everything You Need to Know About Cookies for Web Development](https://www.freecodecamp.org/news/everything-you-need-to-know-about-cookies-for-web-development/)

# Introduction to Cookies
* __Cookie__: string of data passed back and forth between the __client__ and __server__ to create a __stateful__ session. By example. __cookies__ are something that bring you back to your Twitter account after you have signed in with _Remember me checkbox_ checked. By definition, _small chunk of information (4KB) that browser stores on behalf of Web server_. 


# Mechanism Behind Cookies
* server asks the browser to store this using a _Set-Cookie_ header.
* browser and server pass this info to and fro as part of request and response headers
* stores a name value pair and attributes like Expires, Domain, Path.
* Cookie in the header when communicating from Browser to server.
* Set-Cookie in the header when communicating from server to browser.
* These HTTP Cookies are used to store the name value pair that identify you. So, the next time you visit, your session is restored.
* It is used by numerous websites to track your online activities.

# Types of Cookies
1. Session Cookies
2. Persistent/Permanent Cookies
3. Third Party Cookies

__Remarks__:
* Cookies can be attacked. It's crucial to secure cookies as they contain personal information about a user's interests, login information, overall web browsing habits, and much more.
* Here are a few points that can help us to minimize cookie attacks
    - _Use httpOnly attribute_: The `httpOnly` attribute prevents accessing cookies by the client-side script.
    - _Use SameSite attribute_: Use `SameSite=Strict` to prevent from cookies being sent with cross-site requests.
    - _Use only HTTPS_: It is important to use HTTPS on login pages and the entire website. Use SSL/TLS encryption to hide all data transfers, including cookie session IDs.
    - _Use anti-malware_: Using anti-malware solutions or reliable security plugins will protect your system from cookie stealing software
    - _Digital hygiene_: Digital hygiene refers to general tips that keep online connections secure. These include logging out of accounts to end the session once you are done, avoiding public wifi connections when possible, and regularly clearing out your browser's cookie data.