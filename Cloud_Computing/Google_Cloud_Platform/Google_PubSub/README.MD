# PubSub

# What is PubSub?
__PubSub__ is shorthand for the __Publish/Subscribe__ model of distributed systems. In this model, any message __published__ (produced) to a topic is immediately received by all of the subscribers to the topic. __Pub/sub__ messaging can be used to enable event-driven architectures, or to decouple applications in order to increase _performance_, _reliability_ and _scalability_.

The __subscribers__ to the message topic often perform different functions, so each one can do something different with the message in parallel. The __publisher__ doesn’t need to know who is using the information that it is broadcasting, and the subscribers don’t need to know who the message comes from.

# Use Cases
Cloud __Pub/Sub__ is a _simple_, _reliable_, _scalable_ foundation for _stream analytics_ and _event-driven computing systems_. As part of Google Cloud’s _stream analytics solution_, the service ingests event streams and delivers them to Cloud Dataflow for processing and BigQuery for analysis as a data warehousing solution. Relying on the __Cloud Pub/Sub__ service for delivery of event data frees you to focus on transforming your business and data systems with applications such as:
* check Real-time personalization in gaming
* check Fast reporting, targeting and optimization in advertising and media
* check Processing device data for healthcare, manufacturing, oil and gas, and logistics
* check Syndicating market-related data streams for financial services

