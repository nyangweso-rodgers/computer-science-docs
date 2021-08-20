# CloudSQL
__Google Cloud SQL__ is a service that allows you to _create_, _configure_, and _use_ __relational databases__ that live in __Google's cloud__. It is a fully-managed service that maintains, manages, and administers your databases, allowing you to focus on your applications and services.

_Remarks:_
* _Google Cloud SQL is a MySQL database that lives in Google's cloud._ 
* _It has all the capabilities and functionality of MySQL, with a few additional features and a few unsupported features._
* _Its easy to use and doesn't require any software installation or maintenance, and is ideal for small to medium-sized applications._

# Features of Cloud SQL
* Host your MySQL 5.5 and 5.6 databases in the cloud
* All data replicated across multiple zones for greater availability and durability
* Choice of billing options:
    - Per use option means you only pay for the time you access your data
    - Package option allows you to control your costs for more frequent access
* Google Cloud SQL instances can have up to 16GB of RAM and 500GB data storage
* Create and manage instances in the Google Cloud Console
* Instances available in US, EU, or Asia
* Cloud SQL customer data is encrypted when on Google’s internal networks and when stored in database tables, temporary files, and backups
* Synchronous or asynchronous replication between multiple zones with automatic failover
* Import and export databases using mysqldump, or import and export CSV files.
* Java and Python compatibility
* Support for MySQL wire protocol and MySQL connectors
* Support for connections over IPv4 and IPv6
* Support for connecting with the __Secure Sockets Layer__ (SSL) protocol
* Automated backups and point-in-time recovery
* __ISO/IEC 27001__ compliant

# Restrictions of Cloud SQL
* Size limit for individual instances is 500GB
* User defined functions are not supported
* The following MySQL statements are not supported:
    - LOAD DATA INFILE
        - Note: LOAD DATA LOCAL INFILE is supported.
    - SELECT ... INTO OUTFILE/DUMPFILE
    - INSTALL/UNINSTALL PLUGIN ...
    - CREATE FUNCTION ...
    - LOAD_FILE()
* The SUPER privilege is not supported.
* The following MySQL functions are not supported:
    - SHA2()
* The following MySQL Client Program features are not supported:
    - [mysqlimport](https://dev.mysql.com/doc/refman/8.0/en/mysqlimport.html) without using the --local option. This is due to the LOAD DATA INFILE restriction. If you need to load data remotely, use the Cloud SQL [import function](https://cloud.google.com/sql/docs/mysql/import-export#importing)
    - [mysqlimport](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html) using the --tab option or options that are used with --tab. This is because the [FILE](https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html#priv_file) privilege is not granted for instance users. All other mysqlimport options are supported.