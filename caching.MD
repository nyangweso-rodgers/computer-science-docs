# caching
__Caching__ is a common practice in different layers of technology to _improve application performance_. A __cache__ is a high speed data store which stores a part or the complete dataset so that future requests to the data are served faster. The data in a cache is stored on a fast access hardware like __RAM__. Caching allows us to _efficiently reuse previously retrieved data_.

__Caching__ is leveraged at different layers of technology like:
* Operating systems
* CDN(Content Delivery Network)
* DNS(Domain Name Systems)
* Web Applications(APIs)
* Databases e.t.c.

__Caching__ information includes:
* database query results
* computationally intensive caclculations
* API requests/responses
* data files like HTML, images or
* any application data in general e.t.c

In _distributed applications_ there are various caching _strategies_:
* write-through
* write-around
* write-back

## 1. write-through cache
in this policy, data is written to both the cache and the underlying data source. The order in which it is written is not important. The main idea is that the I/O operation is considered complete when the data is written to both the cache and the DB.

## 2.write-around cache
in this policy, data is directly written to the underlying data source without disturbing the cache.

## 3. write-back cache
in this policy, data is written only to the cache and the I/O operation is considered complete. Typically, data is written  to the underlying data source as well, but it is done asynchronously using a worker process.

### Benefits of caching
1. improves application performance
2. reduced load on servers
3. reduced load on databases
4. eliminates database hotspots
5. increases Read Throughput(IOPS)
6. reduces bandwidth consumption