	kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-external-bootstrap-bank-events.apps.cluster-9jwvr.9jwvr.sandbox431.opentlc.com:443 \
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \
	-topic event-input-stream --from-beginning \
	--consumer-property ssl.truststore.location=/home/chaika/git_ws2/bank-events-new/bank-events/customer-event-analysis/src/main/resources/scripts/generated/truststore.jks
