	kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap-bank-events.apps.elm.optimalpath.xyz:443 \
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \
	-topic atm-response --from-beginning \
	--consumer-property ssl.truststore.location=truststore.jks
