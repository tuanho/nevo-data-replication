# Nevo Data Replication

## Getting Started

1. `docker-compose up`
2. Broswe [http://localhost:8080](http://localhost:8080)

## Steps taken to build this project for iOS Mac:
1. Installed Azure Data Studio on Mac
2. Created docker-compose.yml - Microsoft SQL Server service in (mcr.microsoft.com/mssql/server:2019-latest)
3. Wrote msql_init.sql script to create db, create tables, insert records, and enable CDC
4. Added to docker-compose.yml - zookeeper, kafka, kafka-connect, and kafka-ui

## Terms
- Source - the original data to be replicated
- Sink - (a cluster that is) the primary consumer of replication data
- Kafka - event streaming platform
    - Broker - Responsible for receiving and sending the messages, it consists in two parts: topics and partitions.
    - Topic - It’s an identifier used to organize the message into categories.
    - Partitions - A subdivision of a topic to organize and balance the data.
    - Kafka cluster - A cluster set, being the main instance of Kafka.
    - Producer - The source of the data, send and distribute the logs.
    - Consumer - Consumers subscribe to a topic and listen to them all the time, receiving logs.
    - Kafka Connectors
    - Kafka Transformers
    - Kafka Converters
- Debezium (db-z-ium) - open source distributed platform for change data capture that converts information from your existing databases into event streams, enabling applications to detect, and immediately respond to row-level changes in the databases

## Resoures
- https://kafka.apache.org/
- https://debezium.io/
- https://www.confluent.io/confluent-cloud/
- https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-kafka-connect-debezium
- https://medium.com/google-cloud/near-real-time-data-replication-using-debezium-4da77cef67ab
- https://medium.com/nagoya-foundation/simple-cdc-with-debezium-kafka-a27b28d8c3b8