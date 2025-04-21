FROM debezium/connect:3.0.0.Final

USER root

RUN curl -sL https://client.hub.confluent.io/confluent-hub-client-latest.tar.gz -o confluent-hub-client.tar.gz && \
    mkdir -p /usr/local/confluent-hub && \
    tar -xzf confluent-hub-client.tar.gz -C /usr/local/confluent-hub && \
    rm confluent-hub-client.tar.gz

# Add Confluent Hub CLI to PATH
ENV PATH="/usr/local/confluent-hub/bin:$PATH"

WORKDIR /kafka
RUN curl -fsSL http://client.hub.confluent.io/confluent-hub-client-latest.tar.gz -o confluent-hub-client-latest.tar.gz && \
       tar xzf confluent-hub-client-latest.tar.gz
RUN rm confluent-hub-client-latest.tar.gz
RUN touch /kafka/config/connect-distributed.properties
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.6.3 --component-dir /kafka/connect --worker-configs /kafka/config/connect-distributed.properties