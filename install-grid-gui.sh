#!/bin/bash
clear


main_node="main-node"
service_node_name="lastma-node"
region="eu-west-2"

echo "OCTOPUSX GRID SETUP INTERACTIVE SHELL"

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - -"


read -p 'Grid Name: ' grid_name
read -p 'Region: ' region



echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "STARTED GRID INSTALLATION...(${grid_name}) in (${region})"

#install grid base
./install-grid-base/install.sh $region $grid_name

echo "GRID INSTALLATION COMPLETED...(${grid_name})"

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "STARTED MAIN NODE INSTALLATION...(${main_node})"

#insall main node
./install-node/main-node/install.sh $main_node $grid_name

echo "MAIN NODE INSTALLATION COMPLETED...(${main_node})"

#insall service node
#./install-node/service-node/install.sh $service_node_name

#return
echo "${grid_name} Setup Completed!"

