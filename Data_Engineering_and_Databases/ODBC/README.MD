# Open Database Connectivity (ODBC)

## Table of Contents
- [What is ODBC?](#What-is-ODBC?)
- [What is OLEDB?](#What-is-OLEDB?)
- [References]()
    - [Microsoft Documentation](https://docs.microsoft.com/de-de/sql/odbc/reference/what-is-odbc?view=sql-server-ver16)

# What is ODBC?
__ODBC__ is a standadized interface for SQL databases which allows one to access different database management systems and execute queries. The goal is to have a programming interface that works independently of the selected database and can thus be connected to various existing databases.

# What is OLEDB?
__OLEDB__ was also developed by Microsoft and provides an API for databases. It offers the same possibilities as __ODBC__ and is therefore also considered the successor of Open Database Connectivity. However, it fetches the data already on a higher level and makes it possible thereby also non-relational databases to query, which is seen as a large advantage opposite ODBC.

# Installation and Configuration of Software
* https://docs.microsoft.com/de-de/sql/odbc/reference/install/installing-and-configuring-the-odbc-software?view=sql-server-ver16