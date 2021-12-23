        kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap-bank-events3.apps.cluster-rd5m7.rd5m7.sandbox822.opentlc.com:443 \
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \
        -topic atm-response \
        --producer-property ssl.truststore.location=truststore.jks
