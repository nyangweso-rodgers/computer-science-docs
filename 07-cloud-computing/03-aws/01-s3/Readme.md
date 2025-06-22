# AWS S3 (Amazon Simple Storage Service)

## Table Of Contents

# Amazon S3

- **Amazon S3** is an object storage service that stores data as objects within **buckets**. An object is a file and any metadata that describes the file. A **bucket** is a container for **objects**.
- At a high level, **storage systems** fall into three broad categories:

  1. Block storage
  2. File storage
  3. Object storage

- **Block Storage**

  - **Block storage** came first, in the 1960s. Common storage devices like **hard disk drives** (**HDD**) and **solid-state drives** (**SSD**) that are physically attached to servers are all considered as **block storage**.
  - **Block storage** presents the raw blocks to the server as a volume. This is the most flexible and versatile form of storage. The server can format the raw blocks and use them as a file system, or it can hand control of those blocks to an application. Some applications like a database or a virtual machine engine manage these blocks directly in order to squeeze every drop of performance out of them.

- **File Storage**:

  - **File storage** is built on top of **block storage**. It provides a higher-level abstraction to make it easier to handle files and directories. Data is stored as files under a hierarchical directory structure. File storage is the most common general-purpose storage solution. File storage could be made accessible by a large number of servers using common file-level network protocols like SMB/CIFS and NFS. The servers accessing file storage do not need to deal with the complexity of managing the blocks, formatting volume, etc. The simplicity of file storage makes it a great solution for sharing a large number of files and folders within an organization.

- **Object Storage**:

  - **Object storage** is new. It makes a very deliberate tradeoff to sacrifice performance for high durability, vast scale, and low cost. It targets relatively “cold” data and is mainly used for **archival** and **backup**.
  - **Object storage** stores all data as **objects** in a flat structure. There is no hierarchical directory structure.
  - Data access is normally provided via a **RESTful API**. It is relatively slow compared to other storage types.
  - Most public cloud service providers have an object storage offering, such as **AWS S3**, **Google object storage**, and **Azure blob storage**.

- **How Amazon S3 works**
  - To store your data in **Amazon S3**, you first create a **bucket** and specify a **bucket name** and **AWS Region**. Then, you upload your data to that bucket as objects in Amazon S3. Each object has a **key** (or **key name**), which is the unique identifier for the object within the bucket.
  - S3 provides features that you can configure to support your specific use case. For example, you can use S3 Versioning to keep multiple versions of an object in the same bucket, which allows you to restore objects that are accidentally deleted or overwritten.

# S3 Buckets

- To store your data in **Amazon S3**, you work with resources known as **buckets** and **objects**. A **bucket** is a container for **objects**. An **object** is a file and any metadata that describes that file.
- To store an **object** in **Amazon S3**, you create a **bucket** and then upload the object to a bucket. When the object is in the bucket, you can open it, download it, and move it. When you no longer need an object or a bucket, you can clean up your resources.

- AWS S3 supports **three types of buckets**:

  1. **General purpose buckets**

     - **General purpose buckets** are the original S3 bucket type and are recommended for most use cases and access patterns.
     - Also allow **objects** that are stored across all storage classes, except **S3 Express One Zone**.
     - Every **object** is contained in a **bucket**. For example, if the object named `photos/puppy.jpg` is stored in the `amzn-s3-demo-bucket` bucket in the US West (Oregon) Region, then it is addressable by using the URL `https://amzn-s3-demo-bucket.s3.us-west-2.amazonaws.com/photos/puppy.jpg`.
     - **S3 General Purpose buckets** use what is called as **Flat Storage Structure**, where it organize all files at the same level, without directories or subdirectories, akin to placing all documents in a single folder. Relies on metadata tags and unique identifiers to categorize and retrieve files, compensating for the lack of nested directories.

  2. **Directory buckets**

     - **Directory buckets** use the **S3 Express One Zone storage class**, which is recommended if your application is performance-sensitive and benefits from single-digit millisecond `PUT` and `GET` latencies.
     - **Directory buckets** organize data hierarchically into directories as opposed to the **flat storage structure** of **general-purpose buckets**. There aren’t prefix limits for directory buckets, and individual directories can scale horizontally.
     - Example:
       - root-directory
         - folder1
           - sub-folder1
             - file1
           - sub-folder2
             - file2
         - folder2
           - file1
           - file2
       - We can create up to 100 directory buckets in each of your AWS accounts, with no limit on the number of objects that you can store in a bucket. Your bucket quota is applied to each Region in your AWS account.

  3. **Table buckets**
     - **S3 Tables** provide S3 storage that’s optimized for analytics workloads, with features designed to continuously improve query performance and reduce storage costs for tables. **S3 Tables** are purpose-built for storing tabular data, such as daily purchase transactions, streaming sensor data, or ad impressions. Tabular data represents data in columns and rows, like in a database table.

# Uploading objects

- **Prevent uploading objects with identical key names**

  - We can check for the existence of an **object** in a **bucket** before creating it using a conditional write on upload operations. This can prevent overwrites of existing data. Conditional writes will validate there is no existing object with the same key name already in your bucket while uploading.

    ```js
    import { S3Client, PutObjectCommand } from "@aws-sdk/client-s3";

    // Initialize the S3 client
    const s3Client = new S3Client({ region: "us-east-2" });
    // Define your bucket, object key, and the content to upload
    const bucketName = "your-bucket-name";
    const objectKey = "your-object-key";
    const fileContent = "My Amazing File Content";
    async function uploadFileIfNotExists() {
      try {
        const params = {
          Bucket: bucketName,
          Key: objectKey,
          Body: fileContent,
          // If-None-Match set to "*" prevents overwriting an existing object
          IfNoneMatch: "*",
        };

        const command = new PutObjectCommand(params);
        const data = await s3Client.send(command);
        console.log("File successfully uploaded!");
      } catch (error) {
        if (error.name === "PreconditionFailed") {
          console.log(
            "File already exists. Aborting upload to prevent overwrite."
          );
        } else {
          console.error("Error uploading file:", error);
        }
      }
    }
    ```

# Transforming objects with S3 Object Lambda

- With **Amazon S3 Object Lambda**, you can add your own code to Amazon S3 `GET`, `LIST`, and `HEAD` requests to modify and process data as it is returned to an application.
- You can use custom code to modify the data returned by S3 `GET` requests to filter rows, dynamically resize and watermark images, redact confidential data, and more.
- You can also use **S3 Object Lambda** to modify the output of S3 `LIST` requests to create a custom view of all objects in a bucket and S3 `HEAD` requests to modify object metadata such as object name and size. You can use **S3 Object Lambda** as an origin for your Amazon CloudFront distribution to tailor data for end users, such as automatically resizing images, transcoding older formats (like from JPEG to WebP), or stripping metadata.

- **How S3 Object Lambda works**
  - **S3 Object Lambda** uses **AWS Lambda functions** to automatically process the output of standard S3 `GET`, `LIST`, or `HEAD` requests.
  - After you configure a **Lambda function**, you attach it to an **S3 Object Lambda service endpoint**, known as an **Object Lambda Access Point**. The **Object Lambda Access Point** uses a standard S3 access point, known as a **supporting access point**, to access Amazon S3.
  - When you send a request to your **Object Lambda Access Point**, Amazon S3 automatically calls your **Lambda function**. Any data retrieved by using an S3 `GET`, `LIST`, or `HEAD` request through the **Object Lambda Access Point** returns a transformed result back to the application. All other requests are processed as normal

# S3 Batch Operations

- You can use **S3 Batch Operations** to perform large-scale batch operations on **Amazon S3 objects**. **S3 Batch Operations** can perform a single operation on lists of Amazon S3 objects that you specify. A single job can perform a specified operation on billions of objects containing exabytes of data. Amazon S3 tracks progress, sends notifications, and stores a detailed completion report of all actions, providing a fully managed, auditable, and serverless experience. You can use S3 Batch Operations through the **Amazon S3 console**, **AWS CLI**, **AWS SDKs**, or **Amazon S3 REST API**.

# Bucket Policies

- An **S3 bucket policy** is a **JSON document** that defines the access permissions for an **S3 bucket** and its objects. It allows you to control who can access the bucket and its objects, what actions can be performed on them, and under what conditions. It can be set at the bucket and object level and works in conjunction with other access controls such as IAM policies and ACLs.
- You can use bucket policies to:

  1. Control who can access the objects in your bucket
  2. Control what actions can be performed on the objects in your bucket
  3. Control the conditions under which access is allowed or denied

- For example, you could use a bucket policy to grant read-only access to all objects in a bucket to a specific AWS account or to grant public read access to all objects in a bucket. Here is an example of an **S3 bucket policy** that grants public read access to all objects in a bucket named “cloudandcodebucket”:

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

  - Above policy uses the **“Effect”** field to specify that access is allowed, the **“Principal”** field to specify that access is granted to anyone (`*`” means all), the **“Action”** field to specify that the “**s3:GetObject**” action is allowed (which corresponds to read access), and the **“Resource”** field to specify that access is granted to all objects in the **“cloudandcodebucket”** bucket.

- Here is another example of an **S3 bucket policy** that grants write access only to an AWS account with the ID **“012345678901”** to a specific object inside a bucket named `“cloudandcodebucket”`:
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
  - Above policy uses the **“Principal”** field to specify that access is granted to a specific AWS account with the ID `012345678901`, the `“Action”` field to specify that the `s3:PutObject` action is allowed (which corresponds to write access), and the `Resource` field to specify that access is granted to a specific object `specific_object` inside the `cloudandcodebucket` bucket.

# Pricing of AWS S3

- **Amazon S3 pricing** is based on a **pay-as-you-go** model, where you pay for the amount of **storage** and **data transfer used**.
- **Storage prices** vary depending on the **region**, **storage class**, and volume of data stored, with a lower cost for infrequently accessed data and a higher cost for frequently accessed data.
- **Data transfer prices** also vary depending on the **source** of the data and its destination, with a lower cost for data transfer within the same region and a higher cost for data transfer across regions or over the internet.
- In addition to **storage** and **data transfer costs**, there are also additional costs for features such as **versioning**, **lifecycle management**, and **data retrieval**.

# Storage Classes

- **Amazon S3 storage classes** are different levels of storage designed for different use cases and access patterns. Each class has its own set of features and prices.
  1. **S3 Standard**: for frequently accessed data, with high durability and availability. This is the default storage class.
  2. **S3 Standard-Infrequent Access** (**S3 Standard-IA**): for infrequently accessed data, with a lower cost than **S3 Standard** but slightly higher retrieval costs.
  3. **S3 One Zone-Infrequent Access** (**S3 One Zone-IA**): for infrequently accessed data, with a lower cost than **S3 Standard-IA**, but with the data stored in a single availability zone, making it less durable than **S3 Standard-IA**.
  4. **S3 Intelligent-Tiering**: for data with unknown or changing access patterns, with automatic tiering between **S3 Standard** and **S3 Standard-IA**.
  5. **S3 Glacier**: for long-term archival storage, with a lower cost than **S3 Standard-IA** and **S3 One Zone-IA**, but with retrieval costs and retrieval times that are higher.
  6. **S3 Glacier Deep Archive**: for data that is rarely accessed and for which retrieval times of several hours are acceptable, with the lowest cost of all S3 storage classes.

# Resources and Further Reading

1. [Medium - AWS S3 Deep Dive](https://medium.com/@joudwawad/aws-s3-deep-dive-1c19ad58af40)
2. [Medium - AWS S3 Quick Reference Guide](https://awstip.com/aws-s3-quick-reference-guide-8fcd0303e927)
