#!/bin/bash

grid_name="grid-sand-2"
main_node_name="main-node"
region="eu-west-2"


#insall main node
./install-node/main-node/install.sh $region $grid_name $main_node_name

#return
echo "${grid_name} Setup Completed!"