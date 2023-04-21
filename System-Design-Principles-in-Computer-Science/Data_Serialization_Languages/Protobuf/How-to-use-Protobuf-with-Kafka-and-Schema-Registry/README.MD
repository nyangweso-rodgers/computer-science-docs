# How to Use Protobuf with Apache Kafka and Schema Registry

## Table Of Contents
- [Further Reading]()
  - [Dev Community - How to use Protobuf with Apache Kafka and Schema Registry](https://dev.to/de_maric/how-to-use-protobuf-with-apache-kafka-and-schema-registry-4iep)

# Overview Of Schema Registry
* __Schema Registry__ is a service for storing a versioned history of schemas used in Kafka. It also supports the evolution of schemas in a way that doesn’t break producers or consumers. Schema Registry supports:
  * Avro schemas
  * JSON Schemas, and
  * Protobuf Schemas

* Like with Avro, __Schema Registry__ provides a __serializer__ and __deserializer__ for Protobuf, called:
  * KafkaProtobufSerializer and 
  * KafkaProtobufDeserializer.

* The job of this serializer is to convert the Java object to a protobuf binary format before the producer writes the message to Kafka.
* The additional job of the serialiser is to check whether the protobuf schema exists in the Schema Registry. If not, it will write the schema to Schema Registry and it will write the schema id to the message (at the beginning of the message). Then, when the Kafka record reaches the consumer, the consumer will use KafkaProtobufDeserializer to fetch the schema from the Schema Registry based on the schema id from the message. Once the schema is fetched, the KafkaProtobufDeserializer will use it to deserialize the message. This way the consumer doesn’t need to know the schema in advance to be able to consume messages from Kafka.