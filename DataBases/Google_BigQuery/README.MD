# Google's BigQuery

## Table of Contents
__BigQuery__ is a serverless data analytics platform i.e., it automatically allocates  resources based on demand.
# BigQuery Pricing
1. __Analysis pricing__ is the cost to _process queries_, including SQL queries, user-defined functions, scripts, and certain data manipulation language (DML) and data definition language (DDL) statements that scan tables.
    - __On-demand pricing__. With this pricing model, you are charged for the number of bytes processed by each query. The first 1 TB of query data processed per month is free.
    - __Flat-rate pricing__. With this pricing model, you purchase slots, which are virtual CPUs. When you buy slots, you are buying dedicated processing capacity that you can use to run queries. Slots are available in the following commitment plans:
        - Flex slots: You commit to an initial 60 seconds.
        - Monthly: You commit to an initial 30 days.
        - Annual: You commit to 365 days.

     With monthly and annual plans, you receive a lower price in exchange for a longer-term capacity commitment.
2. __Storage pricing__ is the cost to store data that you load into BigQuery. You pay for _active storage_ and _long-term storage_.
    - __Active storage__ includes any table or table partition that has been modified in the last 90 days.
    - __Long-term storage__ includes any table or table partition that has not been modified for 90 consecutive days. The price of storage for that table automatically drops by approximately 50%. There is no difference in performance, durability, or availability between active and long-term storage.

# References
1. [BigQuery Pricing](https://cloud.google.com/bigquery/pricing)