# Google Could Functions
__Cloud Functions__ are services which execute a piece of code  written by a developer as a response to a pre-defined event, with a time execution limit and it’s scalability managed by the provider. 

The architecture of this kind of service is refered as a __Serverless Architecture__, where pricing is calculated by the number of times the function is called and the quantity of memory and the CPU utilized. This kind of service is atractive as with little effort the function is up and running without worrying about managing a server. 

# Setting up a Cloud Function
The idea behind this function is to instantly process a json file at the moment it’s stored in a Cloud Storage bucket and load it’s content to BigQuery.

# References
1. [Streaming data from Cloud Storage into BigQuery using Cloud Functions](https://cloud.google.com/architecture/streaming-data-from-cloud-storage-into-bigquery-using-cloud-functions)
2. [Google Cloud Functions — A Brief Tutorial](https://medium.com/geekculture/google-cloud-functions-a-brief-tutorial-de07d8945b01)