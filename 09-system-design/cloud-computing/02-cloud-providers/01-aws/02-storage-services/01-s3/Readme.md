# AWS S3 (Simple Storage Service)

## Table Of Contents

# What’s Amazon S3?

- Amazon S3 is an object storage service that stores data as **objects** within **buckets**. An **object** is a file and any metadata that describes the file.
- A **bucket** is a container for **objects** stored in **Amazon S3**. You can store any number of objects in a **bucket** and can have up to one hundred buckets in your account.

# S3 Features

## 1. S3 Bucket Policies

- An **S3 bucket policy** is a **JSON** document that defines the access permissions for an S3 bucket and its objects. It allows you to control who can access the bucket and its objects, what actions can be performed on them, and under what conditions. It can be set at the bucket and object level and works in conjunction with other access controls such as IAM policies and ACLs.
- **Examples**:
  1. **Example 1**: Bucket Policy that grants public read access to all objects in a bucket named `“cloudandcodebucket”`:
     ```json
     {
       "Version": "2012-10-17",
       "Statement": [
         {
           "Sid": "CloudandCode",
           "Effect": "Allow",
           "Principal": "*",
           "Action": "s3:GetObject",
           "Resource": "arn:aws:s3:::cloudandcodebucket/*"
         }
       ]
     }
     ```
     - This policy uses the `“Effect”` field to specify that access is allowed, the `“Principal”` field to specify that access is granted to anyone ("`*`” means all), the `“Action”` field to specify that the “`s3:GetObject`” action is allowed (which corresponds to read access), and the `“Resource”` field to specify that access is granted to all objects in the `“cloudandcodebucket”` bucket.

2. **Example 2**: bucket policy that grants write access only to an AWS account with the ID “012345678901” to a specific object inside a bucket named `“cloudandcodebucket”`:
   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "CloudandCode",
         "Effect": "Allow",
         "Principal": {
           "AWS": "012345678901"
         },
         "Action": "s3:PutObject",
         "Resource": "arn:aws:s3:::cloudandcodebucket/path/to/specific_object"
       }
     ]
   }
   ```
   - This policy uses the `“Principal”` field to specify that access is granted to a specific AWS account with the ID `“012345678901”`, the `“Action”` field to specify that the “`s3:PutObject`” action is allowed (which corresponds to write access), and the `“Resource”` field to specify that access is granted to a specific object `“specific_object”` inside the `“cloudandcodebucket”` bucket.

## 2. Pricing of AWS S3

- **Amazon S3** pricing is based on a pay-as-you-go model, where you pay for the amount of **storage** and **data transfer** used. **Storage** prices vary depending on the **region**, **storage class**, and **volume of data stored**, with a lower cost for infrequently accessed data and a higher cost for frequently accessed data.
- **Data transfer prices** also vary depending on the source of the data and its destination, with a lower cost for data transfer within the same region and a higher cost for data transfer across regions or over the internet.
- In addition to **storage** and **data transfer costs**, there are also additional costs for features such as **versioning**, **lifecycle management**, and **data retrieval**.

## 3. Storage Classes

- **Amazon S3 storage classes** are different levels of storage designed for different use cases and access patterns. Each class has its own set of features and prices.

  1. **S3 Standard**

     - for frequently accessed data, with high durability and availability. This is the **default storage class**.

  2. **S3 Standard-Infrequent Access (S3 Standard-IA)**

     - for infrequently accessed data, with a lower cost than **S3 Standard** but slightly higher retrieval costs.

  3. **S3 One Zone-Infrequent Access (S3 One Zone-IA)**

     - for infrequently accessed data, with a lower cost than **S3 Standard-IA**, but with the data stored in a single availability zone, making it less durable than **S3 Standard-IA**.

  4. **S3 Intelligent-Tiering**

     - For data with unknown or changing access patterns, with automatic tiering between **S3 Standard** and **S3 Standard-IA**.

  5. **S3 Glacier**

     - For long-term archival storage, with a lower cost than **S3 Standard-IA** and **S3 One Zone-IA**, but with retrieval costs and retrieval times that are higher.

  6. **S3 Glacier Deep Archive:**
     - for data that is rarely accessed and for which retrieval times of several hours are acceptable, with the lowest cost of all **S3 storage classes**.

## 4. Block Public Access

- **Amazon S3 Block Public Access** is a feature that allows you to prevent public access to your **S3 buckets** and objects at the account level or the bucket level.
- It allows you to block or override public access settings for individual **buckets**, including public access to objects through the **Amazon S3 website**, public access through the **AWS Management Console**, public access through the **AWS SDKs** and **CLI**, and public access through anonymous access to buckets.
- When you enable **S3 Block Public Access**, the following public access settings are automatically blocked:
  1.  Bucket and object ACLs that grant public access
  2.  Bucket policies that grant public access
  3.  Object policies that grant public access
  4.  Public access to newly created buckets and objects
- You can also set up **S3 Block Public Access** to automatically block new public access settings that are added to your account or bucket, or you can use the **S3 Block Public Access** configuration to override existing public access settings.

## 5. Event Notifications

- **Amazon S3 Event Notifications** are a feature that allows you to configure **Amazon S3** to send a message to an **AWS service**, such as **Amazon SNS** when certain events occur in your bucket. These events include:

  1. Object created
  2. Object deleted
  3. Object restored from archive
  4. Reduced redundancy storage (RRS) object lost

- You can use **S3 Event Notifications** to trigger actions in response to changes to your objects, such as:

  1.  Automatically triggering an AWS Lambda function to process new data as it is added to an S3 bucket
  2.  Sending a message to an Amazon SNS topic to notify you of a new object
  3.  Sending an SQS message to trigger a workflow in response to a new object

- **S3 Event Notifications** are configured using an **S3 bucket notification** configuration, which is a set of rules that specify the events that you want to be notified of and the target service to send the notifications to. You can set up notifications for a specific prefix or suffix in the key name of your objects, and you can also set up notifications for specific events (e.g. only object creation, only object deletion)

## 6. Lifecycle Policies

- **Amazon S3 Lifecycle policies** are a feature that allows you to automatically transition objects between storage classes or delete them when they are no longer needed, based on their age or other criteria.
- It allows you to define a set of rules that specify when objects should be transitioned to a different storage class or deleted, and you can apply these rules to all objects in a bucket or to specific objects or prefixes.
- For example, you could use a **Lifecycle policy** to transition all objects in a bucket to the **S3 Standard-IA storage class** after 30 days, and then delete them after 90 days.
- You can also use S3 Lifecycle policies to transition objects to the S3 Glacier or S3 Glacier Deep Archive storage classes for archival purposes and you can configure the policy to transition objects between the classes as they age.
- **Lifecycle policies** can help you reduce storage costs by automatically moving infrequently accessed data to lower-cost storage classes and deleting data that is no longer needed, and it can also help you to comply with data retention regulations.

# Working with AWS S3 using `boto3` client

- AWS’ Boto3 library is used commonly to integrate Python applications with various AWS services. The two most used features of boto3 are **Clients** and **Resources**.
- **Client**: Used for low-level service access. The main benefit of using the **Boto3 client** are:

  1.  It maps 1:1 with the actual AWS service API.
  2.  All AWS service operations supported by clients

- **Resource**: Used for higher-level object-oriented service access. Boto3 resources are a higher-level abstraction compared to clients. They are generated from a JSON resource description that is present in the boto3 library itself.

# Setup

- Configure Enivironment
  - Define configuation variables:
    ```env
        aws_accesskey=<Your Access Key>
        aws_secretaccess=<Secret Access>
        AWS_REGION=<Region>
        AWS_BUCKET=<Bucket Name>
    ```
- **Uploading Files to S3**

  - Using Python and `boto3` library

    ```py
        import boto3
        import os

        def upload_file(aws_access, aws_secret, aws_region, bucket_name, file_toupload, object_name=None):
            s3_client = boto3.client('s3', aws_access_key_id=aws_access, aws_secret_access_key=aws_secret, region_name=aws_region)

            # if s3 object_name was not specified, use file_toupload
            if object_name is None:
                object_name = os.path.basename(file_toupload)
            try:
                response = s3_client.upload_file(file_toupload, bucket_name, object_name)
            except: ClientError as e:
                logging.error(e)
                return false
            return true
    ```

  - The function allows you to upload a file to the specified S3 bucket. You can select the file to upload (‘file_toupload’), the bucket name (‘bucket_name’), and, optionally, the object name (‘object_name’). The object name defaults to the file’s base name if it is not provided.

- **Downloading Files from S3 bucket**
- **Listing Objects in a Bucket**
- **Deleting Files from a Bucket**

# Resources and Further Reading

1. [Medium - AWS S3 Quick Reference Guide](https://awstip.com/aws-s3-quick-reference-guide-8fcd0303e927)
