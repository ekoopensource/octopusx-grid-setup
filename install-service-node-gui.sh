#!/bin/bash


echo "OCTOPUSX SERVICE NODE SETUP INTERACTIVE SHELL"

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - -"


read -p 'Grid Name: ' grid_name
read -p 'Service Node: ' service_node_name

read -p 'Region: ' region

#insall main node
./install-node/service-node/install.sh $region $grid_name $service_node_name

#return
echo "${grid_name} Setup Completed!"