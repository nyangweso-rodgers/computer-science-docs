# Dimensional Modeling

## Table of Contents
- [Dimensional Modeling in Data Warehousing](#Dimensional-Modeling-in-Data-Warehousing)
- [Elements of Dimensional Data Modeling](#Elements-of-Dimensional-Data-Modeling)
- [Types of Dimensions in Data Warehouse](#Types-of-Dimensions-in-Data-Warehouse)
- [Steps of Dimensional Modelling](#Steps-of-Dimensional-Modelling)
- [Rules for Dimensional Modeling](#Rules-for-Dimensional-Modeling)
- [References]()
    - [Quora - Dimensional Modeling in Data Warehousing](https://www.quora.com/What-is-dimension-modeling-in-data-warehousing)
    - [What is Dimensional Modeling in Data Warehouse? Learn Types](https://www.guru99.com/dimensional-model-data-warehouse.html)

# Dimensional Modeling in Data Warehousing
A __Dimensional Model__ is a database structure that is optimized for online queries and __Data Warehousing__ tools. It is comprised of "__fact__" and "__dimension__" tables. A "__fact__" is a _numeric value that a business wishes to count or sum_. A "__dimension__" is essentially an entry point for getting at the facts.

# Elements of Dimensional Data Modeling
1. __Fact__: are the measurements/metrics
2. __Dimension__: provides the context surrounding a business process event. i.e., they give who, what, where of a fact. e.g., customer name, location, product name. e.t.c.,
3. __Atrributes__: are the various _characteristics_ of the __dimension__ in __dimensional data modeling__. Attributes are used to serach, filter, or classify facts. E.g., in the _Location_ dimension, the __atributes__ can be:
    * State
    * Country
    * Zipcode e.t.c.,

    _Remark_: _Dimension Tables contain Attributes_

4. __Fact Table__: this is a _primary table_ in __dimension modelling__. A __fact table__ contains: 
    * Measurements/facts
    * Foreign Key to dimension table

5. __Dimension Table__: 
    * A dimension table contains dimensions of a fact.
    * A dimension table contains dimensions of a fact.
    * Dimension tables are de-normalized tables.
    * The Dimension Attributes are the various columns in a dimension table
    * Dimensions offers descriptive characteristics of the facts with the help of their attributes
    * No set limit set for given for number of dimensions
    * The dimension can also contain one or more hierarchical relationships

# Types of Dimensions in Data Warehouse
1. Conformed Dimension
2. Outrigger Dimension
3. Shrunken Dimension
4. Role-playing Dimension
5. Dimension to Dimension Table
6. Junk Dimension
7. Degenerate Dimension
8. Swappable Dimension
9. Step Dimension

# Steps of Dimensional Modelling
The accuracy in creating a __Dimensional modeling__ determines the success of your data warehouse implementation. Here are the steps to create __Dimension Model__
1. Identify Business Process
2. __Identify Grain (level of detail)__: describes the level of detail for the business problem/solution.  It is the process of identifying the lowest level of information for any table in your data warehouse.
3. __Identify Dimensions__: Dimensions are nouns like date, store, inventory, etc. These dimensions are where all the data should be stored. For example, the date dimension may contain data like a year, month and weekday. 
4. __Identify Facts__: This step is co-associated with the business users of the system because this is where they get access to data stored in the data warehouse. Most of the fact table rows are numerical values like price or cost per unit, etc.
5. __Build Schema__: In this step, you implement the __Dimension Model__. A schema is nothing but the database structure (arrangement of tables). There are two popular schemas:
    * __Star Schema__: The star schema architecture is easy to design. It is called a star schema because diagram resembles a star, with points radiating from a center. The center of the star consists of the fact table, and the points of the star is dimension tables. The fact tables in a star schema which is third normal form whereas dimensional tables are de-normalized.
    * __Snowflake Schema__: The snowflake schema is an extension of the star schema. In a snowflake schema, each dimension are normalized and connected to more dimension tables.

# Rules for Dimensional Modeling
* Load atomic data into dimensional structures.
* Build dimensional models around business processes.
* Need to ensure that every fact table has an associated date dimension table.
* Ensure that all facts in a single fact table are at the same grain or level of detail.
* It’s essential to store report labels and filter domain values in dimension tables
* Need to ensure that dimension tables use a surrogate key
* Continuously balance requirements and realities to deliver business solution to support their decision-making

# Benefits of Dimensional Modeling
* Standardization of dimensions allows easy reporting across areas of the business.
* Dimension tables store the history of the dimensional information.
* It allows to introduce entirely new dimension without major disruptions to the fact table.
* Dimensional also to store data in such a fashion that it is easier to retrieve the information from the data once the data is stored in the database.
* Compared to the normalized model dimensional table are easier to understand.
* Information is grouped into clear and simple business categories.
* The dimensional model is very understandable by the business. This model is based on business terms, so that the business knows what each fact, dimension, or attribute means.
* Dimensional models are deformalized and optimized for fast data querying. Many relational database platforms recognize this model and optimize query execution plans to aid in performance.
* Dimensional modelling in data warehouse creates a schema which is optimized for high performance. It means fewer joins and helps with minimized data redundancy.
* The dimensional model also helps to boost query performance. It is more denormalized therefore it is optimized for querying.
* Dimensional models can comfortably accommodate change. Dimension tables can have more columns added to them without affecting existing business intelligence applications using these tables.