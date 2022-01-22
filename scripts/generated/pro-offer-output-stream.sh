        kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap-bank-events2.apps.okean.ocean.localdomain:443 \
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \
        -topic offer-output-stream \
        --producer-property ssl.truststore.location=truststore.jks
