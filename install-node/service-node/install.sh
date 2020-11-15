#!/bin/bash

region=$1
grid=$2
node=$3


#install service node (aws)

terraform init $(pwd)/install-node/service-node \
&& terraform apply -var="grid=${grid}" -var="region=${region}" -var="namespace=${node}" -input=false -auto-approve -state-out=states/nodes/${node}-${grid}.state $(pwd)/install-node/service-node

#return
echo "Service Node Setup Completed"
