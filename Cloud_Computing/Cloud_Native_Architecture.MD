# The Principle of Cloud Native Architecture

## The Principles of Cloud-native Architecture

### What do Leading Companies Care About?
1. Respond to consumer trends
2. Disruptions in the systems
3. Develop and maintain satisfactory relationships with the customers
4. Controlled costs.

### What's Expected of Our Software Today?
1. Valued by customers
2. Constantly and easily changed.
3. Available at all times.
4. Scalable to meet demand
5. Secure in all aspects
6. Maintainable at scale

## Definition - Cloud-native
__Cloud native__ technologies empower organizations to build and run scalable applications in modern, dynamic environments such as _public_, _private_ and _hybrid_ clouds.

__Or__,

__Cloud-native__ is an approach to building and running applications that exploits the advantages of the cloud computing delivery model. _Cloud-native_ is about how applications are created and deployed, not where.

### Traits of Cloud Natives
1. Customer-centric
2. Learning culture
3. Agile development
4. Focus on products, not projects
5. Focus on the Automation of the entire delivery process
6. Heavy-users of open-source software

### How does Positive Progress look like?
1. _More speed_: Faster load time, regular deployments.
2. _More scale_: Low API response time, easily scale in and out, linear dev productivity.
3. _More stability_: drop in impact minutes , fast MTTR, low change failure rate
4. _More secure_:fully patched software, regularly changed credentials, small amounts of unplanned work.

## "Cloud-native" Applies to More than Just Apps
1. Cloud-native infrastructure
2. Cloud-native data
3. Cloud-native security
4. Cloud-native integration 

# The Patterns of Cloud-native Architecture
## Cloud-native Application Architecture Pattersn
### 12 - Factor Applications
These are a set of crireteria to help one measure how friendly an app is to really run on some quality sub-strait.
1. One code base in source control
2. Declared dependencies
3. Config stored in the environment
4. Backing services at attched services
5. Seperate build and run stages
6. App is executed as stateless processes.
7. Services exported as port bindings
8. Scale out process
9. Disposability
10. Environment pority
11. Treat logs like event streams
12. Run admin processes as one-off processes

## Cloud-native Application Technologies
1. External config including cloud-only services like Azure Key Vault, software like Hashocorp vault, or spring cloud config.
2. Code-based microservices infrastructure like Spring Cloud, Steeltoe, and Go Micro.
3. API gateways from public cloud providers, or software from Apigee and Mulesoft.
4. Identity management technologies including OAuth 2.0, OpenID Connect, and JWT.

## Cloud-native Database Technologies
1. Self-managed OSS databases like PostgreSQL, MySQL, MongoDB, and Cassandra
2. Managed Cloud Database from Amazon (RDS, DynamoDB), Microsoft(SQL Database, CosmosDB) and Google(Spanner)
3. Self-managed or hosted application caches based Redis, Memcached, and GemFire

## Cloud-native Messaging Technologies
1. Brokers like RabbitMQ, ActiveMQ, or NATS
2. Event stream processors like Apache Kafka, Apache Flink, or WSO2 Stream Processor.
3. Cloud-based services like Amazon SQS, Google Sub/Pub, or Azure Event Hubs.

## Application Delivery Technologies
### Continuos Integration Technologies
1. Version Control from GitHub, GitLab, Azure Repos, and BitBucket
2. Continuous integration workflow tools like Jenkins, Concourse,  Circle CI, TeamCity, AWS CodePipeline, and Azure Pipelines.

## Packaginng and Deployment Technologies
1. Artifact repositories like JFrog Artifactory, Sonatype Nexus Repository, and Apache Archiva.
2. Package formats like Linux, or Windows containers and package managers like Helm
3. Use CI tools like Concourse or Jenkins, plus software like GoCD and Spinnaker.
4. Enable feature flags with services like LauchDarkly, and analyse post-deploy metrics with Dynatrace and New Relic.

## Application Infrastructure Technologies
1. Config management like Chef, Ansible
2. Create infrsstructure with Terraform
3. Build and Manage systems with BOSH.
4. Run containers with Kubernetes, Mesos, or Nomad.
5. Automate app runtime with PaaS or FaaS
6. Microservices infrastructure with a service mesh.

## Application Team Technologies
1. __Chat__ tools like Slack and Microsoft Teams
2. __Kanban boards__ using tools from Trello, RealtimeBoard, and Asana.
3. Shared access to __logging and monitoring__ tools to pinpoint issues.
4. __Video conferencing__ tools like Zoom, BlueJeans, Skype, and Google Hangouts.
