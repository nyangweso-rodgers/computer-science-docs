# PostgreSQL

## Table Of Contents
- [References]()
    - [EP30: Why is PostgreSQL the most loved database](https://blog.bytebytego.com/p/ep30-why-is-postgresql-the-most-loved?utm_campaign=post&utm_medium=web)
    - [How To Handle Date and Time Difference in PostgreSQL](https://towardsdatascience.com/how-to-handle-date-and-time-difference-in-postgresql-615f26ba0b84)

# Use Cases Of PostgreSQL
1. __OLTP (Online Transaction Processing)__: We can use PostgreSQL for CRUD (Create-Read-Update-Delete) operations.
2. __OLAP (Online Analytical Processing)__: We can use PostgreSQL for analytical processing. PostgreSQL is based on HTAP (Hybrid transactional/analytical processing) architecture, so it can handle both OLTP and OLAP well.
3. __FDW (Foreign Data Wrapper)__: A FDW is an extension available in PostgreSQL that allows us to access a table or schema in one database from another.
4. __Streaming__: _PipelineDB_ is a PostgreSQL extension for high-performance time-series aggregation, designed to power real-time reporting and analytics applications.
5. __Geospatial__: _PostGIS_ is a spatial database extender for PostgreSQL object-relational database. It adds support for geographic objects, allowing location queries to be run in SQL.
6. __Time Series__: _Timescale_ extends PostgreSQL for time series and analytics. For example, developers can combine relentless streams of financial and tick data with other business data to build new apps and uncover unique insights.
7. __Distributed Tables__: CitusData scales Postgres by distributing data & queries. 