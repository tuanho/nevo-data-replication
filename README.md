# Nevo Data Replication

This is an example project showing how to replicate data from a source SQL database to a sink SQL database using Kafka, Kafka Connect, and Debezium.

## Included in this project

- Docker containers for Microsoft SQL Server, Zookeeper, Kafka, Kafka Connect, Kafka UI, and Debezium
- How to enable CDC on Microsoft SQL Server
- Debezium Microsoft SQL Server connector
- Write CDC changes to Kafka topics using Debezium SQL Server connector.
- Write CDC changes to sink database to finish full replication procedure.

## Prerequisites

- `Docker Desktop` (will integrate with WSL on Windows)
- Linux terminal with or WSL (Windows)
- Install `Azure Data Studio`

## Getting Started

1. From terminal, `docker-compose build && docker-compose up`
2. Create Source & Sink connections in Azure Data Studio:
    - host: `localhost`
    - port: `1433` (source) & `1434` (sink)
    - user: `sq`
    - password: `Imgoingtotellalongstory123!@#`
3. Azure Data Studio, open & execute files:
    - `src/source/mssql_source_init.sql`
    - `src/sink/mssql_sink_init.sql`
4. From terminal run:
    - `bin/create_source.sh`
    - `bin/create_sink.sh`
5. On `Sink` database connection you should now see data replicated from the `Source` database.
    - `select * from Products`
6. To brown the Kafka topics, open browser to [http://localhost:8080](http://localhost:8080)

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

## CDC (Change Data Capture)
- For SQL Server, materialied views are not supported

## Resoures
- https://debezium.io/documentation/reference/2.1/connectors/sqlserver.html
- https://debezium.io/documentation/reference/2.1/tutorial.html
- https://kafka.apache.org/
- https://debezium.io/
- https://www.confluent.io/confluent-cloud/
- https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-kafka-connect-debezium
- https://medium.com/google-cloud/near-real-time-data-replication-using-debezium-4da77cef67ab
- https://medium.com/nagoya-foundation/simple-cdc-with-debezium-kafka-a27b28d8c3b8