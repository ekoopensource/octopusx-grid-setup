#!/bin/bash

grid_name="octopusx-grid-3"
main_node_name="main-node"
service_node_name="lastma-node"
region="eu-west-2"

#install grid base
./install-grid-base/install.sh $region $grid_name

##create grid state
#
#./copystate.sh $grid_name

#insall main node
./install-node/main-node/install.sh $main_node_name $grid_name

#insall service node
#./install-node/service-node/install.sh $service_node_name

#return
echo "${grid_name} Setup Completed!"

