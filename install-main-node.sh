#!/bin/bash

grid_name="octopusx-grid-sandbox"
main_node_name="main-node"
region="eu-west-2"


#insall main node
./install-node/main-node/install.sh $region $main_node_name $grid_name

#return
echo "${grid_name} Setup Completed!"