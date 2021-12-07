# Deposit-Retention


oc new-app ubi8/openjdk-11~https://github.com/dbrugger946/bank-events.git \
--context-dir=fraud-alert-sb-kstreams  --name=fraud-kstreams




//// old demo approach oc new-app java:8~https://github.com/snandakumar87/alert-fraud-pattern.git

/// local
Start Kafka Brokers: zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties

kafka-server-start /usr/local/etc/kafka/server.properties

mvn clean install

java -jar target/deposit-retention-1.0.0.jar

Input topic: kafka-console-consumer --bootstrap-server localhost:9092 --topic event-input-stream --from-beginning

Output topic: kafka-console-consumer --bootstrap-server localhost:9092 --topic offer-output-stream --from-beginning
