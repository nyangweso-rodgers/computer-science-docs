# Redis - Remote Dictionary Serve

## Table Of Contents
- [Overview Of Redis](#Overview-Of-Redis)
- [Features Of Redis](#Features-Of-Redis)
- [Uses Cases Of Using Redis](#Uses-Cases-Of-Using-Redis)
- [References]()
    - [Introduction to Redis, What it is, what are the use cases](https://severalnines.com/blog/introduction-redis-what-it-what-are-use-cases-etc/)

# Overview Of Redis
__Redis__ is an open-source __NoSQL database__ known to be a fast, in-memory key-value data store, cache, message broker, and queue.


# Features Of Redis
Features of Redis highlight the significance of its capabilities that it can provide and power up your existing environment with its distinctive features.
1. __Rich Data Structures__: Redis offers five possible data options for the values. These are hashes, lists, sets, strings, and sorted sets. The operations which are unique to these data types are given and come along with the well-documented time-complexity (The Big O notation).

2. __Data Persistence__: Data Persistence means that the data survives after the producer process of the particular data has ended. In other terms, Saved data must last even if the server fails. For a data store to be considered persistent, It must write on permanent storage (i.e. non-volatile storage such as hdd or ssd). Redis typically holds the whole dataset in memory. For persistence, Redis supports point-in-time backups (copying the Redis data set to disk). Redis supports RDB, AOF persistence mechanism to persist the data to the non-volatile memory. 

3. __Performance__: Performance in Redis is extremely efficient. Because of its in-memory nature, a project manager’s commitment to ensuring that complexity stays at the bare minimum, as well as an event-based programming model, the application boasts of having an exceptional performance for the read and write operations.

4. __High Availability__: Redis has Built-in support for non-blocking, asynchronous, primary/replica replication, in order to ensure high-level data availability.

# Uses Cases Of Using Redis
1. __Caching__: Redis is a good choice for implementing a highly available in-memory cache to decrease data access latency with disk or SSD, high throughput and ease the load of the database and application. Web page caching, Database query results caching, persistent session caching and caching of frequently used objects such as images, files, and metadata are popular examples of caching solutions with Redis.

2. __Sessio Store__: Session state is user-related data that captures the current status of user interaction with applications such as a website or a game. __Session state__ is how applications remember user identity, login credentials, personalization information, recent actions, shopping cart details, and more.

3. __Chat and Messaging Applications__: Redis supports __Pub/Sub__ with pattern matching and many different varieties of data structures such as lists, sorted sets, and hashes. This allows Redis to support high-performance chat rooms, real-time comment streams, social media feeds and server intercommunication.

4. __Gaming Leaderboard Applications__: Redis is a very popular choice among game developers looking to build real-time leaderboards or scoreboards. Redis Sorted Set data structure can be simply used to implement this use case, which provides uniqueness of elements while keeping the list sorted by users’ scores(points) associated with the key. Need to update the user’s score whenever it changes. We can also use Sorted Sets to handle time-series data by using timestamps as the score for ranking based on timestamps.