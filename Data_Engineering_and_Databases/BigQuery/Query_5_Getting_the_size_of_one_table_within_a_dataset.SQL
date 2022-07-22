select table_id, sum(size_bytes)/(1024*1024*1024) as size_GB
from sales.__TABLES__  -- dataset name
where table_id = 'tbl_orders' -- table name
group by table_id order by size_GB desc;