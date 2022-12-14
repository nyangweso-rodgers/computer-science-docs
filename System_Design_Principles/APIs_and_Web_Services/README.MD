# APIs & Web Services

## Table Of Contents
- [What is an Event-Driven Architecture?](#What-is-an-Event-Driven-Architecture?)

- [5 Protocols For Event-Driven API Architectures](#5-Protocols-For-Event-Driven-API-Architectures)
    - [WebSockets](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/System_Design_Principles/APIs_and_Web_Services/Websockets)
    - [WebHooks](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/System_Design_Principles/APIs_and_Web_Services/WebHooks)
    - [REST Hooks]()
    - [Pub-Sub]()
    - [Server Sent Events]()

- [API Lifecycle](#API-Lifecycle)
- [Attacks On APIs](#Attacks-On-APIs)
- [Further Reading]()
    - [5 Protocols For Event-Driven API Architectures](https://nordicapis.com/5-protocols-for-event-driven-api-architectures/)

# What is an Event-Driven Architecture?
* __Event-driven architectures__ establish an event that can be consumed and reacted to. But what is an __event__? An __event__ is essentially _any significant change from one state to another, such as the change from having no messages in your inbox to have a new message in your inbox_.
# 5 Protocols For Event-Driven API Architectures
* 5 common event-driven methods include:
    1. __WebSockets__:
    2. __WebHooks__:
    3. __REST Hooks__:
    4. __Pub-Sub__:
    5. __Server Sent Events__:

* If you are building for scalability with low overhead in a browser environment, __WebSockets__ are a great solution. Conversely, if you’d like those same benefits but are working in a non-browser system, then __WebHooks__ should be your approach. __REST Hooks__ are not only great for __RESTful services__, they’re also much easier to set up than either, and thus are _great in low-time high-rush situations_. __Pub-Sub__ can be great if you need to enforce a division between client and server, and this can further be established and controlled in an even stronger way with Server Sent.



# API Lifecycle
* __API Lifecycle__ provides a clear-cut plan for the entire lifecycle of an API. From a higher level, the __lifecycle of an API__ involves three key phases — __create__, __control__, and __consume__. The following are the 7 stages of an API Lifecycle:

    1. __Design__: An API’s lifecycle starts with planning and designing the API in question. API design includes choosing an _API architecture_, _target audience_, and _API type_ (public, private, or partner). Lastly, API requirements are laid out using an API specification file.

    2. __Develop__: A team of API developers works on implementing the API according to the decisions and specifications in the design plan. An organized development phase includes implementation using a language or framework of choice, debugging, testing and documentation.

    3. __Publish__: At the end of the development phase, it is time to deploy the finished API to development, staging, and production environments. Then, we can make it available to the end-users by publishing it.

    4. __Secure__: The secure phase includes authentication and access control to stop unauthorized access to the API. The API should also be protected against OWASP 10 API security vulnerabilities.

    5. __Discover__: In this phase, the aim is to expose your API to potential consumers to increase adoption. We can call it the monetize phase for cases when you want to sell your API as a product.

    6. __Monitor__: When the API is up and running, it will be connected to multiple consumer applications that rely on it for data. Now the API enters the monitoring phase, where all parameters are checked to ensure the API is working correctly.

    7. __Depreciate__: In the API industry, backward compatibility is a serious concern, which is why older versions must work long enough after newer versions are released. Therefore, after proper planning and monitoring, API enters the last stage, where the older version is retired.

# Attacks On APIs
1. __API Injection Attack__: Injection attacks are carried out by inserting malicious code into the API via a query or request to obtain unauthorized access to data. These are most commonly SQL injection attacks, which insert malicious SQL code as a parameter field.

2. __DDoS (Distributed Denial of Service) attack__: This aims to disrupt a server with a large amount of traffic. It essentially creates a traffic jam, with no traffic able to be transferred to and from the server. This can break the API by making its data inaccessible to users.

3. __Excessive data exposure__: This is where an API returns unneeded or sensitive data in its responses that could be valuable to hackers. This is commonly seen where APIs return complete datasets as they are on backend servers, and the client is relied on to filter the results.

4. __MITM (Man-in-the-middle attack)__: MITM attacks are when a hacker intercepts communication between two programs to obtain the information being transferred between them. This risk is much greater if the data in transit is not encrypted, which is why using HTTPS is standard.

5. __Parameter tampering__: Parameter tampering aims to manipulate parameters sent in __API__ requests, creating access to potentially sensitive information. Parameter tampering is done mainly through input forms submitted by clients on the web.

# Popular Free APIs for Web Developers
* [RapidAPI Hub](https://rapidapi.com/hub?utm_source=twitter.com%2FRapid_API&utm_medium=DevRel&utm_campaign=DevRel) has tens of thousands of excellent APIs you can use with a single API Key.

Index | API | Description
| ----------- | -------------- | ----------------- |
1 | [IMDb API](https://rapidapi.com/apidojo/api/imdb8/) | Grab all information about films, actors, characters,etc… as on official websites.
2 | [Google Translate API](https://rapidapi.com/googlecloud/api/google-translate1/) | Dynamically translate between languages super simple.
3 | [Recipe - Food - Nutrition API Documentation](https://rapidapi.com/spoonacular/api/recipe-food-nutrition/) | Get results of recipes, and products along with natural language queries.
4 | [WordsAPI API Documentation](https://rapidapi.com/dpventures/api/wordsapi/) | Dictionary API that helps retrieve information about words, its definitions, synonyms, pronunciation and more.
5 | [COVID-19 API](https://rapidapi.com/api-sports/api/covid-193/) | Get statistics for all countries about COVID-19
6 | [Frankfurter](https://www.frankfurter.app/) | This is an API that allows you to get currency data and track available exchange rates. The API is free and it does not require an API key.
7 | [The NASA APIs](https://api.nasa.gov/) | The objective of this site is to make NASA data, including imagery, eminently accessible to application developers. These APIs give you access to different types of data about astronomy, space, weather, and much more.
8 | [Quotes](https://rapidapi.com/martin.svoboda/api/quotes15/?utm_source=twitter.com%2FRapid_API&utm_medium=DevRel&utm_campaign=DevRel) | Free multilingual API for famous random quotes in many languages.
9 | [OpenWeather](https://t.co/pi4UPr7iOx) | 
10 | [Random User](https://randomuser.me/) | A free, open-source API for generating random user data. Like Lorem Ipsum, but for people.
11 | [ExchangeRate](https://www.exchangerate-api.com/) | 
12 | [Amazon Price](https://rapidapi.com/ajmorenodelarosa/api/amazon-price1/pricing) | This API returns real-time price information of Amazon products.