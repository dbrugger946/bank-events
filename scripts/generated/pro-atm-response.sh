        kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap-kafka-central.apps.cluster-hhdnz.hhdnz.sandbox1353.opentlc.com:443 \
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \
        -topic atm-response \
        --producer-property ssl.truststore.location=truststore.jks
