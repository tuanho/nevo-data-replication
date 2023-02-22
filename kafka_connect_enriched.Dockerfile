FROM debezium/connect

WORKDIR /kafka
RUN curl http://client.hub.confluent.io/confluent-hub-client-latest.tar.gz --output confluent-hub-client-latest.tar.gz
RUN tar xfz confluent-hub-client-latest.tar.gz
RUN rm confluent-hub-client-latest.tar.gz
RUN touch /kafka/config/connect-distributed.properties
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.6.3 --component-dir /kafka/connect --worker-configs /kafka/config/connect-distributed.properties