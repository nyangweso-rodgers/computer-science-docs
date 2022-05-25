-- The final resulting table will assign a score between 1 and 4 for each of the quantiles (recency, frequency and monetary value)
sql
select distinct(Unique_Stalls) as unique_stall,
        ntile(4) over (order by last_delivery_date) as rfm_recency,
        ntile(4) over (order by delivery_count) as rfm_frequency,
        ntile(4) over (order by avg_amount) as rfm_monetary
from (select Unique_Stalls, 
       max(delivery_date) as last_delivery_date, -- last delivery date
       count(*) as delivery_count,
       sum(Amount) as total_delivery_amount,
       avg(Amount) as avg_amount
from dmslive.cache_finance_deliveries
where delivery_date between '2020-01-01' and '2020-07-31'
group by 1
order by 1)
```

```sql
-- These individual scores can be combined to create an aggregate score if needed.
select distinct(unique_stall) as unique_stall, rfm_recency*100 + rfm_frequency*100 + rfm_monetary*100 as rfm_combined from (select distinct(Unique_Stalls) as unique_stall,
        ntile(4) over (order by last_delivery_date) as rfm_recency,
        ntile(4) over (order by delivery_count) as rfm_frequency,
        ntile(4) over (order by avg_amount) as rfm_monetary
from (select Unique_Stalls, 
       max(delivery_date) as last_delivery_date,
       count(distinct delivery_date) as delivery_count,
       sum(Amount)/26 as avg_amount
from dmslive.cache_finance_deliveries
where delivery_date between '2020-06-01' and '2020-06-30'
group by 1
order by 1))