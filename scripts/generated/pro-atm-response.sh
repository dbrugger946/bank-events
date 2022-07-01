        kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap-bank-events.apps.elm.optimalpath.xyz:443 \
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \
        -topic atm-response \
        --producer-property ssl.truststore.location=truststore.jks
