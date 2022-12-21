# BigQuery Audit Logs

## Table Of Contents
- [Further Reading]()
    - [BigQuery audit logs overview](https://cloud.google.com/bigquery/docs/reference/auditlogs/)
    - [How I build a Real-time BigQuery Pipeline for Cost Saving and Capacity Planning](https://towardsdatascience.com/how-i-build-a-real-time-bigquery-pipeline-for-cost-saving-and-capacity-planning-15712c97f058)

# Introduction to BigQuery Audit Logs
* You can route logs to different [destinations](https://cloud.google.com/logging/docs/export/configure_export_v2#supported-destinations) like Cloud storage, Pub/Sub, and BigQuery via [sinks](https://cloud.google.com/logging/docs/export/configure_export_v2). Among them, Pub/Sub is the best candidate because it natively fits real-time usecases. In the sink, you can include a filter that matches the log entries you want to include. Otherwise, the Pub/Sub topic will be overloaded by irrelevant messages.

* __PubSub__ is essentially a queue. We need subscribers like cloud function to consume logs and process them. After creating the topic, you can click “Trigger Cloud Function” button to create a cloud function in any programming language. How easy is that!