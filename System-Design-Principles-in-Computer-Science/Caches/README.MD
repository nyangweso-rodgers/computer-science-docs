# System Design - Caches

## Table Of Contents
- [Introduction to Caching](#Introduction-to-Caching)
- [Benefits of caching](#Benefits-of-caching)

# Introduction to Caching
* __Caching__: is the temporary storage of information outside of the __server__. 

* In between the __client__ and the __server__, there are many points of presence where the cache can be stored:
    * The cache can be stored near the server like an __API gateway cache__ on AWS. 
    * The cache can be stored somewhere in the middle between the client and the server using a 3rd party solution or using a hierarchy of proxy servers that just holds cache data, and are called __caching proxy servers__. This is usually a shared cache so this cache can be shared by many clients. 
    * Lastly, the cache can be stored on the client/in the app/on the device. It is not shared and is only available to the client. This is called a __private cache__.

* __Caching__ information includes:
    * database query results
    * computationally intensive calculations
    * API requests/responses
    * data files like HTML, images or
    * any application data in general e.t.c

# Benefits of caching
* improves application performance
* reduced load on servers
* reduced load on databases
* eliminates database hotspots
* increases Read Throughput(IOPS)
* reduces bandwidth consumption