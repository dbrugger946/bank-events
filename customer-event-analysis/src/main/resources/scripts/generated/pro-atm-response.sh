        kafka-console-producer.sh --bootstrap-server my-cluster-kafka-external-bootstrap-bank-events.apps.cluster-9jwvr.9jwvr.sandbox431.opentlc.com:443 \
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \
        -topic atm-response \
        --producer-property ssl.truststore.location=truststore.jks
