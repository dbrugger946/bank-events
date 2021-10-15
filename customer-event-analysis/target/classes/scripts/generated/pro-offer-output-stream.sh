        kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap-demo.apps.cluster-7858.7858.sandbox48.opentlc.com:443 \
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \
        -topic pro-offer-output-stream \
        --producer-property ssl.truststore.location=truststore.jks
