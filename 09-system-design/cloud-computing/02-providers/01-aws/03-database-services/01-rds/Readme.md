# Amazon RDS

## Table Of Contents

- **How compute is billed in Amazon RDS**: In **Amazon RDS**, compute costs are largely determined by:
  1. **Instance class**. How much **vCPUs** and **RAM** are allocated to your database instance. Logically, larger instances with more resources will cost more. This is allocation pricing: it’s independent of how much resources you actually use
  2. **On-demand vs reserved**. With **On-demand instances**, you will pay “by the hour” (though effectively by the month) for the **allocated compute capacity**. If you want a discount, you can make an upfront payment for a 1 or 3-year term to access Reserved pricing.
  3. **Single-AZ vs multi-AZ**: Single-AZ deployments give you one database instance in a single Availability Zone. Multi-AZ deployments cost double, and come with a primary database instance and a standby replica in a different AZ for high availability.

# Lowering down compute costs in Amazon RDS

1. Choosing the best database strategy

   - How many **prod instances** do you need?
     - E.g., if you want to create **one-database-per-tenant**, should every database be on its own **instance**? In RDS, this architecture often means not only higher costs but also complex operations overtime.
     - Do you prefer to fit many databases into a larger production instance? This is often more cost-effective, but be aware of potential performance isolation problems, complexities with region-dependent data compliance regulations, and more complex Postgres management.
   - Similarly, ask yourself how many **non-production instances** do you need. Do you want one separate dev instance per engineer? Make sure to audit your testing and staging environments too, and evaluate if you really need them.
   - If you want multi-AZ for your production instances, make sure you really need this level of availability. High-availability deployments are expensive (in RDS and elsewhere).

2. Choosing the right instance size

   - in **RDS** deployments (and in all allocation-based databases), the majority of allocated compute capacity remains unused most of the time. This is obviously a huge innefficiency in terms of costs. The reason why this is so common is that it’s actually hard to estimate how much compute capacity a workload will need; so in order to ensure a good user experience and to avoid outages and other nasty things, developers tend to overprovision.
   - You can try to avoid this by investing time to know your workload as best as possible. Run experiments to determine the right size for your prod instance, and analyze usage patterns of similar instances you might have running (e.g. dev or testing instances).

3. Manually downsizing / pausing instances
   - the next step would be to analyze **RDS usage metrics** over a significant period to identify consistent patterns of low resource utilization, for example by looking at these **AWS Cloudwatch metrics**:
     1. `CPUUtilization`: if your **CPU utilization** is consistently low (e.g., below 10-20%) this indicates that you are **overprovisioned**.
     2. `FreeableMemory`: similarly, if your RDS instance consistently has a high amount of freeable memory (e.g., more than 50% of the total memory), it suggests that the instance is **overprovisioned**.
   - Now, imagine you’ve decided that you can downsize your instance class. In theory, **Amazon RDS** allows you to stop and start your **DB instance**, which could theoretically be used to switch to a smaller (and cheaper) instance when less compute power is required. However, beware:
     - Stopping and restarting instances involves downtime (sometimes seconds, sometimes more)
     - Changing the instance type involves modifying the DB instance settings
     - Pausing and resizing instances in multi-AZ deployments can have some consequences – e.g. the primary and secondary might switch roles
     - If you’re looking at the production instance, you should first test and validate any downsizing to avoid any unwanted effects on performance. This means creating a test environment that mirrors your production setup, then downsizing the instances in the test environment and monitoring performance and resource utilization. Ideally, you would perform load testing and simulate real-world workloads to ensure the downsized instances can handle the expected traffic.

# Optimizing your Postgres database

1. Query Optimization

   - The first thing you can look into is **query optimization**. If you are hand-rolling your SQL, you can analyze and optimize slow-running queries using tools like `EXPLAIN` and `ANALYZE`. Here’s a quick example of `EXPLAIN`:
     ```sql
        EXPLAIN ANALYZE
        SELECT c.customer_name, SUM(o.total_amount) AS total_spent
        FROM customers c
        JOIN orders o ON c.customer_id = o.customer_id
        WHERE c.customer_status = 'Active'
        GROUP BY c.customer_name
        ORDER BY total_spent DESC
        LIMIT 10;
     ```
   - Here, we have a query that retrieves the top 10 active customers based on their total spent amount. The query joins the `customers` and `orders` tables, filters active customers, groups the results by customer name, and orders by the total spent amount in descending order.
   - When we run the `EXPLAIN ANALYZE` command, it provides a detailed execution plan along with the actual runtime statistics.
   - The execution plan will show the steps and costs involved in executing the query. By analyzing the execution plan, we can identify potential performance bottlenecks and optimize the query accordingly.
   - Some possible optimizations here are:
     - Add an index on the `customer_status` column in the `customers` table to speed up the filtering of active customers.
     - Create an index on the `customer_id` column in the `orders` table to improve the join performance.
     - Consider using a **materialized view** to pre-aggregate the total spent amount per customer if this query is frequently executed.

2. Use appropriate indexes to improve query performance and reduce the need for full table scans.
3. Avoid using unnecessary joins or complex subqueries that can impact performance.
4. Optimize query parameters and use parameterized queries to avoid query plan cache misses.
5. Caching is also an option to reduce database load by storing frequently accessed data in memory. You can implement application-level caching using tools like **Redis** to cache query results or frequently accessed objects.

# Resources and Further Reading
