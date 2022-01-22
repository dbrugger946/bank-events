	kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap-bank-events2.apps.okean.ocean.localdomain:443 \
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \
	-topic event-input-stream --from-beginning \
	--consumer-property ssl.truststore.location=truststore.jks
