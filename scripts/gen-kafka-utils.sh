#!/bin/bash
echo "Script to generate keystore and kafka client script "
echo "Ensure you are logged into correct OCP cluster via the CLI 'oc' "
echo "May need to adjust scripts for different kafka cluster naming "
echo "Check Route and Secret Naming in OCP"

# grab the route
route=$(oc get routes my-cluster-kafka-external-bootstrap -o=jsonpath='{.status.ingress[0].host}')
route=${route}:443
echo $route

# pull the TLS cert from the broker
oc extract secret/my-cluster-cluster-ca-cert --keys=ca.crt --to=- > generated/ca.crt

keyfile='generated/truststore.jks'

# if a truststore.jks file already exists then delete it
if [ -f $keyfile  ]; then
	echo "Deleting existing -- $keyfile"
	rm $keyfile
fi

# push the the cert into a Java keystore
keytool -import -trustcacerts -alias root -file generated/ca.crt -keystore $keyfile -storepass password -noprompt

echo "keystore replaced"

# create the client kafka scripts
cat <<EOF > generated/lis-event-input-stream.sh
	kafka-console-consumer.sh --bootstrap-server $route \\
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \\
	-topic event-input-stream --from-beginning \\
	--consumer-property ssl.truststore.location=truststore.jks
EOF
chmod +x generated/lis-event-input-stream.sh

cat <<EOF > generated/pro-event-input-stream.sh
        kafka-console-producer.sh --bootstrap-server $route \\
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \\
        -topic event-input-stream \\
        --producer-property ssl.truststore.location=truststore.jks
EOF
chmod +x generated/pro-event-input-stream.sh


# create the client kafka scripts
cat <<EOF > generated/lis-offer-output-stream.sh
	kafka-console-consumer.sh --bootstrap-server $route \\
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \\
	-topic offer-output-stream --from-beginning \\
	--consumer-property ssl.truststore.location=truststore.jks
EOF
chmod +x generated/lis-offer-output-stream.sh

cat <<EOF > generated/pro-offer-output-stream.sh
        kafka-console-producer.sh --bootstrap-server $route \\
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \\
        -topic offer-output-stream \\
        --producer-property ssl.truststore.location=truststore.jks
EOF

chmod +x generated/pro-offer-output-stream.sh

echo "offer topic kafka utils built"

# create the client kafka scripts
cat <<EOF > generated/lis-atm-withdrawl.sh
	kafka-console-consumer.sh --bootstrap-server $route \\
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \\
	-topic atm-withdrawl --from-beginning \\
	--consumer-property ssl.truststore.location=truststore.jks
EOF
chmod +x generated/lis-atm-withdrawl.sh

cat <<EOF > generated/pro-atm-withdrawl.sh
        kafka-console-producer.sh --bootstrap-server $route \\
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \\
        -topic atm-withdrawl \\
        --producer-property ssl.truststore.location=truststore.jks
EOF

chmod +x generated/pro-atm-withdrawl.sh

echo "atm withdrawl topic kafka utils built"

cat <<EOF > generated/lis-atm-response.sh
	kafka-console-consumer.sh --bootstrap-server $route \\
   	--consumer-property security.protocol=SSL --consumer-property ssl.truststore.password=password \\
	-topic atm-response --from-beginning \\
	--consumer-property ssl.truststore.location=truststore.jks
EOF
chmod +x generated/lis-atm-response.sh

cat <<EOF > generated/pro-atm-response.sh
        kafka-console-producer.sh --bootstrap-server $route \\
        --producer-property security.protocol=SSL --producer-property ssl.truststore.password=password \\
        -topic atm-response \\
        --producer-property ssl.truststore.location=truststore.jks
EOF

chmod +x generated/pro-atm-response.sh

echo "end build script for kafka clients"

exit 0
