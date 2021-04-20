# Introduction to Computer Science
## Computer Science Concepts

## 1. Definition of Terms
### 1.1 Payload
When data is sent over the Internet, each unit transmitted includes both header information and the actual data being sent. The header identifies the source and destination of the packet, while the actual data is referred to as the __payload__. Because header information, or overhead data, is only used in the transmission process, it is stripped from the packet when it reaches its destination. Therefore, the __payload__ is the only data received by the destination system.

#### References
_https://techterms.com/definition/payload_

### 1.2 Cookies
By example. __cookies__ are something that bring you back to your Twitter account after you have signed in with _Remember me checkbox_ checked. By definition, _small chunk of information (4KB) that browser stores on behalf of Web server_.

#### Mechanism Behind Cookies
* server asks the browser to store this using a _Set-Cookie_ header.
* browser and server pass this info to and fro as part of request and response headers
* stores a name value pair and attributes like Expires, Domain, Path.
* Cookie in the header when communicating from Browser to server.
* Set-Cookie in the header when communicating from server to browser.
* These HTTP Cookies are used to store the name value pair that identify you. So, the next time you visit, your session is restored.
* It is used by numerous websites to track your online activities

#### Types of Cookies
1. Session Cookies
2. Persistent/Permanent Cookies
3. Third Party Cookies

#### Cookies vs. Session
__Session__ is a period with all the parameters that suggest you are active on the website. __Cookies__ help in recognising and managing the session.Cookies are primarily used to create session and related info for web application. They get deleted when the session expires. 

_Note_: not all cookies are related wit session, some remain persistent