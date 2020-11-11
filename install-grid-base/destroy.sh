#!/bin/bash

region=$1
grid_name=$2

#destroy grid base (aws)
terraform destroy -var="region=${region}" -var="grid=${grid_name}" -input=false -auto-approve -state=states/grid/${grid_name}.state -state-out=states/grid/destroy/${grid_name}.state $(pwd) \
&& terraform init $(pwd) && terraform apply -target=null_resource.grid_destroy -var="region=${region}" -var="grid=${grid_name}" -input=false -auto-approve -state=states/grid/${grid_name}.state -state-out=states/grid/destroy/${grid_name}.state $(pwd)


#return
echo "Grid Base Destruction Completed"
