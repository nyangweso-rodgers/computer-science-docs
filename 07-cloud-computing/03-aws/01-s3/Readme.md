# AWS S3 (Amazon Simple Storage Service)

## Table Of Contents

# Amazon S3

- **Amazon S3** is an object storage service that stores data as objects within **buckets**. An object is a file and any metadata that describes the file. A bucket is a container for objects.
- At a high level, storage systems fall into three broad categories:
  1. Block storage
  2. File storage
  3. Object storage

# How Amazon S3 works

- To store your data in **Amazon S3**, you first create a **bucket** and specify a **bucket name** and **AWS Region**. Then, you upload your data to that bucket as objects in Amazon S3. Each object has a **key** (or **key name**), which is the unique identifier for the object within the bucket.
- S3 provides features that you can configure to support your specific use case. For example, you can use S3 Versioning to keep multiple versions of an object in the same bucket, which allows you to restore objects that are accidentally deleted or overwritten.

# S3 Buckets

- To store your data in **Amazon S3**, you work with resources known as **buckets** and **objects**. A **bucket** is a container for **objects**. An **object** is a file and any metadata that describes that file.
- To store an **object** in **Amazon S3**, you create a **bucket** and then upload the object to a bucket. When the object is in the bucket, you can open it, download it, and move it. When you no longer need an object or a bucket, you can clean up your resources.
- AWS S3 supports three types of buckets:
  1. General purpose buckets
  2. Directory buckets
  3. Table buckets

# Resources and Further Reading
