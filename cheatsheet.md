** Shortcuts and CLI reminders  


*** Knative CLI  
https://access.redhat.com/documentation/en-us/openshift_container_platform/4.6/html-single/serverless/index#creating-serverless-apps-kn_serverless-applications  

kn service create event-display \\  
    --image quay.io/openshift-knative/knative-eventing-sources-event-display:latest  

kn service update <service_name> --image  

kn service update <service_name> --request cpu=500m --limit memory=1024Mi --limit cpu=1000m  

kn service update <service_name> --traffic <revision>=<percent>  

kn service describe <service_name> -o json  

oc get ksvc <service_name>  

kn service update <service_name> --traffic <revision>=<percent>  

Delete a service 'svc1' in default namespace  
kn service delete svc1  

Delete a service 'svc2' in 'ns1' namespace  
kn service delete svc2 -n ns1  




*** Podman/Quay/Skopeo  

podman login quay.io  

skopeo copy --dest-tls-verify=false \\  
containers-storage:myimage \\  
docker://registry.example.com/myorg/myimage  

skopeo copy --src-creds=testuser:testpassword \\  
--dest-creds=testuser1:testpassword \\  
docker://srcregistry.domain.com/org1/private \\  
docker://dstegistry.domain2.com/org2/private  

oc create secret docker-registry registrycreds \\  
--docker-server registry.example.com \\  
--docker-username youruser \\  
--docker-password yourpassword  

oc secrets link default registrycreds --for pull  

*** OC  

oc adm prune images  



