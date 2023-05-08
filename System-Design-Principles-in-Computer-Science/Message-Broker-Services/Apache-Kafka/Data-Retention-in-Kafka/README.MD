# Data Retention in Kafka

* Unlike a _database_ - _Kafka_ is usually used to pipe enormous amounts of Data hence the Data is not stored indefinitely.
* Since Data is eventually Deleted, given a restart of your Stream Processing Application - it might not find all of the previously seen data.
* There are generally __two strategies__ to implement __Data Retention in Kafka__ :
  * __Deletion__ and 
  * __Log Compaction__
* __Data Retention Strategies__ are enabled by setting __𝗹𝗼𝗴.𝗰𝗹𝗲𝗮𝗻𝘂𝗽.𝗽𝗼𝗹𝗶𝗰𝘆__ to _𝗱𝗲𝗹𝗲𝘁𝗲_ or _𝗰𝗼𝗺𝗽𝗮𝗰𝘁_.
* This is set on a Broker level but can later be configured per Topic.

# Deletion
* Each Partition in a Topic is made of Log Segments.
* Log Segments are closed on a certain condition. It can be on a segment reaching a certain size or it being open for a certain time.
* Closed Log Segments are marked for deletion if the difference between current time and when the segment was closed is more than one of: __𝗹𝗼𝗴.𝗿𝗲𝘁𝗲𝗻𝘁𝗶𝗼𝗻.𝗺𝘀__, __𝗹𝗼𝗴.𝗿𝗲𝘁𝗲𝗻𝘁𝗶𝗼𝗻.𝗺𝗶𝗻𝘂𝘁𝗲𝘀__, __𝗹𝗼𝗴.𝗿𝗲𝘁𝗲𝗻𝘁𝗶𝗼𝗻.𝗵𝗼𝘂𝗿𝘀__. If all of them are set, a more granular option will be used.
* After being marked for deletion the segments will be cleaned up by background processes.

# Log Compaction
* This Strategy only works on Keyed Partitions.
* Topics are compacted by retaining only the latest written record per key.
* Compaction is performed by the background process consisting of a pool of threads called Log Cleaner.