# MySQL

## Storage Engines in MySQL
Whether you need 99.999% uptime and reliability on your distributed computing cluster or you need ACID compliant transaction support with FOREIGN KEY constraints, MySQL has a storage engine to suit your needs.

As always, proper planning and identification of your project goals and requirements is the best way to accurately identify which storage engines are best suited for your application. 

### 1. InnoDB: 
The default option in MySQL 5.7, __InnoDB__ is a robust storage engine that offers:
* Full ACID compliance
* Commit, rollback, and crash-recovery
* Row-level locking
* FOREIGN KEY referential-integrity constraints
* Increase multi-user concurrency (via non-locking reads)

With the above functionality that __InnoDB__ offers, it is obvious why it is the default MySQL engine. It is an engine that performs well and offers many of the required attributes that any database would need.

### 2. MyISAM: 
The functionality that sets __MyISAM__ apart is its capability for:
* full text search indexes
* table-level locking
* lack of support for transactions

Though it is a fast storage engine, it is best suited for use in read-heavy and mostly read applications such as data warehousing and web applications that don’t need transaction support or ACID compliance.

### 3. NDB (or NDBCLUSTER): 
If a clustered environment is where your database will be working, __NDB__ is the storage engine of choice. It is best when you need:
* Distributed computing
* High-redundancy
* High-availability
* The highest possible uptimes

Take note that support for NDB is not included in the distribution of standard MySQL Server 5.7 binaries. You will have to update to the latest binary release of MySQL Cluster. Though, if you’re developing in a cluster environment, you probably have the necessary experience to deal with these tasks.

### 4. CSV: 
A useful storage engine when data needs to be shared with other applications that use __CSV__ formatted data. The tables are stored as comma separated value text files. Though this makes sharing the data with scripts and applications easier, one drawback is that the __CSV__ files are not indexed. So, the data should be stored in an __InnoDB__ table until the Import/Export stage of the process.

### 5. Blackhole: 
This engine accepts but does not store data. Similar to the UNIX /dev/null, queries always return an empty set. This can be useful in a distributed database environment where you do not want to store data locally or in performance or other testing situations.

### 6. Archive: 
Just as the name implies, this engine is excellent for seldom-referenced historical data. The tables are not indexed and compression happens upon insert. Transactions are not supported. Use this storage engine for _archiving and retrieving past data_.

### 7. Federated: 
This storage engine is for creating a single, local, logical database by linking several different physical MySQL servers. No data is stored on the local server and queries are automatically executed on the respective remote server. It is perfect for distributed data mart environments and can vastly improve performance when using MySQL for analytical reporting.


#### References
1. https://www.sisense.com/blog/beginners-guide-to-mysql-storage-engines/