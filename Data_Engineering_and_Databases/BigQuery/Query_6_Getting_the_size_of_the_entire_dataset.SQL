select sum(size_bytes)/(1024*1024*1024) as size_GB
from sales.__TABLES__; -- sales is the dataset name