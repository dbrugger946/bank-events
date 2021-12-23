	kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap-bank-events3.apps.cluster-rd5m7.rd5m7.sandbox822.opentlc.com:443 \
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \
	-topic offer-output-stream --from-beginning \
	--consumer-property ssl.truststore.location=truststore.jks
