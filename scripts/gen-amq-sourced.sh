#!/bin/bash

# grab the route
route=$(oc get routes my-cluster-kafka-bootstrap -o=jsonpath='{.status.ingress[0].host}')
route=${route}:443
echo $route


# create the client kafka scripts
cat <<EOF > generated/lis-person-topic.sh
	kafka-console-consumer.sh --bootstrap-server $route \\
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \\
	-topic person-topic --from-beginning \\
	--consumer-property ssl.truststore.location=truststore.jks
EOF
chmod +x generated/lis-person-topic.sh

cat <<EOF > generated/pro-person-topic.sh
        kafka-console-producer.sh --bootstrap-server $route \\
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \\
        -topic person-topic \\
        --producer-property ssl.truststore.location=truststore.jks
EOF
chmod +x generated/pro-person-topic.sh

echo "end build script for kafka clients"

exit 0
