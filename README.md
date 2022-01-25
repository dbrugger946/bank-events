# bank-events
### this is a rebuild of https://github.com/jbossdemocentral/rhdm-realtime-event*


Install/Build/Deployment to OCP


Kafka topics:  
event-input-stream  
offer-output-stream  
atm-withdrawal  
atm-response  



## Included Services (within this repo):

event-emitter :             Python app that generates events semi-randomly, and pushes into Kafak topics: event-input-stream, atm-withdrawl
                            Look at its README.md file for tips on running in OCP

customer-event-analysis :   Quarkus/Kogito service with a DMN business rules model that reads in event-input-stream topic and
                            outputs offer-output-stream.  
                            DMN rules determine offers for customers
                            Look at it's README.md file for tips on running in OCP

                            


fraud-alert-sb-kstreams :   Spring / Kafka Streams service: original CEP module from original demo, looks across a window of atm-withdrawl topic events,
                            determines if potential ATM fraud (stolen card/pin) sends out atm-response messages indicating possible fraud
                            Look at it's README.md file for tips on running in OCP


scripts :                   Location for all Kafka scripts and other utilities,
                            
                            create-topics.sh

                            oc get kt  //show kafka topics
                            oc delete kt <topic>

                            gen-kafka-utils.sh : script to build console consumer/producers to work with topics directly                        
                            to check and test functionality  -- need to adjust settings in script, possibly... 
                            Check script before running -- ensure parms/setting met 
                            created kafka consumer/producer scripts under generated sub dir


### local dir:  /home/chaika/git_ws2/bank-events-new/bank-events

git add --all -- ':!customer-event-analysis/target'
-- add all files except the ones in the above target dir

### Orignial Demo artifacts and guide

Please open the Guide in a new tab with the following link Here


Github repos for original demo:

Event Decisions:
https://github.com/jbossdemocentral/rhdm-realtime-event - decisioning-demo-personalization-repo
Event Emitter:
https://github.com/jbossdemocentral/rhdm-realtime-event-decisioning-demo-event-emitter
KStreams Event Processor(Decisioning):
https://github.com/jbossdemocentral/rhdm-realtime-event-decisioning-demo-event-analysis
KStreams Event Processor(Fraud Pattern Check):
https://github.com/jbossdemocentral/rhdm-realtime-event-decisioning-demo-alert-fraud-pattern
Vertx Web App:
https://github.com/jbossdemocentral/rhdm-realtime-event-decisioning-demo-event-analysis-webapp


Source event emitter github code leveraged by original demo
https://github.com/elmiko/event-stream-decisions




