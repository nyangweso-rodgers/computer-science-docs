# Data Formats

## Table Of Contents

# Common Data Formats and Their Characteristics

1. CSV:

   - A simple, text-based format ideal for tabular data. It is easy to read but lacks support for advanced data types or metadata.

2. Excel

   - Rich in features and user-friendly for data exploration, but less optimal for handling very large datasets or automation.

3. JSON

   - A flexible, human-readable format that supports nested data structures, widely used for APIs and configuration files.

4. Parquet

   - A columnar storage format that is highly optimized for analytical queries and efficient storage through built-in compression.

5. Avro
   - A binary, schema-driven format designed for high-performance serialization and accommodating schema evolution over time.

#

## 1. JSON

- **When to use JSON**:

  1. **Public APIs**: Imagine you’re building a weather app or an e-commerce site API. You want other developers to use your API without jumping through hoops. JSON is perfect here — everyone knows how to work with it.
  2. **Quick Prototypes & Side Projects**: Starting a side project over the weekend? Need to move fast and debug easily? Stick with JSON. No extra tooling needed.
  3. **Human-Readable Configurations**: Config files, simple settings, or anything developers might need to manually tweak — JSON wins because you can open it in any text editor.

- **How to parse received JSON data?**: When receiving data from **API**, that data is always a `string`. In order to use it, you should parse the data with the `JSON.parse` method and the data becomes a **JavaScript object**.
- **How to send JSON data to an API?** When sending data to an API or web server, the data has to be a `string`. You can convert a JavaScript object using the `JSON.stringfy` method into a string in order to send it to an API or a web server.

## 2. Proto

- Features (Proto vs. JSON):

  - **Proto** is 3x smaller in size compared to **JSON**.
  - **Proto** serialises data more than 10x faster than **JSON** for small payloads (100 users).
  - **Deserialization** times are close for both at larger scales, but **Proto** still slightly wins.
  - As the data size grows (1000 users), Proto maintains smaller size, but JSON’s serialization time gap narrows slightly.

- **When to Use Proto**:
  1. **High-Performance Mobile Apps**: You’re building a ride-sharing app or chat application where network speed matters and every byte counts? **Proto** is your best friend. Smaller size = faster transfers = better user experience.
  2. **Microservices Talking to Each Other**: Inside your backend architecture (where you control everything), Proto’s speed and small size make it ideal. Who cares if humans can’t read it when services talk machine-to-machine?
  3. **Realtime Systems**: Gaming, stock trading, live scores, or anything streaming — you need super fast serialisation/deserialisation. Proto shines here.
  4. **IoT Devices**: Tiny sensors sending data over constrained networks? You definitely want the smallest payload possible.

## 3. YAML

- **YAML** is a simple human readable language that can be used to represent data and works well with other programming languages. **YAML** is neither a programming language nor a markup language. **YAML** is a **Data Serialization language**.
- It was previously known as "**Yet Another Markup Language**" but now its called "**YAML Ain't Markup Language**". **Markup languages** are used to store only documents. But **YAML** can store **objects data** along with **documents**. The two most popular markup languages are **HTML** and **XML**.

- **Uses of YAML**

  - Importing and exporting data to and from the server.
  - Configuring files can be written in **YAML**.
  - Transferring data between two different components of the application.
  - Intermediate data storing.

- **Benefits of YAML**
  - YAML is simple and easy to read.
  - Easily convertible to JSON and XML files.
  - Most programming languages use YAML for data serialization.
  - You can only store data and not commands in YAML.
  - YAML is more powerful when representing complex data.
  - Parsing is Easy in YAML(parsing means reading the data).

# Compression Types and Best Use Cases

1. **GZIP** (**GNU Zip**)

   - Best for: Text-based formats like **CSV** and **JSON**.
   - **Advantages**:

     - Offers excellent compression ratios for text data.
     - Widely supported across various platforms and programming languages.

   - **Considerations**:
     - Decompression can be CPU-intensive, which may be a factor in real-time processing scenarios.
     - For formats like CSV and JSON, GZIP can significantly reduce file sizes, speeding up data transfer and storage costs.

2. **BZIP2**:

   - Best for: Situations where maximum compression is needed, and decompression speed is less critical.
   - **Advantages**

     - Provides higher compression ratios compared to GZIP.

   - **Considerations**
     - Slower compression and decompression speeds can make it less suitable for real-time or high-throughput environments.
     - Typically used in archival scenarios where processing time is not the primary concern.

3. **Snappy**

   - **Best for**: Big data processing systems and columnar formats like Parquet.
   - **Advantages**:

     - Optimized for speed rather than maximum compression ratio.
     - Integrates well with **Apache Hadoop**, **Spark**, and other big data tools.

   - **Considerations**:
     - May not compress as tightly as GZIP, but its speed benefits often outweigh this drawback in large-scale data processing tasks.
     - Ideal when you require fast read and write operations during analytics workloads.

4. **LZO**:

   - Best For: Real-time and near real-time processing scenarios where speed is critical.
   - **Advantages**

     - Very fast decompression speeds.
     - Used in scenarios like streaming data pipelines.

   - **Considerations**
     - Compression ratios are generally lower than those achieved with GZIP or BZIP2.
     - Often a good choice when minimizing latency is a priority.

5. **Built-In Compression**

   - Best For: Columnar file formats like **Parquet**.
   - **Advantages**

     - Parquet supports built-in compression techniques (including Snappy, GZIP, and others) at the column level.
     - This integration means that compression is seamlessly applied during data write operations.

   - **Considerations**:
     - External zipping of an already compressed Parquet file may not provide significant additional benefits.
     - Ensuring that the chosen algorithm aligns with your processing engine (e.g., Spark’s native support) is critical for maintaining performance.

# When to Compress: During Transformation or After?

- An important design decision in your data pipeline is determining when to apply compression. Here are some scenarios to consider:

  1. **Compression During Data Transformation**:

     - Pros

       - **I/O Efficiency**: Compressing data as it is transformed or ingested can reduce I/O overhead, particularly when writing to disk or transferring over networks.
       - **Optimized Storage**: Early compression ensures that intermediate data stages are stored in a compact form, which can be beneficial in resource-constrained environments.

     - Cons:

       - **Processing Overhead**: Compressing data on-the-fly can add computational overhead, potentially slowing down transformation processes.
       - **Complexity**: Handling compressed data during transformations might require additional steps in your pipeline (e.g., decompressing before further processing).

     - Best Practice:
       - Use built-in compression options when available (such as in Parquet) to balance efficiency and speed. For text-based formats, consider compressing after the main transformation if your processing engine struggles with on-the-fly compression.

  2. **Compression After Data Transformation**

     - Pros

       - **Simplicity**: Compressing your data after all transformations are complete can simplify the pipeline, ensuring that each stage handles raw or minimally processed data.
       - **Flexibility**: You can choose different compression algorithms for final storage versus intermediate stages.

     - Cons

       - **Larger Intermediate Footprint**: If data isn’t compressed during transformation, you might need to allocate more storage for intermediate files.
       - **Delayed Efficiency Gains**: The benefits of compression (reduced disk usage and faster transfers) only come into play after processing is complete.

     - Best Practice:
       - For pipelines where real-time processing isn’t critical, compress your end result before loading into your data warehouse or final storage. This approach is often easier to manage and debug.

- **Remarks**:
  - For **batch processing** of large text datasets (**CSV**, **JSON**), **GZIP** offers a good balance of compression and compatibility.
  - For **real-time analytics** or **streaming data**, consider **LZO** or **Snappy** to minimize latency.
  - For big data ecosystems, leverage the built-in compression capabilities of formats like **Parquet** and **Avro**, tuning the algorithm (e.g., choosing between Snappy or GZIP) based on your performance requirements.

# Data Serialization

- **Data Serialization** is a process of converting the data objects that is present in some complex data structure into a stream of bytes that can be used to store, transfer and distribute on physical devices.
- The reverse process of data serialization is called **data deserialization**.
- `YAML`, `JSON`, `XML` are data serialization language.
- Here's how a {hello: "world"} object looks like in `JSON` versus **Protobuf**:

  - **JSON** (17 bytes)
    ```json
    { "hello": "world" }
    ```
  - **Protobuf** (7 bytes):

    ```proto
        // interpreting the bytes as Unicode characters...
        \n\u0005world

        // reading them as a sequence of bytes in raw hexadecimal form...
        0A 05 77 6F 72 6C 64

        // or as binary...
        00001010 00000101 01110111 01101111 01110010 01101100 01100100
    ```

  - **XML** (37 bytes): Here's what an XML {hello: "world"} object might look like:
    ```xml
        <object>
            <hello>world</hello>
        </object>
    ```

- **Tradeoffs in serialization**:
  - We have different **serialization formats**. Some of the major tradeoffs involved when picking a format are:
    - human-readability,
    - ease of debugging,
    - speed, and
    - payload size.
  - **Binary formats** are often faster to parse and result in smaller payloads.
  - Most APIs today go with **JSON**. It's not the most optimized in speed or size, but it's fast enough and can be easily debugged, making it worth it, unless your API is transferring humongous amounts of data.

# Resources and Further Reading
