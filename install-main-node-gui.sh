#!/bin/bash

main_node_name="main-node"



echo "OCTOPUSX MAIN NODE SETUP INTERACTIVE SHELL"

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - -"


read -p 'Grid Name: ' grid_name
read -p 'Region: ' region

#insall main node
./install-node/main-node/install.sh $region $grid_name $main_node_name

#return
echo "${grid_name} Setup Completed!"