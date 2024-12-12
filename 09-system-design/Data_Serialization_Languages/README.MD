# Data Serialization Langiages

## Table Of Contents
- [Overview Of Data Serialization](#Overview-Of-Data-Serialization)
- [Data Serialization Languages]()
  - [XML](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Serialization_Languages/XML)
  - [JSON](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Serialization_Languages/JSON)
  - [Protobuf](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Serialization_Languages/Protobuf)
  - [YAML](https://github.com/nyangweso-rodgers/Computer_Science_Concepts/tree/master/Data_Serialization_Languages/XML)


# Overview Of Data Serialization
* __Data Serialization__ is a process of converting the data objects that is present in some complex data structure into a stream of bytes that can be used to store, transfer and distribute on physical devices.
* The reverse process of data serialization is called __data deserialization__.
* YAML, JSON, XML are data serialization language.
* Here's how a {hello: "world"} object looks like in JSON versus Protobuf:
  * JSON (17 bytes)
    ```json
        {"hello": "world"}
    ```
  * Protobuf (7 bytes):
    ```proto
        // interpreting the bytes as Unicode characters... 
        \n\u0005world

        // reading them as a sequence of bytes in raw hexadecimal form...
        0A 05 77 6F 72 6C 64

        // or as binary...
        00001010 00000101 01110111 01101111 01110010 01101100 01100100
    ```
  * XML (37 bytes): Here's what an XML {hello: "world"} object might look like:
      ```xml
          <object>
              <hello>world</hello>
          </object>
      ```
# Tradeoffs in serialization
* We have different serialization formats. Some of the major tradeoffs involved when picking a format are:
  * human-readability, 
  * ease of debugging, 
  * speed, and 
  * payload size.
* __Binary formats__ are often faster to parse and result in smaller payloads.
* Most APIs today go with JSON. It's not the most optimized in speed or size, but it's fast enough and can be easily debugged, making it worth it, unless your API is transferring humongous amounts of data.