	kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap-demo.apps.cluster-7858.7858.sandbox48.opentlc.com:443 \
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \
	-topic offer-output-stream --from-beginning \
	--consumer-property ssl.truststore.location=truststore.jks
