#!/bin/bash

region=$1
grid=$2


#install grid base (aws)
#terraform init aws/ec2 && terraform apply aws/ec2

terraform init $(pwd)/install-grid-base/aws/kubernetes && terraform apply -var="cluster_name=${grid}" -var="region=${region}" -input=false -auto-approve -state=states/grid/${grid}.state -state-out=states/grid/${grid}.state $(pwd)/install-grid-base/aws/kubernetes

#return
echo "Grid Base Setup Completed"
