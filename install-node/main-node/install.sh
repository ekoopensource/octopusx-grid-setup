#!/bin/bash

region=$1
grid=$2
node=$3


#install main node (aws)

terraform init $(pwd)/install-node/main-node \
&& terraform apply -var="grid=${grid}" -var="region=${region}" -var="namespace=${node}" -input=false -auto-approve -state=states/grid/${grid}.state -state-out=states/nodes/${node}-${grid}.state $(pwd)/install-node/main-node

#return
echo "Main Node Setup Completed"
